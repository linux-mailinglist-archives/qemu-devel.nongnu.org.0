Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBDB69DC9F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:13:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOhx-0003EZ-Rv; Tue, 21 Feb 2023 04:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pUOhv-0003EJ-87
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:13:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pUOht-0007iN-Ch
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676970784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NR2w0zb7f7zbVIleo3/KORSI4e6TNOfFi6Z8lbL8KS0=;
 b=VXUoA8XqOQ8gB5Fwo/tGZhXJMHxjiHmi2w1TPS5ZlYbyFeADmefJyy4GYVjBTf0h+qAjkk
 041ciflv6l2fRi/+cTbWWg4JJxr0mxMh/iQbkGtT/vxxJSSg3XbqFkEGDR3aK5OXMiHw3F
 2cgqTZ3vdjus+hNbqx19GPU7Ch5CaVI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-BR_IGDEIOiOOeUD5r6F-SQ-1; Tue, 21 Feb 2023 04:13:01 -0500
X-MC-Unique: BR_IGDEIOiOOeUD5r6F-SQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so5484814edb.12
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NR2w0zb7f7zbVIleo3/KORSI4e6TNOfFi6Z8lbL8KS0=;
 b=ipd0nt3LguZR6vp8Wu7U1X09E7D6the08KyX/0BNn1hvZz0l/m4jWP1nPJebkHk5rB
 DfQDTbzaCOqL8Qu6VSf7rfqQT7++asSNDovruussXD7zN8NeLIygQsHDzRj7ERBos3XX
 0X0T1Dpw4yf2T+YMjzReVWnkmZOODsR95soTYv2XKfZQsEATrsrSv1FgbKIQhff9hwBb
 s8UZisInPtXmNMZLi/QSxhMt2KfAHdIItDFvEltaTkv1qgRSO2y5sCKCHC6lhiWL5I6P
 QqyKu5hWPr6IEt9ge2cJJgfqIHqoX1Hp4NdYdN5+3tgSxoxOK6VQRa4q7hcnMWuFGQG5
 xuGQ==
X-Gm-Message-State: AO0yUKVqftX8/GQDDwYBehEAkCH3GA5qzlAim39tBEPAjNTfRCOmY3dD
 PUE3YT/laaUeHgeVF+De093hOBKedu82soUj7iMnqsaDMgdoCI1ZwdSnCjGynZjKYAydoLl50A3
 XA3GOogATRyQKw225DUljWq2voUH7hKY=
X-Received: by 2002:a17:906:b746:b0:88d:64e7:a2be with SMTP id
 fx6-20020a170906b74600b0088d64e7a2bemr5720614ejb.15.1676970780720; 
 Tue, 21 Feb 2023 01:13:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/sHMzyx1XszWcGe46a+i1G6V08i1Ul5rxU3qx3RJAsN0OK7qZSrctkVfh4Y0XfCs2AiUoQFfxwAuU1qHmuj8c=
X-Received: by 2002:a17:906:b746:b0:88d:64e7:a2be with SMTP id
 fx6-20020a170906b74600b0088d64e7a2bemr5720607ejb.15.1676970780484; Tue, 21
 Feb 2023 01:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
 <87r0ukbjfp.fsf@pond.sub.org>
 <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
 <55e488cf-0b5f-f1e9-0a15-5d3e8c155abe@redhat.com>
In-Reply-To: <55e488cf-0b5f-f1e9-0a15-5d3e8c155abe@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Feb 2023 13:12:48 +0400
Message-ID: <CAMxuvayAMEwR29fCs3SkHd8iOiOB+36QZBvEd7qG-sMhPdf2EQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000ab759105f5322fb5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

--000000000000ab759105f5322fb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 21, 2023 at 12:18 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 2/20/23 16:29, Marc-Andr=C3=A9 Lureau wrote:
> >> 7. A Windows SOCKET is also a HANDLE.  Maybe.  I guess.  Docs are
> >>     confusing.
> >>
> > Kind of, but not really. I think a HANDLE is a kind of void*. You need =
to
> > be careful using it appropriately with the right functions. Sometime, a
> > HANDLE can work with generic functions, like ReadFile, but you should n=
ot
> > use a CloseHandle on SOCKET, or registry key..
>
> A Windows SOCKET *is* a file HANDLE except it's always in overlapped
> mode so Windows provides send()/recv() in case you don't want to deal
> with overlapped mode.  But you can use it with ReadFile too (Windows API
> documentation says that is only true sometimes, but Winsock API is 30
> years old and right now you pretty much always can).
>
> However, sockets also has some extra information on the side, so you
> need to close them with closesocket() and CloseHandle() is not enough.
>

Yeah, the question is "is it safe to call CloseHandle() on a SOCKET, before
closesocket()". Testing/error checking seems to say it's okay.. I wouldn't
be surprised if internally the CloseHandle() function does something to
check if the given handle is a SOCKET and skip it. I wish they would
document it..


> The problem is that close() of something opened with _open_osfhandle()
> *does* do that CloseHandle(), so basically you are closing the handle
> twice.  IIRC there used to be undocumented functions _alloc_osfhnd() and
> similar, but they don't exist anymore (even Wine does not have them), so
> we're stuck; unfortunately this is the reason why QEMU is not already
> doing something like what you have in this patch.
>
> Is this a real bug or is it theoretical?  Do file descriptor and socket
> spaces overlap in practice?
>
>
Yes it likely can, the first SOCKET value starts at 92 in a simple test. It
looks like it may depend on the system number of opened sockets.

I think the second big issue is that we have many places where we assume a
fd is a fd, and we simply call close() (which would result in CloseHandle,
but missing closesocket).

sigh, if the CRT would allow us to steal the handle back..

--000000000000ab759105f5322fb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 12:18 PM Pa=
olo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n 2/20/23 16:29, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt;&gt; 7. A Windows SOCKET is also a HANDLE.=C2=A0 Maybe.=C2=A0 I guess.=
=C2=A0 Docs are<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0confusing.<br>
&gt;&gt;<br>
&gt; Kind of, but not really. I think a HANDLE is a kind of void*. You need=
 to<br>
&gt; be careful using it appropriately with the right functions. Sometime, =
a<br>
&gt; HANDLE can work with generic functions, like ReadFile, but you should =
not<br>
&gt; use a CloseHandle on SOCKET, or registry key..<br>
<br>
A Windows SOCKET *is* a file HANDLE except it&#39;s always in overlapped <b=
r>
mode so Windows provides send()/recv() in case you don&#39;t want to deal <=
br>
with overlapped mode.=C2=A0 But you can use it with ReadFile too (Windows A=
PI <br>
documentation says that is only true sometimes, but Winsock API is 30 <br>
years old and right now you pretty much always can).<br>
<br>
However, sockets also has some extra information on the side, so you <br>
need to close them with closesocket() and CloseHandle() is not enough.<br><=
/blockquote><div><br></div><div>Yeah, the question is &quot;is it safe to c=
all CloseHandle() on a SOCKET, before closesocket()&quot;. Testing/error ch=
ecking seems to say it&#39;s okay.. I wouldn&#39;t be surprised if internal=
ly the CloseHandle() function does something to check if the given handle i=
s a SOCKET and skip it. I wish they would document it..<br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The problem is that close() of something opened with _open_osfhandle() <br>
*does* do that CloseHandle(), so basically you are closing the handle <br>
twice.=C2=A0 IIRC there used to be undocumented functions _alloc_osfhnd() a=
nd <br>
similar, but they don&#39;t exist anymore (even Wine does not have them), s=
o <br>
we&#39;re stuck; unfortunately this is the reason why QEMU is not already <=
br>
doing something like what you have in this patch.<br>
<br>
Is this a real bug or is it theoretical?=C2=A0 Do file descriptor and socke=
t <br>
spaces overlap in practice?<br>
<br></blockquote><div><br></div><div>Yes it likely can, the first SOCKET va=
lue starts at 92 in a simple test. It looks like it may depend on the syste=
m number of opened sockets.<br></div><div><br></div><div>I think the second=
 big issue is that we have many places where we assume a fd is a fd, and we=
 simply call close() (which would result in CloseHandle, but missing closes=
ocket).</div><div><br></div><div>sigh, if the CRT would allow us to steal t=
he handle back.. <br></div><div><br></div><div><br></div><div>=C2=A0</div><=
/div></div>

--000000000000ab759105f5322fb5--


