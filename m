Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9E6C5241
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:20:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf26Z-0003Ln-4K; Wed, 22 Mar 2023 13:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pf26W-0003L4-QL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pf26U-0005Tq-Vs
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679505505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6cqRdDR2Rg0hd9SIjUDgKq3mUj9HQL1oDI4ne+TA+es=;
 b=EREUuQbHGmeaW3Qu170bCfZeWzN211jL55uXqWcKoSDuhfRBQg0SEppVHIp4laZkDD+Myg
 uryTxW6zRgHFv6535TdUQqvWsQ12GP/QqC26GWulYL//Mg1AxbOJcIWLzXIZel2k6YVwGy
 sSPDnGiND14KsSTGBNcgNVcRijbXKq0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-WClomtZlOq-erSIx_nN-Og-1; Wed, 22 Mar 2023 13:18:23 -0400
X-MC-Unique: WClomtZlOq-erSIx_nN-Og-1
Received: by mail-yb1-f197.google.com with SMTP id
 z4-20020a25bb04000000b00b392ae70300so20371594ybg.21
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679505502;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6cqRdDR2Rg0hd9SIjUDgKq3mUj9HQL1oDI4ne+TA+es=;
 b=Ot863cJca46xW2153SXMiI+HlUeCFfLGHwzjHCKJxzA35tn87FJVs4Dwzq4kBBlDnR
 SJdeMmfJImUDwKbBt6c/7CFJ4uSCJafPMaducw1H5l21xNfOO3ZS89HKuT5kGMKej09o
 NbGpAc7NShPcmXBdjat+Fda8gFKliF+Xw3TNnJp6S/BggTOaxM0cpxDQ9BTXDFOqTkEQ
 Uqn2RjdcrARJGCq9+tlHr458Rye0hlUz2ZaYaBJxYl092juLfNtTDuvT64cvJK+U2x2l
 TQoUrSvT0B1bLgB0sX2iUQhG8eMMmgMWUro36SbPLBkB9szdemHWC8GBSxLELRVEtEWp
 DlfA==
X-Gm-Message-State: AAQBX9eetVKi5ma/Vp+98/r4zxVTi+TMLMLACTWIWAgf37crwngYao/z
 DXg0+Jw2EUoXsL7rU0JMCJPuo97PnFeNHuhyw5MI3XS7PJi7Baj585sntg4VstBhB0EcHvA/QfZ
 2WiHco3txHf63gWs3VPNHmPX10km8jstUkRxyKrYlmg==
X-Received: by 2002:a25:8712:0:b0:b3d:c59:4d26 with SMTP id
 a18-20020a258712000000b00b3d0c594d26mr353209ybl.5.1679505502531; 
 Wed, 22 Mar 2023 10:18:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZCXmuiapNvHZ7jb+J9yla0+up/NeLZLA5AeaPeFvcZE0ZImMgiXFVuQAlVSYpPhhkhvxiHkbxDLJwUtDrFzeQ=
X-Received: by 2002:a25:8712:0:b0:b3d:c59:4d26 with SMTP id
 a18-20020a258712000000b00b3d0c594d26mr353192ybl.5.1679505502224; Wed, 22 Mar
 2023 10:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-4-pierrick.bouvier@linaro.org>
 <cfde8400-2df9-73d7-3eb0-b3a81f838311@linaro.org>
In-Reply-To: <cfde8400-2df9-73d7-3eb0-b3a81f838311@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 22 Mar 2023 19:18:11 +0200
Message-ID: <CAPMcbCoat--fGMLXYUodctORdiws9=H1dL7GiL3q_jv3VKJLLg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] qga/vss-win32: fix warning for clang++-15
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, clg@kaod.org
Content-Type: multipart/alternative; boundary="000000000000dbd59305f780584e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000dbd59305f780584e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierrick,

Thanks for reminding me. You are fully right to ping me. I really lost this
commit.
As QEMU is already at the code freeze stage, I don't want to push this into
8.0.
I hope it will be ok to merge after 8.0 was released.

Best Regards,
Konstantin Kostiuk.


On Tue, Mar 21, 2023 at 11:48=E2=80=AFPM Pierrick Bouvier <
pierrick.bouvier@linaro.org> wrote:

> Sorry to come back on this, but it seems this specific commit was not
> integrated in trunk.
>
> @Konstantin Kostiuk: If you plan to integrate this later (before 8.0
> tag), sorry for the noise. Since rc1 was published today, I think it may
> have been "lost".
>
> If someone wants to merge it, that would be nice.
>
> Thanks,
> Pierrick
>
> On 2/21/23 16:30, Pierrick Bouvier wrote:
> > Reported when compiling with clang-windows-arm64.
> >
> > ../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used
> uninitialized whenever 'if' condition is false
> [-Werror,-Wsometimes-uninitialized]
> >      if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
> >          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs her=
e
> >      return hr;
> >             ^~
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > Fixes: 917ebcb170 ("qga-win: Fix QGA VSS Provider service stop failure"=
)
> > Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   qga/vss-win32/install.cpp | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> > index b57508fbe0..b8087e5baa 100644
> > --- a/qga/vss-win32/install.cpp
> > +++ b/qga/vss-win32/install.cpp
> > @@ -518,7 +518,7 @@ namespace _com_util
> >   /* Stop QGA VSS provider service using Winsvc API  */
> >   STDAPI StopService(void)
> >   {
> > -    HRESULT hr;
> > +    HRESULT hr =3D S_OK;
> >       SC_HANDLE manager =3D OpenSCManager(NULL, NULL,
> SC_MANAGER_ALL_ACCESS);
> >       SC_HANDLE service =3D NULL;
> >
>

--000000000000dbd59305f780584e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Pierrick,</div><div><br></div><div>Thanks for remi=
nding me. You are fully right to ping me. I really lost this commit.</div><=
div>As QEMU is already at the code freeze stage, I don&#39;t want to push t=
his into 8.0.</div><div>I hope it will be ok to merge after 8.0 was release=
d.</div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</di=
v><div>Konstantin Kostiuk.</div></div></div></div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 21,=
 2023 at 11:48=E2=80=AFPM Pierrick Bouvier &lt;<a href=3D"mailto:pierrick.b=
ouvier@linaro.org">pierrick.bouvier@linaro.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Sorry to come back on this, b=
ut it seems this specific commit was not <br>
integrated in trunk.<br>
<br>
@Konstantin Kostiuk: If you plan to integrate this later (before 8.0 <br>
tag), sorry for the noise. Since rc1 was published today, I think it may <b=
r>
have been &quot;lost&quot;.<br>
<br>
If someone wants to merge it, that would be nice.<br>
<br>
Thanks,<br>
Pierrick<br>
<br>
On 2/21/23 16:30, Pierrick Bouvier wrote:<br>
&gt; Reported when compiling with clang-windows-arm64.<br>
&gt; <br>
&gt; ../qga/vss-win32/install.cpp:537:9: error: variable &#39;hr&#39; is us=
ed uninitialized whenever &#39;if&#39; condition is false [-Werror,-Wsometi=
mes-uninitialized]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!(ControlService(service, SERVICE_CONTROL_STOP=
, NULL))) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~<br>
&gt; ../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs he=
re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return hr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
&gt; Signed-off-by: Pierrick Bouvier &lt;<a href=3D"mailto:pierrick.bouvier=
@linaro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;<br>
&gt; Fixes: 917ebcb170 (&quot;qga-win: Fix QGA VSS Provider service stop fa=
ilure&quot;)<br>
&gt; Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.=
com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@=
linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/install.cpp | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp<br>
&gt; index b57508fbe0..b8087e5baa 100644<br>
&gt; --- a/qga/vss-win32/install.cpp<br>
&gt; +++ b/qga/vss-win32/install.cpp<br>
&gt; @@ -518,7 +518,7 @@ namespace _com_util<br>
&gt;=C2=A0 =C2=A0/* Stop QGA VSS provider service using Winsvc API=C2=A0 */=
<br>
&gt;=C2=A0 =C2=A0STDAPI StopService(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 HRESULT hr;<br>
&gt; +=C2=A0 =C2=A0 HRESULT hr =3D S_OK;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SC_HANDLE manager =3D OpenSCManager(NULL, NU=
LL, SC_MANAGER_ALL_ACCESS);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SC_HANDLE service =3D NULL;<br>
&gt;=C2=A0 =C2=A0<br>
</blockquote></div>

--000000000000dbd59305f780584e--


