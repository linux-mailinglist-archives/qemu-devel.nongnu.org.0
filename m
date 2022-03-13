Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5FB4D7414
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 10:49:05 +0100 (CET)
Received: from localhost ([::1]:49476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTKqV-0000yG-JO
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 05:49:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c553fe1cfcfef7560240a40638b5ebc40a992863@lizzy.crudebyte.com>)
 id 1nTKmf-0006zj-Jw
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 05:45:05 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c553fe1cfcfef7560240a40638b5ebc40a992863@lizzy.crudebyte.com>)
 id 1nTKmd-0004ep-Tp
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 05:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=R+Ym3H72vLgfmxhPbr+56C5SscupW+6O2Epxsim+3dY=; b=a6Dx9
 P7KVX9ei2Wg84YfyXAcZdVv+sR05aSMFWOqQLFRkrJEdTobwxoaSPr9VOvFgU+XocvllXXZH/EyvQ
 HT02spmijL8SyvCuJNSIajtOIIw/x3mZkuE13onA1uPcDqXXNtV8p3R7p5MdC59z5e8G4DvEKOVu4
 cXtA3ID4FjdxRHpmhDyKIvmd4XvL84nCaPuS/mrCdpUHMwtn1Rz/UsKGoO2OybikNK4wL9CR8EL1T
 vWM63IGF6vICfyetwUOVcupKIio/TJMSNfvTcUgkCyNdkX/l669qNlhPAz8FVbN2fLc8/az9DnIDN
 +DRxvu9MrgmhuzOigfIk3vwHRtAeA==;
Message-Id: <cover.1647163863.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 13 Mar 2022 10:31:03 +0100
Subject: [PATCH v3 0/7] 9pfs: fix 'Twalk' protocol violation
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c553fe1cfcfef7560240a40638b5ebc40a992863@lizzy.crudebyte.com;
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

v2 -> v3:

  * Use 'any_err |= err = ...' at all occurrences to make v9fs_walk() function
    less error prone, which also reduces lines of code. [patch 5]

Christian Schoenebeck (7):
  tests/9pfs: walk to non-existent dir
  tests/9pfs: Twalk with nwname=0
  tests/9pfs: compare QIDs in fs_walk_none() test
  9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
  9pfs: fix 'Twalk' to only send error if no component walked
  tests/9pfs: guard recent 'Twalk' behaviour fix
  tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent

 hw/9pfs/9p.c                 |  57 ++++++-----
 tests/qtest/virtio-9p-test.c | 191 ++++++++++++++++++++++++++++++++++-
 2 files changed, 221 insertions(+), 27 deletions(-)

-- 
2.30.2


