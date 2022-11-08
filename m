Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0247620BB0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:02:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKV4-0008A6-J5; Tue, 08 Nov 2022 04:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nyoro.gachu@gmail.com>)
 id 1osKUg-00082V-P5
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:02:07 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nyoro.gachu@gmail.com>)
 id 1osKUb-0002md-HQ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:02:06 -0500
Received: by mail-lf1-x133.google.com with SMTP id c1so18651098lfi.7
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OMazL3QO7MIVVURpVpy/B5PVB+2OjD7QIgU9RRNjerM=;
 b=h13E2ebSHxDnCA+FmwI8M+ehdVbTUHF9V0eRUuRqM+Q3TBkf/7YbyzzPVyYtkHSDK1
 HsVBRoI0Y0vjFAKdidIOwN6xq6BUCHyNkGMChexkwqVNjg5HYQ6sstEas5KIoh+RaXE9
 PmXLAPSMLA4PFnfTYjRc+pvxZDD1amsghnkc1KZorfk/I5y0cY7AFzFuodWXqAXZqtfu
 1Vue5FUDfV7ohuAgQ6ZFYLnKuCmrzjorNdFGJO6QCUg3ZGITWOgGP6E61VmOCuGKNUHR
 hrlj2JELo94ys/HhpC2IMbuCij1H03qICx6oGT/Soa+oPLeQbi/aGkQs4NTLUS4iG/65
 nPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OMazL3QO7MIVVURpVpy/B5PVB+2OjD7QIgU9RRNjerM=;
 b=xoyMDQDqYbigtLHkHlKO9bL3kyExPgGns661eVmBlKd2+3XObHHOPFilfuYWSgxJ4T
 YG5iZMJYgSqM5nsel2dnpxjm1APvf8y7dBouDZjc7oFCh+8i9TaaB0iTf+2M7sCUN0B8
 HfXjrQ/IAdcywpplUTcVv778icsDQLQvn3vgwC5yRobSOcNMFfPSvoUnndpdwZ+qbnyP
 o8V5Y3CbKB6Q8czuCzrVqVYw9uVt2ovhiehWwkCFbAKzm6d4Y0QRrk1nEvy2QjZ7zrV3
 VMbDaHYueFRSA93SZjjmU8YGhvAkPfEbdn37lByOSykBUrDdz5Z8NRq4AGMja9AHxpOJ
 xrbg==
X-Gm-Message-State: ANoB5pmYfX3VXMxM/DO/2JsBUDzozoDocfybRdZISMYzbLiHSEm7941r
 ONSJFcf7NCRyKkFXGuNnFeurp8UE4xiv4vH0yKw=
X-Google-Smtp-Source: AA0mqf4h6qHeta5lOdulwVEkyqJF5nhsK10u14+IIXql+97h8gkttVi3KhAW6BQOd4J2Zasi9l5KReymmM0jT8KxgGw=
X-Received: by 2002:a05:6512:931:b0:4b2:b06:884d with SMTP id
 f17-20020a056512093100b004b20b06884dmr6449751lft.210.1667898119307; Tue, 08
 Nov 2022 01:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20221108051120.6859-1-nyoro.martin@gmail.com>
 <ccdc710d-2816-502c-ff91-e3e166ad3856@linaro.org>
In-Reply-To: <ccdc710d-2816-502c-ff91-e3e166ad3856@linaro.org>
From: Martin Gachu <nyoro.gachu@gmail.com>
Date: Tue, 8 Nov 2022 12:01:43 +0300
Message-ID: <CAMrbA+YTDNzQ5_VuJ5wKqH5XnAS9DXneULx+2o3hR9cFoQsxCA@mail.gmail.com>
Subject: Re: [PATCH] LOCK GUARDS: replace manual lock()/unlock() calls to
 QEMU_LOCK_GUARD()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, samkergachu@gmail.com, 
 Samker <nyoro.martin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ec44d005ecf1caa4"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=nyoro.gachu@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000ec44d005ecf1caa4
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> This patch doesn't apply...

> $ git grep QEMU_LOCK_GUARD origin/master -- softmmu/physmem.c

> $

> On what is it based?

I initially replaced  lock()/unlock() calls in the softmmu/physmem.c with
the more preferred WITH_QEMU_LOCK_GUARD() call.

However Stefan pointed out that instead I should have used QEMU_LOCK_GUARD
when I don't want to use block scope.

--000000000000ec44d005ecf1caa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Philippe,</div><div class=3D"gmai=
l_quote"><div>=C2=A0</div><div><span style=3D"color:rgb(255,0,255)">&gt; Th=
is patch doesn&#39;t apply...</span></div><div><span style=3D"color:rgb(255=
,0,255)"><br></span></div><div><span style=3D"color:rgb(255,0,255)">&gt; $ =
git grep QEMU_LOCK_GUARD origin/master -- softmmu/physmem.c</span></div><di=
v><span style=3D"color:rgb(255,0,255)"><br></span></div><div><span style=3D=
"color:rgb(255,0,255)">&gt; $</span></div><div><span style=3D"color:rgb(255=
,0,255)"><br></span></div><div><span style=3D"color:rgb(255,0,255)">&gt; On=
 what is it based?</span></div><div><br></div><div>I initially replaced=C2=
=A0 lock()/unlock() calls in the softmmu/physmem.c with the more preferred =
WITH_QEMU_LOCK_GUARD() call.</div><div><br></div><div>However Stefan pointe=
d out that instead I should have used QEMU_LOCK_GUARD when I don&#39;t want=
 to use block scope.</div><div><br></div></div></div>

--000000000000ec44d005ecf1caa4--

