Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44B6DC03B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:06:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plVek-0004A1-BL; Sun, 09 Apr 2023 10:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plVei-00049T-By
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:04:32 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plVeg-00013g-Aq
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:04:32 -0400
Received: by mail-ej1-x631.google.com with SMTP id ga37so7395180ejc.0
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681049067;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WzY7/BrRWtyQH99vpvQ3pz3mpkJNLohnUom4S/Fhesg=;
 b=ENpsa+O8Mt+39cJl2nYoKPcW3to4bYfRwKakoV4sFYEBSicLYN6PcRb0uvsoqu1+na
 ySizQ5UWVLX++YAoGhrKkgr4hJclhezFEIPPcpd5eLH5V5XofmlbIvqZySxraBEQ2jpT
 SRXK+DckoFd8r09Qeqke7Vy1WKU51Jfqref8m5ESmlSny5/S39bsy9n9oX9ksvIYHh6q
 OkgE4ObLDNR7gQh5rNI4taWWmLhPEoXMBSyNADUmRMoP38zVW2QqTsPrmpLNOS4i3HgR
 Cuj9jnKJ9Nl1xDOcVaU//sgF1lxuaoMi5ib/Mpt8KrS1PhVcz+Ci2CVvVjOYIjHmDeAL
 bjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681049067;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WzY7/BrRWtyQH99vpvQ3pz3mpkJNLohnUom4S/Fhesg=;
 b=IkqQzf90UdvucZwGpOvf2+4MA8Da0CPZHrToYQgQB/yvWp2HS01YDQ2xlq6QrvTJia
 vi1DRZ6N5MeqpLUwPou0KfeVsX3Kx+d/6fnyAOWw1jHcAV28QwPD1LLYKUlq2MIUXB7N
 gaa3DVyQGrC2jFiIbCZ0gjDn2iLwzB3qcMH2j2xNxeCC99Ytxjm2FzM9+y7yvtJomxPA
 iuFhZ38TCRFRAZ+GYRQePGx2LXAsziWy0TB4vVHYJNE2H56EY6gcpoHDEQtokYcpvHA5
 s/RC4Aokz0A1FP8sfWRqPgvHrz/oXiUy0SAuG+2RVdjHFRr/Uep8g/J5DNIurkb1gKLs
 V7GA==
X-Gm-Message-State: AAQBX9fcAqDWrBHvnEkYZkEmQhE2ToHpwhrAjIHp2SCFYaKWWKpm2XyI
 SmRvIeQYJ4+E4NmmMNfM4MlZ2Tmyje1HlFx7IwOW+A==
X-Google-Smtp-Source: AKy350Y94v9bpnE2ysgIQijE0fYLnRZDAZ57fqGOmwB24oakYzlrtfx7hdjuGLQlh1j7ovg+39njAG00PcCbAzYszo0=
X-Received: by 2002:a17:907:6287:b0:93e:c1ab:ae67 with SMTP id
 nd7-20020a170907628700b0093ec1abae67mr2367844ejc.2.1681049067229; Sun, 09 Apr
 2023 07:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <cd93a0e0-6047-c511-9b96-35bf4e0adce0@msgid.tls.msk.ru>
In-Reply-To: <cd93a0e0-6047-c511-9b96-35bf4e0adce0@msgid.tls.msk.ru>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 9 Apr 2023 08:04:20 -0600
Message-ID: <CANCZdfrcKrj3vLpKRjACwiCnNjc1JfCyNNpLP8Lw4zv9Qhxo2w@mail.gmail.com>
Subject: Re: qemu-user: avoid allocations to convert stuff when not necessary
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000080a97d05f8e7bc0c"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000080a97d05f8e7bc0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 9, 2023 at 2:53=E2=80=AFAM Michael Tokarev <mjt@tls.msk.ru> wro=
te:

> Hi!
>
> In the qemu-user case, we allocate various structures and arrays
> for conversion of data between host and guest byte orders and sizes.
> But it is actually not necessary to do such allocation when the
> *size* is the same, and only byte order is different, because the
> conversion can be done in-place.  Does it make any sense to avoid'
> allocations in such cases?
>
> There are 2 issues with this though. First is that in some cases,
> the data being converted is const, and we may end up writing to a
> data resides in a read-only segment, is it ever possible?  And
> second - it is not entirely clear what to do in case the syscall
> returned error.
>

I don't think you can reliably do it in place. What if another thread in th=
e
guest reads the data after you've converted it? It will get the wrong
answer.
I think you have to copy when endian mismatches, just like when alignment,
data size or layout differences are present. You'd need to convert it back
after the system call as well, which can cause problems, especially
if the system call needs multiple steps to emulate for whatever reason.

Warner

--00000000000080a97d05f8e7bc0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 9, 2023 at 2:53=E2=80=AFA=
M Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<b=
r>
<br>
In the qemu-user case, we allocate various structures and arrays<br>
for conversion of data between host and guest byte orders and sizes.<br>
But it is actually not necessary to do such allocation when the<br>
*size* is the same, and only byte order is different, because the<br>
conversion can be done in-place.=C2=A0 Does it make any sense to avoid&#39;=
<br>
allocations in such cases?<br>
<br>
There are 2 issues with this though. First is that in some cases,<br>
the data being converted is const, and we may end up writing to a<br>
data resides in a read-only segment, is it ever possible?=C2=A0 And<br>
second - it is not entirely clear what to do in case the syscall<br>
returned error.<br></blockquote><div><br></div><div>I don&#39;t think you c=
an reliably do it in place. What if another thread in the</div><div>guest r=
eads the data after you&#39;ve converted it? It will get the wrong answer.<=
/div><div>I think you have to copy when endian mismatches, just like when a=
lignment,</div><div>data size or layout differences are present. You&#39;d =
need to convert it back</div><div>after the system call as well, which can =
cause problems, especially</div><div>if the system call needs multiple step=
s to emulate for whatever reason.<br></div><div><br></div><div>Warner <br><=
/div></div></div>

--00000000000080a97d05f8e7bc0c--

