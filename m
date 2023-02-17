Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3669B14A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3qj-0005lO-BY; Fri, 17 Feb 2023 11:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1pT3qh-0005lB-Sp
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:44:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1pT3qV-0000mP-3X
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676652266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TetaBlZHC6v/PetEqrPTKxF3E4ZyTnDr/pz7AA0FdLQ=;
 b=Roh4aC8b6mGLMp8d0ozTvg1fzfkeDj0Z5lLzDR1PJmGQg/88Jb3KBqylPCDfgQCRCk7MrE
 lHVh/IGkRe1tOPyKC7UehAcBaUYu4YJwpy/ejgj4E46gZgtIPpS3fIPrgm3AyX1GsXtOoM
 ztiF1s0H+jn8OWWsM7jhdd5FA8MYibk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-6spdyQ9zPqq8LtBEAQ1O3w-1; Fri, 17 Feb 2023 11:43:06 -0500
X-MC-Unique: 6spdyQ9zPqq8LtBEAQ1O3w-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-53659386dc8so8879737b3.6
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TetaBlZHC6v/PetEqrPTKxF3E4ZyTnDr/pz7AA0FdLQ=;
 b=qGTtMC9N9CH2pZ4NWEvZT1lYgPleM3/h6RCRjd1tZN4C19E7yoMVuSvo4C3VKsu6ly
 kD6jaryvFN8bMlkHH44cFQ+nbEiG9dZFJWVdsuizvp4fjNlSP8KDLZgtok9CDTvV/z/W
 t2n/CLI8qdab0j9XGsNWAxQD8uQ6OALJ2+/gxZvji5jeNV/px89pXK1VcN3b3p7Dhujg
 WMEaTEJlIrKjNvFrCsYGAUwC0iPsJ06pxATUzyS3XcLRZ9nIM/I1DtFgneMbXxdnVjJg
 zMFcaFjFfd3dTtgIBQhqZIDRGsyaK3HK9O7yaMfYWZhHoaiTZvfGVifQfu2ZL6tEHJrx
 f8nQ==
X-Gm-Message-State: AO0yUKXikZV4ZB25NMaBvxE8gODpGSXWLS78KGWuay8lB4m3Wa3JnfF5
 b3/lzTdNwnUqqlLmn3t5nhu90sFmo240DMjLweO9MFtW9jMTeCeup6BHZF4gPZwdVapPOO6425t
 WKBnCopUWqVt7UaVkklgAE8kPAE0PTgE=
X-Received: by 2002:a05:6902:308:b0:900:91c7:5499 with SMTP id
 b8-20020a056902030800b0090091c75499mr1112969ybs.395.1676652185045; 
 Fri, 17 Feb 2023 08:43:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8MVusFG8mgSDBLQlmeUhn0oFVxtJSWpy/LwQYKpbAT2tn727mgXhBsKJThUhIEXsDFg+9CuaGuXhzNhCTnKT4=
X-Received: by 2002:a05:6902:308:b0:900:91c7:5499 with SMTP id
 b8-20020a056902030800b0090091c75499mr1112946ybs.395.1676652184646; Fri, 17
 Feb 2023 08:43:04 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
In-Reply-To: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
From: German Maglione <gmaglione@redhat.com>
Date: Fri, 17 Feb 2023 17:42:28 +0100
Message-ID: <CAJh=p+4_XkR-MN4ByiOHmu_8-RSMDS69zKd_AXYX-47Kzp7Ciw@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e0c9a205f4e801bf"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gmaglion@redhat.com;
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

--000000000000e0c9a205f4e801bf
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

Sorry for being so late, if it is still possible I would like to propose the
following project:

=== A sandboxing tool for virtiofsd ===

''Summary:''' Create a tool that runs virtiofsd in a sandboxed environment

Virtiofs is a shared file system that lets virtual machines access a
directory
tree on the host. Unlike existing approaches, it is designed to
offer local file system semantics and performance.

Currently, virtiofsd integrates the sandboxing code and the server code in a
single binary. The goal is to extract that code and create an external tool
that
creates a sandbox environment and runs virtiofsd in it. In addition, that
tool
should be extended to be able to run virtiofsd in a restricted environment
with
Landlock.

This will allow greater flexibility when integrating virtiofsd into a VMM
or
running it inside a container.

Goals:
* Understand how to setup a restricted environment using chroot,
namespaces, and
  Landlock
* Refactor virtiofsd to extract the sandbox code to its own crate
* Create an external sandboxing tool for virtiofsd

'''Links:'''
* https://virtio-fs.gitlab.io/
* https://gitlab.com/virtio-fs/virtiofsd
* https://landlock.io/

'''Details:'''
* Project size: 175 hours
* Skill level: intermediate (knowledge of Rust and C)
* Language: Rust
* Mentor: German Maglione <gmaglione@redhat.com>, Stefano Garzarella <
sgarzare@redhat.com>
* Suggested by: German Maglione <gmaglione@redhat.com>


On Fri, Jan 27, 2023 at 4:18 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2023
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May 2023 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
>
> Please reply to this email by February 6th with your project ideas.
>
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. Mentors support interns as they work on their project. It's a
> great way to give back and you get to work with people who are just
> starting out in open source.
>
> Good project ideas are suitable for remote work by a competent
> programmer who is not yet familiar with the codebase. In
> addition, they are:
> - Well-defined - the scope is clear
> - Self-contained - there are few dependencies
> - Uncontroversial - they are acceptable to the community
> - Incremental - they produce deliverables along the way
>
> Feel free to post ideas even if you are unable to mentor the project.
> It doesn't hurt to share the idea!
>
> I will review project ideas and keep you up-to-date on QEMU's
> acceptance into GSoC.
>
> Internship program details:
> - Paid, remote work open source internships
> - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> hrs/week for 12 weeks
> - Mentored by volunteers from QEMU, KVM, and rust-vmm
> - Mentors typically spend at least 5 hours per week during the coding
> period
>
> For more background on QEMU internships, check out this video:
> https://www.youtube.com/watch?v=xNVCX7YMUL8
>
> Please let me know if you have any questions!
>
> Stefan
>
>

-- 
German

--000000000000e0c9a205f4e801bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Stefan, <br></div><div><br></div><div>Sorry for be=
ing so late, if it is still possible I would like to propose the</div>follo=
wing project:<br><br>=3D=3D=3D A sandboxing tool for virtiofsd =3D=3D=3D<br=
><br>&#39;&#39;Summary:&#39;&#39;&#39; Create a tool that runs virtiofsd in=
 a sandboxed environment<br>=C2=A0 =C2=A0<br>Virtiofs is a shared file syst=
em that lets virtual machines access a directory<br>tree on the host. Unlik=
e existing approaches, it is designed to <br>offer local file system semant=
ics and performance.<br>=C2=A0 =C2=A0<br>Currently, virtiofsd integrates th=
e sandboxing code and the server code in a<br>single binary. The goal is to=
 extract that code and create an external tool that<br>creates a sandbox en=
vironment and runs virtiofsd in it. In addition, that tool<br>should be ext=
ended to be able to run virtiofsd in a restricted environment with<br>Landl=
ock.<br>=C2=A0 =C2=A0<br>This will allow greater flexibility when integrati=
ng virtiofsd into a VMM or <br>running it inside a container.<br><br>Goals:=
<br>* Understand how to setup a restricted environment using chroot, namesp=
aces, and<br>=C2=A0 Landlock<br>* Refactor virtiofsd to extract the sandbox=
 code to its own crate<br>* Create an external sandboxing tool for virtiofs=
d<br><br>&#39;&#39;&#39;Links:&#39;&#39;&#39;<br>* <a href=3D"https://virti=
o-fs.gitlab.io/">https://virtio-fs.gitlab.io/</a><br>* <a href=3D"https://g=
itlab.com/virtio-fs/virtiofsd">https://gitlab.com/virtio-fs/virtiofsd</a><b=
r>* <a href=3D"https://landlock.io/">https://landlock.io/</a><br>=C2=A0 =C2=
=A0<br>&#39;&#39;&#39;Details:&#39;&#39;&#39;<br>* Project size: 175 hours<=
br>* Skill level: intermediate (knowledge of Rust and C)<br>* Language: Rus=
t<br>* Mentor: German Maglione &lt;<a href=3D"mailto:gmaglione@redhat.com">=
gmaglione@redhat.com</a>&gt;, Stefano Garzarella &lt;<a href=3D"mailto:sgar=
zare@redhat.com">sgarzare@redhat.com</a>&gt;<br>* Suggested by: German Magl=
ione &lt;<a href=3D"mailto:gmaglione@redhat.com">gmaglione@redhat.com</a>&g=
t;<br>=C2=A0=C2=A0 <br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Jan 27, 2023 at 4:18 PM Stefan Hajnoczi &lt;=
<a href=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Dear QEMU, KVM, and=
 rust-vmm communities,<br>
QEMU will apply for Google Summer of Code 2023<br>
(<a href=3D"https://summerofcode.withgoogle.com/" rel=3D"noreferrer" target=
=3D"_blank">https://summerofcode.withgoogle.com/</a>) and has been accepted=
 into<br>
Outreachy May 2023 (<a href=3D"https://www.outreachy.org/" rel=3D"noreferre=
r" target=3D"_blank">https://www.outreachy.org/</a>). You can now<br>
submit internship project ideas for QEMU, KVM, and rust-vmm!<br>
<br>
Please reply to this email by February 6th with your project ideas.<br>
<br>
If you have experience contributing to QEMU, KVM, or rust-vmm you can<br>
be a mentor. Mentors support interns as they work on their project. It&#39;=
s a<br>
great way to give back and you get to work with people who are just<br>
starting out in open source.<br>
<br>
Good project ideas are suitable for remote work by a competent<br>
programmer who is not yet familiar with the codebase. In<br>
addition, they are:<br>
- Well-defined - the scope is clear<br>
- Self-contained - there are few dependencies<br>
- Uncontroversial - they are acceptable to the community<br>
- Incremental - they produce deliverables along the way<br>
<br>
Feel free to post ideas even if you are unable to mentor the project.<br>
It doesn&#39;t hurt to share the idea!<br>
<br>
I will review project ideas and keep you up-to-date on QEMU&#39;s<br>
acceptance into GSoC.<br>
<br>
Internship program details:<br>
- Paid, remote work open source internships<br>
- GSoC projects are 175 or 350 hours, Outreachy projects are 30<br>
hrs/week for 12 weeks<br>
- Mentored by volunteers from QEMU, KVM, and rust-vmm<br>
- Mentors typically spend at least 5 hours per week during the coding perio=
d<br>
<br>
For more background on QEMU internships, check out this video:<br>
<a href=3D"https://www.youtube.com/watch?v=3DxNVCX7YMUL8" rel=3D"noreferrer=
" target=3D"_blank">https://www.youtube.com/watch?v=3DxNVCX7YMUL8</a><br>
<br>
Please let me know if you have any questions!<br>
<br>
Stefan<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">German<br></div></div>

--000000000000e0c9a205f4e801bf--


