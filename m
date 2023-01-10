Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83332663EA9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFC7x-00015l-HN; Tue, 10 Jan 2023 05:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pFC7u-00014o-Bu
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pFC7s-0002bo-Vh
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673347504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OpBEtLayZv812b5e4YkoMeuuObfbl7XI6KU/W9f3Fis=;
 b=UDC0Ho7BXkNMbe2wUjrhEMyXP+gLwf2gkwy7N+PJDWcT2uvYPjI4X4ndNqKoEOpVwTfeoq
 7Ozayfy/6PQOAG9rLecbNmyuY1/qu1iSBOTA1snjYH0YYeuObF4taWQ4XslKd/RhjbhAn5
 oNoLqN8qwG2bnzQVFgsEY+7t1yEbAOg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-ZZy08JZyO6qVmxkjj3QUmw-1; Tue, 10 Jan 2023 05:45:02 -0500
X-MC-Unique: ZZy08JZyO6qVmxkjj3QUmw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qw20-20020a1709066a1400b007c1727f7c55so7392210ejc.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 02:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OpBEtLayZv812b5e4YkoMeuuObfbl7XI6KU/W9f3Fis=;
 b=srBE1m+avfjm8z9Z0pX9Ay7ZGqLEYzj3wHW5U3oc1JHRtUhLWYCrBvcVcjDpxg6ZLx
 wiuZ2WO7MLIRjbsswyPO16yARtOH938U4zlohnAv9f4lLmvi57lHpskK6jFDcjUMygJW
 jW/Mos4ZQzTK5HBgM8TPZsj5D5TFn/C89Y4vK/pKIcVfe8l/FSJYROFd3pd3TxUXtnVs
 usaGHxPBfyoKlnLG/B+OoL/u7B7nwsYukHDoYr8Y1Yf2c73ZfFsrbgpmaPHeHACspI+1
 PYGQn2c4F7HybZzDPxGrnvA9dVGEKwwfnH9K+obT35351orbeypmYaCPuw7mfHT4qGP3
 tJTg==
X-Gm-Message-State: AFqh2krvVM8/D7InyCTjspF5VTr1gv4U0KyX2LITmC8W6bV0DTLaheB7
 ctBDM7X1rLYFeDLOeCga5UA+fqPYi+Qyphq9D4fyAijUvECULhM0BK9o1AAu1sESBFQEEWTutus
 NV9GaDhWXVg3UWx84rBqmltPArqDL7kU=
X-Received: by 2002:a17:906:b0cd:b0:781:c97c:84d1 with SMTP id
 bk13-20020a170906b0cd00b00781c97c84d1mr5796848ejb.147.1673347501639; 
 Tue, 10 Jan 2023 02:45:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNdlMfB//32sHA1Wq9N7C86pAKPycJ6bV2pnlDOBl1CJDGGPF8Z+y486ZD+N/tL+sfDvfqsoXYWBy8C4/vbV0=
X-Received: by 2002:a17:906:b0cd:b0:781:c97c:84d1 with SMTP id
 bk13-20020a170906b0cd00b00781c97c84d1mr5796845ejb.147.1673347501508; Tue, 10
 Jan 2023 02:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
 <87358ioen0.fsf@linaro.org>
In-Reply-To: <87358ioen0.fsf@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 10 Jan 2023 14:44:48 +0400
Message-ID: <CAMxuvayOmvVpWwDvF-LpF35ntD+p-pVVj9athsjB6fGsWYOypw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Fix win32/msys2 shader compilation & update
 lcitool deps
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>, pbonzini@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org, 
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Ed Maste <emaste@freebsd.org>, kraxel@redhat.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 John Snow <jsnow@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000069e4de05f1e693ee"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

--00000000000069e4de05f1e693ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jan 10, 2023 at 2:41 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Fix the shader compilation error on win32/msys2 and convert the related
> script
> > from perl to python. Drop unneeded dependencies from lcitool project.
>
> Queued to testing/next, thanks.
>

Thanks but wait for v4, Thomas pointed out some issues with the python
scripts +x.

--00000000000069e4de05f1e693ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023 at 2:41 PM Ale=
x Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.=
lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Fix the shader compilation error on win32/msys2 and convert the relate=
d script<br>
&gt; from perl to python. Drop unneeded dependencies from lcitool project.<=
br>
<br>
Queued to testing/next, thanks.<br></blockquote><div><br></div><div>Thanks =
but wait for v4, Thomas pointed out some issues with the python scripts <a =
class=3D"gmail_plusreply" id=3D"plusReplyChip-2">+x.</a><br></div></div></d=
iv>

--00000000000069e4de05f1e693ee--


