Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2EE60A2E5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:49:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvLE-0007xg-C8; Mon, 24 Oct 2022 07:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3ce77865bf813f313cf79c00fd951bfc95a50165@lizzy.crudebyte.com>)
 id 1omvLC-0007w8-46
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:09:58 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3ce77865bf813f313cf79c00fd951bfc95a50165@lizzy.crudebyte.com>)
 id 1omvLA-0006YD-3Q
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=nzkJQ+eM1RXAfsgG/vaAFq1MElp1WMFQthcmTldfz3c=; b=E/dGF
 HCfDpUJJCpsLslVQOX78EcBUY8obbFIbRPQH3IpvkqNj6wk4MZxl3nKBLWph6fuvNt7XtdFWhszWC
 THOjOPe1glFnnc0ZEhl/IOPvc9her+f9eaGMtYjxB4+A4QGlk4Mi8w9pKZ7vRccO5oBrltl55yNLc
 Rq7Q9qh8uOrDh9GiL/tjznNuDAALf/th4Kb4mX0gf1GGqFn1KdsdHQzK1rsalPZUN043FIV99AnIy
 hL891LvVZ/NsQQ+WhAXS7Ge9MPa7nXliA9ftoIIWyXmpEqtWX2Ifdt5yg8dzRiiJx7a6Y9PQvZFmQ
 IlXmSRexxmZALEkxQ8LXYpSnHMR4w==;
Message-Id: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 00/23] 9p queue 2022-10-24
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Linus Heckemann <git@sphalerite.org>,
 Bin Meng <bin.meng@windriver.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=3ce77865bf813f313cf79c00fd951bfc95a50165@lizzy.crudebyte.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024

for you to fetch changes up to 3ce77865bf813f313cf79c00fd951bfc95a50165:

  tests/9p: remove unnecessary g_strdup() calls (2022-10-24 12:24:32 +0200)

----------------------------------------------------------------
9pfs: performance, Windows host prep, tests restructure

* Highlight of this PR is Linus Heckemann's GHashTable patch which
  brings massive general performance improvements of 9p server
  somewhere between factor 6 .. 12.

* Bin Meng's g_mkdir patch is a preparatory patch for upcoming
  Windows host support of 9p server.

* The rest of the patches in this PR are 9p test code restructuring
  and refactoring changes to improve readability and to ease
  maintenance of 9p test code on the long-term.

----------------------------------------------------------------
Bin Meng (1):
      fsdev/virtfs-proxy-helper: Use g_mkdir()

Christian Schoenebeck (21):
      tests/9p: split virtio-9p-test.c into tests and 9p client part
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

Linus Heckemann (1):
      9pfs: use GHashTable for fid table

 fsdev/virtfs-proxy-helper.c           |    3 +-
 hw/9pfs/9p.c                          |  196 ++---
 hw/9pfs/9p.h                          |    2 +-
 tests/qtest/libqos/meson.build        |    1 +
 tests/qtest/libqos/virtio-9p-client.c | 1049 ++++++++++++++++++++++++++
 tests/qtest/libqos/virtio-9p-client.h |  494 +++++++++++++
 tests/qtest/virtio-9p-test.c          | 1299 ++++++---------------------------
 7 files changed, 1867 insertions(+), 1177 deletions(-)
 create mode 100644 tests/qtest/libqos/virtio-9p-client.c
 create mode 100644 tests/qtest/libqos/virtio-9p-client.h

