Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA56BB7D2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:30:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcT57-0003Dq-Fi; Wed, 15 Mar 2023 11:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcT53-0003AR-Jj
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcT52-0002Py-2a
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678894219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FC9qNFDr7dW2zK086jpA7TBzeL835tczoyigjEkqsv8=;
 b=f1aakpnG07mOcn0onxKoBkH+PJ/WfmDgJdg7zTDXZnEzQ4pjh88aV6cburZI9pzCdxO0vK
 BtHQEI2ctjIaxfXFc3UEYeiB3KEKr2m1sa0MDFfdMRcL9/ISzhMFrYfNjrpZ7CeH+3eLFI
 eTrtKmkz4DvMbASTJ7Xn01QFJ5kfEbw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-u0SxyBtLNFOo1nAWavuaJQ-1; Wed, 15 Mar 2023 11:30:17 -0400
X-MC-Unique: u0SxyBtLNFOo1nAWavuaJQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so1160157wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 08:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678894216;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FC9qNFDr7dW2zK086jpA7TBzeL835tczoyigjEkqsv8=;
 b=DgOOwRpwk58xV7jkEVznacM9Kc4fW3p4qDove+BPOty5jDVFvpG2FCDzE7O/lH5x32
 6fCj3PfkckqKYglVFgYxFlaXnHq9v/M/iEjI205nvAcULSo41d0q69F2IP7ilosJhBBX
 MQYKf/j2QLq6pdc1PTZDjdGfW/PfI//GjA9b7eVZzd65E7NUe0Sl0PCT0Jz2ZybkLsYT
 b/X2tWIdfjwX1dtbsBkvRlJ4ZAEfDhscqJjhK3v0fgVqCbdpF/V34RA7E4GU3cqUaskW
 kXA5m2pWUMHWazJiPFmYYE+2z81kmLqDD+M0XtQumqxeptsFbRh4Ej/weZ95Pi9nxm23
 GGHA==
X-Gm-Message-State: AO0yUKUyb4/p+lMdxTrOX9E4SMiy7Pv9QUmC2HFue7ZiIqv5ybJj/p/D
 J/DfPwTLbJ17iDwt9WhQPmqcDMFt7IrNvz0xV2UxyAXEMx0++GOoXyY4ELFBOX6MbmYyoLJd1Sb
 +UXDj0xbgtyV5qHc=
X-Received: by 2002:a05:600c:1d14:b0:3eb:376e:2ba5 with SMTP id
 l20-20020a05600c1d1400b003eb376e2ba5mr18319804wms.3.1678894216538; 
 Wed, 15 Mar 2023 08:30:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set/ReW6tk4qhIry8danRbdKsy4fVXixFd+dqKAqRDX/XuBXdR4x/aikZioWpke1G3HL7pJvKcQ==
X-Received: by 2002:a05:600c:1d14:b0:3eb:376e:2ba5 with SMTP id
 l20-20020a05600c1d1400b003eb376e2ba5mr18319788wms.3.1678894216277; 
 Wed, 15 Mar 2023 08:30:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b002cea392f000sm4869196wrv.69.2023.03.15.08.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:30:15 -0700 (PDT)
Message-ID: <646d6c84-4004-6fce-20de-6f327b3975db@redhat.com>
Date: Wed, 15 Mar 2023 16:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@redhat.com
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-2-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/7] target/s390x: Fix s390_probe_access for user-only
In-Reply-To: <20230109201856.3916639-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/01/2023 21.18, Richard Henderson wrote:
> In db9aab5783a2 we broke the contract of s390_probe_access, in that it
> no longer returned an exception code, nor set __excp_addr.  Fix both.
> 
> Reported-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/mem_helper.c | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index cb82cd1c1d..5c0a7b1961 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -138,23 +138,27 @@ typedef struct S390Access {
>    * For !CONFIG_USER_ONLY, the TEC is stored stored to env->tlb_fill_tec.
>    * For CONFIG_USER_ONLY, the faulting address is stored to env->__excp_addr.
>    */
> -static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
> -                             MMUAccessType access_type, int mmu_idx,
> -                             bool nonfault, void **phost, uintptr_t ra)
> +static inline int s390_probe_access(CPUArchState *env, target_ulong addr,
> +                                    int size, MMUAccessType access_type,
> +                                    int mmu_idx, bool nonfault,
> +                                    void **phost, uintptr_t ra)
>   {
> -#if defined(CONFIG_USER_ONLY)
> -    return probe_access_flags(env, addr, access_type, mmu_idx,
> -                              nonfault, phost, ra);
> -#else
> -    int flags;
> +    int flags = probe_access_flags(env, addr, access_type, mmu_idx,
> +                                   nonfault, phost, ra);
>   
> -    env->tlb_fill_exc = 0;
> -    flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
> -                               ra);
> -    if (env->tlb_fill_exc) {
> +    if (unlikely(flags & TLB_INVALID_MASK)) {
> +        assert(!nonfault);

  Hi Richard,

qemu-system-s390x now triggers on this assert() if running the
kvm-unit-tests in TCG mode:

$ qemu-system-s390x -nographic -kernel s390x/mvpg.elf
...
PASS: mvpg: exceptions: specification: Key Function Control value 27
PASS: mvpg: exceptions: specification: Key Function Control value 28
PASS: mvpg: exceptions: specification: Key Function Control value 29
PASS: mvpg: exceptions: specification: Key Function Control value 30
PASS: mvpg: exceptions: specification: Key Function Control value 31
qemu-system-s390x: ../../devel/qemu/target/s390x/tcg/mem_helper.c:152: s390_probe_access: Assertion `!nonfault' failed.
Aborted (core dumped)

If I've got the test right, it tries to do a "mvpg" with an illegal
address and expects to see an addressing exception.

It seems to work when I remove the assert() statement. Could we maybe
replace it with a qemu_log_mask(LOG_GUEST_ERROR, ...) instead?

> +#ifdef CONFIG_USER_ONLY
> +        /* Address is in TEC in system mode; see s390_cpu_record_sigsegv. */
> +        env->__excp_addr = addr & TARGET_PAGE_MASK;
> +        return (page_get_flags(addr) & PAGE_VALID
> +                ? PGM_PROTECTION : PGM_ADDRESSING);
> +#else
>           return env->tlb_fill_exc;
> +#endif
>       }

  Thomas


