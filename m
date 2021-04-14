Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD5635F1B8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:52:34 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWd8L-0000AW-Ra
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWd51-0006o0-8q
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lWd4z-00085N-Bj
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618397344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GdbQ9OqW/5tFe01Vc2vUzlBl29xlYmm13pUFtsgd5+w=;
 b=cB/+HHi7hf27Mhs+ZRVylddgeLb6QzsvLqCFTxBVcQCQE2EGyuC07Y67Ve5Ih8bzkt2eBE
 6+4z8B/3QzCs1IQIyCwdcAf16ygyNVBMnzBMV7yA+V5nL+cWR3JD77PqO0PkvOkjDaO/sY
 FWE5O2IwIMe4fyFmwwqItUPOzrtD7WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-cSoPcxWuPdShf7zPPtscjQ-1; Wed, 14 Apr 2021 06:49:02 -0400
X-MC-Unique: cSoPcxWuPdShf7zPPtscjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F001107ACC7;
 Wed, 14 Apr 2021 10:49:01 +0000 (UTC)
Received: from gondolin (ovpn-113-114.ams2.redhat.com [10.36.113.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 660D110027C4;
 Wed, 14 Apr 2021 10:48:56 +0000 (UTC)
Date: Wed, 14 Apr 2021 12:48:53 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v2] target/s390x: Fix translation exception on illegal
 instruction
Message-ID: <20210414124853.7562f987.cohuck@redhat.com>
In-Reply-To: <20210414123936.05f9759a.cohuck@redhat.com>
References: <20210413165257.21426-1-iii@linux.ibm.com>
 <20210414103813.2595508b.cohuck@redhat.com>
 <9ffa39db0e16efa173119d3b9746bb312e214d87.camel@linux.ibm.com>
 <710e154736b7e118ae12587a468a8c198cab028c.camel@linux.ibm.com>
 <20210414123936.05f9759a.cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Wed, 14 Apr 2021 12:39:36 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 14 Apr 2021 12:27:03 +0200
> Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>=20
> > On Wed, 2021-04-14 at 11:19 +0200, Ilya Leoshkevich wrote: =20
> > > On Wed, 2021-04-14 at 10:38 +0200, Cornelia Huck wrote:   =20
> > > > On Tue, 13 Apr 2021 18:52:57 +0200
> > > > Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> > > >    =20
> > > > > Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> > > > > happens is:
> > > > >=20
> > > > > * uretprobe maps a userspace page containing an invalid
> > > > > instruction.
> > > > > * uretprobe replaces the target function's return address with th=
e
> > > > > =C2=A0 address of that page.
> > > > > * When tb_gen_code() is called on that page, tb->size ends up bei=
ng
> > > > > 0
> > > > > =C2=A0 (because the page starts with the invalid instruction), wh=
ich
> > > > > causes
> > > > > =C2=A0 virt_page2 to point to the previous page.
> > > > > * The previous page is not mapped, so this causes a spurious
> > > > > =C2=A0 translation exception.
> > > > >=20
> > > > > The bug is that tb->size must never be 0: even if there is an
> > > > > illegal
> > > > > instruction, the instruction bytes that have been looked at must
> > > > > count
> > > > > towards tb->size. So adjust s390x's translate_one() to act this w=
ay
> > > > > for both illegal instructions and instructions that are known to
> > > > > generate exceptions.
> > > > >=20
> > > > > Also add an assertion to tb_gen_code() in order to detect such
> > > > > situations in future.
> > > > >=20
> > > > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > > > ---
> > > > >=20
> > > > > v1:=20
> > > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037=
.html
> > > > > v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size
> > > > > =3D=3D 0
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in tb_gen_=
code().
> > > > >=20
> > > > > =C2=A0accel/tcg/translate-all.c |=C2=A0 1 +
> > > > > =C2=A0target/s390x/translate.c=C2=A0 | 16 +++++++++++-----
> > > > > =C2=A02 files changed, 12 insertions(+), 5 deletions(-)   =20
> > > >=20
> > > > I assume this bug is not usually hit during normal usage, right? It=
's
> > > > probably not release critical, so I'll line it up for 6.1 instead. =
  =20
> > >=20
> > > Yes, I saw it only with uprobes, and then it leads only to a process
> > > crash, not to a kernel crash. Thanks!   =20
> >=20
> > Seems like the new assertion triggers on ARM:
> >=20
> > https://gitlab.com/cohuck/qemu/-/jobs/1178409450 =20
>=20
> Yep, I just wanted to make sure it was this patch before complaining :)
>=20
> >=20
> > What are the rules in s390x-next-staging, can we amend the patch, or
> > only commit a follow-up?  =20
>=20
> -staging is before I merge properly, so no problem folding something in.
>=20
> > In either case, I think we'll need something
> > like this (untested):
> >=20
> > --- a/target/arm/translate.c
> > +++ b/target/arm/translate.c
> > @@ -9060,6 +9060,7 @@ static void
> > arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> >      unsigned int insn;
> > =20
> >      if (arm_pre_translate_insn(dc)) {
> > +        dc->base.pc_next +=3D 4;
> >          return;
> >      }
> >=20
> >=20
> > I'm currently trying to debug this in more detail and test the fix.
> >  =20
>=20

I'm also seeing a problem on xtensa
(https://gitlab.com/cohuck/qemu/-/jobs/1178409540), but not sure if it
is related to this patch, or more general flakiness.


