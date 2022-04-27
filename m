Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77851223E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 21:14:23 +0200 (CEST)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njn7F-0004dp-TW
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 15:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <233e6406128f5b90278e3d717e93b70c8e987217@lizzy.crudebyte.com>)
 id 1njn4V-0001xR-1B; Wed, 27 Apr 2022 15:11:31 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:36321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <233e6406128f5b90278e3d717e93b70c8e987217@lizzy.crudebyte.com>)
 id 1njn4T-0008P2-BS; Wed, 27 Apr 2022 15:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=KWXIdjGKT1mtOR/kaVZETdRGfVw92NHBPedFH3kz5yo=; b=KVYAw
 a9GXZqMAPs6cEpy4X2GCvzePxHXI06BI/txrQe2wBFttnoybocSJbsgHaIA0oYKvJtpeT5+kjFwxO
 Xw8UzUyNMnGY09TNDjPZbSJodRnwqpSDGLHrUUVCQrCSIVYCNXEeo/5utsHmdKwTC5/uUjTg62WaH
 Mf2O75wBeN1jkRMkzwzc13sEbgSCkmkGrhFb2A+ZNtT9aQq6sLfVX8JRz/kn7sF8soZC7DmWlrp3w
 jEaqZrLX4BC3dl3cRBTRd+OxWWdfmkxcAzfWTBc+S8tPL5IpFJxesfkgENAo22e4Rx3qcu/F4Eswm
 yT5ApzrT9pBjhKB3qvdy8p7AoR2VA==;
Message-Id: <cover.1651085921.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Apr 2022 20:58:41 +0200
Subject: [PATCH v4 0/6] 9pfs: macOS host fixes
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=233e6406128f5b90278e3d717e93b70c8e987217@lizzy.crudebyte.com;
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

A bunch of fixes for recently (in QEMU 7.0) added 9p support on macOS hosts.

Note: there are still issues to address with case-insensitive file systems
on macOS hosts. I sent a separate RFC on that icase issue:
https://lore.kernel.org/qemu-devel/1757498.AyhHxzoH2B@silver/

v3 -> v4:

  * Use fchmodat(AT_SYMLINK_NOFOLLOW_ANY) instead of chmod().
    [patch 2]

Christian Schoenebeck (6):
  9pfs: fix qemu_mknodat(S_IFREG) on macOS
  9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
  9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
  9pfs: fix wrong errno being sent to Linux client on macOS host
  9pfs: fix removing non-existent POSIX ACL xattr on macOS host
  9pfs: fix qemu_mknodat() to always return -1 on error on macOS host

 hw/9pfs/9p-posix-acl.c   | 12 +++++--
 hw/9pfs/9p-util-darwin.c | 57 +++++++++++++++++++++++++++++++--
 hw/9pfs/9p-util.h        | 69 ++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c             |  4 ++-
 4 files changed, 137 insertions(+), 5 deletions(-)

-- 
2.32.0 (Apple Git-132)


