Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCC5E68EE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:58:02 +0200 (CEST)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPWT-0007cv-CE
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obNrd-0007Vw-O1
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obNrb-0007RN-Q3
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663859500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRkSmY00rPgUVO6fAo550n7grcYW9UGJ3K4Vp4V66ao=;
 b=A+TW98DvO5mMS46GdmPwlrx2RAvxTELX42CW9S1lJLcGEvVrnJQPc74sfT1vBg+YI9SO+1
 3h3RKCUmSV7RxQbp+0WbprLfzs/92gSwqN9i7ZtTqVmQA7TS4u32nJCZPbM8rObT+7gt+h
 6dk6NvY0WFHnLC1GXEzFNCquUtxtODE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-HVpO3lm_Nayx-wrdnqwhKQ-1; Thu, 22 Sep 2022 11:11:37 -0400
X-MC-Unique: HVpO3lm_Nayx-wrdnqwhKQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a13-20020adfbc4d000000b00228631ddfafso3355803wrh.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=tRkSmY00rPgUVO6fAo550n7grcYW9UGJ3K4Vp4V66ao=;
 b=XkDZ0fxKjN2n3evg8vgHrr+XZ9lv6Vrc0G4flaQ5WZPKgI1gInPUjicmG3d62Ik59n
 BdTYNQ+kZb148RmjGyq6wjig83s6ISPPHgU/UIujByqViK2cdrtAdZxHwhOwO2kNcybP
 lcsxlXKuAkeEzjCpzocPAiE7CFp+v6QGjRHVQ3/JzKYOfboSH2CjoijxoyzBizhy5eoS
 BEWzNc9Uj5zrWBsxTvirl9JGLAwqYXZRF98vpBQDfYMgpDdGpDiJ8luIngoXmtyMylS4
 b417rmEU8zn+ELXP8KjVEJ49nXrd6jpZNP0tRD6qyhCfliTAI72P3XeOKMXYAujBgxHM
 2lWA==
X-Gm-Message-State: ACrzQf0u9dxCjT1R/4NFuVDkzBn2k5aNZfiabPRRczITfcETEfaRAum3
 sIZUoqoQZ3SDXVS4fsAxRuVwVKi/rDmbK8VtZtXLrNudzEPaOmzoWlgjTJ/JzrM0kao0jxrsj8d
 4vzvJyOLowzkFkeQ=
X-Received: by 2002:a05:600c:27d1:b0:3b4:5e9c:23ed with SMTP id
 l17-20020a05600c27d100b003b45e9c23edmr2703502wmb.180.1663859496040; 
 Thu, 22 Sep 2022 08:11:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lZxVLwMXjhdGOsZ4cd/5v6eHxEg7qbdtEylOUNbE6ATdpVdSRLn8FUNEPTzMbEXfkn04Nww==
X-Received: by 2002:a05:600c:27d1:b0:3b4:5e9c:23ed with SMTP id
 l17-20020a05600c27d100b003b45e9c23edmr2703473wmb.180.1663859495758; 
 Thu, 22 Sep 2022 08:11:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f?
 (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de.
 [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c4f5000b003b4a68645e9sm6824694wmq.34.2022.09.22.08.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:11:35 -0700 (PDT)
Message-ID: <a30a021d-bac6-c321-02d9-0f4a5d3e3f8f@redhat.com>
Date: Thu, 22 Sep 2022 17:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
 <YyxyxCZH4X5n7Rdy@zx2c4.com>
 <5a8f56a5-50ec-01f3-094f-b1213bb29e56@redhat.com>
Organization: Red Hat
In-Reply-To: <5a8f56a5-50ec-01f3-094f-b1213bb29e56@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.09.22 16:51, David Hildenbrand wrote:
> On 22.09.22 16:35, Jason A. Donenfeld wrote:
>> On Thu, Sep 22, 2022 at 03:07:13PM +0200, David Hildenbrand wrote:
>>> +        if (processed >= MAX_BLOCKS_PER_RUN * 128) {
>>> +            break;
>>
>> If you make this a `goto out` or similar instead of a break, then you
>> can
>>
>>> +    if (type == S390_FEAT_TYPE_KLMD && len < 128) {
>>
>> change that to `if (len)`.
> 
> 
> Thanks, I'll do this on top:
> 
> diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> index 67133ba33a..c1505b27a4 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -190,7 +190,7 @@ static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
>            uint64_t w[16];
>    
>            if (processed >= MAX_BLOCKS_PER_RUN * 128) {
> -            break;
> +            goto write_ocv;
>            }
>    
>            sha512_read_block(env, *message_reg + processed, w, ra);
> @@ -198,7 +198,7 @@ static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
>        }
>    
>        /* KMLD: Process partial/empty block last. */
> -    if (type == S390_FEAT_TYPE_KLMD && len < 128) {
> +    if (len) {
>            uint8_t x[128];
>    
>            /* Read the remainder of the message byte-per-byte. */
> @@ -237,6 +237,7 @@ static int cpacf_sha512(CPUS390XState *env, uintptr_t ra, uint64_t param_addr,
>         * TODO: if writing fails halfway through (e.g., when crossing page
>         * boundaries), we're in trouble. We'd need something like access_prepare().
>         */
> +write_ocv:
>        sha512_write_ocv(env, param_addr, a, ra);
>        *message_reg = deposit64(*message_reg, 0, message_reg_len,
>                                 *message_reg + processed);
>

I just realized (when testing) that this doesn't work as we also have to 
deal with the "len == 0" case for KLMD ...

-- 
Thanks,

David / dhildenb


