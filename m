Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F2360F1D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:39:10 +0200 (CEST)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX45F-0002xN-2r
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lX43S-0002QB-4b
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:37:19 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:33616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lX43O-00067R-6r
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:37:17 -0400
Received: by mail-ua1-x92d.google.com with SMTP id m20so2721966uah.0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNRj0A39GoR9Wx0BXuXE7qeZas6ZhZLO/C+vmlNvteI=;
 b=vtpZtJK4K6/VBNBuJLDlcFZOH0pxvfEVErWmSLCEaDr0c5Ql5a3UnzA6acx0m9ELXr
 +7C0CZ5NXc5fZG20b8ndfx0vfAMZhGdWUGXHWdZaY+uaT1cJP1xvgfFq8myFT7IA48wj
 Yg0Bp9bqpwLTxzT1/TdD8E5vaqRrJ3UQURrWOVgz1hMfYX9F6Nu6RvQH/Fot2fiYhD0I
 4aMgaPi+uawDUKuY4tKeDhjhvY+wYSVknRZ1vV1uQk5v4j/aPXefSUmNeN9V+z2dWwd5
 ki5Xo0yIzANHDUXTWCen7pDUwQNjf7o1BphheL0OCiyBxtP7DDdnDj/ndbDj0s43amNv
 ckNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNRj0A39GoR9Wx0BXuXE7qeZas6ZhZLO/C+vmlNvteI=;
 b=B9OmvGvF0W/B6Ncg6rezEHNx5cwI60/yhynUOzfF0bBy6m35msCiNwf1b7H9Re7Ipb
 Kq54gY+fttk+O/dqGkaExFKKTs7uoDKTydWRJ/zwceXNc3pcvoukaJ7fnso1SVT9M6pd
 T+2GWKRBUld2TrFXuDImCxrSI1lZtua/PepXh5hTjAi+CFo4IzjWsb9KFUWjT2BeYr0U
 IzB0dRD/MMSVz29md0XEZFUxJPdeGIw4/zZ/X1fHOBfIiZccW+6h8CpNrVoqjUQW5olm
 LoYTahflC+fAsGWjqc5qgKPr7oUCACXfcuKqhA+oPHZuuH15WKDFtusYctzKwIMxA1Bs
 p6KA==
X-Gm-Message-State: AOAM5323KK668f+0eM9A0hemwIBJkGuiaredRkWt73S+ZVNYYM6FttC+
 Llo3CbOj4yhsMwrixsPg4/TmCLMSxT98TNKvuXGiBKl+4ljhCA==
X-Google-Smtp-Source: ABdhPJziQFfXhN9FJF8ckH8JECxeW2YVbzN26xcxvP46GLrV9srkAl1i67AQGFcnTlZZPFDHg9eCX8S3syCzLY7JOk4=
X-Received: by 2002:ab0:596f:: with SMTP id o44mr2577135uad.8.1618501029868;
 Thu, 15 Apr 2021 08:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-4-dje@google.com>
In-Reply-To: <20210415033925.1290401-4-dje@google.com>
From: Doug Evans <dje@google.com>
Date: Thu, 15 Apr 2021 08:36:32 -0700
Message-ID: <CADPb22QwStkJ_M+E08fAid457+UxmCxdCQ86RgqwBRe3w_zHGQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] net/slirp.c: Refactor address parsing
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f4c83405c004a21c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=dje@google.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f4c83405c004a21c
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 8:40 PM Doug Evans <dje@google.com> wrote:

> ... in preparation for adding ipv6 host forwarding support.
>
> Tested:
> avocado run tests/acceptance/hostfwd.py
>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>
> [...]
>
> diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py
> new file mode 100644
> index 0000000000..9b9db142c3
> --- /dev/null
> +++ b/tests/acceptance/hostfwd.py
> @@ -0,0 +1,91 @@
> [...]
> +
> +    def test_qmp_hostfwd_ipv4_parsing_errors(self):
> +        """Verify handling of various kinds of parsing errors."""
> +        self.vm.add_args('-nodefaults',
> +                         '-netdev', 'user,id=vnet',
> +                         '-device', 'virtio-net,netdev=vnet')
> +        self.vm.launch()
> +        self.assertEquals(self.hmc('hostfwd_remove abc::42'),
> +                          "Invalid format: bad protocol name 'abc'\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add abc::65022-:22'),
> +                          "Invalid host forwarding rule 'abc::65022-:22'"
> + \
> +                          " (bad protocol name 'abc')\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add :foo'),
> +                          "Invalid host forwarding rule ':foo'" + \
> +                          " (missing host-guest separator)\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add :a.b.c.d:66-:66'),
> +                          "Invalid host forwarding rule
> ':a.b.c.d:66-:66'" + \
> +                          " (For host address: address resolution failed
> for" \
> +                          " 'a.b.c.d:66': Name or service not known)\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add ::66-a.b.c.d:66'),
> +                          "Invalid host forwarding rule
> '::66-a.b.c.d:66'" + \
> +                          " (For guest address: address resolution
> failed" + \
> +                          " for 'a.b.c.d:66': Name or service not
> known)\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add ::-1-foo'),
> +                          "Invalid host forwarding rule '::-1-foo'" + \
> +                          " (For host address: error parsing port in" + \
> +                          " address ':')\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add ::66-foo'),
> +                          "Invalid host forwarding rule '::66-foo' (For"
> + \
> +                          " guest address: error parsing address
> 'foo')\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add ::66-:0'),
> +                          "Invalid host forwarding rule '::66-:0'" + \
> +                          " (For guest address: invalid port '0')\r\n")
>


One improvement I think I'd like to make here is that I'm not sure how
portable the text of the result of, e.g., gai_strerror() is,
and relax the expected text of the error messages in the potentially
host-specific part.
But I'll wait until everything else is reviewed.

--000000000000f4c83405c004a21c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Apr 14, 2021 at 8:40 PM Doug Evans &lt;<a href=3D"mai=
lto:dje@google.com">dje@google.com</a>&gt; wrote:<br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">... in p=
reparation for adding ipv6 host forwarding support.<br>
<br>
Tested:<br>
avocado run tests/acceptance/hostfwd.py<br>
<br>
Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_=
blank">dje@google.com</a>&gt;<br>
---<br>
<br><span class=3D"gmail_default" style=3D"font-size:small">[...]</span><br=
>
<br>
diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py<br>
new file mode 100644<br>
index 0000000000..9b9db142c3<br>
--- /dev/null<br>
+++ b/tests/acceptance/hostfwd.py<br>
@@ -0,0 +1,91 @@<br><span class=3D"gmail_default" style=3D"font-size:small"=
>[...]</span><br>
+<br>
+=C2=A0 =C2=A0 def test_qmp_hostfwd_ipv4_parsing_errors(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Verify handling of various k=
inds of parsing errors.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-nodefaults&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-netdev&#39;, &#39;user,id=3Dvnet&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 abc::42&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid format: bad protocol name &#39;abc&#39;\r\n=
&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ab=
c::65022-:22&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;abc::65022-:22&#3=
9;&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (bad protocol name &#39;abc&#39;)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add :f=
oo&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;:foo&#39;&quot; +=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (missing host-guest separator)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add :a=
.b.c.d:66-:66&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;:a.b.c.d:66-:66&#=
39;&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For host address: address resolution failed for&q=
uot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; &#39;a.b.c.d:66&#39;: Name or service not known)\r=
\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
66-a.b.c.d:66&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::66-a.b.c.d:66&#=
39;&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For guest address: address resolution failed&quot=
; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; for &#39;a.b.c.d:66&#39;: Name or service not know=
n)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
-1-foo&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::-1-foo&#39;&quo=
t; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For host address: error parsing port in&quot; + \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; address &#39;:&#39;)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
66-foo&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::66-foo&#39; (Fo=
r&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; guest address: error parsing address &#39;foo&#39;=
)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
66-:0&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::66-:0&#39;&quot=
; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For guest address: invalid port &#39;0&#39;)\r\n&=
quot;)<br></blockquote><div><br></div><div><br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">One improvement I think I&#39;d like to ma=
ke here is that I&#39;m not sure how portable the text of the result of, e.=
g., gai_strerror() is,</div><div class=3D"gmail_default" style=3D"font-size=
:small">and relax the expected text of the error messages in the potentiall=
y host-specific part.</div><div class=3D"gmail_default" style=3D"font-size:=
small">But I&#39;ll wait until everything else is reviewed.</div></div></di=
v>

--000000000000f4c83405c004a21c--

