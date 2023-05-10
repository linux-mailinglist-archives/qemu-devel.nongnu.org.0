Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520466FE220
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:06:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmK1-0006Q0-7Z; Wed, 10 May 2023 12:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmJy-0006JU-NE
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmJw-0007LD-HC
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683734740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F++yh3jXk7U9TAEAghjFV0QOdCwHtVhgBSJ2Zq/TPlg=;
 b=NjnYiishfJTagNmxnwUts76sYgABuxB6jZ/65zj79QjnZswVXIefanIw8cqrv7+xvfs2bK
 RAbN0K+s41QifuapKjmufzjrGSNcHIWsJyE+FitlFji0CX2EnYyBXgwudQ2EdJ4ZMCL+Eb
 4SE0+1jE/nxseQUqt0UZxSo6DtIFTx8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-tdSvrgb-MxOzFNXrQaLdKA-1; Wed, 10 May 2023 12:05:38 -0400
X-MC-Unique: tdSvrgb-MxOzFNXrQaLdKA-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-4346c6cac99so5454346137.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683734734; x=1686326734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F++yh3jXk7U9TAEAghjFV0QOdCwHtVhgBSJ2Zq/TPlg=;
 b=hs0qZBdVG5K2uQoSGLWqxkTBIGxMasq+uCedLGspR7qShxSIQCfIJkxl6Lb52cNT9A
 Pt41d9uJC0P6ZWddtkswO5XPoViq+DERKnBa3+7+GBUmByWlUinoAFHovsRXAwsTRUXA
 a2/24JnskeHYprmK36oMnmJClfTErE790nqN2J8IZtXjePIO9L6OizX95hnMqx/knxre
 JL1TtnFNTE53VPP9YMulU8nnpM7sV8AkDETHNCOynxvDUWQWrXD/iDYCQKdIcoYUJUwU
 ApK5LDNrSegaTfuz8l2gof/fbgEbvZBPBKzzzeayhTa2EM62KhahHBo1/JUsCvovBSPt
 w9VA==
X-Gm-Message-State: AC+VfDylgN1neK4uL5UDzK0nCp9FlTxUNdImmacZyvS5jp1CzBJ8+JHe
 CGaG4AVKP+v3g49RuCGqwWs0SEzv3w5ny7VRgBMG5XBCxLbSN3FXJQkr63/TaAxSWXEAhOxsUxO
 U3TLF5LUGQV9RSSUS4YdIONoMPwfdyY8uSfluWmE=
X-Received: by 2002:a67:fe02:0:b0:417:b0e0:dfe7 with SMTP id
 l2-20020a67fe02000000b00417b0e0dfe7mr5769691vsr.16.1683734734280; 
 Wed, 10 May 2023 09:05:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7WwuYrq6uxjVH2fnmTYxL58Sl6HFf5GiwS1fhOMZwWMAPz86tAVcAkf0vVfGIvspxVffbGLfZozhllY2DZoEY=
X-Received: by 2002:a67:fe02:0:b0:417:b0e0:dfe7 with SMTP id
 l2-20020a67fe02000000b00417b0e0dfe7mr5769656vsr.16.1683734733866; Wed, 10 May
 2023 09:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230510160346.1248626-1-pbonzini@redhat.com>
 <20230510160346.1248626-2-pbonzini@redhat.com>
In-Reply-To: <20230510160346.1248626-2-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 10 May 2023 18:05:21 +0200
Message-ID: <CABgObfaZVcsmERp-cV-cY_pP1hLzEaDTFnaMSc=WXNmVQFaYfA@mail.gmail.com>
Subject: Re: [PATCH] coroutine-asm: add x86 CET shadow stack support
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Sorry, this was sent incorrectly (extra "-1" in the git-send-email
command line).

Paolo

On Wed, May 10, 2023 at 6:03=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build          | 16 +++++++--
>  util/coroutine-asm.c | 82 ++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 93 insertions(+), 5 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 0121ccab78dd..17e4a3bc582e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -328,6 +328,10 @@ elif coroutine_backend not in supported_backends
>          .format(coroutine_backend, ', '.join(supported_backends)))
>  endif
>
> +if cfi_mode =3D=3D 'hw' and coroutine_backend !=3D 'asm'
> +  error('Hardware control-flow integrity requires the "asm" coroutine ba=
ckend.')
> +endif
> +
>  # Compiles if SafeStack *not* enabled
>  safe_stack_probe =3D '''
>    int main(void)
> @@ -469,16 +473,22 @@ if cfi_mode =3D=3D 'sw'
>      endif
>    endif
>  elif cfi_mode in ['hw', 'auto']
> -  if cfi_mode =3D=3D 'hw'
> -    error('Hardware CFI is not supported yet')
> +  if cpu in ['x86', 'x86_64']
> +    cfi_flags +=3D cc.get_supported_arguments('-fcf-protection=3Dfull')
> +    if cfi_mode =3D=3D 'hw'
> +      error('C compiler does not support -fcf-protection')
> +    endif
> +  elif cfi_mode =3D=3D 'hw'
> +    error('Hardware CFI is only supported on x86')
>    endif
>    if cfi_flags =3D=3D [] and cfi_mode =3D=3D 'auto'
>      cfi_mode =3D 'disabled'
>    endif
>  endif
> -if cpu in ['x86', 'x86_64']
> +if cpu in ['x86', 'x86_64'] and cfi_mode !=3D 'hw'
>    cfi_flags +=3D cc.get_supported_arguments('-fcf-protection=3Dbranch')
>  endif
> +
>  add_global_arguments(cfi_flags, native: false, language: all_languages)
>  add_global_link_arguments(cfi_flags, native: false, language: all_langua=
ges)
>
> diff --git a/util/coroutine-asm.c b/util/coroutine-asm.c
> index a06ecbcb0a07..771b1d4a0fc9 100644
> --- a/util/coroutine-asm.c
> +++ b/util/coroutine-asm.c
> @@ -22,6 +22,13 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "qemu/coroutine_int.h"
> +#include "qemu/error-report.h"
> +
> +#ifdef CONFIG_CF_PROTECTION
> +#include <asm/prctl.h>
> +#include <sys/prctl.h>
> +int arch_prctl(int code, unsigned long addr);
> +#endif
>
>  #ifdef CONFIG_VALGRIND_H
>  #include <valgrind/valgrind.h>
> @@ -39,10 +46,14 @@
>  typedef struct {
>      Coroutine base;
>      void *sp;
> +    void *ssp;
>
>      void *stack;
>      size_t stack_size;
>
> +    /* x86: CET shadow stack */
> +    void *sstack;
> +    size_t sstack_size;
>  #ifdef CONFIG_VALGRIND_H
>      unsigned int valgrind_stack_id;
>  #endif
> @@ -77,6 +88,35 @@ static void start_switch_fiber(void **fake_stack_save,
>  #endif
>  }
>
> +static bool have_sstack(void)
> +{
> +#if defined CONFIG_CF_PROTECTION && defined __x86_64__
> +    uint64_t ssp;
> +    asm ("xor %0, %0; rdsspq %0\n" : "=3Dr" (ssp));
> +    return !!ssp;
> +#else
> +    return 0;
> +#endif
> +}
> +
> +static void *alloc_sstack(size_t sz)
> +{
> +#if defined CONFIG_CF_PROTECTION && defined __x86_64__
> +#ifndef ARCH_X86_CET_ALLOC_SHSTK
> +#define ARCH_X86_CET_ALLOC_SHSTK 0x3004
> +#endif
> +
> +    uint64_t arg =3D sz;
> +    if (arch_prctl(ARCH_X86_CET_ALLOC_SHSTK, (unsigned long) &arg) < 0) =
{
> +        abort();
> +    }
> +
> +    return (void *)arg;
> +#else
> +    abort();
> +#endif
> +}
> +
>  #ifdef __x86_64__
>  /*
>   * We hardcode all operands to specific registers so that we can write d=
own all the
> @@ -88,6 +128,26 @@ static void start_switch_fiber(void **fake_stack_save=
,
>   * Note that push and call would clobber the red zone.  Makefile.objs co=
mpiles this
>   * file with -mno-red-zone.  The alternative is to subtract/add 128 byte=
s from rsp
>   * around the switch, with slightly lower cache performance.
> + *
> + * The RSTORSSP and SAVEPREVSSP instructions are intricate.  In a nutshe=
ll they are:
> + *
> + *      RSTORSSP(mem):    oldSSP =3D SSP
> + *                        SSP =3D mem
> + *                        *SSP =3D oldSSP
> + *
> + *      SAVEPREVSSP:      oldSSP =3D shadow_stack_pop()
> + *                        *(oldSSP - 8) =3D oldSSP       # "push" to old=
 shadow stack
> + *
> + * Therefore, RSTORSSP(mem) followed by SAVEPREVSSP is the same as
> + *
> + *     shadow_stack_push(SSP)
> + *     SSP =3D mem
> + *     shadow_stack_pop()
> + *
> + * From the simplified description you can see that co->ssp, being store=
d before
> + * the RSTORSSP+SAVEPREVSSP sequence, points to the top actual entry of =
the shadow
> + * stack, not to the restore token.  Hence we use an offset of -8 in the=
 operand
> + * of rstorssp.
>   */
>  #define CO_SWITCH(from, to, action, jump) ({                            =
              \
>      int action_ =3D action;                                             =
                \
> @@ -100,7 +160,15 @@ static void start_switch_fiber(void **fake_stack_sav=
e,
>          "jmp 2f\n"                          /* switch back continues at =
label 2 */    \
>                                                                          =
              \
>          "1: .cfi_adjust_cfa_offset 8\n"                                 =
              \
> -        "movq %%rsp, %c[SP](%[FROM])\n"     /* save source SP */        =
              \
> +        "xor %%rbp, %%rbp\n"                /* use old frame pointer as =
scratch reg */ \
> +        "rdsspq %%rbp\n"                                                =
              \
> +        "test %%rbp, %%rbp\n"               /* if CET is enabled... */  =
              \
> +        "jz 9f\n"                                                       =
              \
> +        "movq %%rbp, %c[SSP](%[FROM])\n"    /* ... save source shadow SP=
, */         \
> +        "movq %c[SSP](%[TO]), %%rbp\n"      /* restore destination shado=
w stack, */  \
> +        "rstorssp -8(%%rbp)\n"                                          =
              \
> +        "saveprevssp\n"                     /* and save source shadow SP=
 token */     \
> +        "9: movq %%rsp, %c[SP](%[FROM])\n"  /* save source SP */        =
              \
>          "movq %c[SP](%[TO]), %%rsp\n"       /* load destination SP */   =
              \
>          jump "\n"                           /* coroutine switch */      =
              \
>                                                                          =
              \
> @@ -108,7 +176,8 @@ static void start_switch_fiber(void **fake_stack_save=
,
>          "popq %%rbp\n"                                                  =
              \
>          ".cfi_adjust_cfa_offset -8\n"                                   =
              \
>          : "+a" (action_), [FROM] "+b" (from_), [TO] "+D" (to_)          =
              \
> -        : [SP] "i" (offsetof(CoroutineAsm, sp))                         =
              \
> +        : [SP] "i" (offsetof(CoroutineAsm, sp)),                        =
              \
> +          [SSP] "i" (offsetof(CoroutineAsm, ssp))                       =
              \
>          : "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11", "r12", "r13", "=
r14", "r15",  \
>            "memory");                                                    =
              \
>      action_;                                                            =
              \
> @@ -141,6 +210,12 @@ Coroutine *qemu_coroutine_new(void)
>      co->stack =3D qemu_alloc_stack(&co->stack_size);
>      co->sp =3D co->stack + co->stack_size;
>
> +    if (have_sstack()) {
> +        co->sstack_size =3D COROUTINE_SHADOW_STACK_SIZE;
> +        co->sstack =3D alloc_sstack(co->sstack_size);
> +        co->ssp =3D co->sstack + co->sstack_size;
> +    }
> +
>  #ifdef CONFIG_VALGRIND_H
>      co->valgrind_stack_id =3D
>          VALGRIND_STACK_REGISTER(co->stack, co->stack + co->stack_size);
> @@ -186,6 +261,9 @@ void qemu_coroutine_delete(Coroutine *co_)
>  #endif
>
>      qemu_free_stack(co->stack, co->stack_size);
> +    if (co->sstack) {
> +        munmap(co->sstack, co->sstack_size);
> +    }
>      g_free(co);
>  }
>
> --
> 2.40.1


