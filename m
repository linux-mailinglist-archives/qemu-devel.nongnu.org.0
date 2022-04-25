Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4F50E097
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 14:44:27 +0200 (CEST)
Received: from localhost ([::1]:33560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niy4n-0008Be-Sj
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 08:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a48ced8707c1e07420e692088905ee23fde132f8@lizzy.crudebyte.com>)
 id 1niy1d-0005Jc-FV; Mon, 25 Apr 2022 08:41:09 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a48ced8707c1e07420e692088905ee23fde132f8@lizzy.crudebyte.com>)
 id 1niy1Y-00029t-0E; Mon, 25 Apr 2022 08:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=DNSzkk0jkZ7LJkGVfcqwcglhkccBvAwZph6rkIgNFWM=; b=ASu01
 3I8musZa1XfCmkZk34XV93TeZevszpbbfw5KLbAVpDItRUSZyVc4+PIqaOcJGMX+chpsPY6788Pkv
 ts3yDyAvwn38ckwokm/pmGjSFsdIc3zQUMvf64ZMqm16CEoO2OMbqz5TP9+sZyIbCxU7ylxAQIONx
 3KkeqPFMhCYmbG0BBKokuqneW0XDUCAmGOyoYSUePaaZ/7YdPAzUiR4m2eH4EaigT0V/62iTPOWqE
 z/bbmXgr2heWtqhvg095NYAwDrGX8lO04nMD2GFc5I/92FNy3EGhswqEig1RYEthDwnZ/gxziFXnL
 EqcmRc1yy3Q3Qu5VMqD+0baE93JcQ==;
Message-Id: <cover.1650889268.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 25 Apr 2022 14:21:08 +0200
Subject: [PATCH v3 0/6] 9pfs: macOS host fixes
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a48ced8707c1e07420e692088905ee23fde132f8@lizzy.crudebyte.com;
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

v2 -> v3:

  * Explicit check whether filename fits into addr.sun_path. [patch 2]

  * s/close/close_preserve_errno/ [patch 2]

  * Fix qemu_mknodat() from having returned a negative result != -1
    on error and not having set errno. [NEW patch 6]

Christian Schoenebeck (6):
  9pfs: fix qemu_mknodat(S_IFREG) on macOS
  9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
  9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
  9pfs: fix wrong errno being sent to Linux client on macOS host
  9pfs: fix removing non-existent POSIX ACL xattr on macOS host
  9pfs: fix qemu_mknodat() to always return -1 on error on macOS host

 hw/9pfs/9p-posix-acl.c   | 12 +++++--
 hw/9pfs/9p-util-darwin.c | 46 +++++++++++++++++++++++++--
 hw/9pfs/9p-util.h        | 69 ++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c             |  4 ++-
 4 files changed, 126 insertions(+), 5 deletions(-)

-- 
2.32.0 (Apple Git-132)


