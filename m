Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D3854DFDD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:17:23 +0200 (CEST)
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nV4-0006kd-Ig
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1o1n7d-0003Xq-T3
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:53:13 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:57969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1o1n7b-0000KC-Ut
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=/iaiEl+cDNhb71BJRlQOPOtKQ6bjW2TgTVOUp5YP6o8=; b=O5YFpYbg4pRH610pu6y1I5VMfd
 ml5iY/leaWhZ70o52O4nP0Ghq72OWfjJJDW4J2rEdk7zVYtCsLfNWj0E2cyr7Q7+q2OpQ1jlY/OaU
 GoM8d3VEqZ60dMqpbAKyBcCB9652jC4jlU/WCQhFGFTwXMycEot6+hy4iaX2/YNpRSPQwIbJVT9Rz
 EvxEUnswqhhftUmOHQxGA1clNEF1eOsa/NUvfoRrMAuWKAD+PGPkwBPUKefvOZhOIrXFWAnp5ZK+l
 6/KFfVZf9seU3NdKdmdpN7UNjfz0sgiyPw8THGDCigJYq4nddaq1b784ogeUow4cWJ3bfvdi0iyXp
 plCRD49UAGjuMsHzi77IHMARNeOMZFmmtEK3k+y53jdK5T4THqUdMcwNAPRv9Rkt9H+xdHsXLWgoh
 CHDZku346gGJ75qVzWoBrKKCt6zsdBiLrNsycPfFwn+45dAe6aaj+CyKtPuYt5rRr8Pa8CERAYh4n
 EiQlumbiBciQfSHAdTnY5lFO0JNQcMK7Ca/TdopnP5Jnte69RxUh8dR7ZMfyzxq+dMa6ly/D2gTKG
 chqfEzB09wVu+TILERp2p2TB5dc/+ksjbPghwbDBHvWtheXNyIuNniSUK0wHfhzfxQDcuikTml/d3
 cPtTcwl8mGXk7Adq/H/v9234VyxKoroqBy2ofCR0A=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 0/7] 9pfs: fix 'Twalk' protocol violation
Date: Thu, 16 Jun 2022 12:53:05 +0200
Message-ID: <3101449.ubMNDF7p0F@silver>
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

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Good time to send a PR for this.

Thanks!

Best regards,
Christian Schoenebeck



