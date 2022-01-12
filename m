Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C048C024
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:43:06 +0100 (CET)
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZDl-0004uh-SK
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Z4L-0004Dk-O6
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Z4K-0002o0-1C
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641976398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Byz8hsrm3bcjdrq2cVNtNhbhMQBkMqKG+SCH/NqMCDQ=;
 b=hMgfegCU/uTk2T2N5gxN8FZf7Y+nTD7JsX1H1dHldvEKQloN0EGBIz+dTv5e9TYIV1apKg
 1pZGKKhHq5h2QEH8BgUVGOR3qzN7cu8SedNghkn/nqkAQDOcb/pH4FQZ/xGNr3PCcgLWmQ
 qIm63vsRNOB/FMtvvO6poEVXPdxph0I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-FvuZhkfAOrqkn3s_8W8W1g-1; Wed, 12 Jan 2022 03:33:18 -0500
X-MC-Unique: FvuZhkfAOrqkn3s_8W8W1g-1
Received: by mail-ed1-f70.google.com with SMTP id
 z10-20020a05640235ca00b003f8efab3342so1628916edc.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Byz8hsrm3bcjdrq2cVNtNhbhMQBkMqKG+SCH/NqMCDQ=;
 b=aRaCDrcp23WRV6o45xm/aTRwjMjoqphbjpaL1bEypNZl6ABJ05ubCpQRd8aF7AYnn1
 otgGOXjLaQIrRocw/WaCvj5wefTgRmQK2NuQvT0jnsrmuic7wd0rML3E3+dLIeqlfPb7
 DTNzJqsdpJXH/VLBeyc/n6plOGbEjp8P9OTnF2lPkFq5FTuDxvAPv5Z3FGTMBFORGNLA
 5hMGo55IpFPaXKCXBm49fEr+NbsBkoM5TLyNvCzSSriYPk1rLydd57W3FPy8Hvp/ATcE
 SE41QPEjBqurLwEaadFZ9sKm7XSh8jfhHaKRvZltB1eXV6lvYPO9W3RB60HbpyByueVX
 6auA==
X-Gm-Message-State: AOAM532XYqN/T4sCsTRLSmh6OR/xISDZAEV5OJ31veDbwFsflju6ytLy
 hh2+ok6pu8dA+wRGMvt3O2FtBi4Q0zAeoaeVOehU7Lp5ifwL7HFQTRQSBLvVF57Z371RZgFMwxX
 DnqHe5ban72Ng1tM=
X-Received: by 2002:a17:906:7944:: with SMTP id
 l4mr5194144ejo.290.1641976396816; 
 Wed, 12 Jan 2022 00:33:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0o26F0BUSJyubbX1KEYwkNAzyMKN4TjN0QYCBQG1IGebByymrerh2esDL/zNi0NK0FpFFUQ==
X-Received: by 2002:a17:906:7944:: with SMTP id
 l4mr5194113ejo.290.1641976396496; 
 Wed, 12 Jan 2022 00:33:16 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id dd5sm4333091ejc.99.2022.01.12.00.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:33:16 -0800 (PST)
Message-ID: <30d1e881-9290-90ed-ca12-e3713e554183@redhat.com>
Date: Wed, 12 Jan 2022 09:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/5] target/s390x: Fix SLDA sign bit index
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112043948.224405-2-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 05:39, Ilya Leoshkevich wrote:
> David Hildenbrand noticed that sign bit index for SLDA is wrong: since
> SLDA operates on 64-bit values, it should be 63, not 31.

Maybe just replace the "David ... noticed" by a Reported-by (below).

> 
> Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/insn-data.def | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index f0af458aee..90c753068c 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -800,7 +800,7 @@
>      C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh32, new, r1_32, srl, 0)
>      C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh64, r1, 0, srl, 0)
>  /* SHIFT LEFT DOUBLE */
> -    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 31)
> +    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 63)
>  /* SHIFT LEFT DOUBLE LOGICAL */
>      C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sll, 0)
>  /* SHIFT RIGHT DOUBLE */

Reported-by: David Hildenbrand <david@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>


Thanks :)

-- 
Thanks,

David / dhildenb


