Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F74EAB32
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:26:50 +0200 (CEST)
Received: from localhost ([::1]:49260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ93p-0008FS-UO
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:26:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZ8yV-0005EO-Qf
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:21:21 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:58829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZ8yU-0007Fx-44
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=m8vk4wsLY7uOVEgFg0Bs6u4lYmZdrM2ZXH9X04ZnO1o=; b=lhJhJefkLbsqJFUOTqrVhJo6Gs
 PcmNUPBb8o9cPiT+EuXxmdlRaws7Y94jrIg4NR3fWgOS86Ls+eS/TreWDYqJSx3Qo9fYqH+nnHWN7
 KhnBQ71CkTAQvjwqiu8n4UOYknSCvC9cvYYWt6u52nQN2Kcsj7sc5oKaAjru2q2J/1tFzEF2Arnrr
 68WYoL/IWxzsutN6gU99Zju+qKjbtrutdY6uqL+dmpYeFWruUeENDy9ie+PYmjzQkHV/6IwUwhCBg
 bGcZA1T5lVSyqX7d6tBd/a5MzVmpMddvo/X3oXZXNamCvJVyGy2Rg66mu8F8/nHR5U/y5gg8HKBUl
 SNcuFnyfQ0QuC4u/cmmSqlidgH1Wx9SK2w058THWoRLeKHd0XP0Hff6TVz0YSKg63Pn+6ttnm9L5j
 FttcL+M3qYvH62ZKuGjZorESKj5hhia+bicjASwZwXLNgcGVEO1iFKeezxpSR6/hRrs0VREja6gF9
 l6qbMLc/f8EJP7RmyEQxHKCgmBSygiQfEBk8YinZ6iR8/F7YEHJHhAUhDN4UCMqjFBcB24+DrzqZk
 c+URB/c4QyZ+x0xy40RS50Du7U6qCq37ipAUqEejTt/qm10TgJaeX3mFPQB1bwOQaq73G1HbrqhgH
 jLNvfJLfZH8oa8mOCDdGn7EEc/kB+TRZBVlm6IEe8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 0/7] 9pfs: fix 'Twalk' protocol violation
Date: Tue, 29 Mar 2022 12:21:13 +0200
Message-ID: <2664983.LghzH4s2Bn@silver>
In-Reply-To: <cover.1647339025.git.qemu_oss@crudebyte.com>
References: <cover.1647339025.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 15. M=E4rz 2022 11:10:25 CEST Christian Schoenebeck wrote:
> Currently the implementation of 'Twalk' does not behave exactly as specif=
ied
> by the 9p2000 protocol specification. Actual fix is patch 5; see the
> description of that patch for details of what this overall fix and series
> is about.
>=20
> PREREQUISITES
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This series requires the following additional patch to work correctly:
> https://lore.kernel.org/qemu-devel/E1nTpyU-0000yR-9o@lizzy.crudebyte.com/
>=20
> OVERVIEW OF PATCHES
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Patch 4 is a preparatory (pure) refactoring change to make actual 'Twalk'
> fix patch 5 better readable.
>=20
> All the other patches are just additional test cases for guarding 'Twalk'
> behaviour.
>=20
> v3 -> v4:
>=20
>   * QID returned by Twalk request in fs_walk_2nd_nonexistent() test should
> NOT be identical to root node's QID. [patch 7]
>=20
>   * Fix actual 'fid unaffected' check in fs_walk_2nd_nonexistent() test by
>     sending a subsequent 'Tgetattr' request. [patch 7]
>=20
> Christian Schoenebeck (7):
>   tests/9pfs: walk to non-existent dir
>   tests/9pfs: Twalk with nwname=3D0
>   tests/9pfs: compare QIDs in fs_walk_none() test
>   9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
>   9pfs: fix 'Twalk' to only send error if no component walked
>   tests/9pfs: guard recent 'Twalk' behaviour fix
>   tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent
>=20
>  hw/9pfs/9p.c                 |  57 ++++++----
>  tests/qtest/virtio-9p-test.c | 201 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 231 insertions(+), 27 deletions(-)

ping

No hurry, as this is something for the subsequent QEMU release cycle, but=20
would be good to know whether you will be able to look at this at all.

Best regards,
Christian Schoenebeck



