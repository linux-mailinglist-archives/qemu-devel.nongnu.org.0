Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E3506C83
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:33:06 +0200 (CEST)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngn2X-0000SD-Js
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <284de6154d7ad57ac6539a7318aa2364261da105@lizzy.crudebyte.com>)
 id 1ngmqJ-0002WG-Sg; Tue, 19 Apr 2022 08:20:27 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:45095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <284de6154d7ad57ac6539a7318aa2364261da105@lizzy.crudebyte.com>)
 id 1ngmqH-0004gN-Tb; Tue, 19 Apr 2022 08:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=J/jnqpwYKRvHY9ZfMEO/gi79u1gNK6Cd/CDPPdiUIBg=; b=iXNCV
 cPvFpyO7UIzgX+k9xCH5Sn+qI5PuTURKC+bcBdjuuYpMsqDpk+omOgf72tiCTlQ4KpaUPiJev5FqL
 GEmADwuy/pEXT7jaYV4Hd04ydqU1PiSNz78GMg+vza0sbvgstf3D/cFmaUosPLlmaC5UCCC6xmura
 ayZTPSRbWbLqc4ylNjbKSFYFN8VwrzC8mRas+EG0jozy57S3DYIh1Yg/u5Fq1XjXnX2uaHF0j9O2p
 xPWNdxPKqOFe4l1ZDM/kwjJO28k8Jz31lOogi1h/x7r6P8eJQEQC6VQj3gw7VzOiODgOzgpBPkG/k
 OSALvnJ/vcbhCE6FE6oB35+F9iMJQ==;
Message-Id: <cover.1650370026.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 19 Apr 2022 14:07:06 +0200
Subject: [PATCH 0/5] 9pfs: macOS host fixes
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=284de6154d7ad57ac6539a7318aa2364261da105@lizzy.crudebyte.com;
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

Christian Schoenebeck (5):
  9pfs: fix qemu_mknodat(S_IFREG) on macOS
  9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
  9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
  9pfs: fix wrong errno being sent to Linux client on macOS host
  9pfs: fix removing non-existent POSIX ACL xattr on macOS host

 hw/9pfs/9p-posix-acl.c   |  8 ++++-
 hw/9pfs/9p-util-darwin.c | 28 +++++++++++++++++-
 hw/9pfs/9p.c             | 64 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 97 insertions(+), 3 deletions(-)

-- 
2.32.0 (Apple Git-132)


