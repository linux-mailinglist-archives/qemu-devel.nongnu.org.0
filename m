Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0527454CE5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:15:05 +0100 (CET)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPSb-0001WI-0H
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnPR7-0007Yv-Lk
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnPR5-0005Wz-BW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637172810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PC1omtyVUccLxr8bgFYcSKTF0iaeu/bGQ0LzVo0Jk7w=;
 b=JSHVLPwPDBWbivqpIFii8j3VaR9fzuTho5zYkRGa24j7+4r/zNKlA1wamhFYYomAQQoi6L
 0V02tYyTuVxoYXVVv2dc9SrEejH8p4huK6U1excZdMrdmjmNExMUTZoCmsz9yyrL90dFl1
 AGSjrpYx9aq95C5/8SOzcamyLZ/ADbw=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-o-WMkx16M-6CILjajIEioA-1; Wed, 17 Nov 2021 13:13:24 -0500
X-MC-Unique: o-WMkx16M-6CILjajIEioA-1
Received: by mail-vk1-f200.google.com with SMTP id
 k19-20020a05612212f300b002f9b9e6a997so1708570vkp.19
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 10:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PC1omtyVUccLxr8bgFYcSKTF0iaeu/bGQ0LzVo0Jk7w=;
 b=7HmuvR6xawSvbq68vK6KCVCh3qaSLFjMpuwS9etsRMrcYVMtqzAHAMFhMRKpF8BfIR
 ZJJbqjcsu4FcBJtJSeBerhaT7Hnu48QHEYgEmfXG0O6bBa84by3CCF9gl6BgvIy0WRcw
 uvIt0/nKdPamxG1H1vTCfuU+6BrPMyEn7rPQrbsDSr+LPjD9iggzwMbAjNcT5PWGWfD5
 R8iaLFTiOVlY7E3NLp2tgsYSeofFArVWGTEsTqx4j2sJ+rMagGSdbYJJCwdrmZNMdOJb
 5plp+vCAeE99dZ7cGASsJNjewJHnpwrj4Iov+UIofopp2XIl1lo/KIcKoyKLCn2cGpfN
 DpmA==
X-Gm-Message-State: AOAM530NjSLc/nXqZ4+uQcdaJMfgwVXoMe5U6rTRLX89xoH0vgzYnSox
 rC8epvGuJNSKoeIyiBCL7a/xdqWRqiMcanweeeLchPQu9g7oT/Et05fVXJgD2E8DJQwcGg+ROqu
 FItO0XkLRitGlvH96h3ellCdiCG1J1yk=
X-Received: by 2002:a1f:a704:: with SMTP id q4mr91664510vke.0.1637172803827;
 Wed, 17 Nov 2021 10:13:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuTQ28UKwlConngEfbxZem8fBipDBRgOoG4rxYdjWf6iuZfhszwC7A+TjdWIjlJnkAEo2xwfPH7Im8i+FROlU=
X-Received: by 2002:a1f:a704:: with SMTP id q4mr91664460vke.0.1637172803653;
 Wed, 17 Nov 2021 10:13:23 -0800 (PST)
MIME-Version: 1.0
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
In-Reply-To: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 17 Nov 2021 13:13:12 -0500
Message-ID: <CAFn=p-akTO0Q3jct_PHYyc=yH6q1XwRWwv3EYBc49yKqT9YCeg@mail.gmail.com>
Subject: Re: Failing QEMU iotests
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000065e60d05d0ffff8f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065e60d05d0ffff8f
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 5:07 AM Thomas Huth <thuth@redhat.com> wrote:

>
>   Hi!
>
> I think it has been working fine for me a couple of weeks ago,
> but when I now run:
>
>   make check SPEED=slow
>
> I'm getting a couple of failing iotests... not sure whether
> these are known issues already, so I thought I'd summarize them
> here:
>
> *** First one is 045 in raw mode: ***
>
>   TEST   iotest-raw: 045 [fail]
> QEMU          --
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64"
> -nodefaults -display none -accel qtest
> QEMU_IMG      --
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io" --cache
> writeback --aio threads -f raw
> QEMU_NBD      --
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- raw
> IMGPROTO      -- file
> PLATFORM      -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64
> TEST_DIR      -- /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmphlexdrlt
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
>
> --- /home/thuth/devel/qemu/tests/qemu-iotests/045.out
> +++ 045.out.bad
> @@ -1,5 +1,77 @@
> -...........
> +......EE.EE
> +======================================================================
> +ERROR: test_add_fd (__main__.TestSCMFd)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 148, in
> test_add_fd
> +    self._send_fd_by_SCM()
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in
> _send_fd_by_SCM
> +    ret = self.vm.send_fd_scm(file_path=image0)
> +  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 229,
> in send_fd_scm
> +    self._qmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, in
> send_fd_scm
> +    self._aqmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 149,
> in _wrapper
> +    return func(proto, *args, **kwargs)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 644,
> in send_fd_scm
> +    sock = sock._sock  # pylint: disable=protected-access
> +AttributeError: 'socket' object has no attribute '_sock'
>

Well, that's not good.

Can you tell me some details about what system produced this failure?
The python version used to run the test would be good, as well as distro
release, kernel version, etc.

If you can reproduce it, I might want to give you a test branch of the
python code to produce some extra debugging information to help me
understand what's gone wrong here. Get in touch on IRC when you have some
spare time if you'd like to interactively debug it.

--js

--00000000000065e60d05d0ffff8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 5:07 AM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 Hi!<br>
<br>
I think it has been working fine for me a couple of weeks ago,<br>
but when I now run:<br>
<br>
=C2=A0 make check SPEED=3Dslow<br>
<br>
I&#39;m getting a couple of failing iotests... not sure whether<br>
these are known issues already, so I thought I&#39;d summarize them<br>
here:<br>
<br>
*** First one is 045 in raw mode: ***<br>
<br>
=C2=A0 TEST=C2=A0 =C2=A0iotest-raw: 045 [fail]<br>
QEMU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- &quot;/home/thuth/tmp/qemu-build/=
tests/qemu-iotests/../../qemu-system-x86_64&quot; -nodefaults -display none=
 -accel qtest<br>
QEMU_IMG=C2=A0 =C2=A0 =C2=A0 -- &quot;/home/thuth/tmp/qemu-build/tests/qemu=
-iotests/../../qemu-img&quot;<br>
QEMU_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0-- &quot;/home/thuth/tmp/qemu-build/tests=
/qemu-iotests/../../qemu-io&quot; --cache writeback --aio threads -f raw<br=
>
QEMU_NBD=C2=A0 =C2=A0 =C2=A0 -- &quot;/home/thuth/tmp/qemu-build/tests/qemu=
-iotests/../../qemu-nbd&quot;<br>
IMGFMT=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- raw<br>
IMGPROTO=C2=A0 =C2=A0 =C2=A0 -- file<br>
PLATFORM=C2=A0 =C2=A0 =C2=A0 -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x8=
6_64<br>
TEST_DIR=C2=A0 =C2=A0 =C2=A0 -- /home/thuth/tmp/qemu-build/tests/qemu-iotes=
ts/scratch<br>
SOCK_DIR=C2=A0 =C2=A0 =C2=A0 -- /tmp/tmphlexdrlt<br>
GDB_OPTIONS=C2=A0 =C2=A0--<br>
VALGRIND_QEMU --<br>
PRINT_QEMU_OUTPUT --<br>
<br>
--- /home/thuth/devel/qemu/tests/qemu-iotests/045.out<br>
+++ 045.out.bad<br>
@@ -1,5 +1,77 @@<br>
-...........<br>
+......<a href=3D"http://EE.EE" rel=3D"noreferrer" target=3D"_blank">EE.EE<=
/a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+ERROR: test_add_fd (__main__.TestSCMFd)<br>
+----------------------------------------------------------------------<br>
+Traceback (most recent call last):<br>
+=C2=A0 File &quot;/home/thuth/devel/qemu/tests/qemu-iotests/045&quot;, lin=
e 148, in test_add_fd<br>
+=C2=A0 =C2=A0 self._send_fd_by_SCM()<br>
+=C2=A0 File &quot;/home/thuth/devel/qemu/tests/qemu-iotests/045&quot;, lin=
e 144, in _send_fd_by_SCM<br>
+=C2=A0 =C2=A0 ret =3D self.vm.send_fd_scm(file_path=3Dimage0)<br>
+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qemu/machine/machine.py&qu=
ot;, line 229, in send_fd_scm<br>
+=C2=A0 =C2=A0 self._qmp.send_fd_scm(fd)<br>
+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py&quot;,=
 line 138, in send_fd_scm<br>
+=C2=A0 =C2=A0 self._aqmp.send_fd_scm(fd)<br>
+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py&quot=
;, line 149, in _wrapper<br>
+=C2=A0 =C2=A0 return func(proto, *args, **kwargs)<br>
+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py&qu=
ot;, line 644, in send_fd_scm<br>
+=C2=A0 =C2=A0 sock =3D sock._sock=C2=A0 # pylint: disable=3Dprotected-acce=
ss<br>
+AttributeError: &#39;socket&#39; object has no attribute &#39;_sock&#39;<b=
r></blockquote><div><br></div><div>Well, that&#39;s not good.<br></div><div=
><br></div><div>Can you tell me some details about what system produced thi=
s failure?<br></div><div>The python version used to run the test would be g=
ood, as well as distro release, kernel version, etc.<br><br></div><div>If y=
ou can reproduce it, I might want to give you a test branch of the python c=
ode to produce some extra debugging information to help me understand what&=
#39;s gone wrong here. Get in touch on IRC when you have some spare time if=
 you&#39;d like to interactively debug it.<br></div><div><br></div><div>--j=
s<br></div></div></div>

--00000000000065e60d05d0ffff8f--


