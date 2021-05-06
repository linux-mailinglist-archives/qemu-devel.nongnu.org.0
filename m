Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BC375591
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:24:17 +0200 (CEST)
Received: from localhost ([::1]:32790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leevI-0006Nz-Ut
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leeuA-0005W2-JU
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:23:06 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leeu6-0001KB-05
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:23:06 -0400
Received: by mail-qt1-x835.google.com with SMTP id o12so4086606qtx.8
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dQGJ6Q0wZKhpJ3PZdrsCXdr7zqNBB4FZ2lq1ceu6GQM=;
 b=ZL4nPapkQnQzI5hNrqRk4EOdF5UHQXoCYwA+zf3I+5p/OUid0bx8xQwiCfkDY+jFGY
 aDfo8z/n+Uvb38a499UO1wHo9wIQcmVf/wrEkrAK5OdlG3a+GSssxqtBphd1teZcAlm3
 hG4GNdvi3lkLzC/eSM78wvOAJLXNsXVo9TY5xUz2LYxZfQEj1wv5+2BXP3agjyOrsGcU
 h5Q9s6oh62tiJHArrV06sD+1nxZRUV1nrLszulTjOBjMLQ9xhMbH/0Vf2aaDhIlD4vFZ
 YugV+oq2xItinGwYVBwj7/Q53HOc5UuxgX2DyBpys2whXSIisA+hkqzZNg0T+cx8Kn66
 R8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dQGJ6Q0wZKhpJ3PZdrsCXdr7zqNBB4FZ2lq1ceu6GQM=;
 b=G4/wyAjUh1Y0HQM7yQY3kE3p4DbB5Igemc9auPTDxT7Dp1ngNFH8BHGKv/DdzaFZxa
 pndrZb3WDnS/yElGaZM4K/24jlPsDn7BW8O0nBAItPjIZp9r3FcZPphS8nWYZ4wQsIxy
 5OAvT/V+nBdd1JDfk0LLNfQhz5/QKS0050T+fb6mMzV2GjsR6En4Ot629W4ZEZCNJb66
 c2RJQ7+QDJFe+IvwepngKIkcSTCTDLbq1R1NGqjOhVHarLQ6cHKpiqWtQPtGLbkffKEO
 AoG3H5myMHJmpLam4YNrULTnnXubTuKS2g41eH3yCB2qO2DlHDlEPChjeQgWYgPnhlRK
 d1ug==
X-Gm-Message-State: AOAM533Lj7TAvHRNgJrv1Bu1jMU3sfHAyh8GoIozPzZQ3yxW6sflbVNg
 BnyALN7brGZeUCP0q/uaqQ6YbJcZ1v2qsUVGOWMFPA==
X-Google-Smtp-Source: ABdhPJyBS//SKMm9JQFUL3tfxRak1+TRpBPcKJh3kB36Zt2GrPL58gzj7r9qDcK1DCjsG8+S0Gfw9DFeN5JYYE60FBI=
X-Received: by 2002:ac8:675a:: with SMTP id n26mr4557315qtp.101.1620310980656; 
 Thu, 06 May 2021 07:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:22:49 -0600
Message-ID: <CANCZdfqiHxQoG+g3bq_KL01yWCHUbF5qxJWN=sD37h7UJFMZ7g@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] misc: Replace alloca() by g_malloc()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006d95be05c1aa0c4a"
Received-SPF: none client-ip=2607:f8b0:4864:20::835;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x835.google.com
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
Cc: kvm@vger.kernel.org, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d95be05c1aa0c4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 7:39 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> The ALLOCA(3) man-page mentions its "use is discouraged".
> Replace few calls by equivalent GLib malloc().
>

Except g_alloc and g_malloc are not at all the same, and you can't drop in
replace one with the other.

g_alloc allocates stack space on the calling frame that's automatically
freed when the function returns.
g_malloc allocates space from the heap, and calls to it must be matched
with calls to g_free().

These patches don't do the latter, as far as I can tell, and so introduce
memory leaks unless there's something I've missed.

Warner



> Last call site is linux-user/.
>
> Since v1:
> - Converted more uses (alsaaudio, tpm, pca9552)
> - Reworked gdbstub (Alex)
> - Simplified PPC/KVM (Greg)
>
> Philippe Mathieu-Daud=C3=A9 (9):
>   audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent
>   backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD
>   backends/tpm: Replace g_alloca() by g_malloc()
>   bsd-user/syscall: Replace alloca() by g_new()
>   gdbstub: Constify GdbCmdParseEntry
>   gdbstub: Only call cmd_parse_params() with non-NULL command schema
>   gdbstub: Replace alloca() + memset(0) by g_new0()
>   hw/misc/pca9552: Replace g_newa() by g_new()
>   target/ppc/kvm: Replace alloca() by g_malloc()
>
>  audio/alsaaudio.c           | 11 +++++++----
>  backends/tpm/tpm_emulator.c | 35 +++++++++++++++--------------------
>  bsd-user/syscall.c          |  3 +--
>  gdbstub.c                   | 34 +++++++++++++++-------------------
>  hw/misc/pca9552.c           |  2 +-
>  target/ppc/kvm.c            |  3 +--
>  6 files changed, 40 insertions(+), 48 deletions(-)
>
> --
> 2.26.3
>
>
>
>

--0000000000006d95be05c1aa0c4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 7:39 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;.<br=
>
Replace few calls by equivalent GLib malloc().<br></blockquote><div><br></d=
iv><div>Except g_alloc and g_malloc are not at all the same, and you can&#3=
9;t drop in replace one with the other.</div><div><br></div><div>g_alloc al=
locates stack space on the calling frame that&#39;s automatically freed whe=
n the function returns.</div><div>g_malloc allocates space from the heap, a=
nd calls to it must be matched with calls to g_free().</div><div><br></div>=
<div>These patches don&#39;t do the latter, as far as I can tell, and so in=
troduce memory leaks unless there&#39;s something I&#39;ve missed.</div><di=
v><br></div><div>Warner</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Last call site is linux-user/.<br>
<br>
Since v1:<br>
- Converted more uses (alsaaudio, tpm, pca9552)<br>
- Reworked gdbstub (Alex)<br>
- Simplified PPC/KVM (Greg)<br>
<br>
Philippe Mathieu-Daud=C3=A9 (9):<br>
=C2=A0 audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent<br>
=C2=A0 backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD<br>
=C2=A0 backends/tpm: Replace g_alloca() by g_malloc()<br>
=C2=A0 bsd-user/syscall: Replace alloca() by g_new()<br>
=C2=A0 gdbstub: Constify GdbCmdParseEntry<br>
=C2=A0 gdbstub: Only call cmd_parse_params() with non-NULL command schema<b=
r>
=C2=A0 gdbstub: Replace alloca() + memset(0) by g_new0()<br>
=C2=A0 hw/misc/pca9552: Replace g_newa() by g_new()<br>
=C2=A0 target/ppc/kvm: Replace alloca() by g_malloc()<br>
<br>
=C2=A0audio/alsaaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++=
+----<br>
=C2=A0backends/tpm/tpm_emulator.c | 35 +++++++++++++++--------------------<=
br>
=C2=A0bsd-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br=
>
=C2=A0gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 34 +++++++++++++++-------------------<br>
=C2=A0hw/misc/pca9552.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
=C2=A0target/ppc/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +=
--<br>
=C2=A06 files changed, 40 insertions(+), 48 deletions(-)<br>
<br>
-- <br>
2.26.3<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000006d95be05c1aa0c4a--

