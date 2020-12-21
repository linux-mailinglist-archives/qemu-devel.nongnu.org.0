Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15B2DF9D1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 09:17:29 +0100 (CET)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krGNj-0002bV-SA
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 03:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1krGMG-00029Z-KR
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 03:15:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1krGMC-0001MM-Od
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 03:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608538549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQGRhEKO0pq1UbIGEaxcfimezClPFPgR3dud8wXVUAY=;
 b=MFktFdtHljx/4Q9/s9Lsqp8UNiGF8I1IuqCdBJSkJBDr6yzli5Jj08K+oagu0UVSkXw+l1
 xiO33uFrZVPh1whB0iz0WuUI2YcbZrPVH79tNYDFkjxIFFOTa3E4LvcKHPoxPbY1H63djl
 uh6yDYHY3brJ7qdRC36GwggWRXDNCc4=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-lKXG08B4OQa5rkN7WJ20Rg-1; Mon, 21 Dec 2020 03:15:46 -0500
X-MC-Unique: lKXG08B4OQa5rkN7WJ20Rg-1
Received: by mail-il1-f198.google.com with SMTP id c13so8651715ilg.22
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 00:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQGRhEKO0pq1UbIGEaxcfimezClPFPgR3dud8wXVUAY=;
 b=c0ZIXefMSKhdR+vtw7pWHnxNBBwhX38RB1TCLMY48/jrinAlUkPL1tPfwQnfCayFem
 CHV5oHrE3RSv/a9fZVJCVu3nm4Bbif8JNJLXuKjaH59HA4djdRsC0Uuv14+FbmaF58Qc
 ENvcojEGoDKj/LSgl2JB7MHAwETu0YzCZozKb+H33qPTJx0WLIEqpTBFy+30nC9uRq8f
 /Bb7PHhNOzHsrNxderIn/hTJajQrTYe5nuGExPmiO8zhWE39AgiQl9xgnq98erBGFTjI
 y5DmH7l646eHCKPwiqzqdkyH/hGevdts0Ng0BlpEjqLQVlgcEBbQklsMjin/yRzObUd1
 tr4w==
X-Gm-Message-State: AOAM532waaHfT22FX2xOvrokOXc5aLKpCAKIdrKWQ0ZKKc2sHpVvWzkZ
 IBLwQMWi40QG9U1eD7wTiP7Xru9NYPXVeoAbi4IAl6ZarCw+cr2tLfYPcsRik48jr1ShT7UY04Y
 dgjiHzrQceq52kG3lej6mWATMvE2HPMA=
X-Received: by 2002:a92:4101:: with SMTP id o1mr15647081ila.82.1608538545379; 
 Mon, 21 Dec 2020 00:15:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY4GvFYqMZxlPHpfi65OKXEJmgtnyfk3gSurparfAUm8AjiJhyCqIZ/qdQ0helzamwfGYpDxtUwltj/A/sPkA=
X-Received: by 2002:a92:4101:: with SMTP id o1mr15647067ila.82.1608538545215; 
 Mon, 21 Dec 2020 00:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20201219090637.1700900-1-pbonzini@redhat.com>
 <20201219090637.1700900-2-pbonzini@redhat.com>
In-Reply-To: <20201219090637.1700900-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 21 Dec 2020 12:15:34 +0400
Message-ID: <CAMxuvazB2VgUfgDOyLy4P7T0ghNua0gAVmrPhoNwG+nArxvqHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] whpx: rename whp-dispatch to whpx-internal.h
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009870e005b6f51083"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009870e005b6f51083
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2020 at 1:06 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Rename the file in preparation for moving more implementation-internal
> definitions to it.  The build is still broken though.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  target/i386/whpx/whpx-all.c                          | 5 +----
>  target/i386/whpx/whpx-apic.c                         | 2 +-
>  target/i386/whpx/whpx-cpus.c                         | 4 +---
>  target/i386/whpx/{whp-dispatch.h =3D> whpx-internal.h} | 6 +++---
>  4 files changed, 6 insertions(+), 11 deletions(-)
>  rename target/i386/whpx/{whp-dispatch.h =3D> whpx-internal.h} (98%)
>
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 3b824fc9d7..12f79e2cd6 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -26,13 +26,10 @@
>  #include "qapi/qapi-types-common.h"
>  #include "qapi/qapi-visit-common.h"
>  #include "migration/blocker.h"
> -#include "whp-dispatch.h"
>  #include <winerror.h>
>
>  #include "whpx-cpus.h"
> -
> -#include <WinHvPlatform.h>
> -#include <WinHvEmulation.h>
> +#include "whpx-internal.h"
>
>  #define HYPERV_APIC_BUS_FREQUENCY      (200000000ULL)
>
> diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
> index b127a3cb8a..1d330bf749 100644
> --- a/target/i386/whpx/whpx-apic.c
> +++ b/target/i386/whpx/whpx-apic.c
> @@ -18,7 +18,7 @@
>  #include "hw/pci/msi.h"
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/whpx.h"
> -#include "whp-dispatch.h"
> +#include "whpx-internal.h"
>
>  static void whpx_put_apic_state(APICCommonState *s,
>                                  struct whpx_lapic_state *kapic)
> diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
> index d9bd5a2d36..f7e69881a3 100644
> --- a/target/i386/whpx/whpx-cpus.c
> +++ b/target/i386/whpx/whpx-cpus.c
> @@ -15,11 +15,9 @@
>  #include "qemu/guest-random.h"
>
>  #include "sysemu/whpx.h"
> +#include "whpx-internal.h"
>  #include "whpx-cpus.h"
>
> -#include <WinHvPlatform.h>
> -#include <WinHvEmulation.h>
> -
>  static void *whpx_cpu_thread_fn(void *arg)
>  {
>      CPUState *cpu =3D arg;
> diff --git a/target/i386/whpx/whp-dispatch.h
> b/target/i386/whpx/whpx-internal.h
> similarity index 98%
> rename from target/i386/whpx/whp-dispatch.h
> rename to target/i386/whpx/whpx-internal.h
> index cef5d848bd..e0a9ea1dce 100644
> --- a/target/i386/whpx/whp-dispatch.h
> +++ b/target/i386/whpx/whpx-internal.h
> @@ -1,5 +1,5 @@
> -#ifndef WHP_DISPATCH_H
> -#define WHP_DISPATCH_H
> +#ifndef WHP_INTERNAL_H
> +#define WHP_INTERNAL_H
>
>  #include <windows.h>
>  #include <WinHvPlatform.h>
> @@ -72,4 +72,4 @@ typedef enum WHPFunctionList {
>      WINHV_PLATFORM_FNS_SUPPLEMENTAL
>  } WHPFunctionList;
>
> -#endif /* WHP_DISPATCH_H */
> +#endif /* WHP_INTERNAL_H */
> --
> 2.26.2
>
>
>

--0000000000009870e005b6f51083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 19, 2020 at 1:06 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rena=
me the file in preparation for moving more implementation-internal<br>
definitions to it.=C2=A0 The build is still broken though.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0target/i386/whpx/whpx-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +----<br>
=C2=A0target/i386/whpx/whpx-apic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0target/i386/whpx/whpx-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +---<br>
=C2=A0target/i386/whpx/{whp-dispatch.h =3D&gt; whpx-internal.h} | 6 +++---<=
br>
=C2=A04 files changed, 6 insertions(+), 11 deletions(-)<br>
=C2=A0rename target/i386/whpx/{whp-dispatch.h =3D&gt; whpx-internal.h} (98%=
)<br>
<br>
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c<br>
index 3b824fc9d7..12f79e2cd6 100644<br>
--- a/target/i386/whpx/whpx-all.c<br>
+++ b/target/i386/whpx/whpx-all.c<br>
@@ -26,13 +26,10 @@<br>
=C2=A0#include &quot;qapi/qapi-types-common.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-common.h&quot;<br>
=C2=A0#include &quot;migration/blocker.h&quot;<br>
-#include &quot;whp-dispatch.h&quot;<br>
=C2=A0#include &lt;winerror.h&gt;<br>
<br>
=C2=A0#include &quot;whpx-cpus.h&quot;<br>
-<br>
-#include &lt;WinHvPlatform.h&gt;<br>
-#include &lt;WinHvEmulation.h&gt;<br>
+#include &quot;whpx-internal.h&quot;<br>
<br>
=C2=A0#define HYPERV_APIC_BUS_FREQUENCY=C2=A0 =C2=A0 =C2=A0 (200000000ULL)<=
br>
<br>
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c<br=
>
index b127a3cb8a..1d330bf749 100644<br>
--- a/target/i386/whpx/whpx-apic.c<br>
+++ b/target/i386/whpx/whpx-apic.c<br>
@@ -18,7 +18,7 @@<br>
=C2=A0#include &quot;hw/pci/msi.h&quot;<br>
=C2=A0#include &quot;sysemu/hw_accel.h&quot;<br>
=C2=A0#include &quot;sysemu/whpx.h&quot;<br>
-#include &quot;whp-dispatch.h&quot;<br>
+#include &quot;whpx-internal.h&quot;<br>
<br>
=C2=A0static void whpx_put_apic_state(APICCommonState *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct whpx_lapic_state *kapic=
)<br>
diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c<br=
>
index d9bd5a2d36..f7e69881a3 100644<br>
--- a/target/i386/whpx/whpx-cpus.c<br>
+++ b/target/i386/whpx/whpx-cpus.c<br>
@@ -15,11 +15,9 @@<br>
=C2=A0#include &quot;qemu/guest-random.h&quot;<br>
<br>
=C2=A0#include &quot;sysemu/whpx.h&quot;<br>
+#include &quot;whpx-internal.h&quot;<br>
=C2=A0#include &quot;whpx-cpus.h&quot;<br>
<br>
-#include &lt;WinHvPlatform.h&gt;<br>
-#include &lt;WinHvEmulation.h&gt;<br>
-<br>
=C2=A0static void *whpx_cpu_thread_fn(void *arg)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D arg;<br>
diff --git a/target/i386/whpx/whp-dispatch.h b/target/i386/whpx/whpx-intern=
al.h<br>
similarity index 98%<br>
rename from target/i386/whpx/whp-dispatch.h<br>
rename to target/i386/whpx/whpx-internal.h<br>
index cef5d848bd..e0a9ea1dce 100644<br>
--- a/target/i386/whpx/whp-dispatch.h<br>
+++ b/target/i386/whpx/whpx-internal.h<br>
@@ -1,5 +1,5 @@<br>
-#ifndef WHP_DISPATCH_H<br>
-#define WHP_DISPATCH_H<br>
+#ifndef WHP_INTERNAL_H<br>
+#define WHP_INTERNAL_H<br>
<br>
=C2=A0#include &lt;windows.h&gt;<br>
=C2=A0#include &lt;WinHvPlatform.h&gt;<br>
@@ -72,4 +72,4 @@ typedef enum WHPFunctionList {<br>
=C2=A0 =C2=A0 =C2=A0WINHV_PLATFORM_FNS_SUPPLEMENTAL<br>
=C2=A0} WHPFunctionList;<br>
<br>
-#endif /* WHP_DISPATCH_H */<br>
+#endif /* WHP_INTERNAL_H */<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000009870e005b6f51083--


