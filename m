Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBE3656EA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:53:24 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYo0R-0000bz-PK
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnub-0005Vr-Mk
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnuV-0001ko-AF
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618915633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWGNaeSTQ2CCaeoVZGEDKKRF2Oa/xnJ890yRhS7WIQs=;
 b=QJW9yJha3apdWzhC5mOmu2PhPfMlg4+fN/ielXxcBRXEMUrfXYlApzDYoa6idPYx9w8+vx
 nuPayKvUkqtUHQZoEmX9JN9QcW+0rvE771bDdMsC1lEZGCbAbMr+357HFgxUGHPmQFdyjy
 ligQ98bkVpKANif3Sh5j+QyU7PVnh5o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-GD7FOvu9M3W9ck4oMs8vhA-1; Tue, 20 Apr 2021 06:47:09 -0400
X-MC-Unique: GD7FOvu9M3W9ck4oMs8vhA-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so6150153wrl.20
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JWGNaeSTQ2CCaeoVZGEDKKRF2Oa/xnJ890yRhS7WIQs=;
 b=H4aSTHo8hU8YyM9qSEfYjNxbbSKXbpY8tBWMwNF5soJd3PpMxWqGKhqKSmaDJ2RZk8
 iop1E7RzMtvfrlaB7+V1Rbx9lS0OLkfAEufLXnvQ44LgDJ+77E8ouE78/XRyg/B5h6YR
 bPUxYa5cJDSMJs9boMdZJuSDIRY9J0oLHNKPQ5qR+9QIecftdOzWWqj3KnPza8THUj4n
 6aZXJ+wEIB29NCeMhmGNGBcxtcyExfLMuNISNXjE4eoCXSGa3oRxzcdALtwY/LL4G+UK
 Ic8B6uDkmj5BAzkuAajukjl+ArI2dvnl2v4LPk5ypyPzYtj3qBkTtXEkk07ardf+AJ55
 XxLg==
X-Gm-Message-State: AOAM532TeCYnQTvPgvrJGBqxOy+hWkjq0pcUp1dUO1iPgdX7lD1MAW/8
 KzYH9G6NiwJQ62ChxWFaFNjgrKoNzb0OHEfWk52Pq8Tm25Yjo9L4MAvKwfI0/ZZMl4GMCtSqxOj
 A31fUAyxIWkADPZk=
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr3752529wmm.153.1618915628683; 
 Tue, 20 Apr 2021 03:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/YrIWe2FWWBqWXKfG9kn4f78idThYIW5pOV1buiCbgm1laWgwXx96DFF12lj8ci8Pwo3B5w==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr3752517wmm.153.1618915628525; 
 Tue, 20 Apr 2021 03:47:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b1sm30126547wru.90.2021.04.20.03.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:47:08 -0700 (PDT)
Subject: Re: [PATCH v5 13/14] qmp: Include "reserve" property of memory
 backends
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-14-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <17b0219e-096b-1d7e-7377-90e8f047cc03@redhat.com>
Date: Tue, 20 Apr 2021 12:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-14-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> Let's include the new property.
> 
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine-qmp-cmds.c | 1 +
>  qapi/machine.json          | 4 ++++
>  2 files changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


