Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE283A78A6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:02:48 +0200 (CEST)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt423-0005ns-SJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3zM-0003G7-Gq
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3zJ-000797-Hu
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6K8YWcj81NY2YbfyLjIJuyA2u50NTcwcn5pBmqeGw5s=;
 b=FKs2JRsaIgnBisjXC13f0gQQpKhcsuAbujJR3YpRgf2ulEBmzsFkd5F0+CVdwblyhArx2p
 ddsuRPajUt5m2aOhTkmI6yGjsxE8+lGFpF+T8pfnkUvH0vzHUXnTsF6EcA6JX0jC+NCDD4
 He8sOJz8KTxvKhIj3kefC6bIWuIsZgA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-sDwJrdgjNv-Wx2K5b_xWoQ-1; Tue, 15 Jun 2021 03:59:54 -0400
X-MC-Unique: sDwJrdgjNv-Wx2K5b_xWoQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j2-20020a05600c1c02b02901cecbe55d49so129003wms.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6K8YWcj81NY2YbfyLjIJuyA2u50NTcwcn5pBmqeGw5s=;
 b=f5uBXt7+98s5wyy6Nj+3Fo3zBo3Hhso+56EHCSHbvqwW1/u7CVtTPUA0fXhXGuQmc4
 NBp1bQvp1M2T78XYimxCV0FLSc/d/RBwgbgAGAuY/TzZn0wLzsP3/oos7zVIvaWmkImc
 7Fq/bSacp2TdB8EO0kDgXrd4zyojCIcxC74mj7ZfI5m9UwfzbNHllNfJKoYOrUIwo6lg
 dEULZV768QrFWZyhiS2TUM9UoOCDE81TzWOZhBmu26Q6U6MpJiuSuwCNgy6de3683wOS
 0/vzj2p4FKMoD5Gr1lJEj/RgQN+Z/Rgmh7hXbq6BdhdTbUW4SLnNbAdHNFHfSZnr7z7a
 Kt+A==
X-Gm-Message-State: AOAM530EBPEHzasje2iVJAHxBmia7kerwmYTgZi+j6IcjTOBbvzHOQna
 G4dBXUL9uf5SfswQxt+SAIUx4fFRSKcv1GfzMUr/H448xMyyMRFQj8+tqAS00XaBfrDFei9cXOY
 oDBpZs/G69oQEj0M=
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr3667990wmq.157.1623743993728; 
 Tue, 15 Jun 2021 00:59:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA23PHbdC7RpkFT4T62+kNFgRl7Tm2hUYoLNom6fkQJjbsjAiQH/2XCbEVGV775KYL6qg8oA==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr3667963wmq.157.1623743993504; 
 Tue, 15 Jun 2021 00:59:53 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6136.dip0.t-ipconnect.de. [91.12.97.54])
 by smtp.gmail.com with ESMTPSA id
 n13sm20358888wrg.75.2021.06.15.00.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:59:53 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <20210615030744.1252385-6-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 5/5] linux-user/s390x: Save and restore psw.mask properly
Message-ID: <6acc61df-f2e0-8f59-3a87-9bdc89afee32@redhat.com>
Date: Tue, 15 Jun 2021 09:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615030744.1252385-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.06.21 05:07, Richard Henderson wrote:
> At present, we're referencing env->psw.mask directly, which
> fails to ensure that env->cc_op is incorporated or updated.
> Use s390_cpu_{set_psw,get_psw_mask} to fix this.
> 
> Mirror the kernel's cleaning of the psw.mask in save_sigregs
> and restore_sigregs.  Ignore PSW_MASK_RI for now, as qemu does
> not support that.

s/qemu/qemu\/tcg/ ? because qemu/kvm supports it .

Maybe reference the bug reports this fixes?

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 37 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index ef136dae33..bf8a8fbfe9 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -112,15 +112,23 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
>       return (sp - frame_size) & -8ul;
>   }
>   
> +#define PSW_USER_BITS   (PSW_MASK_DAT | PSW_MASK_IO | PSW_MASK_EXT | \
> +                         PSW_MASK_MCHECK | PSW_MASK_PSTATE | PSW_ASC_PRIMARY)
> +#define PSW_MASK_USER   (PSW_MASK_ASC | PSW_MASK_CC | PSW_MASK_PM | \
> +                         PSW_MASK_64 | PSW_MASK_32)
> +
>   static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
>   {
> +    uint64_t psw_mask = s390_cpu_get_psw_mask(env);
>       int i;
>   
>       /*
>        * Copy a 'clean' PSW mask to the user to avoid leaking
>        * information about whether PER is currently on.
> +     * TODO: qemu does not support PSW_MASK_RI; it will never be set.
>        */
> -    __put_user(env->psw.mask, &sregs->regs.psw.mask);
> +    psw_mask = PSW_USER_BITS | (psw_mask & PSW_MASK_USER);
> +    __put_user(psw_mask, &sregs->regs.psw.mask);
>       __put_user(env->psw.addr, &sregs->regs.psw.addr);
>   
>       for (i = 0; i < 16; i++) {
> @@ -289,7 +297,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>   
>   static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
>   {
> -    target_ulong prev_addr;
> +    uint64_t prev_addr, prev_mask, mask, addr;
>       int i;
>   
>       for (i = 0; i < 16; i++) {
> @@ -297,9 +305,28 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
>       }
>   
>       prev_addr = env->psw.addr;
> -    __get_user(env->psw.mask, &sc->regs.psw.mask);
> -    __get_user(env->psw.addr, &sc->regs.psw.addr);
> -    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
> +    __get_user(mask, &sc->regs.psw.mask);
> +    __get_user(addr, &sc->regs.psw.addr);
> +    trace_user_s390x_restore_sigregs(env, addr, prev_addr);
> +
> +    /*
> +     * Use current psw.mask to preserve PER bit.
> +     * TODO:
> +     *  if (!is_ri_task(current) && (user_sregs.regs.psw.mask & PSW_MASK_RI))
> +     *          return -EINVAL;
> +     * Simply do not allow it to be set in mask.
> +     */
> +    prev_mask = s390_cpu_get_psw_mask(env);
> +    mask = (prev_mask & ~PSW_MASK_USER) | (mask & PSW_MASK_USER);
> +    /* Check for invalid user address space control. */
> +    if ((mask & PSW_MASK_ASC) == PSW_ASC_HOME) {
> +        mask = (mask & ~PSW_MASK_ASC) | PSW_ASC_PRIMARY;
> +    }
> +    /* Check for invalid amode. */
> +    if (mask & PSW_MASK_64) {
> +        mask |= PSW_MASK_32;
> +    }
> +    s390_cpu_set_psw(env, mask, addr);
>   
>       for (i = 0; i < 16; i++) {
>           __get_user(env->aregs[i], &sc->regs.acrs[i]);
> 

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


