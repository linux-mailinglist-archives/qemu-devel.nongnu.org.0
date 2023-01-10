Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50740663E5F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:37:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBKc-0002Tz-0C; Tue, 10 Jan 2023 04:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pFBKY-0002Pc-Ld
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pFBKV-0002ho-CG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uc0t1hrg1WABt7f+Z+uhA7C95FB2Ch6o82+udo/lSMY=;
 b=OkdyPE6NPgAPHMQUOyiKEohaSd1eh+sHK2ezStNvS2KaB2uQUqHMIOAsZtbmU3FO1BlWBf
 37zg8Mm12bxmQR5o3Dj4PGRT7NbiP47RDhPTC8DMyaWPpEl/3TJCgEfFFRyzwQDqRc4mKX
 wC2pISxUCJcshz+84Aix7kb0IgWAukM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-5bARiPzpPYuEXqpfs-vBKA-1; Tue, 10 Jan 2023 04:54:01 -0500
X-MC-Unique: 5bARiPzpPYuEXqpfs-vBKA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs18-20020a1709073e9200b007c0f9ac75f9so7307827ejc.9
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 01:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uc0t1hrg1WABt7f+Z+uhA7C95FB2Ch6o82+udo/lSMY=;
 b=S/p3KEXFD3HalGtxWtVTp7nSiMOoxYvLUOEO+rxioElvjosf4a0z62KZwKgede2oK/
 py6UPCGAmx7WPj9JCnwp/4c5CUmZDI+lMJshxUxC6jQ4/w+QEveE9urktsf6Jeji+Oeo
 GIiDODwOuPb/Fj1uoHYfItep7QwKiN4sxtM+KNPYzau8bFZQJC8JLCSPJwEQg+2WMMGW
 L6kAey/N8Sjh0WuHYLsvQxKOM2+ff06jQLF1R46d5Hi+N+TbD10PQurE6du+AdeuG36T
 syR18wynlVe6rZXx1CGTxbW3V93uWErPGn4cr4Cx4Ivx6dBJB7Q36f40tARTn+d0gh8s
 +8UA==
X-Gm-Message-State: AFqh2koWb8Sl+4jYAjxHwIPGnfsbcCHs5DbRjNJu7MHBOIKyO6zasOKv
 +EWAvflo/bCLIgesuUGqZUbbFSWXysur4lAxbCN8bo/sWjWMqjzmaeI0fGjv8uacJUQlX3QNZtN
 ZdRDiQLHTBcAuSVnEPEXKUMLRmd5R4uk=
X-Received: by 2002:a17:906:1116:b0:859:8a72:77a with SMTP id
 h22-20020a170906111600b008598a72077amr61269eja.482.1673344440065; 
 Tue, 10 Jan 2023 01:54:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsrpD6jN3OVHGNMGeRYo6jJTU7sCkCKsj98w/kUgOSSWIyx3dnS9qU3CG8QPpl4DgjXAnXZvsISF2JK6Qxecp0=
X-Received: by 2002:a17:906:1116:b0:859:8a72:77a with SMTP id
 h22-20020a170906111600b008598a72077amr61255eja.482.1673344439810; Tue, 10 Jan
 2023 01:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
 <20230110080246.536056-2-marcandre.lureau@redhat.com>
 <b3f236ad-6e18-c735-a4ba-6f35cf9f3cdf@redhat.com>
In-Reply-To: <b3f236ad-6e18-c735-a4ba-6f35cf9f3cdf@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 10 Jan 2023 13:53:48 +0400
Message-ID: <CAMxuvawVQuichuy7H3S67rE3qmVLukU_k-F52KGwLkKomBwkSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] build-sys: fix crlf-ending C code
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, 
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org, 
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Ed Maste <emaste@freebsd.org>, kraxel@redhat.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 John Snow <jsnow@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ec0ef105f1e5dce7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000ec0ef105f1e5dce7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jan 10, 2023 at 12:33 PM Thomas Huth <thuth@redhat.com> wrote:

> On 10/01/2023 09.02, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > On msys2, the shader-to-C script produces bad C:
> > ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating "
> character [-Werror]
> >
> > Fix it by changing the line ending from crlf to lf, and convert the
> > script to Python (qemu build seems perl-free after that).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   meson.build              |  2 +-
> >   scripts/shaderinclude.pl | 16 ----------------
> >   scripts/shaderinclude.py | 26 ++++++++++++++++++++++++++
> >   3 files changed, 27 insertions(+), 17 deletions(-)
> >   delete mode 100644 scripts/shaderinclude.pl
> >   create mode 100755 scripts/shaderinclude.py
>
> This seems to break our "make vm-build-freebsd" test... I'm now getting:
>
> [281/1485] Generating ui/shader/texture-blit-frag.h with a custom command
> (wrapped by meson to capture output)
> FAILED: ui/shader/texture-blit-frag.h
> /usr/local/bin/python3.7
> /usr/home/qemu/qemu-test.SnknY0/src/meson/meson.py
> --internal exe --capture ui/shader/texture-blit-frag.h --
> /usr/home/qemu/qemu-test.SnknY0/src/scripts/shaderinclude.py
> ../src/ui/shader/texture-blit.frag
> --- stderr ---
> env: python3: No such file or directory
>
> Looks like you've got to do "chmod a-x scripts/shaderinclude.py" to get
> this
> fixed, after removing the executable bits, I'm getting:
>
> [281/1485] Generating ui/shader/texture-blit-frag.h with a custom command
> (wrapped by meson to capture output)
>
> and the compilation process continues happily.
>

thanks for the tip, indeed since 0.51 "find_program: use Meson's Python3
for non-executable Python scripts":
https://github.com/mesonbuild/meson/commit/0078d808a2a2b01c634483ca4a986f52=
ffe1ce3c

It's a bit annoying to have a mix of executable and non-executable
scripts/*.py, but python.., oh well.. I suppose the ones used during build
are -x, the one used manually are +x.

--000000000000ec0ef105f1e5dce7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023 at 12:33 PM Th=
omas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/01/=
2023 09.02, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank=
">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; On msys2, the shader-to-C script produces bad C:<br>
&gt; ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating &quot;=
 character [-Werror]<br>
&gt; <br>
&gt; Fix it by changing the line ending from crlf to lf, and convert the<br=
>
&gt; script to Python (qemu build seems perl-free after that).<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Acked-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0scripts/<a href=3D"http://shaderinclude.pl" rel=3D"norefer=
rer" target=3D"_blank">shaderinclude.pl</a> | 16 ----------------<br>
&gt;=C2=A0 =C2=A0scripts/shaderinclude.py | 26 ++++++++++++++++++++++++++<b=
r>
&gt;=C2=A0 =C2=A03 files changed, 27 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 scripts/<a href=3D"http://shaderinclude=
.pl" rel=3D"noreferrer" target=3D"_blank">shaderinclude.pl</a><br>
&gt;=C2=A0 =C2=A0create mode 100755 scripts/shaderinclude.py<br>
<br>
This seems to break our &quot;make vm-build-freebsd&quot; test... I&#39;m n=
ow getting:<br>
<br>
[281/1485] Generating ui/shader/texture-blit-frag.h with a custom command <=
br>
(wrapped by meson to capture output)<br>
FAILED: ui/shader/texture-blit-frag.h<br>
/usr/local/bin/python3.7 /usr/home/qemu/qemu-test.SnknY0/src/meson/meson.py=
 <br>
--internal exe --capture ui/shader/texture-blit-frag.h -- <br>
/usr/home/qemu/qemu-test.SnknY0/src/scripts/shaderinclude.py <br>
../src/ui/shader/texture-blit.frag<br>
--- stderr ---<br>
env: python3: No such file or directory<br>
<br>
Looks like you&#39;ve got to do &quot;chmod a-x scripts/shaderinclude.py&qu=
ot; to get this <br>
fixed, after removing the executable bits, I&#39;m getting:<br>
<br>
[281/1485] Generating ui/shader/texture-blit-frag.h with a custom command <=
br>
(wrapped by meson to capture output)<br>
<br>
and the compilation process continues happily.<br></blockquote><div><br></d=
iv><div>thanks for the tip, indeed since 0.51 &quot;find_program: use Meson=
&#39;s Python3 for non-executable Python scripts&quot;:</div><div><a href=
=3D"https://github.com/mesonbuild/meson/commit/0078d808a2a2b01c634483ca4a98=
6f52ffe1ce3c">https://github.com/mesonbuild/meson/commit/0078d808a2a2b01c63=
4483ca4a986f52ffe1ce3c</a></div><div><br> </div><div>It&#39;s a bit annoyin=
g to have a mix of executable and non-executable scripts/*.py, but python..=
, oh well.. I suppose the ones used during build are -x, the one used manua=
lly are <a class=3D"gmail_plusreply" id=3D"plusReplyChip-1">+x.</a><br></di=
v></div></div>

--000000000000ec0ef105f1e5dce7--


