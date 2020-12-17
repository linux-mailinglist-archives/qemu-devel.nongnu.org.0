Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA32DD49B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:52:40 +0100 (CET)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpva3-0002w0-O2
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vessy@st6.io>) id 1kprrh-00066q-Ie
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:54:37 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vessy@st6.io>) id 1kprrf-0004CL-OC
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:54:37 -0500
Received: by mail-lf1-x12f.google.com with SMTP id o19so31011295lfo.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 03:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st6.io; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=+EIId0LQa9oL4W0fQV22GdYzFxlJSiC33BK63/5UAkQ=;
 b=SRGJGKTkAkdt2jrSAZmht0T53QYnqSPmbEcpBOwhQS9MoQApledvEQbRMV8IMsnZrb
 wp8RJ2P0hRUVwvm66Biky9SIBemU7YCefWJ+TM1R5T5FCnDa4qfmDV1Sigq+weV5Dt6J
 r7njVbihG5Tp70DqYYgw6irQvywkrWAIlccFevlnE9y5YQqpiQTnAT2PrLZTsM1DS9ep
 nE8AGHRtYjCS+95+GJKu5j8YcjIotU6wU+1jckZN3PQZmKpMzpWbpPicqHaUnb2rgJZE
 0hUFOGbQPssIasHTm78G4PoINKaUnJyn8VGws0f/KsXdfL0UZgpgi7xkkijd7rofpXfZ
 GUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+EIId0LQa9oL4W0fQV22GdYzFxlJSiC33BK63/5UAkQ=;
 b=e6UFs+NmGo/tUrTOXq6GV1i1OyWUztk6Bspb4wsk60DkEc/CkRCgR5qHa/KhbMbSm8
 2zjzXf+iF6jxLEkTUGPCUepxd1EcqF9u9l3lVDni7rNyIlQRRjNHar1vwOwI4ZLt8Hw2
 fM+3dx7kw+XejNEgetuTOnC5XrW6f4+o7u70sxBguJI9OkkyoCptGgQFMJMhYWH+Md2N
 RmmG39+1ykdOttl3j8sdvW5QTcXpeTkb6HM/X9gXjLdJ06nK2BaQcpCXl+ggKop5Ar7I
 QBsCWCL/8nq79m7flfSM7APZbHtC1qTHINUYffMT31cLg/2XeAqLIugur34JwJECcNTu
 8flA==
X-Gm-Message-State: AOAM533JKPBnCWFNYPVQeKoad0WcqZYSKmBVgn1HfTaekvq7/WdBmnCw
 v741pkz9NK8xkcs6JKUVUaNycST8Xrb4aEbJijZjsv0Eby/IJFT4LRw=
X-Google-Smtp-Source: ABdhPJxMpCD00CVuJJ2sLpdyYCCaZ2LZqIeikwF7s8acW4QHR14CBEWVTG99hjPwDVsbde09dExQnVzZan0+G2GhxUU=
X-Received: by 2002:a19:5f0a:: with SMTP id t10mr7407443lfb.568.1608206073166; 
 Thu, 17 Dec 2020 03:54:33 -0800 (PST)
MIME-Version: 1.0
From: Veselina Radeva <vessy@st6.io>
Date: Thu, 17 Dec 2020 13:54:22 +0200
Message-ID: <CAHNOXOQREiONA5aurW4B0aW4MJjmamqp6ZXpauCY4O88A1sSAw@mail.gmail.com>
Subject: Question about migration of a VM between hosts having slight
 difference in TSC Frequency
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b793df05b6a7a7f3"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f; envelope-from=vessy@st6.io;
 helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Dec 2020 10:51:21 -0500
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

--000000000000b793df05b6a7a7f3
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to migrate a VM from one host to another where there is a 1KHz
difference in the TSC frequency between hosts. This results in errors
caused by this warning
<https://github.com/qemu/qemu/blob/b785d25e91718a660546a6550f64b3c543af7754/target/i386/kvm.c#L777>,
so migration fails. On the other hand, I can see few lines before that
<https://github.com/qemu/qemu/blob/b785d25e91718a660546a6550f64b3c543af7754/target/i386/kvm.c#L761>
that
there is a try to allow TSC frequency difference between host and VM if it
falls within the specified bounds. It seems like `KVM_SET_TSC_KHZ`succeeds
only when TSC Scaling is available
<https://github.com/qemu/qemu/blob/2c6605389c1f76973d92b69b85d40d94b8f1092c/linux-headers/linux/kvm.h#L1361>.
Practically this means that migration between hosts having difference in
TSC frequency, even when it falls within bounds, is possible only when TSC
scaling is available.

On the other hand, in libvirt,
<https://github.com/libvirt/libvirt/commit/d8e5b4560006590668d4669f54a46b08ec14c1a2>
migration is allowed if TSC frequency difference falls within bounds, no
matter if TSC scaling is enabled or not.

So, I was wondering is it intended not to allow migration between hosts
having differences in TSC frequency if TSC scaling is not available? Or is
it a bug?

Thanks in advance,
Veselina Radeva
https://st6.io/

--000000000000b793df05b6a7a7f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div><br></div><div>I&#39;m trying to mi=
grate a VM from one host to another where there is a 1KHz difference in the=
 TSC frequency between hosts. This results in errors caused by <a href=3D"h=
ttps://github.com/qemu/qemu/blob/b785d25e91718a660546a6550f64b3c543af7754/t=
arget/i386/kvm.c#L777">this warning</a>, so migration fails. On the other h=
and, I can see <a href=3D"https://github.com/qemu/qemu/blob/b785d25e91718a6=
60546a6550f64b3c543af7754/target/i386/kvm.c#L761">few lines before that</a>=
=C2=A0that there is a try to allow TSC frequency difference=C2=A0between ho=
st and VM=C2=A0if it falls within the specified bounds. It seems like=C2=A0=
`<span style=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&qu=
ot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre">KV=
M_SET_TSC_KHZ`</span>succeeds only <a href=3D"https://github.com/qemu/qemu/=
blob/2c6605389c1f76973d92b69b85d40d94b8f1092c/linux-headers/linux/kvm.h#L13=
61">when TSC Scaling is available</a>. Practically this means that migratio=
n between hosts having difference in TSC frequency, even when it falls with=
in bounds, is possible only when TSC scaling is available.=C2=A0</div><div>=
<br></div><div>On the other hand, <a href=3D"https://github.com/libvirt/lib=
virt/commit/d8e5b4560006590668d4669f54a46b08ec14c1a2">in libvirt,</a> migra=
tion is allowed if TSC frequency difference falls within bounds, no matter =
if TSC scaling is enabled or not.</div><div><br></div><div>So, I was wonder=
ing is=C2=A0it intended not to allow migration between hosts having differe=
nces in TSC frequency if TSC scaling is not available? Or is it a bug?</div=
><div><br></div><div>Thanks in advance,</div><div>Veselina Radeva</div><div=
><a href=3D"https://st6.io/">https://st6.io/</a>=C2=A0</div><span style=3D"=
color:rgb(0,0,0);font-family:Helvetica;font-size:12px"><br></span></div>

--000000000000b793df05b6a7a7f3--

