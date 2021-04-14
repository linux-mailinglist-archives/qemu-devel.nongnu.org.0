Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22835F197
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:41:39 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcxm-0001Tj-PI
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWcw6-0000Zx-5X
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWcw3-0002iX-6y
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618396790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRbKEwBBzZ54ewNUKDgX5oMV/h7K2yEn6WAmSxVoFwg=;
 b=O5tayKft2BM5P+qKmAZbbgqppdBMnpR8zqpHUDrR6C2u978ECY/aOiy0SVqKniKSAUj/7m
 iZX0rub5lbZsUBBxrmYXLc6UX4cQrndh0n6CZbx6pUAHSM9ykGLzEloq1g1PUhJ7OxRoB0
 ig1inlmZG0jgvX0txcQg4MI3IhMP3gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-hvLUPgUvPRuyoqw-PYhp7Q-1; Wed, 14 Apr 2021 06:39:48 -0400
X-MC-Unique: hvLUPgUvPRuyoqw-PYhp7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2DD9107ACC7;
 Wed, 14 Apr 2021 10:39:46 +0000 (UTC)
Received: from gondolin (ovpn-113-114.ams2.redhat.com [10.36.113.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCE65D9CC;
 Wed, 14 Apr 2021 10:39:38 +0000 (UTC)
Date: Wed, 14 Apr 2021 12:39:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v2] target/s390x: Fix translation exception on illegal
 instruction
Message-ID: <20210414123936.05f9759a.cohuck@redhat.com>
In-Reply-To: <710e154736b7e118ae12587a468a8c198cab028c.camel@linux.ibm.com>
References: <20210413165257.21426-1-iii@linux.ibm.com>
 <20210414103813.2595508b.cohuck@redhat.com>
 <9ffa39db0e16efa173119d3b9746bb312e214d87.camel@linux.ibm.com>
 <710e154736b7e118ae12587a468a8c198cab028c.camel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 12:27:03 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> On Wed, 2021-04-14 at 11:19 +0200, Ilya Leoshkevich wrote:
> > On Wed, 2021-04-14 at 10:38 +0200, Cornelia Huck wrote: =20
> > > On Tue, 13 Apr 2021 18:52:57 +0200
> > > Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> > >  =20
> > > > Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> > > > happens is:
> > > >=20
> > > > * uretprobe maps a userspace page containing an invalid
> > > > instruction.
> > > > * uretprobe replaces the target function's return address with the
> > > > =C2=A0 address of that page.
> > > > * When tb_gen_code() is called on that page, tb->size ends up being
> > > > 0
> > > > =C2=A0 (because the page starts with the invalid instruction), whic=
h
> > > > causes
> > > > =C2=A0 virt_page2 to point to the previous page.
> > > > * The previous page is not mapped, so this causes a spurious
> > > > =C2=A0 translation exception.
> > > >=20
> > > > The bug is that tb->size must never be 0: even if there is an
> > > > illegal
> > > > instruction, the instruction bytes that have been looked at must
> > > > count
> > > > towards tb->size. So adjust s390x's translate_one() to act this way
> > > > for both illegal instructions and instructions that are known to
> > > > generate exceptions.
> > > >=20
> > > > Also add an assertion to tb_gen_code() in order to detect such
> > > > situations in future.
> > > >=20
> > > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > > ---
> > > >=20
> > > > v1:=20
> > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.h=
tml
> > > > v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size
> > > > =3D=3D 0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in tb_gen_co=
de().
> > > >=20
> > > > =C2=A0accel/tcg/translate-all.c |=C2=A0 1 +
> > > > =C2=A0target/s390x/translate.c=C2=A0 | 16 +++++++++++-----
> > > > =C2=A02 files changed, 12 insertions(+), 5 deletions(-) =20
> > >=20
> > > I assume this bug is not usually hit during normal usage, right? It's
> > > probably not release critical, so I'll line it up for 6.1 instead. =
=20
> >=20
> > Yes, I saw it only with uprobes, and then it leads only to a process
> > crash, not to a kernel crash. Thanks! =20
>=20
> Seems like the new assertion triggers on ARM:
>=20
> https://gitlab.com/cohuck/qemu/-/jobs/1178409450

Yep, I just wanted to make sure it was this patch before complaining :)

>=20
> What are the rules in s390x-next-staging, can we amend the patch, or
> only commit a follow-up?=20

-staging is before I merge properly, so no problem folding something in.

> In either case, I think we'll need something
> like this (untested):
>=20
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9060,6 +9060,7 @@ static void
> arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      unsigned int insn;
> =20
>      if (arm_pre_translate_insn(dc)) {
> +        dc->base.pc_next +=3D 4;
>          return;
>      }
>=20
>=20
> I'm currently trying to debug this in more detail and test the fix.
>=20


