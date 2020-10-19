Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD7293219
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 01:44:13 +0200 (CEST)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUep2-0002ny-F7
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 19:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <63a6783a516398a55a8e91dd678d3926abb7e138@lizzy.crudebyte.com>)
 id 1kUejb-0006er-Hm
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 19:38:39 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:42205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <63a6783a516398a55a8e91dd678d3926abb7e138@lizzy.crudebyte.com>)
 id 1kUejW-0002Oh-Af
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 19:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=UFiJ1bqM/cyQkD+c+HPkIwvWkJJ21MLsOC4UKZsvx/I=; b=bVg98
 wH6Bh+4hTi3i6k3ZfUTNXXK1GrgRteiZDF0FxPCrhU2IJT960J2bydT5tMfFxQScCZIrU68RYxgUk
 bwZ7quwttpzksXarrY4eNGuOJm/TE6zDKKBSvh4z2ksq8Tu2+taOPhVk66zbha+xqdZbyIySonkoP
 WLSigTeSXy2Yl0YM6bJotLSi1cgSudH9ZXx2rBH2PgbciWJ9G+ZI4pnObVH/avfyKFIsORZAncAVg
 GyXsOAHhBEzbFGLYgnqBWjQaYcDBgpFElHheKW12qu9r9Wp7Jgk/y+Dfn0CK7TZsdG3bfuGDTngtu
 ++JEH/jzeeqTGURgX3siZPOCMoJyA==;
Message-Id: <cover.1603149434.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 01:17:14 +0200
Subject: [PATCH 0/8] 9pfs: more local tests
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=63a6783a516398a55a8e91dd678d3926abb7e138@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 19:37:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just a bunch of more test case using the 9pfs 'local' fs driver backend,
namely for these 9p requests:

* Tunlinkat, Tlcreate, Tsymlink and Tlink.

Christian Schoenebeck (8):
  tests/9pfs: simplify fs_mkdir()
  tests/9pfs: add local unlinkat directory test
  tests/9pfs: add local Tlcreate test
  tests/9pfs: add local unlinkat file test
  tests/9pfs: add local Tsymlink test
  tests/9pfs: add local unlinkat symlink test
  tests/9pfs: add local Tlink test
  tests/9pfs: add local unlinkat hard link test

 tests/qtest/virtio-9p-test.c | 395 ++++++++++++++++++++++++++++++++++-
 1 file changed, 390 insertions(+), 5 deletions(-)

-- 
2.20.1


