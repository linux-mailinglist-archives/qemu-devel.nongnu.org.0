Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBE6F198C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:31:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOBK-0008Jv-5m; Fri, 28 Apr 2023 09:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1psOBD-0008JE-Rz
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 09:30:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1psOBB-0003Dc-Jo
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 09:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682688628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XIMtsYJR1tfcZdixz0Fv1Yi6u3zS8/1bl04KNCXweKM=;
 b=b5nwxxQ3nwscauVSJTzm+8N9K1dDF3vy+9Qy40kABL6bim5pJdu1jKNJ9I9jFX/QqPFnTQ
 g6Wug5UosE4ghfh0jTEe7Je3SdQb8aaMTyfQgzNs9W/N1xYP8K3sPwZb+9CQc3iDI2Q8YV
 CkMzEsZcvYOEexQlUbp05vrFcdX42QE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-dwK76Tv1NXS4BWOAqVGnIg-1; Fri, 28 Apr 2023 09:30:27 -0400
X-MC-Unique: dwK76Tv1NXS4BWOAqVGnIg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-505b696f254so9891740a12.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 06:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688625; x=1685280625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XIMtsYJR1tfcZdixz0Fv1Yi6u3zS8/1bl04KNCXweKM=;
 b=dYkdNVHAE9KrlnbPskDJgqYf/8hmrdvK/jbaLUkPL2PMpx77JGwD4x/HpR9IGspR7+
 hXQWDBvTe3ksSVTOaVrSTe8hseCvL/3vxOjyKxOh25Chw2t/ke/s00/5V7tIju+PZCwA
 RPCwPZOVnHPVD+87fFF89qMpD3mYvn8/Od8ZPZi0w9pNTtiwzU2vO6hVX4liP4l0HR2r
 MF+gRg9YbCxp2gqC2WFDiIfELyRypm9miCnhdkID42Oe7k3m9jp77RWHjJ/1kFvmme1t
 go58n2Qlm/bWpefnI1vNs4j97Iuley4qP8gqdWpyOeR18zkRy4sTf5ZOyR1exet+TaPG
 92sw==
X-Gm-Message-State: AC+VfDyrDS5COOYAp40Ekl8glrHLj7BbUXTaFCPVOoayZkvSlRfM+Vik
 WMC4XBBOPWAIrhNJDuTA7SRO77xMaGxoV9IRdq12aZoAumMfdkNe0Yg4JPylbwQbeKSXbCMkXIw
 HRR1IzLXrfAjpcIkCj1Vo2sm/hRcRf0I=
X-Received: by 2002:a17:907:930a:b0:94e:dd3f:b650 with SMTP id
 bu10-20020a170907930a00b0094edd3fb650mr4869374ejc.18.1682688625177; 
 Fri, 28 Apr 2023 06:30:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZTihQvJCn49Z/8EthXiD3Azg4aB1TUhd/hQm8z6lSIvMIbhNjEBRaq8X+8jl1SBQwECG4JC+x0B2H2QBKKb4=
X-Received: by 2002:a17:907:930a:b0:94e:dd3f:b650 with SMTP id
 bu10-20020a170907930a00b0094edd3fb650mr4869341ejc.18.1682688624887; Fri, 28
 Apr 2023 06:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-7-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-7-armbru@redhat.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Fri, 28 Apr 2023 19:00:13 +0530
Message-ID: <CAK3XEhNymw+7_mCYvTiSqegXBGE3wEjbSdyELOwTTPfi-c45yA@mail.gmail.com>
Subject: Re: [PATCH 06/17] sphinx/qapidoc: Do not emit TODO sections into user
 manuals
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, peter.maydell@linaro.org, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com, 
 thuth@redhat.com, philmd@linaro.org, mst@redhat.com, imammedo@redhat.com, 
 eblake@redhat.com, kraxel@redhat.com, kwolf@redhat.com, hreitz@redhat.com, 
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com, 
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 wangyanan55@huawei.com, quintela@redhat.com, peterx@redhat.com, 
 leobras@redhat.com, jasowang@redhat.com, yuval.shaia.ml@gmail.com, 
 pavel.dovgaluk@ispras.ru, jiri@resnulli.us, stefanb@linux.vnet.ibm.com, 
 stefanha@redhat.com, lukasstraub2@web.de, kkostiuk@redhat.com, 
 qemu-block@nongnu.org, victortoso@redhat.com
Content-Type: multipart/alternative; boundary="000000000000c11e9405fa6579c5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000c11e9405fa6579c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 4:24=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> QAPI doc comments are for QMP users: they go into the "QEMU QMP
> Reference Manual" and the "QEMU Storage Daemon QMP Reference Manual".
>
> The doc comment TODO sections are for somebody else, namely for the
> people who can do: developers.  Do not emit them into the user
> manuals.
>
> This elides the following TODOs:
>
> * SchemaInfoCommand
>
>   # TODO: @success-response (currently irrelevant, because it's QGA, not
> QMP)
>
>   This is a note to developers adding introspection to the guest
>   agent.  It makes no sense to users.
>
> * @query-hotpluggable-cpus
>
>   # TODO: Better documentation; currently there is none.
>
>   This is a reminder for developers.  It doesn't help users.
>
> * @device_add
>
>   # TODO: This command effectively bypasses QAPI completely due to its
>   #       "additional arguments" business.  It shouldn't have been added =
to
>   #       the schema in this form.  It should be qapified properly, or
>   #       replaced by a properly qapified command.
>
>   Likewise.
>
> Eliding them is an improvement.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>

Reviewed-by: Ani Sinha <anisinha@redhat.com>


> ---
>  docs/devel/qapi-code-gen.rst | 5 +++--
>  docs/sphinx/qapidoc.py       | 3 +++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index ff7b74bdb2..6386b58881 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -1007,8 +1007,9 @@ A "Since: x.y.z" tagged section lists the release
> that introduced the
>  definition.
>
>  An "Example" or "Examples" section is automatically rendered entirely
> -as literal fixed-width text.  In other sections, the text is
> -formatted, and rST markup can be used.
> +as literal fixed-width text.  "TODO" sections are not rendered at all
> +(they are for developers, not users of QMP).  In other sections, the
> +text is formatted, and rST markup can be used.
>
>  For example::
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index d791b59492..8f3b9997a1 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -268,6 +268,9 @@ def _nodes_for_sections(self, doc):
>          """Return list of doctree nodes for additional sections"""
>          nodelist =3D []
>          for section in doc.sections:
> +            if section.name and section.name =3D=3D 'TODO':
> +                # Hide TODO: sections
> +                continue
>              snode =3D self._make_section(section.name)
>              if section.name and section.name.startswith('Example'):
>                  snode +=3D self._nodes_for_example(section.text)
> --
> 2.39.2
>
>

--000000000000c11e9405fa6579c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 28, 2023 at 4:24=E2=80=AF=
PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">QAPI doc comments are for QMP users: they go into the &quot;QEMU QMP<br=
>
Reference Manual&quot; and the &quot;QEMU Storage Daemon QMP Reference Manu=
al&quot;.<br>
<br>
The doc comment TODO sections are for somebody else, namely for the<br>
people who can do: developers.=C2=A0 Do not emit them into the user<br>
manuals.<br>
<br>
This elides the following TODOs:<br>
<br>
* SchemaInfoCommand<br>
<br>
=C2=A0 # TODO: @success-response (currently irrelevant, because it&#39;s QG=
A, not QMP)<br>
<br>
=C2=A0 This is a note to developers adding introspection to the guest<br>
=C2=A0 agent.=C2=A0 It makes no sense to users.<br>
<br>
* @query-hotpluggable-cpus<br>
<br>
=C2=A0 # TODO: Better documentation; currently there is none.<br>
<br>
=C2=A0 This is a reminder for developers.=C2=A0 It doesn&#39;t help users.<=
br>
<br>
* @device_add<br>
<br>
=C2=A0 # TODO: This command effectively bypasses QAPI completely due to its=
<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;additional arguments&quot; busines=
s.=C2=A0 It shouldn&#39;t have been added to<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0the schema in this form.=C2=A0 It should=
 be qapified properly, or<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0replaced by a properly qapified command.=
<br>
<br>
=C2=A0 Likewise.<br>
<br>
Eliding them is an improvement.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:anisinha@redhat.com">anisi=
nha@redhat.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
---<br>
=C2=A0docs/devel/qapi-code-gen.rst | 5 +++--<br>
=C2=A0docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
=C2=A02 files changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst<br=
>
index ff7b74bdb2..6386b58881 100644<br>
--- a/docs/devel/qapi-code-gen.rst<br>
+++ b/docs/devel/qapi-code-gen.rst<br>
@@ -1007,8 +1007,9 @@ A &quot;Since: x.y.z&quot; tagged section lists the r=
elease that introduced the<br>
=C2=A0definition.<br>
<br>
=C2=A0An &quot;Example&quot; or &quot;Examples&quot; section is automatical=
ly rendered entirely<br>
-as literal fixed-width text.=C2=A0 In other sections, the text is<br>
-formatted, and rST markup can be used.<br>
+as literal fixed-width text.=C2=A0 &quot;TODO&quot; sections are not rende=
red at all<br>
+(they are for developers, not users of QMP).=C2=A0 In other sections, the<=
br>
+text is formatted, and rST markup can be used.<br>
<br>
=C2=A0For example::<br>
<br>
diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py<br>
index d791b59492..8f3b9997a1 100644<br>
--- a/docs/sphinx/qapidoc.py<br>
+++ b/docs/sphinx/qapidoc.py<br>
@@ -268,6 +268,9 @@ def _nodes_for_sections(self, doc):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Return list of doctree =
nodes for additional sections&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodelist =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for section in doc.sections:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://section.nam=
e" rel=3D"noreferrer" target=3D"_blank">section.name</a> and <a href=3D"htt=
p://section.name" rel=3D"noreferrer" target=3D"_blank">section.name</a> =3D=
=3D &#39;TODO&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Hide TODO: secti=
ons<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snode =3D self._make_sectio=
n(<a href=3D"http://section.name" rel=3D"noreferrer" target=3D"_blank">sect=
ion.name</a>)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if <a href=3D"http://sectio=
n.name" rel=3D"noreferrer" target=3D"_blank">section.name</a> and section.n=
ame.startswith(&#39;Example&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snode +=3D se=
lf._nodes_for_example(section.text)<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--000000000000c11e9405fa6579c5--


