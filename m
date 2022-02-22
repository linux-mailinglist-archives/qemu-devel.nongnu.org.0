Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5C4BFE06
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:03:22 +0100 (CET)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXdJ-0000aO-G4
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nMX1z-0003bg-OB
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nMX1x-0004r1-1E
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645543484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZyxIs6qTuueUicN6Pe5C4212Xh9LYcKTXUSZKxOpZ4=;
 b=MTdma4SVHS/AcicA4Qfqp176gVwtw7ZsROXG0kOKVEzzt24g+YSwEEOYdKj5RSLAsOPc2c
 gJk8XgBTdb71F9VxJ4/23FpP/Gpp/fHqybJG76z7be+evAXbgplW5B0gpcwfYkMk+NDqmn
 EmoZc06WiBGqIxJ/u0jDWZIrC3FXLdQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-jPdRw9pEO_a18NYbMBH48w-1; Tue, 22 Feb 2022 10:24:43 -0500
X-MC-Unique: jPdRw9pEO_a18NYbMBH48w-1
Received: by mail-wr1-f71.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so7063499wrg.20
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 07:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0ZyxIs6qTuueUicN6Pe5C4212Xh9LYcKTXUSZKxOpZ4=;
 b=wBwxN2nWpgDggHTQDZYl6n0Go7lhY4k4WXGCqX7aAQ/G2SMtSzXxMsx/gnb3oOvokq
 o7NZL4D4OyRireolEyBfCACE9tHvPCcKPIjKempT47/mf0mJeyAWpvp0B60lB+Pxh/QF
 bMAKKjfJ4JJsYbT50WdexIGs3orvAdrktjv1yzLPC56PcnppH55Z1/QsyiOYyPmezpDv
 jr1XexYGzF4Zj0t++8T9TNJMCWa/v0Ztkk8fXInvbt7NvvyhKl1w0CBL4h6roQgExQpp
 s30jFMf78IF+mqiYwtr97tSIcAfc1beVyirPvkdXX/RJe4X2ivpYVSkShSlfOcXZ3RMF
 vBdQ==
X-Gm-Message-State: AOAM531LT8P30GbR3HgVyPWY7j2coS1vSL6D37zw0Q/3EGMqMRtY0w1k
 +n9jXGRJs5wNwUIPwDs1mYGhnkWj2gIhhTfMK02fjnXMFBUxdiB9Voh1CH1R7b16bywzPFyAmLX
 ClH8EPq3iIgaGtXA=
X-Received: by 2002:a05:600c:1d88:b0:37e:c0b3:944c with SMTP id
 p8-20020a05600c1d8800b0037ec0b3944cmr3783141wms.147.1645543481760; 
 Tue, 22 Feb 2022 07:24:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuK0fxrj6O4fKauAsn6iqk5Cfe9rBjRGnjQ8TRW8sC6BAAIjh5TfgcGu+KhZsqocmj5xDK5A==
X-Received: by 2002:a05:600c:1d88:b0:37e:c0b3:944c with SMTP id
 p8-20020a05600c1d8800b0037ec0b3944cmr3783119wms.147.1645543481438; 
 Tue, 22 Feb 2022 07:24:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:7d00:477e:35d5:928f:9b7f?
 (p200300cbc7067d00477e35d5928f9b7f.dip0.t-ipconnect.de.
 [2003:cb:c706:7d00:477e:35d5:928f:9b7f])
 by smtp.gmail.com with ESMTPSA id v8sm29262784wrf.115.2022.02.22.07.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 07:24:41 -0800 (PST)
Message-ID: <ef91857f-e343-580e-3f3c-d5e36c078e25@redhat.com>
Date: Tue, 22 Feb 2022 16:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/mem/pc-dimm: Fix error message if no slots were
 defined some more
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220222152211.1209292-1-armbru@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220222152211.1209292-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ani@anisinha.ca, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.22 16:22, Markus Armbruster wrote:
> The error message added in commit 3ff333effa "pc-dimm: fix error
> messages if no slots were defined" is misleading:
> 
>     $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1
>     qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1: no slots where allocated, please specify the 'slots' option
>     $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1,slots=0
>     qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1,slots=0: Property 'pc-dimm.slots' not found
> 
> The property it called 'slot', not 'slots'.  With that fixed, we get
> another bad error message:
> 
>     $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1,slot=0
>     qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1,slot=0: invalid slot number 0, valid range is [0-18446744073709551615]
> 
> Left for another day.
> 

We're referring to the "-m 2g,maxmem=8g,slots=5" slots parameter. And I
agree that we can make that clearer somehow :)

> Fixes: 3ff333effa319df6178f138d9cf32e3937419790
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/mem/pc-dimm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 48b913aba6..28fec00575 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -115,7 +115,7 @@ static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp)
>  
>      if (max_slots <= 0) {
>          error_setg(errp, "no slots where allocated, please specify "
> -                   "the 'slots' option");
> +                   "the 'slot' option");
>          return slot;
>      }
>  


-- 
Thanks,

David / dhildenb


