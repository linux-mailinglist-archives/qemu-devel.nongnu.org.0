Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B5E42FBE1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:19:21 +0200 (CEST)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSjh-0004f5-1U
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSc8-0008LE-Nz
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:11:32 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSc5-00010d-Ce
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:11:32 -0400
Received: by mail-vk1-xa29.google.com with SMTP id t200so5692804vkt.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkiyZBtICgL+JIx+npqGtUK75CUh20HMLvrzWkvYCAo=;
 b=kQV5EUZd4QKaKAPhb1CGnm/m0/H62AzD82+yzCzeKDntgMEMSMgHlCT5VOR13yNqcE
 ozbMqB+L6fLTl1IrlACvnvz8SoWf5n5eEaCqSz8Q12YnQXmyLbFEOXZFD8NrYfQSy/WH
 es2lqXkDKhqpI/Q70mcazbZmoIestnSm3h4Jq+mpTiYdR355ljylgItAeflTVcmSY05Y
 HHRZkWyvTfDhPC6Rkk2U6TtcYBkzOB5LfFhTSk3C2OrDSl+1VrnzAH7uZ+31bubU5lAj
 aUGKRvuTCa7ESEn83DC+qbOUGsJRa4cfbE7F9lW8HgR0/DMSimJwGvkrVLkQuJXKBOfW
 SQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkiyZBtICgL+JIx+npqGtUK75CUh20HMLvrzWkvYCAo=;
 b=5wMm32bXuRW6YexiOhpIkLq4mY4NttGkUGNIge6TK5osyiCFcVygerG4SOoB54oGb2
 PxgYFNlUNBZKynk+BWvs12/QjoCD/9D6X6AUArNtXQCclnWan+9qG8oEIpBspZJOX4tb
 2rb57yia/Esrg2AAIBdfMjuZr5Awv0jZ0ZAjybnRVxhx0eHRN5sfBzoUNseS3QBzIBKU
 UPEAcE/F1NLkuGxMt5rjwZNvR+hukvt77WaXFZgVcBrrTFTzvYsS5TRT5eU3CNiFkjQP
 Kjs9ggn3da3bv81TCnx9+rDxnckkVWq606aqMYObB8IV4rqmhf8EjGCpUbM87NY6s2IJ
 tuOQ==
X-Gm-Message-State: AOAM531xEBfaYPOLZXLp6N6vJlR1i4aNAT/dVWjQo73HfWU6pBNr+6h/
 55sMTPPfW0PUx18paWG6QrpeBFxjA961B1n2mrrlslc+CVAGIg==
X-Google-Smtp-Source: ABdhPJwxpNSSZAp7YJkm6tJCGwaLPLqMp1AFjS91MGkICLsKbsmMHVSRZECEl/OwPOcKMx01AKpUAlC69BGPz/cVD3o=
X-Received: by 2002:a1f:2006:: with SMTP id g6mr14281550vkg.22.1634325088110; 
 Fri, 15 Oct 2021 12:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-65-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-65-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 13:11:17 -0600
Message-ID: <CANCZdfoJGbzMGRQbmUj0MxHW2mucEZPnO00G-51BHtd7vaVSQg@mail.gmail.com>
Subject: Re: [PATCH v5 64/67] linux-user: Add code for PR_GET/SET_UNALIGN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000053306605ce68f6f1"
Received-SPF: none client-ip=2607:f8b0:4864:20::a29;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000053306605ce68f6f1
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This requires extra work for each target, but adds the
> common syscall code, and the necessary flag in CPUState.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h                     |  3 +++
>  linux-user/generic/target_prctl_unalign.h | 27 +++++++++++++++++++++++
>  cpu.c                                     | 20 ++++++++++++-----
>  linux-user/syscall.c                      | 13 +++++++++--
>  4 files changed, 56 insertions(+), 7 deletions(-)
>  create mode 100644 linux-user/generic/target_prctl_unalign.h
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 1a10497af3..6202bbf9c3 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -412,6 +412,9 @@ struct CPUState {
>
>      bool ignore_memory_transaction_failures;
>
> +    /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
> +    bool prctl_unalign_sigbus;
> +
>      struct hax_vcpu_state *hax_vcpu;
>
>      struct hvf_vcpu_state *hvf;
> diff --git a/linux-user/generic/target_prctl_unalign.h
> b/linux-user/generic/target_prctl_unalign.h
> new file mode 100644
> index 0000000000..bc3b83af2a
> --- /dev/null
> +++ b/linux-user/generic/target_prctl_unalign.h
> @@ -0,0 +1,27 @@
> +/*
> + * Generic prctl unalign functions for linux-user
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef GENERIC_TARGET_PRCTL_UNALIGN_H
> +#define GENERIC_TARGET_PRCTL_UNALIGN_H
> +
> +static abi_long do_prctl_get_unalign(CPUArchState *env, target_long arg2)
> +{
> +    CPUState *cs = env_cpu(env);
> +    uint32_t res = PR_UNALIGN_NOPRINT;
> +    if (cs->prctl_unalign_sigbus) {
> +        res |= PR_UNALIGN_SIGBUS;
> +    }
> +    return put_user_u32(res, arg2);
> +}
> +#define do_prctl_get_unalign do_prctl_get_unalign
> +
> +static abi_long do_prctl_set_unalign(CPUArchState *env, target_long arg2)
> +{
> +    env_cpu(env)->prctl_unalign_sigbus = arg2 & PR_UNALIGN_SIGBUS;
> +    return 0;
> +}
> +#define do_prctl_set_unalign do_prctl_set_unalign
> +
> +#endif /* GENERIC_TARGET_PRCTL_UNALIGN_H */
> diff --git a/cpu.c b/cpu.c
> index 9bce67ef55..9e388d9cd3 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -179,13 +179,23 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>      cpu_list_remove(cpu);
>  }
>
> +/*
> + * This can't go in hw/core/cpu.c because that file is compiled only
> + * once for both user-mode and system builds.
> + */
>  static Property cpu_common_props[] = {
> -#ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_USER_ONLY
>      /*
> -     * Create a memory property for softmmu CPU object,
> -     * so users can wire up its memory. (This can't go in hw/core/cpu.c
> -     * because that file is compiled only once for both user-mode
> -     * and system builds.) The default if no link is set up is to use
> +     * Create a property for the user-only object, so users can
> +     * adjust prctl(PR_SET_UNALIGN) from the command-line.
> +     * Has no effect if the target does not support the feature.
> +     */
> +    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
> +                     prctl_unalign_sigbus, false),
> +#else
> +    /*
> +     * Create a memory property for softmmu CPU object, so users can
> +     * wire up its memory.  The default if no link is set up is to use
>       * the system address space.
>       */
>      DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 7635c2397a..ac3bc8a330 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6375,6 +6375,12 @@ static abi_long do_prctl_inval1(CPUArchState *env,
> abi_long arg2)
>  #ifndef do_prctl_get_tagged_addr_ctrl
>  #define do_prctl_get_tagged_addr_ctrl do_prctl_inval0
>  #endif
> +#ifndef do_prctl_get_unalign
> +#define do_prctl_get_unalign do_prctl_inval1
> +#endif
> +#ifndef do_prctl_set_unalign
> +#define do_prctl_set_unalign do_prctl_inval1
> +#endif
>
>  static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long
> arg2,
>                           abi_long arg3, abi_long arg4, abi_long arg5)
> @@ -6438,6 +6444,11 @@ static abi_long do_prctl(CPUArchState *env,
> abi_long option, abi_long arg2,
>          }
>          return do_prctl_get_tagged_addr_ctrl(env);
>
> +    case PR_GET_UNALIGN:
> +        return do_prctl_get_unalign(env, arg2);
> +    case PR_SET_UNALIGN:
> +        return do_prctl_set_unalign(env, arg2);
> +
>      case PR_GET_DUMPABLE:
>      case PR_SET_DUMPABLE:
>      case PR_GET_KEEPCAPS:
> @@ -6480,8 +6491,6 @@ static abi_long do_prctl(CPUArchState *env, abi_long
> option, abi_long arg2,
>      case PR_SET_THP_DISABLE:
>      case PR_GET_TSC:
>      case PR_SET_TSC:
> -    case PR_GET_UNALIGN:
> -    case PR_SET_UNALIGN:
>      default:
>          /* Disable to prevent the target disabling stuff we need. */
>          return -TARGET_EINVAL;
> --
> 2.25.1
>
>

--00000000000053306605ce68f6f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">This requires extra work for each target, but adds the<b=
r>
common syscall code, and the necessary flag in CPUState.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/hw/core/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0linux-user/generic/target_prctl_unalign.h | 27 ++++++++++++++++++++++=
+<br>
=C2=A0cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 +=
+++++++++++-----<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++--<br>
=C2=A04 files changed, 56 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 linux-user/generic/target_prctl_unalign.h<br></blo=
ckquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:=
imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h<br>
index 1a10497af3..6202bbf9c3 100644<br>
--- a/include/hw/core/cpu.h<br>
+++ b/include/hw/core/cpu.h<br>
@@ -412,6 +412,9 @@ struct CPUState {<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool ignore_memory_transaction_failures;<br>
<br>
+=C2=A0 =C2=A0 /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */=
<br>
+=C2=A0 =C2=A0 bool prctl_unalign_sigbus;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0struct hax_vcpu_state *hax_vcpu;<br>
<br>
=C2=A0 =C2=A0 =C2=A0struct hvf_vcpu_state *hvf;<br>
diff --git a/linux-user/generic/target_prctl_unalign.h b/linux-user/generic=
/target_prctl_unalign.h<br>
new file mode 100644<br>
index 0000000000..bc3b83af2a<br>
--- /dev/null<br>
+++ b/linux-user/generic/target_prctl_unalign.h<br>
@@ -0,0 +1,27 @@<br>
+/*<br>
+ * Generic prctl unalign functions for linux-user<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+#ifndef GENERIC_TARGET_PRCTL_UNALIGN_H<br>
+#define GENERIC_TARGET_PRCTL_UNALIGN_H<br>
+<br>
+static abi_long do_prctl_get_unalign(CPUArchState *env, target_long arg2)<=
br>
+{<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 uint32_t res =3D PR_UNALIGN_NOPRINT;<br>
+=C2=A0 =C2=A0 if (cs-&gt;prctl_unalign_sigbus) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res |=3D PR_UNALIGN_SIGBUS;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return put_user_u32(res, arg2);<br>
+}<br>
+#define do_prctl_get_unalign do_prctl_get_unalign<br>
+<br>
+static abi_long do_prctl_set_unalign(CPUArchState *env, target_long arg2)<=
br>
+{<br>
+=C2=A0 =C2=A0 env_cpu(env)-&gt;prctl_unalign_sigbus =3D arg2 &amp; PR_UNAL=
IGN_SIGBUS;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+#define do_prctl_set_unalign do_prctl_set_unalign<br>
+<br>
+#endif /* GENERIC_TARGET_PRCTL_UNALIGN_H */<br>
diff --git a/cpu.c b/cpu.c<br>
index 9bce67ef55..9e388d9cd3 100644<br>
--- a/cpu.c<br>
+++ b/cpu.c<br>
@@ -179,13 +179,23 @@ void cpu_exec_unrealizefn(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0cpu_list_remove(cpu);<br>
=C2=A0}<br>
<br>
+/*<br>
+ * This can&#39;t go in hw/core/cpu.c because that file is compiled only<b=
r>
+ * once for both user-mode and system builds.<br>
+ */<br>
=C2=A0static Property cpu_common_props[] =3D {<br>
-#ifndef CONFIG_USER_ONLY<br>
+#ifdef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0* Create a memory property for softmmu CPU object,<br>
-=C2=A0 =C2=A0 =C2=A0* so users can wire up its memory. (This can&#39;t go =
in hw/core/cpu.c<br>
-=C2=A0 =C2=A0 =C2=A0* because that file is compiled only once for both use=
r-mode<br>
-=C2=A0 =C2=A0 =C2=A0* and system builds.) The default if no link is set up=
 is to use<br>
+=C2=A0 =C2=A0 =C2=A0* Create a property for the user-only object, so users=
 can<br>
+=C2=A0 =C2=A0 =C2=A0* adjust prctl(PR_SET_UNALIGN) from the command-line.<=
br>
+=C2=A0 =C2=A0 =C2=A0* Has no effect if the target does not support the fea=
ture.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;prctl-unalign-sigbus&quot;, CPUState,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0prctl_unalign_sigbus, false),<br>
+#else<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Create a memory property for softmmu CPU object, so =
users can<br>
+=C2=A0 =C2=A0 =C2=A0* wire up its memory.=C2=A0 The default if no link is =
set up is to use<br>
=C2=A0 =C2=A0 =C2=A0 * the system address space.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_LINK(&quot;memory&quot;, CPUState, memory, =
TYPE_MEMORY_REGION,<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index 7635c2397a..ac3bc8a330 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -6375,6 +6375,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, a=
bi_long arg2)<br>
=C2=A0#ifndef do_prctl_get_tagged_addr_ctrl<br>
=C2=A0#define do_prctl_get_tagged_addr_ctrl do_prctl_inval0<br>
=C2=A0#endif<br>
+#ifndef do_prctl_get_unalign<br>
+#define do_prctl_get_unalign do_prctl_inval1<br>
+#endif<br>
+#ifndef do_prctl_set_unalign<br>
+#define do_prctl_set_unalign do_prctl_inval1<br>
+#endif<br>
<br>
=C2=A0static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long=
 arg2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 abi_long arg3, abi_long arg4, abi_long arg5)<br>
@@ -6438,6 +6444,11 @@ static abi_long do_prctl(CPUArchState *env, abi_long=
 option, abi_long arg2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return do_prctl_get_tagged_addr_ctrl(env)=
;<br>
<br>
+=C2=A0 =C2=A0 case PR_GET_UNALIGN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return do_prctl_get_unalign(env, arg2);<br>
+=C2=A0 =C2=A0 case PR_SET_UNALIGN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return do_prctl_set_unalign(env, arg2);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0case PR_GET_DUMPABLE:<br>
=C2=A0 =C2=A0 =C2=A0case PR_SET_DUMPABLE:<br>
=C2=A0 =C2=A0 =C2=A0case PR_GET_KEEPCAPS:<br>
@@ -6480,8 +6491,6 @@ static abi_long do_prctl(CPUArchState *env, abi_long =
option, abi_long arg2,<br>
=C2=A0 =C2=A0 =C2=A0case PR_SET_THP_DISABLE:<br>
=C2=A0 =C2=A0 =C2=A0case PR_GET_TSC:<br>
=C2=A0 =C2=A0 =C2=A0case PR_SET_TSC:<br>
-=C2=A0 =C2=A0 case PR_GET_UNALIGN:<br>
-=C2=A0 =C2=A0 case PR_SET_UNALIGN:<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable to prevent the target disablin=
g stuff we need. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -TARGET_EINVAL;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000053306605ce68f6f1--

