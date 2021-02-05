Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D455A311058
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:51:46 +0100 (CET)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86Cn-0007tC-ET
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l84tK-0001My-PM
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:27:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l84tF-00070G-AR
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612546047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQy5nXL0DMJH5281SuYV1V5cNgfuetsom4yvoadm30M=;
 b=Q0QaWh0hQ6x2xa8BrTNb952rdxblErgbIsKRrkJhQOuxJCC+tiDAFp2y08KhzT+FCxkWS/
 ifsrJSr/BOPuMZ3EsesqxwSjUHc8tuyAXBH0O7QrxmJJvAVossZ1wtTmvKjQcU8r31Oiko
 4uVMMz4yC2Yxi9ccIONJwgWSNekeBh4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-OSEzV12SNzyfTvernbthYQ-1; Fri, 05 Feb 2021 12:27:23 -0500
X-MC-Unique: OSEzV12SNzyfTvernbthYQ-1
Received: by mail-wm1-f70.google.com with SMTP id u15so4075480wmj.2
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hQy5nXL0DMJH5281SuYV1V5cNgfuetsom4yvoadm30M=;
 b=buezIQNbdDR+NC4oka3pIphUAgZAmabwfSHqE3JZYp5cc8VILpvW8e/TJg8ih63es8
 m+IdoDUadFNYTU63kcvD83+Bu5Cdobo63L6w78wsrIS8+PpV5wvMaaXisQ+2XYeNbBRI
 9UwTLlX27+s+sBu/9U+CgaFZfo3HxXIbRK96XnUGQHo3J10y0+CxqIwlvxuUkvvRg+gw
 Sv7rXK3Ps+sAgGRGH4t5tII7cShqJbqWNr1WdpCAlj5CoLsxNdDq5cCaQdxvOKawcrJZ
 hf/hZhLXQEGTppjlqXh7Yd0rTPKRXBiuZCIJa3/BhUQ3zCEs9PW2bxVrGcA1bpF2WytG
 lOWg==
X-Gm-Message-State: AOAM53220a/lBWvPDzFqq5pfkQnm9ApWrM8CpgkGc//xRLyqD3vxtxEs
 Z1k/jyCt+5Vn5gBtbOYyD4sIibo5WdsfAlrQYhVI/SidHyyrn41CMIqwl9XXxB6IpsW3naRNBGB
 w1Xwhxy3r3hVLArg=
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr6275909wrh.326.1612546042593; 
 Fri, 05 Feb 2021 09:27:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcFNN+2R0oaVBeW7b1Dw6/50BMIIn6fzAoI16xXlaoXV8vIYgizthzyJh7PZ+km1w1k+guJA==
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr6275896wrh.326.1612546042380; 
 Fri, 05 Feb 2021 09:27:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b19sm9100292wmj.22.2021.02.05.09.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 09:27:21 -0800 (PST)
Subject: Re: [PATCH v2] hw/scsi/scsi-disk: Fix out of bounds access in
 mode_sense_page()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204225041.1822673-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <657ad3cd-b533-3028-baaf-6718fb44f4cb@redhat.com>
Date: Fri, 5 Feb 2021 18:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204225041.1822673-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Darren Kenny <darren.kenny@oracle.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 23:50, Philippe Mathieu-Daudé wrote:
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index ed52fcd49ff..93aec483e88 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1089,7 +1089,7 @@ static int scsi_emulate_mechanism_status(SCSIDiskState *s, uint8_t *outbuf)
>   static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
>                              int page_control)
>   {
> -    static const int mode_sense_valid[0x3f] = {
> +    static const int mode_sense_valid[MODE_PAGE_ALLS + 1] = {
>           [MODE_PAGE_HD_GEOMETRY]            = (1 << TYPE_DISK),
>           [MODE_PAGE_FLEXIBLE_DISK_GEOMETRY] = (1 << TYPE_DISK),
>           [MODE_PAGE_CACHING]                = (1 << TYPE_DISK) | (1 << TYPE_ROM),
> 

The bug is really that mode select with page 0x3f should fail, but it's 
okay too.  Can you also write a testcase along the lines of 
test_unaligned_write_same?

Paolo


