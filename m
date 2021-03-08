Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB5331187
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:00:21 +0100 (CET)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHMq-00007G-HW
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJHKy-0007Tn-RJ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:58:25 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:54209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJHKw-0005iQ-4W
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=EVW6muVku5uclCjg+uAVBxqvFZOPEleIob7Pt8Y9c44=; b=qoq9geFfCxko80HE75pomwSioz
 3xBl1u/epr2L3dLz//rUeoCctcU2GS5e753AlBZvX9MgKQXeztsuIoqOp0hi0V0Zq8hvWTLQ7CsfP
 lQCm56ROdGLZVCFqAL4AXl1+XdjOxLQYoeXTFsJOe2Fmu2iFjT+628sASvfcD3R50CxXfAhePB/ou
 +3hHOs0kIXQ/+r+lVb/LsT+Hz+TM0b6OBbLL/+wFZCEO3yAUWT81sui/7jhxMKI/qN+uAmXyW5v6+
 0VWNZ5qLjSGvn7LkzBvfr4OWwKZaJimwKiT5pg94glOIjWaLEy9sNYgVp+no/xPUKndytpKIOkYCm
 y1ei0YCiU4o+xlMVJkHIg3KnjlAkCiaPZYj7kTh3AdfxKhWTe6sXCYxfjzIl7PV6GhAt9OYCyh7od
 U/p1X5ppERZOXDt55oewsaL9C/BnRGZxkFgt8qtFFNnRi/l4Aop0CnTOHoQUbQFnDR4knbt3WqDLG
 aAxvFkDcgfGTGxPPhjB0REmF1jX9h6Fspf2jNDGn6Ay040UCbS1S9DWYOIoqYw9o5Wu1zJRT0iJWT
 piCFMLrK29FoxWaXwjH2cPpWpip6e1DvGPKpgu7h2hil46Y/lyM7EiNdnpeefqIF6XiX35HLs90bY
 siAzoUuR0E3oRmb1ppKTGXeAs5jGcH5Obu7yhGS8k=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
Date: Mon, 08 Mar 2021 15:57:56 +0100
Message-ID: <2232725.kIh4fn7MiB@silver>
In-Reply-To: <2f4c50c9-930f-b820-b507-d9e43da20093@redhat.com>
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
 <CAMVc7JVK0FuBuyVvH3ai7V2HxQeiy8dMPHDYB-c7w7ARQL7nMw@mail.gmail.com>
 <2f4c50c9-930f-b820-b507-d9e43da20093@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

On Montag, 8. M=C3=A4rz 2021 15:30:23 CET Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/8/21 3:17 PM, Akihiko Odaki wrote:
> > 2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 23:03 Christian Schoenebec=
k <qemu_oss@crudebyte.com>:
> >> BTW, there is __nonnull supported by clang, e.g.:
> >>=20
> >> static void foo(void *__nonnull p) {
> >>=20
> >>         ...
> >>=20
> >> }
> >>=20
> >> Maybe as an optionally defined macro (if supported by compiler) this
> >> could be a useful tool for such intended nonnull designs, as it
> >> immediately emits compiler errors.
> >>=20
> >> Best regards,
> >> Christian Schoenebeck
> >=20
> > GCC has nonnull attribute and clang accepts it too. However, it
> > specifies argument indices, which is harder to understand and to
> > maintain.
> > __attribute__((nonnull(2)))
> > void f(void *k, void *l);
>=20
> Richard once suggested to add QEMU_NONNULL(), I have been using
> it on a series trying to enforce non-null uses of QOM
> 'struct Object *owner' but it didn't work out because migrations
> of MemoryRegion, some have NULL owner in MachineState.
>=20
> I also discarded it because Daniel said it could have side-effects
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720739.html

Yes, but the optimizer part could be disabled with
=2Dfno-delete-null-pointer-checks which would render it a pure diagnostic
feature:

https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-no=
nnull-function-attribute

Is there an example where the compiler failed to detect a NULL user case?

Best regards,
Christian Schoenebeck



