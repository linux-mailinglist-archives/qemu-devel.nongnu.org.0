Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080ED5F4AD9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:24:21 +0200 (CEST)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpOg-0003jH-DM
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0f80141cde3904ed0591354059da49d1d60bcdbc@lizzy.crudebyte.com>)
 id 1ofpKs-0006D0-8l
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:18 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:54263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0f80141cde3904ed0591354059da49d1d60bcdbc@lizzy.crudebyte.com>)
 id 1ofpKn-0002Hi-JB
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=fVKeFPjfDnv1jjDVv1SWj2m4wSmf1yNLPYcUjLKYRXM=; b=R/uYk
 k+g6Hd/NtH2w/ZFHSNMuQT1jl1/ybMacq1iU4f3oRqnnyHSAanQad4PoHOFjcKovfvWAxQuJGG2UX
 2IwGLMdzv5UoqfgdVaXMgVjkp/vldgKCpnssFspIT1G6y7m52Ci2lKoQHoi0BnTsdyfhCMfa9dnG1
 JMAGuFSVDuNHkCsN7+Vqv2+9FAAOdaZbTqdkk4FDWHGplDVxiKh0crojY4BEVJEDjQqGUOrYtV2Bb
 W5yxOGgV4dacqG7UAvoAY2R9enwBo0Jfx7vlE8coOPvm4LymRkguf7pjBWrXPbsamoOmgL+42vlC5
 051INulPWN5iskXBPr1URXr+q5Qwg==;
Message-Id: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:56:44 +0200
Subject: [PATCH 00/20] tests/9p: introduce declarative function calls
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0f80141cde3904ed0591354059da49d1d60bcdbc@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This series converts relevant 9p (test) client functions to use named
function arguments. For instance

    do_walk_expect_error(v9p, "non-existent", ENOENT);

becomes

    twalk({
        .client = v9p, .path = "non-existent", .expectErr = ENOENT
    });

The intention is to make the actual 9p test code more readable, and easier
to maintain on the long-term.

Not only makes it clear what a literal passed to a function is supposed to
do, it also makes the order and selection of arguments very liberal, and
allows to merge multiple, similar functions into one single function.

This is basically just refactoring, it does not change behaviour.

PREREQUISITES
=============

This series requires the following additional patch to work correctly:

https://lore.kernel.org/all/E1odrya-0004Fv-97@lizzy.crudebyte.com/
https://github.com/cschoenebeck/qemu/commit/23d01367fc7a4f27be323ed6d195c527bec9ede1

Christian Schoenebeck (20):
  tests/9p: merge *walk*() functions
  tests/9p: simplify callers of twalk()
  tests/9p: merge v9fs_tversion() and do_version()
  tests/9p: merge v9fs_tattach(), do_attach(), do_attach_rqid()
  tests/9p: simplify callers of tattach()
  tests/9p: convert v9fs_tgetattr() to declarative arguments
  tests/9p: simplify callers of tgetattr()
  tests/9p: convert v9fs_treaddir() to declarative arguments
  tests/9p: simplify callers of treaddir()
  tests/9p: convert v9fs_tlopen() to declarative arguments
  tests/9p: simplify callers of tlopen()
  tests/9p: convert v9fs_twrite() to declarative arguments
  tests/9p: simplify callers of twrite()
  tests/9p: convert v9fs_tflush() to declarative arguments
  tests/9p: merge v9fs_tmkdir() and do_mkdir()
  tests/9p: merge v9fs_tlcreate() and do_lcreate()
  tests/9p: merge v9fs_tsymlink() and do_symlink()
  tests/9p: merge v9fs_tlink() and do_hardlink()
  tests/9p: merge v9fs_tunlinkat() and do_unlinkat()
  tests/9p: remove unnecessary g_strdup() calls

 tests/qtest/libqos/virtio-9p-client.c | 569 +++++++++++++++++++++-----
 tests/qtest/libqos/virtio-9p-client.h | 408 ++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 529 ++++++++----------------
 3 files changed, 1031 insertions(+), 475 deletions(-)

-- 
2.30.2


