Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749ED3FF4E4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:27:34 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtJ7-0006MT-Fw
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtGE-0003RD-OW
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:24:34 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:35628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtGC-000584-PP
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:24:34 -0400
Received: by mail-vs1-xe29.google.com with SMTP id p14so2642505vsm.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8Au4c7FKoaiiMWcGWVkJQlwfGHl1ua4n/AY/z3jDxg=;
 b=ygYzn8w7lHQ77vwd95mDffZz0nx3ggUnPStoVqrE68fm29Hz19TQ3h+t5Uglu+rZev
 RvohAJbyVuJO6hyqF5QwtAdpjyvO+zdT8otwVjp1nO69oxGK5Bz64X2usN2PRlESu+Ua
 0kePoXWMcH0sPn3cL1QsyhL2efzEMdxe9ivKIO/4boUAWlCI2hlkakKsVNkQhlEx9Wk1
 KLRsMG7bU430gSgF/QCDJ72sBpEzFFJfR3YSctbjiyCSaWASkZvXJINNidn+GsJoTXOV
 x2O1E43DJzVJo5Kmwl7LACoWwMyp5jgAWCSnNg5cSTijsZgVUUnZOxb6mLll/Cc2IwFS
 QrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8Au4c7FKoaiiMWcGWVkJQlwfGHl1ua4n/AY/z3jDxg=;
 b=GP5yZ/GAGfuzS3b3gcDRNgPE+wroT/SoJ+JsVo5Z7H+g1K6YNyRqPyjvophk7spSWa
 A3JqZl0VJdEhIdQ31xdA3/rjttkQDAei6GSGGrHndT8n9C2SNiigj/Mb5B9A/Qk+KUUS
 iLxGIfhanw7vrj8vWMYsB91Gg8VgYF95LSrrFQjom38msZ2llLJb+SkjKXsxQtymMVpI
 +/03RJzNWYgM+bSiYqpdjzUFIMxfCydHqbLwpmemZht2q32/M4a6GtzUhCfAqwUsVfm/
 TCRwmEu8hrcv906quwPTBUN+VJ6p4EwjWnJGZmIle4zCTtPh8oXrlWvEJYb+NBB5y1lW
 ZirQ==
X-Gm-Message-State: AOAM531ZB1ufCI14I1otTIIZVcnHi+2dlgE3j7wMMICdp0oen3v/hI0Z
 KGcN6f8jKJnxkQ0UuGDqMCdrcPKeU/1WvVbUcr9N8w==
X-Google-Smtp-Source: ABdhPJzP1rYW+Uga4iHnT/xVwapUcXCo3gEwp9XNO5GX6s9rIS/g56JFJ5GvesgZQp6sO/xDc8SY6QHqXxivEuQkGb4=
X-Received: by 2002:a67:c789:: with SMTP id t9mr4350240vsk.60.1630614270890;
 Thu, 02 Sep 2021 13:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-17-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-17-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:24:20 -0600
Message-ID: <CANCZdfrMm7dHn+g7V08xrk+JuWKBTVp8Q=8PaBGdSWx7z5ZrBw@mail.gmail.com>
Subject: Re: [PATCH 16/24] target/openrisc: Restrict cpu_exec_interrupt()
 handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000061e41f05cb08f8ff"
Received-SPF: none client-ip=2607:f8b0:4864:20::e29;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000061e41f05cb08f8ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/openrisc/cpu.h       | 5 +++--
>  target/openrisc/cpu.c       | 2 +-
>  target/openrisc/interrupt.c | 2 --
>  target/openrisc/meson.build | 6 ++++--
>  4 files changed, 8 insertions(+), 7 deletions(-)
>

I'm not 100% sure about the build changes because my meson fu is weak, but
they seem right given the rest.

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index 82cbaeb4f84..be6df81a810 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -312,8 +312,6 @@ struct OpenRISCCPU {
>
>
>  void cpu_openrisc_list(void);
> -void openrisc_cpu_do_interrupt(CPUState *cpu);
> -bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int
> reg);
> @@ -331,6 +329,9 @@ int print_insn_or1k(bfd_vma addr, disassemble_info
> *info);
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_openrisc_cpu;
>
> +void openrisc_cpu_do_interrupt(CPUState *cpu);
> +bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +
>  /* hw/openrisc_pic.c */
>  void cpu_openrisc_pic_init(OpenRISCCPU *cpu);
>
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index bd34e429ecb..27cb04152f9 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -186,10 +186,10 @@ static const struct SysemuCPUOps openrisc_sysemu_op=
s
> =3D {
>
>  static const struct TCGCPUOps openrisc_tcg_ops =3D {
>      .initialize =3D openrisc_translate_init,
> -    .cpu_exec_interrupt =3D openrisc_cpu_exec_interrupt,
>      .tlb_fill =3D openrisc_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D openrisc_cpu_exec_interrupt,
>      .do_interrupt =3D openrisc_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
> index 3eab771dcda..19223e3f25b 100644
> --- a/target/openrisc/interrupt.c
> +++ b/target/openrisc/interrupt.c
> @@ -28,7 +28,6 @@
>
>  void openrisc_cpu_do_interrupt(CPUState *cs)
>  {
> -#ifndef CONFIG_USER_ONLY
>      OpenRISCCPU *cpu =3D OPENRISC_CPU(cs);
>      CPUOpenRISCState *env =3D &cpu->env;
>      int exception =3D cs->exception_index;
> @@ -96,7 +95,6 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
>      } else {
>          cpu_abort(cs, "Unhandled exception 0x%x\n", exception);
>      }
> -#endif
>
>      cs->exception_index =3D -1;
>  }
> diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
> index 9774a583065..e445dec4a00 100644
> --- a/target/openrisc/meson.build
> +++ b/target/openrisc/meson.build
> @@ -9,7 +9,6 @@
>    'exception_helper.c',
>    'fpu_helper.c',
>    'gdbstub.c',
> -  'interrupt.c',
>    'interrupt_helper.c',
>    'mmu.c',
>    'sys_helper.c',
> @@ -17,7 +16,10 @@
>  ))
>
>  openrisc_softmmu_ss =3D ss.source_set()
> -openrisc_softmmu_ss.add(files('machine.c'))
> +openrisc_softmmu_ss.add(files(
> +  'interrupt.c',
> +  'machine.c',
> +))
>
>  target_arch +=3D {'openrisc': openrisc_ss}
>  target_softmmu_arch +=3D {'openrisc': openrisc_softmmu_ss}
> --
> 2.31.1
>
>

--00000000000061e41f05cb08f8ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:18 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/openrisc/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<br>
=C2=A0target/openrisc/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0target/openrisc/interrupt.c | 2 --<br>
=C2=A0target/openrisc/meson.build | 6 ++++--<br>
=C2=A04 files changed, 8 insertions(+), 7 deletions(-)<br></blockquote><div=
><br></div><div>I&#39;m not 100% sure about the build changes because my me=
son fu is weak, but they seem right given the rest.=C2=A0</div><div><br></d=
iv><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targ=
et=3D"_blank">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h<br>
index 82cbaeb4f84..be6df81a810 100644<br>
--- a/target/openrisc/cpu.h<br>
+++ b/target/openrisc/cpu.h<br>
@@ -312,8 +312,6 @@ struct OpenRISCCPU {<br>
<br>
<br>
=C2=A0void cpu_openrisc_list(void);<br>
-void openrisc_cpu_do_interrupt(CPUState *cpu);<br>
-bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<b=
r>
=C2=A0int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, in=
t reg);<br>
@@ -331,6 +329,9 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *inf=
o);<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0extern const VMStateDescription vmstate_openrisc_cpu;<br>
<br>
+void openrisc_cpu_do_interrupt(CPUState *cpu);<br>
+bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+<br>
=C2=A0/* hw/openrisc_pic.c */<br>
=C2=A0void cpu_openrisc_pic_init(OpenRISCCPU *cpu);<br>
<br>
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c<br>
index bd34e429ecb..27cb04152f9 100644<br>
--- a/target/openrisc/cpu.c<br>
+++ b/target/openrisc/cpu.c<br>
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps openrisc_sysemu_ops =
=3D {<br>
<br>
=C2=A0static const struct TCGCPUOps openrisc_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D openrisc_translate_init,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D openrisc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D openrisc_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D openrisc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D openrisc_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c<br>
index 3eab771dcda..19223e3f25b 100644<br>
--- a/target/openrisc/interrupt.c<br>
+++ b/target/openrisc/interrupt.c<br>
@@ -28,7 +28,6 @@<br>
<br>
=C2=A0void openrisc_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0{<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0OpenRISCCPU *cpu =3D OPENRISC_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUOpenRISCState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0int exception =3D cs-&gt;exception_index;<br>
@@ -96,7 +95,6 @@ void openrisc_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_abort(cs, &quot;Unhandled exception 0=
x%x\n&quot;, exception);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D -1;<br>
=C2=A0}<br>
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build<br>
index 9774a583065..e445dec4a00 100644<br>
--- a/target/openrisc/meson.build<br>
+++ b/target/openrisc/meson.build<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 =C2=A0&#39;exception_helper.c&#39;,<br>
=C2=A0 =C2=A0&#39;fpu_helper.c&#39;,<br>
=C2=A0 =C2=A0&#39;gdbstub.c&#39;,<br>
-=C2=A0 &#39;interrupt.c&#39;,<br>
=C2=A0 =C2=A0&#39;interrupt_helper.c&#39;,<br>
=C2=A0 =C2=A0&#39;mmu.c&#39;,<br>
=C2=A0 =C2=A0&#39;sys_helper.c&#39;,<br>
@@ -17,7 +16,10 @@<br>
=C2=A0))<br>
<br>
=C2=A0openrisc_softmmu_ss =3D ss.source_set()<br>
-openrisc_softmmu_ss.add(files(&#39;machine.c&#39;))<br>
+openrisc_softmmu_ss.add(files(<br>
+=C2=A0 &#39;interrupt.c&#39;,<br>
+=C2=A0 &#39;machine.c&#39;,<br>
+))<br>
<br>
=C2=A0target_arch +=3D {&#39;openrisc&#39;: openrisc_ss}<br>
=C2=A0target_softmmu_arch +=3D {&#39;openrisc&#39;: openrisc_softmmu_ss}<br=
>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000061e41f05cb08f8ff--

