Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992A335EE65
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 09:35:28 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWa3b-0002oZ-Oj
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 03:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWa2j-0002NB-7C
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWa2g-0002V1-Ku
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618385668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPjWDC9zq2WUTHGG+cHdmTFoWkGPhxlHYM8+cu5gWQY=;
 b=HF/zpl8DcXirJC7dmgZ7N6NmMXUc1s2B89vjCeSr6TmwG3+P9Vkkwb7Vrb9i2ptGvzZ9Sq
 3g82ifC9DL/Aqnp6BlWy+5SifyKUSl7fwlvxAEkJIgETB0MFp/5mcYpiR/S1ChmmSoZgJr
 rtojRAReZv8WuVqTsmswj3GgQ8S3O3E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-HJsGa4U9N2mQiagC-1Wa7A-1; Wed, 14 Apr 2021 03:34:26 -0400
X-MC-Unique: HJsGa4U9N2mQiagC-1Wa7A-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c3792b0290128219cbc7bso1765749wmr.4
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 00:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vPjWDC9zq2WUTHGG+cHdmTFoWkGPhxlHYM8+cu5gWQY=;
 b=XFAWjYHH6IL5qc53VifZKW05qbk4biC2uGeqGfTidHSNcX1dED49NqgXYnofRb0s3c
 USlargLwEvqXxirrANGYFG61xMOFQyrMBADi+OYqc9l6Zf30mdzh/KhevmJd1jh+n0bw
 Mc3fYqCUwhxi/4j4U2nxtsATd3aH9jGoOg7Eu9otzzpnRfTIimSOcfRzMIL1udtvmqhB
 81LN49yzIr6KK56imu44lp/XKTFzee7jsbqYVgkVuqB3CtauMRbsVWrbK0B2DZ9zGVkT
 i2LJAvDaJhGitQeZibDBNunWOLdGkqcee4SVX6z0SVOw87+sedeC7Ou4A58tKFLoI2PH
 WXWA==
X-Gm-Message-State: AOAM530Z0Kv49MbUDVJIlZNkV+rLVpDtMxoLsJMTIln7hLZQzYv15hFJ
 W9hCON1OjgTrb4wadCBXlaDQOyX/Uhy5Wv6ngLn/ciN+t8MNfWGX7MpQAI2aCL+Fj1ssjCUnS0x
 iPHFdFDHccFP0Xo5HRc3091hZQKiVpde/MLHaCduLsrwsPx2N2EhmkQthz8EdC3U=
X-Received: by 2002:a1c:7207:: with SMTP id n7mr1543793wmc.11.1618385665002;
 Wed, 14 Apr 2021 00:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIJVZM1EVrjLdkEeyujWQOHQHcDluciARP1u2ulzx6ZDoneHtIHpxmgQRJPOcR7s9Tnm02og==
X-Received: by 2002:a1c:7207:: with SMTP id n7mr1543749wmc.11.1618385664584;
 Wed, 14 Apr 2021 00:34:24 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6470.dip0.t-ipconnect.de. [91.12.100.112])
 by smtp.gmail.com with ESMTPSA id w7sm24009587wru.74.2021.04.14.00.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 00:34:24 -0700 (PDT)
Subject: Re: [PATCH v2] target/s390x: Fix translation exception on illegal
 instruction
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210413165257.21426-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <72f45896-4943-9c20-e0ca-9091ca068d0f@redhat.com>
Date: Wed, 14 Apr 2021 09:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413165257.21426-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.04.21 18:52, Ilya Leoshkevich wrote:
> Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> happens is:
> 
> * uretprobe maps a userspace page containing an invalid instruction.
> * uretprobe replaces the target function's return address with the
>    address of that page.
> * When tb_gen_code() is called on that page, tb->size ends up being 0
>    (because the page starts with the invalid instruction), which causes
>    virt_page2 to point to the previous page.
> * The previous page is not mapped, so this causes a spurious
>    translation exception.
> 
> The bug is that tb->size must never be 0: even if there is an illegal
> instruction, the instruction bytes that have been looked at must count
> towards tb->size. So adjust s390x's translate_one() to act this way
> for both illegal instructions and instructions that are known to
> generate exceptions.
> 
> Also add an assertion to tb_gen_code() in order to detect such
> situations in future.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
>            in tb_gen_code().
> 
>   accel/tcg/translate-all.c |  1 +
>   target/s390x/translate.c  | 16 +++++++++++-----
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ba6ab09790..93b2dae112 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1913,6 +1913,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>   
>       tcg_ctx->cpu = env_cpu(env);
>       gen_intermediate_code(cpu, tb, max_insns);
> +    assert(tb->size != 0);
>       tcg_ctx->cpu = NULL;
>       max_insns = tb->icount;
>   
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 4f953ddfba..e243624d2a 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -6412,7 +6412,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
>                         s->fields.op, s->fields.op2);
>           gen_illegal_opcode(s);
> -        return DISAS_NORETURN;
> +        ret = DISAS_NORETURN;
> +        goto out;
>       }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -6428,7 +6429,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           /* privileged instruction */
>           if ((s->base.tb->flags & FLAG_MASK_PSTATE) && (insn->flags & IF_PRIV)) {
>               gen_program_exception(s, PGM_PRIVILEGED);
> -            return DISAS_NORETURN;
> +            ret = DISAS_NORETURN;
> +            goto out;
>           }
>   
>           /* if AFP is not enabled, instructions and registers are forbidden */
> @@ -6455,7 +6457,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>               }
>               if (dxc) {
>                   gen_data_exception(dxc);
> -                return DISAS_NORETURN;
> +                ret = DISAS_NORETURN;
> +                goto out;
>               }
>           }
>   
> @@ -6463,7 +6466,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           if (insn->flags & IF_VEC) {
>               if (!((s->base.tb->flags & FLAG_MASK_VECTOR))) {
>                   gen_data_exception(0xfe);
> -                return DISAS_NORETURN;
> +                ret = DISAS_NORETURN;
> +                goto out;
>               }
>           }
>   
> @@ -6484,7 +6488,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>               (insn->spec & SPEC_r1_f128 && !is_fp_pair(get_field(s, r1))) ||
>               (insn->spec & SPEC_r2_f128 && !is_fp_pair(get_field(s, r2)))) {
>               gen_program_exception(s, PGM_SPECIFICATION);
> -            return DISAS_NORETURN;
> +            ret = DISAS_NORETURN;
> +            goto out;
>           }
>       }
>   
> @@ -6544,6 +6549,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>       }
>   #endif
>   
> +out:
>       /* Advance to the next instruction.  */
>       s->base.pc_next = s->pc_tmp;
>       return ret;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


