Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD874D6EC5
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 14:03:27 +0100 (CET)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT0an-000488-U9
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 07:11:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a06e4e9e80212440ed0d1fa4bd2c63d059ce620d@lizzy.crudebyte.com>)
 id 1nT0Xl-0001pQ-Pz
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:08:21 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:57093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a06e4e9e80212440ed0d1fa4bd2c63d059ce620d@lizzy.crudebyte.com>)
 id 1nT0Xk-0005CL-9B
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=p0bDz1w3Iso1OJZ9bCm99reQHk2ZIg+wO1yIN7L4AiU=; b=IGVYj
 2sgft7ton9bMEVUWoQ3cccE2NfMZPwQNLEnZ1VDhPjGpnX/kZgi/Yddwm/Mh4wERGMxcL9uJoUOBJ
 IR+QyLscwKRKohZOkL+N6IS3Q/nGEqh8kHA1DT4u+CrRznk2bU0kmGmmje8ZYTUNF+OKUS6SotBZR
 LVM9iD6ztBbV5XeQ6PRRJ/hPy0evZAXlGOslluql+DxS4ejmPSx6GvKJeVqcaL9WWOjo/uDtsUux8
 9VsPiZC1HnuKVmIE2bSuUiesf1B/+a96Tj9xhnhrKmxJSFOhEyFa+sUv+ViLCccfpABBficPJhc0N
 9ZsE3DnuLov8f1x1JDvTkn9GDyQ4g==;
Message-Id: <cover.1647083430.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 12 Mar 2022 12:10:30 +0100
Subject: [PATCH v2 0/7] 9pfs: fix 'Twalk' protocol violation
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a06e4e9e80212440ed0d1fa4bd2c63d059ce620d@lizzy.crudebyte.com;
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

Patch 4 is a preparatory (pure) refactoring change to make patch 5 better
readable.

All the other patches are just additional test cases for guarding 'Twalk'
behaviour.

v1 -> v2:

  * Use Tgetattr instead of Tstat. [patch 3]

  * Add is_same_qid() function. [patch 3]

  * No need to stat root fid. [patch 3]

  * Adjust commit log: 'retrieved/walked' -> 'walked'. [patch 4]

  * Rename variable 'nvalid' -> 'nwalked'. [patch 4]

  * Fix typo in commit log 'unaffected'. [patch 5]

  * Compare 'any_err < 0' like previously done for 'err'. [patch 5]

  * Fix English wording 'says' in commit log. [patch 6]

  * Ensure fid unaffected in fs_walk_2nd_nonexistent(). [NEW patch 7]

Christian Schoenebeck (7):
  tests/9pfs: walk to non-existent dir
  tests/9pfs: Twalk with nwname=0
  tests/9pfs: compare QIDs in fs_walk_none() test
  9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
  9pfs: fix 'Twalk' to only send error if no component walked
  tests/9pfs: guard recent 'Twalk' behaviour fix
  tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent

 hw/9pfs/9p.c                 |  43 +++++---
 tests/qtest/virtio-9p-test.c | 191 ++++++++++++++++++++++++++++++++++-
 2 files changed, 215 insertions(+), 19 deletions(-)

-- 
2.30.2


