Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E37329A82
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:37:19 +0100 (CET)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2P0-0005al-Hs
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH2JL-0006sv-LC
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:31:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH2JJ-0001zL-Sy
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614681085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15oagbyyaakT3ieFVjWh7TVKlvC3zd1XGpa4FXqaKvs=;
 b=CjIDnszD78pygY3+CykZuBbaYBCKcCmb2GWnpvrivp+ccTEcapPJW9wCg4PqkaiqXDuyJ4
 FCeAFaHaYytFxWEEGljGUWXSfjJScMxhz73rjwfT0O7Wfdk1hc+LSCcniYwMgkaqT/0gMb
 OyA3ksc+NiMySn69HXix5e6t8+XH4i0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-XW2-YlFWNd2IdtGBhs2bcQ-1; Tue, 02 Mar 2021 05:31:23 -0500
X-MC-Unique: XW2-YlFWNd2IdtGBhs2bcQ-1
Received: by mail-ed1-f72.google.com with SMTP id l6so10152613edn.22
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 02:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15oagbyyaakT3ieFVjWh7TVKlvC3zd1XGpa4FXqaKvs=;
 b=n6FtTV7xueTczYrJOyGcLWMw+gEDSXcgDmAPHoi4jz2CAMfLTbCQZvG9Wpgb0PMrN2
 z04Tgscn+GxFX+eC/tRCWoIq/2xQ3QanZe08ROlztpAkqTUpIaZgE0mY6PNvu3L48pJ9
 1pC/eBT2oOWrfSYNpcU+V3AMQG5a6BiU7Hq0kfci3nTXnDoLLKBj4IrPksj1U/WNKdOX
 VSCrYMP2v8eUomn/RWtlG4t03+U6ziBuu2TE0rMpYvfiNkIjBr4UQUYU1yyrUBWGdjbm
 ZjWebErsbFZn3FotQtdWz+JYUpgBoz+jkbVe79H9yULyAN4iPeEtDDaqATKhUuGuHJkQ
 A67w==
X-Gm-Message-State: AOAM531aMmEysdOgTCaor04XJaAJSGtYZY09jiFY5rdytgRYYJbhH4H+
 F89SAv7rFO70DQuo37xXCBziYXv0y8PNLm0y4i3BKp8ng+EwY/4A3O+4cXegpFKrztx19oldTDn
 CDIwpO3zbHiELR9A=
X-Received: by 2002:a50:8a90:: with SMTP id j16mr19493091edj.334.1614681082333; 
 Tue, 02 Mar 2021 02:31:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSyfrBQZD2S8kgb/GNlF+q8gGAS+DVnKVGqtvxUEBnSxmDMqwLa5F6iVUVJ16Eg92SIm1zUA==
X-Received: by 2002:a50:8a90:: with SMTP id j16mr19493078edj.334.1614681082225; 
 Tue, 02 Mar 2021 02:31:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a3sm17758650ejv.40.2021.03.02.02.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:31:21 -0800 (PST)
Subject: Re: [PATCH 1/2] elf_ops: correct loading of 32 bit PVH kernel
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
 <20210302090315.3031492-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c7e39cd9-1d9b-6eb6-f2dd-aa51455f8950@redhat.com>
Date: Tue, 2 Mar 2021 11:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302090315.3031492-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:03 AM, David Edmondson wrote:
> Because sizeof(struct elf64_note) == sizeof(struct elf32_note),
> attempting to use the size of the currently defined struct elf_note as
> a discriminator for whether the object being loaded is 64 bit in
> load_elf() fails.
> 
> Instead, take advantage of the existing glue parameter SZ, which is
> defined as 32 or 64 in the respective variants of load_elf().
> 
> Fixes: 696aa04c84c6 ("elf-ops.h: Add get_elf_note_type()")
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  include/hw/elf_ops.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


