Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EC6362E4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrMg-00016R-1F; Wed, 23 Nov 2022 10:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxrMa-00015c-H8
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxrMY-0002er-9m
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669216113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkA1tpezQ3RBV1lmwbL+L21FqhoK+ghKtk7igoeTwjI=;
 b=UgjwgTMurECqSyIAm3hJvAX+jdXqiwxYUlHvzGuv1DDApR14F+HdkPlmisIRwzpNcLd1d/
 W37cLwjPgSWHCHoCD3nsGlUTjKLg0mWemHYDC5Ebv4pM1iDQEpoeT4VnnbfeQOVX5858JE
 aV5j7OQgb62T30ZNDiq8Fw5OdUwjEBo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317--emDJ8NKO5mACCxgDTyJWA-1; Wed, 23 Nov 2022 10:08:29 -0500
X-MC-Unique: -emDJ8NKO5mACCxgDTyJWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E63E833AEF;
 Wed, 23 Nov 2022 15:08:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8E840C6F75;
 Wed, 23 Nov 2022 15:08:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5E2B21E6921; Wed, 23 Nov 2022 16:08:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org,  Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] Drop more useless casts from void * to pointer
References: <20221123133811.1398562-1-armbru@redhat.com>
 <alpine.LMD.2.03.2211231441480.26886@eik.bme.hu>
 <Y34on7NQk44e07cM@redhat.com>
Date: Wed, 23 Nov 2022 16:08:24 +0100
In-Reply-To: <Y34on7NQk44e07cM@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 23 Nov 2022 14:05:19 +0000")
Message-ID: <871qpt674n.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Nov 23, 2022 at 02:51:49PM +0100, BALATON Zoltan wrote:
>> On Wed, 23 Nov 2022, Markus Armbruster wrote:
>> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> > Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> > ---
>> > v2:
>> > * PATCH 1+2 merged as commit 0a553c12c7 and 3f7febc937
>> > * PATCH 3 change to util/coroutine-ucontext.c dropped [Laurent]
>> >=20
>> > bsd-user/elfload.c                      | 2 +-
>> > contrib/plugins/cache.c                 | 8 ++++----
>> > contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
>> > hw/core/qdev-clock.c                    | 2 +-
>> > hw/hyperv/vmbus.c                       | 2 +-
>> > hw/net/cadence_gem.c                    | 2 +-
>> > hw/net/virtio-net.c                     | 2 +-
>> > hw/nvme/ctrl.c                          | 4 ++--
>> > hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
>> > hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
>> > hw/virtio/virtio-iommu.c                | 3 +--
>> > linux-user/syscall.c                    | 2 +-
>> > target/i386/hax/hax-all.c               | 2 +-
>> > tests/tcg/aarch64/system/semiheap.c     | 4 ++--
>> > util/vfio-helpers.c                     | 2 +-
>> > 15 files changed, 24 insertions(+), 28 deletions(-)
>> >=20
>> > diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>> > index f8edb22f2a..fbcdc94b96 100644
>> > --- a/bsd-user/elfload.c
>> > +++ b/bsd-user/elfload.c
>> > @@ -156,7 +156,7 @@ static abi_ulong copy_elf_strings(int argc, char *=
*argv, void **page,
>> >             --p; --tmp; --len;
>> >             if (--offset < 0) {
>> >                 offset =3D p % TARGET_PAGE_SIZE;
>> > -                pag =3D (char *)page[p / TARGET_PAGE_SIZE];
>> > +                pag =3D page[p / TARGET_PAGE_SIZE];
>>=20
>> I think arithmetic on void pointer was undefined at least in the past so
>> some compilers may warn for it but not sure if this is still the case for
>> the compilers we care about. Apparently not if this now compiles but that
>> explains why this cast was not useless.

I don't think so :)

@pag is char *.

@page is void **.

page[p / TARGET_PAGE_SIZE] is void *.  No need to cast to char * before
assigning to @pag.

No pointer arithmetic so far.  There's some further down: pag + offset.
@pag is char * before and after my patch.

>>                                         Found some more info on this her=
e:
>>=20
>> https://stackoverflow.com/questions/3523145/pointer-arithmetic-for-void-=
pointer-in-c
>
> QEMU explicitly only targets GCC + Clang, so portability to other
> compilers is not required.

Correct.  We do arithmentic with void * in many places already.

If we cared for portability to other compilers, we'd enable

'-Wpointer-arith'
     Warn about anything that depends on the "size of" a function type
     or of 'void'.  GNU C assigns these types a size of 1, for
     convenience in calculations with 'void *' pointers and pointers to
     functions.  In C++, warn also when an arithmetic operation involves
     'NULL'.  This warning is also enabled by '-Wpedantic'.

But we don't.


