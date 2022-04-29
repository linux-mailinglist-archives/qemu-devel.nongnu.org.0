Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24255147C9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 13:12:52 +0200 (CEST)
Received: from localhost ([::1]:47242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkOYN-0000YV-SH
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 07:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c714b5e1cae225ab7575242c45ee0fe4945eb6ad@lizzy.crudebyte.com>)
 id 1nkO5s-00066W-Ux; Fri, 29 Apr 2022 06:43:25 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c714b5e1cae225ab7575242c45ee0fe4945eb6ad@lizzy.crudebyte.com>)
 id 1nkO5r-00085k-84; Fri, 29 Apr 2022 06:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=CtBR3MiWCZ4SbV51ZIMcUWGW3+IEs4oQ5ASOrcepHMQ=; b=TCBWv
 ig/Z0trO3A6AuIp3cXj3f+b3eBOHTN3slZRUQ2O7HN/dzQWw9H9/5WDyxGHOK25Oc87hCOCV7zEGI
 dcuFE7/EpYaBG6bi3QunSbfJN53dZ2URk4iDpHK1ppTr5n0UeE251fi0BFDBHlBTWXvFYtQ92DPNE
 MliJjP+3MR6gIk2FSBk1kQ+GXN4g9e3PFWlx8PmL6G1+voA28mKAHqxuRt3UdA6Qos2vu4ZrTNYM4
 cceWK6aGZvGnrGxz2coehvOi0H+BoMbb9lQkyc4H1CNGoRiFIc82C3WJ3ORB/SnSm06xdhpJn+Bdu
 GXCg4+Y0jRIG3qacMQvpHQkGPmq8Q==;
Message-Id: <cover.1651228000.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 29 Apr 2022 12:26:40 +0200
Subject: [PATCH v5 0/6] 9pfs: macOS host fixes
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c714b5e1cae225ab7575242c45ee0fe4945eb6ad@lizzy.crudebyte.com;
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

v4 -> v5:

  * Check return value of snprintf() instead of strlen(filename).
    [patch 2]

Christian Schoenebeck (6):
  9pfs: fix qemu_mknodat(S_IFREG) on macOS
  9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
  9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
  9pfs: fix wrong errno being sent to Linux client on macOS host
  9pfs: fix removing non-existent POSIX ACL xattr on macOS host
  9pfs: fix qemu_mknodat() to always return -1 on error on macOS host

 hw/9pfs/9p-posix-acl.c   | 12 +++++--
 hw/9pfs/9p-util-darwin.c | 54 +++++++++++++++++++++++++++++--
 hw/9pfs/9p-util.h        | 69 ++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c             |  4 ++-
 4 files changed, 134 insertions(+), 5 deletions(-)

-- 
2.32.0 (Apple Git-132)


