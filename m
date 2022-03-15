Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7004D98AC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:25:50 +0100 (CET)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4NB-0000gz-2O
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:25:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9@lizzy.crudebyte.com>)
 id 1nU4KC-0006Lp-Ta
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:22:44 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9@lizzy.crudebyte.com>)
 id 1nU4KA-0004EU-Uy
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=r/JnAloPKQ8t7DABjgg/vFlAY39w6ZtzK/gPs3HG2ZA=; b=iLdRV
 VYbpbTSJUy2+FReCReUYRo7BEOsNQJjkoPZoF3QFg0aexmZLycwmWWdnyWRkRtfmpDpH6GYCF/F+f
 /ksehilbWhKMRwiEg7kgHRBcn7LLsLUXmPGeEdT4lPggFs54ZZeyMHgwsrLFZyrscZXaE39igsi2K
 UeG3IPxAt+3xapQS0BudMBekKiBPJHslZ4mf8B1gKPbZI2fcIr28fwJQQAcdv2oYrNO7CeXK13cQK
 ki91M310aDM3D9IhkeOHE5sOJXRCk9Bt8M0OhIC8r7XG9x3s5CgMAb5GyTGAJY48d7M0kg5puN7pE
 J2MSgHwkkIMIT5ppIfrJG0JmlPn3Q==;
Message-Id: <cover.1647339025.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 15 Mar 2022 11:10:25 +0100
Subject: [PATCH v4 0/7] 9pfs: fix 'Twalk' protocol violation
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently the implementation of 'Twalk' does not behave exactly as specified
by the 9p2000 protocol specification. Actual fix is patch 5; see the
description of that patch for details of what this overall fix and series is
about.

PREREQUISITES
=============

This series requires the following additional patch to work correctly:
https://lore.kernel.org/qemu-devel/E1nTpyU-0000yR-9o@lizzy.crudebyte.com/

OVERVIEW OF PATCHES
===================

Patch 4 is a preparatory (pure) refactoring change to make actual 'Twalk' fix
patch 5 better readable.

All the other patches are just additional test cases for guarding 'Twalk'
behaviour.

v3 -> v4:

  * QID returned by Twalk request in fs_walk_2nd_nonexistent() test should NOT
    be identical to root node's QID. [patch 7]

  * Fix actual 'fid unaffected' check in fs_walk_2nd_nonexistent() test by
    sending a subsequent 'Tgetattr' request. [patch 7]

Christian Schoenebeck (7):
  tests/9pfs: walk to non-existent dir
  tests/9pfs: Twalk with nwname=0
  tests/9pfs: compare QIDs in fs_walk_none() test
  9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
  9pfs: fix 'Twalk' to only send error if no component walked
  tests/9pfs: guard recent 'Twalk' behaviour fix
  tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent

 hw/9pfs/9p.c                 |  57 ++++++----
 tests/qtest/virtio-9p-test.c | 201 ++++++++++++++++++++++++++++++++++-
 2 files changed, 231 insertions(+), 27 deletions(-)

-- 
2.30.2


