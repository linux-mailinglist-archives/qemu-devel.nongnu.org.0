Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84312321162
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 08:29:56 +0100 (CET)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE5fH-0007Jt-9k
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 02:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lE5dl-0006qB-2P
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 02:28:21 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:9126
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lE5di-0004VA-Fd
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 02:28:20 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4DkYjh1rZtz8PbN
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:30:00 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:subject:message-id:mime-version:content-type; s=default; bh=
 G/WzEknvjJH14+e3t0izjdKLLK4=; b=jeSbRvjeMExjg8mlSk8F0cbqSww+c6YG
 8rnpi9CbTJAb3OAWmBNkow/veIANS9e37nu84ZANtn9A6l4uJpKVsDWtuhJHa4VZ
 GSxgxZ1e38pkWqiO/ojT8Po/lVQppc4kv5BoA+tSgCKb5EGXOfmL1ZnEkKGniNRM
 fxr5kHNiY+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :subject:message-id:mime-version:content-type; q=dns; s=default; b=
 TG50spB00PJShaHnIq+sFg9fyvKtGde2DRqY8fnD5GiE/gfXl2yEa9xba2pCliPH
 ioZ9jZ227VTPbye1/mT+9a7ysz5c9mVHMawTq7Hx3ZJDGGW1RnDbRMhrkC7zyx88
 SzWK/e9NOzPRE4gncuBIM57yebv7dw9ANBGXmxSO81I=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-43-174-88-243-61.dsl.bell.ca [174.88.243.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4DkYjh1B1yz8PbK
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:30:00 -0500 (EST)
Date: Mon, 22 Feb 2021 02:28:02 -0500
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: Remove time_t cast for OpenBSD
Message-ID: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

OpenBSD has supported 64-bit time_t across all archs since 5.5 released in 2014.

Remove a time_t cast that is no longer necessary.


Signed-off-by: Brad Smith <brad@comstyle.com>

diff --git a/migration/savevm.c b/migration/savevm.c
index 52e2d72e4b..9557f85ba9 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     if (name) {
         pstrcpy(sn->name, sizeof(sn->name), name);
     } else {
-        /* cast below needed for OpenBSD where tv_sec is still 'long' */
-        localtime_r((const time_t *)&tv.tv_sec, &tm);
+        localtime_r(&tv.tv_sec, &tm);
         strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
     }
 

