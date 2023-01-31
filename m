Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030406830E4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsEV-0004M2-Hb; Tue, 31 Jan 2023 10:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pMsE4-00048i-PQ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:07:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pMsE1-0002m4-P7
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675177627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CNsxAsoHIDquGjob19j/Xi5zcIWpMkF4/IMGbkdO3qY=;
 b=ZRL/BGTdecuTpWnEX62urFggug8mg4bVBZSOK/Vf1iQemrVej0xYkvitexPRua1rWzr3Cq
 +BIs05nbfywaeg18rRqtgw1oQHSuYwshJcbTQBveoAI4JT9jNyx+bn0LkpjkckdUvfynGl
 mRQETX1Go6d54t5+7WMw1nFaSC7Kr1U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-370-Tn8txrsnO2y-VbpDiv7Vlw-1; Tue, 31 Jan 2023 10:07:05 -0500
X-MC-Unique: Tn8txrsnO2y-VbpDiv7Vlw-1
Received: by mail-ej1-f69.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso3668376ejz.15
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 07:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNsxAsoHIDquGjob19j/Xi5zcIWpMkF4/IMGbkdO3qY=;
 b=hVC0ruuEbzhbGOv3RKS9msK45c4KQ6Yh44KwIKQBHKNrE4Ixi3kH+B0b4E1bdTpw+a
 SOB4Rwb6tFLlMERFae3qQelpJ1w8W+J6GTIy+e+xhDJF0VHywYSdk3YNMdVnsgqTRDag
 u1payjBVH0AWZhTGNqxJ9I6UllVNKKwO32BVa+vAQMcLKwow0MRgOCRyIuR+YexRtTWm
 hmJhOJk2FFcX2Uh2rtgWuujHmcNVvvixBgMBppaREp6EAfH9T3XQ3XJX0oIXc67cB4oz
 jW5blF0C/URmh0vKm7Zyo/4H4jhY8VR+yrlGIQ1Wk4c4D016nkcDc3/3HFvK7djQfvX+
 +xHg==
X-Gm-Message-State: AO0yUKX1nq/aI4f8zp84zAi48wKch9U5jl3TJgzeC6I/fLfNf0qULSAD
 TUJvXADrTgS4ZmWlRrXAaMIiiGGec0bbxeEmi5Y5suRU4roe8KMwAKuzWn5XHMK27LZHXXsuoqt
 qmDD6OPwVfMKkXnsI79WYEULjSgDWSeg=
X-Received: by 2002:a17:906:b817:b0:87b:d73c:b064 with SMTP id
 dv23-20020a170906b81700b0087bd73cb064mr3937381ejb.124.1675177624697; 
 Tue, 31 Jan 2023 07:07:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9oB/vna5GBv3mInDUeMtqKtN8HyWhBFzk1OGsQGEnkzurWRH2ICiSl+kJyaizDGW0qV3UJ/SWTfmR5FfFr0jw=
X-Received: by 2002:a17:906:b817:b0:87b:d73c:b064 with SMTP id
 dv23-20020a170906b81700b0087bd73cb064mr3937367ejb.124.1675177624461; Tue, 31
 Jan 2023 07:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <CAMxuvayW7mzQcVLrB8v-adoKXVKgq-pGCf6uT-cURcmDW51bFQ@mail.gmail.com>
 <Y9koH+ElplpptxWp@redhat.com>
In-Reply-To: <Y9koH+ElplpptxWp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 31 Jan 2023 19:06:51 +0400
Message-ID: <CAMxuvazwG372R9TtFLZLzDx_Zm8kzQRu9-guizfwegFvA=9gCg@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, 
 Guohuai Shi <guohuai.shi@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003df9a905f390afbc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

--0000000000003df9a905f390afbc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jan 31, 2023 at 6:39 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, Jan 31, 2023 at 06:31:39PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, Jan 30, 2023 at 1:52 PM Bin Meng <bin.meng@windriver.com> wrote=
:
> >
> > > At present there is no Windows support for 9p file system.
> > > This series adds initial Windows support for 9p file system.
> > >
> > > 'local' file system backend driver is supported on Windows,
> > > including open, read, write, close, rename, remove, etc.
> > > All security models are supported. The mapped (mapped-xattr)
> > > security model is implemented using NTFS Alternate Data Stream
> > > (ADS) so the 9p export path shall be on an NTFS partition.
> > >
> > > 'synth' driver is adapted for Windows too so that we can now
> > > run qtests on Windows for 9p related regression testing.
> > >
> > > Example command line to test:
> > >
> > >   "-fsdev local,path=3Dc:\msys64,security_model=3Dmapped,id=3Dp9 -dev=
ice
> > > virtio-9p-pci,fsdev=3Dp9,mount_tag=3Dp9fs"
> > >
> > > Base-commit: 13356edb87506c148b163b8c7eb0695647d00c2a
> > >
> > > Changes in v4:
> > > - Fixed 9pfs mounted as read-only issue on Windows host, adding a
> > >   win32_error_to_posix() to translate Windows native API error to
> > >   POSIX one.
> > > - Fixed errors of handling symbolic links
> > > - Added forward declaration to avoid using 'void *'
> > > - Implemented Windows specific xxxdir() APIs for safe directory acces=
s
> > >
> > >
> > Sorry to look a bit late at this series, I don't know what was discusse=
d
> > previously.
> >
> > My general feeling is that a lot of this FS portability work would be
> > better handled by using GIO (even though this may add some extra
> > dependency). GIO lacks some features on win32 (for example xattributes =
on
> > win32), but they could have been proposed there too and benefiting othe=
r
> > apps.
>
> The currently impl relies on the openat, fstatat, mkdirat, renameat,
> utimensat, unlinkat functions. IIRC this was in order to deal with
> various security vulnerabilities that exist due to race conditions.
> AFAIK, there's no way to achieve the same with GIO as its a higher
> level API which doesn't expose this kind of functionality
>
>
Correct me if I am wrong, but that doesn't seem to hold much since the
protocol doesn't keep a context (with associated fds) around. But perhaps
GIO API alone can't provide safe implementations of the FileOperations
callbacks?

Also a lot of 9p-unix specific details may not map easily to the GIO API.
How they can be ported to win32 is certainly a challenge, mostly
duplicating the effort done in GIO to me.

--0000000000003df9a905f390afbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 31, 2023 at 6:39 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Tue, Jan 31, 2023 at 06:31:39PM +0400, Marc-Andr=C3=A9 Lureau wr=
ote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Mon, Jan 30, 2023 at 1:52 PM Bin Meng &lt;<a href=3D"mailto:bin.men=
g@windriver.com" target=3D"_blank">bin.meng@windriver.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt; &gt; At present there is no Windows support for 9p file system.<br>
&gt; &gt; This series adds initial Windows support for 9p file system.<br>
&gt; &gt;<br>
&gt; &gt; &#39;local&#39; file system backend driver is supported on Window=
s,<br>
&gt; &gt; including open, read, write, close, rename, remove, etc.<br>
&gt; &gt; All security models are supported. The mapped (mapped-xattr)<br>
&gt; &gt; security model is implemented using NTFS Alternate Data Stream<br=
>
&gt; &gt; (ADS) so the 9p export path shall be on an NTFS partition.<br>
&gt; &gt;<br>
&gt; &gt; &#39;synth&#39; driver is adapted for Windows too so that we can =
now<br>
&gt; &gt; run qtests on Windows for 9p related regression testing.<br>
&gt; &gt;<br>
&gt; &gt; Example command line to test:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0&quot;-fsdev local,path=3Dc:\msys64,security_model=3D=
mapped,id=3Dp9 -device<br>
&gt; &gt; virtio-9p-pci,fsdev=3Dp9,mount_tag=3Dp9fs&quot;<br>
&gt; &gt;<br>
&gt; &gt; Base-commit: 13356edb87506c148b163b8c7eb0695647d00c2a<br>
&gt; &gt;<br>
&gt; &gt; Changes in v4:<br>
&gt; &gt; - Fixed 9pfs mounted as read-only issue on Windows host, adding a=
<br>
&gt; &gt;=C2=A0 =C2=A0win32_error_to_posix() to translate Windows native AP=
I error to<br>
&gt; &gt;=C2=A0 =C2=A0POSIX one.<br>
&gt; &gt; - Fixed errors of handling symbolic links<br>
&gt; &gt; - Added forward declaration to avoid using &#39;void *&#39;<br>
&gt; &gt; - Implemented Windows specific xxxdir() APIs for safe directory a=
ccess<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Sorry to look a bit late at this series, I don&#39;t know what was dis=
cussed<br>
&gt; previously.<br>
&gt; <br>
&gt; My general feeling is that a lot of this FS portability work would be<=
br>
&gt; better handled by using GIO (even though this may add some extra<br>
&gt; dependency). GIO lacks some features on win32 (for example xattributes=
 on<br>
&gt; win32), but they could have been proposed there too and benefiting oth=
er<br>
&gt; apps.<br>
<br>
The currently impl relies on the openat, fstatat, mkdirat, renameat,<br>
utimensat, unlinkat functions. IIRC this was in order to deal with<br>
various security vulnerabilities that exist due to race conditions.<br>
AFAIK, there&#39;s no way to achieve the same with GIO as its a higher<br>
level API which doesn&#39;t expose this kind of functionality<br>
<br></blockquote><div><br></div><div>Correct me if I am wrong, but that doe=
sn&#39;t seem to hold much since the protocol doesn&#39;t keep a context (w=
ith associated fds) around. But perhaps GIO API alone can&#39;t provide saf=
e implementations of the FileOperations callbacks?<br></div></div><div clas=
s=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Also a lot of 9p-uni=
x specific details may not map easily to the GIO API. How they can be porte=
d to win32 is certainly a challenge, mostly duplicating the effort done in =
GIO to me.<br></div></div>

--0000000000003df9a905f390afbc--


