Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863242FB76
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:52:10 +0200 (CEST)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSJL-0007gg-N9
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSH3-0005ie-TN
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:49:46 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:43725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSGr-0001aO-2O
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:49:45 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id j38so5605863vkd.10
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7dRQ0orXOUpM2Tz7JgfqYMuF2j2oLS9HYMSvQ3tdmIM=;
 b=Vi+d5P+oLdLb0AQSwccUYPOf/4/mnuoc0kJ4wXyh5iqb5vzPKrPpTukCh7pIFU0MEI
 MbwVH+8SpMGwl/zr6GvPSiSW8fkO2QVglr7RrIKCarB9A354ES095cn4845E3UKTIXv5
 BxygXEzLeTZ/a7PmwkTF2J6uN0RD6thsKmhIO1a+ODQN+NREvhKdWWZQzQwQKbVR3oIn
 I/KS6QEIcVjHuthZqgjKGihQWRa2RXemKbdi+NWVkS/FEh/GimcTHdQLDPCUABWqtZai
 WP5TSeeFCxNFzHTjzfJ/tpcs02kW5Nf7+sJszBMQ0DaeKUXePQPZ7eMlA5CqID47oZOj
 zlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7dRQ0orXOUpM2Tz7JgfqYMuF2j2oLS9HYMSvQ3tdmIM=;
 b=phwI+UdjdvdmdqQrdu0AwOAnPkgV3d3TPSnKi7PR9PB5C+5Nbcfqt+LTna4JsnaZSb
 sWR3VJ7nFxJAucO5txprZ02sXHmLjmgLrUiNXqIqOCUluYb81k0kuTgodSYaTRK1KJ0A
 4RIRz1kXrZujsk5IkuCbymaUsQ+Bo50nAOZexTtIdhNXtl8NEv+YJ4mDf9VUlhqjn4u1
 wtNYlSW0TRbGQXbT0PgGnAF1Xjy1bJnd2hgo9tdvPSwu7Q5dMG/AwPv/lsj9pI+v3QF4
 3azS6+sg54m/VANO4+lZl+syS2OwKmEm5KKl6S/K7p1SJcFSmZIXL3FWNKcytXKOUiBl
 ct8g==
X-Gm-Message-State: AOAM531zHj4xGYWCUcvqUqWgYIt+uX0VU2ZQJ1uMl8dt081EIIudCaZf
 RKHcm/F5vVb02x41AeSvY09CkKCyFpvHEUTQAc5eeA==
X-Google-Smtp-Source: ABdhPJyuWJ5XSrRltrBaPKmNijkgjSiSs2rxbcwiuelR0yEztMxKGU3aF+kGTXe2+11xYO3CfUNHzlkPQ79eWqudJl8=
X-Received: by 2002:a1f:2d83:: with SMTP id t125mr14009034vkt.23.1634323771959; 
 Fri, 15 Oct 2021 11:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-45-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-45-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:49:21 -0600
Message-ID: <CANCZdfpmQ4Mbtxi6h3BcAzvUzojN2E-UC9aNGJ-RMhuck4WHOA@mail.gmail.com>
Subject: Re: [PATCH v5 44/67] linux-user: Add cpu_loop_exit_sigbus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e03b1905ce68a771"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000e03b1905ce68a771
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This is a new interface to be provided by the os emulator for
> raising SIGBUS on fault.  Use the new record_sigbus target hook.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 14 ++++++++++++++
>  linux-user/signal.c     | 14 ++++++++++++++
>  2 files changed, 28 insertions(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index f74578500c..6bb2a0f7ec 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -700,6 +700,20 @@ void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState
> *cpu, target_ulong addr,
>                                           MMUAccessType access_type,
>                                           bool maperr, uintptr_t ra);
>
> +/**
> + * cpu_loop_exit_sigbus:
> + * @cpu: the cpu context
> + * @addr: the guest address of the alignment fault
> + * @access_type: access was read/write/execute
> + * @ra: host pc for unwinding
> + *
> + * Use the TCGCPUOps hook to record cpu state, do guest operating system
> + * specific things to raise SIGBUS, and jump to the main cpu loop.
> + */
> +void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
> +                                        MMUAccessType access_type,
> +                                        uintptr_t ra);
> +
>  #else
>  static inline void mmap_lock(void) {}
>  static inline void mmap_unlock(void) {}
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 9d60abc038..df2c8678d0 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -706,6 +706,20 @@ void cpu_loop_exit_sigsegv(CPUState *cpu,
> target_ulong addr,
>      cpu_loop_exit_restore(cpu, ra);
>  }
>
> +void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
> +                          MMUAccessType access_type, uintptr_t ra)
> +{
> +    const struct TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
> +
> +    if (tcg_ops->record_sigbus) {
> +        tcg_ops->record_sigbus(cpu, addr, access_type, ra);
> +    }
> +
> +    force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
> +    cpu->exception_index = EXCP_INTERRUPT;
> +    cpu_loop_exit_restore(cpu, ra);
> +}
> +
>  /* abort execution with signal */
>  static void QEMU_NORETURN dump_core_and_abort(int target_sig)
>  {
> --
> 2.25.1
>
>

--000000000000e03b1905ce68a771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">This is a new interface to be provided by the os emulato=
r for<br>
raising SIGBUS on fault.=C2=A0 Use the new record_sigbus target hook.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/exec-all.h | 14 ++++++++++++++<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++<br>
=C2=A02 files changed, 28 insertions(+)<br></blockquote><div><br></div><div=
><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bs=
dimp.com</a>&gt;</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index f74578500c..6bb2a0f7ec 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -700,6 +700,20 @@ void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu=
, target_ulong addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 M=
MUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ool maperr, uintptr_t ra);<br>
<br>
+/**<br>
+ * cpu_loop_exit_sigbus:<br>
+ * @cpu: the cpu context<br>
+ * @addr: the guest address of the alignment fault<br>
+ * @access_type: access was read/write/execute<br>
+ * @ra: host pc for unwinding<br>
+ *<br>
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system<b=
r>
+ * specific things to raise SIGBUS, and jump to the main cpu loop.<br>
+ */<br>
+void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAcces=
sType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_=
t ra);<br>
+<br>
=C2=A0#else<br>
=C2=A0static inline void mmap_lock(void) {}<br>
=C2=A0static inline void mmap_unlock(void) {}<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index 9d60abc038..df2c8678d0 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -706,6 +706,20 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong=
 addr,<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit_restore(cpu, ra);<br>
=C2=A0}<br>
<br>
+void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMUAccessType access_type, uintptr_t ra)<br>
+{<br>
+=C2=A0 =C2=A0 const struct TCGCPUOps *tcg_ops =3D CPU_GET_CLASS(cpu)-&gt;t=
cg_ops;<br>
+<br>
+=C2=A0 =C2=A0 if (tcg_ops-&gt;record_sigbus) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_ops-&gt;record_sigbus(cpu, addr, access_ty=
pe, ra);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);<br>
+=C2=A0 =C2=A0 cpu-&gt;exception_index =3D EXCP_INTERRUPT;<br>
+=C2=A0 =C2=A0 cpu_loop_exit_restore(cpu, ra);<br>
+}<br>
+<br>
=C2=A0/* abort execution with signal */<br>
=C2=A0static void QEMU_NORETURN dump_core_and_abort(int target_sig)<br>
=C2=A0{<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e03b1905ce68a771--

