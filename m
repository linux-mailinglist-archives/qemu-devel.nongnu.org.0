Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA438692334
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWA7-0000gu-OU; Fri, 10 Feb 2023 11:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQWA0-0000g9-QM
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:22:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQW9v-0005Je-1j
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676046117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QO5gV/0WZhL6Re6jW/V5wFJRCcmsEbY6wv4VkC4tupo=;
 b=BpX0vtuSFFTXlfoj2KzCRbzCKBX5qn4gHlCwjX6xay7mH+vmY9H8/HVv+L83tvDTyEYJaa
 gPHvxQMAk+vIQgwGf6Vth+Tcm80/dOXBfL6ixNKVrJN9LQgIGFMvewTmMWO/6rlNMBQCHm
 Fa3GEt+LN3CQ9PopNFcofHgCh41iNH0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-jSu16kobN6Kzxp69xdiV0w-1; Fri, 10 Feb 2023 11:21:56 -0500
X-MC-Unique: jSu16kobN6Kzxp69xdiV0w-1
Received: by mail-pj1-f72.google.com with SMTP id
 nn5-20020a17090b38c500b0023391b53fd5so1580070pjb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QO5gV/0WZhL6Re6jW/V5wFJRCcmsEbY6wv4VkC4tupo=;
 b=pvS8KvJMy4ZsCXd6DWeqX8bJIL/GMzxTJwF881SfX15HNTB7cLshd4ET7OGtuQHvhu
 odKpnqlot7wN//Yv6/oBC546mfDBMyHw8FQ/cGtv78wyGQMe/Xbaj4W1jiJKedaES1ja
 6yrzpqr+uxjF4EDbRTGhUlErK+LyoT+SkIUtFADyizztLCFXbHdNpXfNyhL3ZP8USJFc
 cd712zhVyL6g5C7W4O61lR45RXdnzltWoEqzQiJ/AndXaPxKTa4LDu+OXjz9JSGoKyXF
 mo2gLlD7lMkkR2fALpXO75YK8ibgLZioEhuSEnizsSX1TBa6w7/S0GOlaC8cDMhI2af4
 Tbww==
X-Gm-Message-State: AO0yUKVxg5EdS90DyPLWxdSTE/CWScUkzTuEJx7vMM+LGy96rncZDvod
 UgeSOyjnGWd1iS7neWAicdftnRFdAhc4nQu46mkecI2G2zN1+y7lZwj9hEbKCANBNYVMOVi1K/B
 fJZdGj4qAMcVx+b293UV6aFwYpmgzQ3k=
X-Received: by 2002:a17:90a:4d44:b0:233:b7df:104d with SMTP id
 l4-20020a17090a4d4400b00233b7df104dmr339425pjh.64.1676046115305; 
 Fri, 10 Feb 2023 08:21:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8XI6S93+vx0fzrwn8BY2WriWnpTNE7DGliQEwNLPV1g8oAgXfiaHgw20LNuzrIjfeZ7cjCa0uZAUxsMqvBFQQ=
X-Received: by 2002:a17:90a:4d44:b0:233:b7df:104d with SMTP id
 l4-20020a17090a4d4400b00233b7df104dmr339405pjh.64.1676046114883; Fri, 10 Feb
 2023 08:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
 <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
 <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
 <CABgObfa79AStZ8DnGEs2GmdZeLecijW3Um9O4XmguVNLwdfs2g@mail.gmail.com>
In-Reply-To: <CABgObfa79AStZ8DnGEs2GmdZeLecijW3Um9O4XmguVNLwdfs2g@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Feb 2023 11:21:44 -0500
Message-ID: <CAFn=p-bWLfV7miK5NB3XqVEJXA1MHK26aN07otLJhUa2xbDHTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004e1dbe05f45ae533"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000004e1dbe05f45ae533
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 11:17 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On Fri, Feb 10, 2023 at 4:28 PM John Snow <jsnow@redhat.com> wrote:
> > PS, while you're here, how does this new loop interfere with your
> "custom python specified" flag for meson? I think meson uses the version of
> python *it* detects and not the configure script identified one, right?
> Does that mean that e.g. the qapi generator gets run with the system
> default/meson version and not the config version?
>
> Yes, if neither --python nor --meson are specified, then it could
> happen that a different python is used during ninja's execution vs.
> what is used for "other stuff" (docker cross compilers and other
> Makefile invocations of $(PYTHON)).
>
> The meson version of Python is guaranteed to be at least 3.7 as soon
> as we update to 0.63.x (which will be Real Soon Now), but it's ugly.
> The main issue I anticipate could be a problem when running from a
> virtual environment, so perhaps we can force usage of the internal
> meson if neither --python nor --meson are specified, and VIRTUAL_ENV
> is set and $VIRTUAL_ENV/bin/meson does not exist?
>
> diff --git a/configure b/configure
> index 06bcd9031903..001a79a90170 100755
> --- a/configure
> +++ b/configure
> @@ -870,8 +870,18 @@ fi
>  # Suppress writing compiled files
>  python="$python -B"
>
> +has_meson() {
> +  if test "${VIRTUAL_ENV:+set}" = set; then
> +    # Ensure that Meson and Python come from the same virtual environment
> +    test -x "$(VIRTUAL_ENV}/bin/meson" &&
> +      test "$(command -v meson)" -ef "$(VIRTUAL_ENV}/bin/meson"
> +  else
> +    has meson
> +  fi
> +}
> +
>  if test -z "$meson"; then
> -    if test "$explicit_python" = no && has meson && version_ge
> "$(meson --version)" 0.63.0; then
> +    if test "$explicit_python" = no && has_meson && version_ge
> "$(meson --version)" 0.63.0; then
>          meson=meson
>      elif test "$git_submodules_action" != 'ignore' ; then
>          meson=git
>
> I will include it when posting the final series.
>
> > Do I need to adjust this loop to consider more binaries as "explicitly
> specified"?
>
> I don't think it's a huge problem. Outside virtual environments, the
> most likely setting is that Meson uses python3 which in turn is the
> most recent python3.X, so it should be fine overall.
>
> Though part of me thinks that your new loop is slightly overengineered
> and we should just require /usr/bin/env python3 and call it a day.
>

Well, but that'd be a problem for CentOS 8, wouldn't it? python3 is gonna
resolve to python3.6.


> Paolo
>
>

--0000000000004e1dbe05f45ae533
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 11:17 AM Paolo Bonzini &lt;<a hr=
ef=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Fri, Feb 10, 2023 at 4:28 PM John Snow=
 &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"noreferre=
r">jsnow@redhat.com</a>&gt; wrote:<br>
&gt; PS, while you&#39;re here, how does this new loop interfere with your =
&quot;custom python specified&quot; flag for meson? I think meson uses the =
version of python *it* detects and not the configure script identified one,=
 right? Does that mean that e.g. the qapi generator gets run with the syste=
m default/meson version and not the config version?<br>
<br>
Yes, if neither --python nor --meson are specified, then it could<br>
happen that a different python is used during ninja&#39;s execution vs.<br>
what is used for &quot;other stuff&quot; (docker cross compilers and other<=
br>
Makefile invocations of $(PYTHON)).<br>
<br>
The meson version of Python is guaranteed to be at least 3.7 as soon<br>
as we update to 0.63.x (which will be Real Soon Now), but it&#39;s ugly.<br=
>
The main issue I anticipate could be a problem when running from a<br>
virtual environment, so perhaps we can force usage of the internal<br>
meson if neither --python nor --meson are specified, and VIRTUAL_ENV<br>
is set and $VIRTUAL_ENV/bin/meson does not exist?<br>
<br>
diff --git a/configure b/configure<br>
index 06bcd9031903..001a79a90170 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -870,8 +870,18 @@ fi<br>
=C2=A0# Suppress writing compiled files<br>
=C2=A0python=3D&quot;$python -B&quot;<br>
<br>
+has_meson() {<br>
+=C2=A0 if test &quot;${VIRTUAL_ENV:+set}&quot; =3D set; then<br>
+=C2=A0 =C2=A0 # Ensure that Meson and Python come from the same virtual en=
vironment<br>
+=C2=A0 =C2=A0 test -x &quot;$(VIRTUAL_ENV}/bin/meson&quot; &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 test &quot;$(command -v meson)&quot; -ef &quot;$(VIRT=
UAL_ENV}/bin/meson&quot;<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 has meson<br>
+=C2=A0 fi<br>
+}<br>
+<br>
=C2=A0if test -z &quot;$meson&quot;; then<br>
-=C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D no &amp;&amp; has m=
eson &amp;&amp; version_ge<br>
&quot;$(meson --version)&quot; 0.63.0; then<br>
+=C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D no &amp;&amp; has_m=
eson &amp;&amp; version_ge<br>
&quot;$(meson --version)&quot; 0.63.0; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson=3Dmeson<br>
=C2=A0 =C2=A0 =C2=A0elif test &quot;$git_submodules_action&quot; !=3D &#39;=
ignore&#39; ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson=3Dgit<br>
<br>
I will include it when posting the final series.<br>
<br>
&gt; Do I need to adjust this loop to consider more binaries as &quot;expli=
citly specified&quot;?<br>
<br>
I don&#39;t think it&#39;s a huge problem. Outside virtual environments, th=
e<br>
most likely setting is that Meson uses python3 which in turn is the<br>
most recent python3.X, so it should be fine overall.<br>
<br>
Though part of me thinks that your new loop is slightly overengineered<br>
and we should just require /usr/bin/env python3 and call it a day.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well, but=
 that&#39;d be a problem for CentOS 8, wouldn&#39;t it? python3 is gonna re=
solve to python3.6.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Paolo<br>
<br>
</blockquote></div></div></div>

--0000000000004e1dbe05f45ae533--


