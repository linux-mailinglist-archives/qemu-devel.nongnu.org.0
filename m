Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AB3FF4A4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:12:25 +0200 (CEST)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLt4S-0005iM-U9
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt2n-0003ek-T4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:10:41 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt2m-0001ed-8D
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:10:41 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id g34so1042637vkd.11
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHe4522IvlU++xhQ5FRHNL4wmzwCPCJqUo4g+BE8kYM=;
 b=PctWUBQ6ROSfiTyCHxx7AlVuS7hUma2vnT8YhXpUin1ypn8+EdHlDs9I3yyLmZ3Ue4
 TkHqfW2EoRFxzrqubLGI7B8MoIMg6QokfMVGQZ3m6lAgSoGeWpnaiwYmbiHDNhjBaXax
 85z2X/XId9IkNczs7r81outUKqtO/tzByO+rX7bkCRLwuqR72lmqq9LpozOL3ghLfXg4
 DRh3hSjsVlfm7fPesVW7EdqKCaWPkdOBirbYBWs6cjh4wMnd/ttQ4/A2xnxpaLVNNhI3
 CBQXsyqJs9eujaseNe+wfc/8gW677mab1r05KZNJuGfCl/6JvRYO13ITt5kYnzuPfTfT
 8oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHe4522IvlU++xhQ5FRHNL4wmzwCPCJqUo4g+BE8kYM=;
 b=TONnVxbfEW5Fn/ro0F99xU9w1PRfD/1qXjiTMUSCF8TiYGDrq/fWr/7zUyZz/9LjTd
 IP2DekIj+NdFzmbPS6Tw6q6Ndg8pfnAqs56lBjOp2t4QguxqdVSt4kVSaK/yGCkliyOM
 d5G9RLqUexVhEw8O3LaPd4/ap6XDtWAtOhr1rYsHj4urEYhi17/f0fHbUNE6G83Ug3hq
 +aML36/+G6H4reR33SE2j1pbSzGbvkfV+TzINth4YEcpEAMOOzu2TmVFhx4HJCop+tSO
 yJ/Vd3vUcPsPkCtiP2/da4pqNpYLVG4bL2i1IdjoVswFsyLR1X/l15Z4CkNMTQJkJ6bn
 qevg==
X-Gm-Message-State: AOAM530fdjLDwBeKGXZLKTC/k5o6Li6/gwl7yqDxluugYua7Qbvedr2o
 vFycNBduhaPYeSJ678Vf+9iG/rxdSZ6gIZcL9lKNDA==
X-Google-Smtp-Source: ABdhPJwF0IgOucoNeiH17eu4mFPr51VtE3mA2tx6hJmF796xAEsCsKroMcrlREtCYN9TqMe9Rvgw/+kpRck8LkElNxk=
X-Received: by 2002:a1f:1bcf:: with SMTP id b198mr3511241vkb.25.1630613438332; 
 Thu, 02 Sep 2021 13:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-3-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-3-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:10:27 -0600
Message-ID: <CANCZdfo=ULeEvZ9vPGuhRb7vgH8TZ+OavcaR9h1ZiNyNh1+nHA@mail.gmail.com>
Subject: Re: [PATCH 02/24] target/i386: Restrict sysemu-only fpu_helper helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000c214d605cb08c6bf"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2e.google.com
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

--000000000000c214d605cb08c6bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict some sysemu-only fpu_helper helpers (see commit
> 83a3d9c7402: "i386: separate fpu_helper sysemu-only parts").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> ---
>  target/i386/cpu.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 6c50d3ab4f1..c241bc183d2 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1833,11 +1833,14 @@ void x86_cpu_list(void);
>  int cpu_x86_support_mca_broadcast(CPUX86State *env);
>
>  int cpu_get_pic_interrupt(CPUX86State *s);
> +
> +#ifndef CONFIG_USER_ONLY
>  /* MSDOS compatibility mode FPU exception support */
>  void x86_register_ferr_irq(qemu_irq irq);
>  void fpu_check_raise_ferr_irq(CPUX86State *s);
>  void cpu_set_ignne(void);
>  void cpu_clear_ignne(void);
> +#endif
>
>  /* mpx_helper.c */
>  void cpu_sync_bndcs_hflags(CPUX86State *env);
> --
> 2.31.1
>
>

--000000000000c214d605cb08c6bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict some sysemu-only fpu_helper helpers (see commit<br>
83a3d9c7402: &quot;i386: separate fpu_helper sysemu-only parts&quot;).<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">im=
p@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
---<br>
=C2=A0target/i386/cpu.h | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/target/i386/cpu.h b/target/i386/cpu.h<br>
index 6c50d3ab4f1..c241bc183d2 100644<br>
--- a/target/i386/cpu.h<br>
+++ b/target/i386/cpu.h<br>
@@ -1833,11 +1833,14 @@ void x86_cpu_list(void);<br>
=C2=A0int cpu_x86_support_mca_broadcast(CPUX86State *env);<br>
<br>
=C2=A0int cpu_get_pic_interrupt(CPUX86State *s);<br>
+<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0/* MSDOS compatibility mode FPU exception support */<br>
=C2=A0void x86_register_ferr_irq(qemu_irq irq);<br>
=C2=A0void fpu_check_raise_ferr_irq(CPUX86State *s);<br>
=C2=A0void cpu_set_ignne(void);<br>
=C2=A0void cpu_clear_ignne(void);<br>
+#endif<br>
<br>
=C2=A0/* mpx_helper.c */<br>
=C2=A0void cpu_sync_bndcs_hflags(CPUX86State *env);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000c214d605cb08c6bf--

