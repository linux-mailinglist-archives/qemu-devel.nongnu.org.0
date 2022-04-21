Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6550A528
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:22:36 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZZi-0003Vn-DG
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe@lizzy.crudebyte.com>)
 id 1nhYkc-0005MN-1R; Thu, 21 Apr 2022 11:29:46 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:52947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe@lizzy.crudebyte.com>)
 id 1nhYka-000857-4Q; Thu, 21 Apr 2022 11:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=YjdjHZYBBg93emNi0Z195MbWd94ZF7c6UApAPULXc1I=; b=pQLPf
 GGPB0fh7ZH5J1N3VJagbj85oB8rly+kB/9R5EErkhKf1BXgDg6o0G05+lZRurvOUw+TsuoOalyaqh
 KL+a6PzLBIGLhOTjpRzVbj8jrEoE8jW4WWan4aSCGvEnvWK0euAaEJr23alv/zUv4uBIEN3nhJye4
 wyHQ3VdO65CaPHKYTtjcCGjCfSrFV7pfpZpENiMS8oR1BE1OEa8kOeIayF2svoqg7+9tpBBueQuxQ
 O5la+43nBjVnbkgxYy2TD56edA2rmtDKx8sMl/As0b9g7A1n/7U9wCe1uDCeHFGu/Jr2hrOOLNQwK
 +Myyoa0HxG61jodD/cGSZp7e0V44g==;
Message-Id: <cover.1650553693.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 21 Apr 2022 17:08:13 +0200
Subject: [PATCH v2 0/5] 9pfs: macOS host fixes
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b0b893bac2c584f1c92b2e6aa86d1308c87d5dbe@lizzy.crudebyte.com;
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

A bunch of fixes for recently added (QEMU 7.0) 9p support on macOS hosts.

Note: there are still issues to address with case-insensitive file systems
on macOS hosts. But I'll send a separate RFC on that issue.

v1 -> v2:

  * Close open file descriptor and return 0 on success instead of descriptor.
    [patch 1], [patch 2]

  * Compare res == -1 instead of res < 0. [patch 1], [patch 2]

  * Move dev_t and errno translation functions from 9p.c to 9p-util.h
    [patch 3], [patch 4]

  * Extend in-code comment that dev_t conversion is actually in glibc format.
    [patch 3]

  * Make it clear from the commit log that not having translated errnos
    before actually violated 9p2000.L protocol. [patch 4]

  * Simply compare against ENOATTR only, instead of comparing against both
    ENOATTR and ENODATA and describe in commit log and in-code comment why
    that is fine. [patch 5]

Christian Schoenebeck (5):
  9pfs: fix qemu_mknodat(S_IFREG) on macOS
  9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
  9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
  9pfs: fix wrong errno being sent to Linux client on macOS host
  9pfs: fix removing non-existent POSIX ACL xattr on macOS host

 hw/9pfs/9p-posix-acl.c   | 12 +++++--
 hw/9pfs/9p-util-darwin.c | 36 ++++++++++++++++++++-
 hw/9pfs/9p-util.h        | 69 ++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c             |  4 ++-
 4 files changed, 117 insertions(+), 4 deletions(-)

-- 
2.32.0 (Apple Git-132)


