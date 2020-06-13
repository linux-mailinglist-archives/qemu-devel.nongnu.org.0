Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B571F86C3
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 06:45:47 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkKWg-0000eX-6Y
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 00:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1jkKTf-0004ks-33
 for qemu-devel@nongnu.org; Sun, 14 Jun 2020 00:42:39 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:57382)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1jkKTd-0005Bi-Cw
 for qemu-devel@nongnu.org; Sun, 14 Jun 2020 00:42:38 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 80F88445E4;
 Sat, 13 Jun 2020 14:06:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1592021162;
 bh=YjpDIb+GSt+1KuwILel96z/UXUtCWDBmh9vU9ioxDXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hmvWmZCOqNdqi4z7Bd3w0E5UfMmuaso3kkhFuZKchKSiqALiEy4o0i/foc8OTBb85
 KQgKp9ulqXCvrqQl8nQiex2yL8/wECF6Tpakhi5Vaps9j3iedYX2JnNAndn+X8Wi08
 3Dj73pfb4/BhxaZMYDYEKOwIizcLQ0wgbHedt8Mw=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 6A1A33A0958; Sat, 13 Jun 2020 14:06:02 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	geoff@hostfission.com
Subject: [PATCH 3/6] audio/jack: remove invalid set of input support bool
Date: Sat, 13 Jun 2020 14:05:15 +1000
Message-Id: <20200613040518.38172-4-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200613040518.38172-1-geoff@hostfission.com>
References: <20200613040518.38172-1-geoff@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 00:05:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
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

Initial code for JACK did not support audio input and as such this
boolean was set to let QEMU know, however JACK ended up including input
support making this invalid. Further investigation shows it was invalid
to set it in the first instance anyway due to a failure on my part
understand properly what this was for when the audodev was initially
developed.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/jackaudio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index fb8efd7af7..58c7344497 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -607,9 +607,6 @@ static int qjack_thread_creator(jack_native_thread_t *thread,
 static void *qjack_init(Audiodev *dev)
 {
     assert(dev->driver == AUDIODEV_DRIVER_JACK);
-
-    dev->u.jack.has_in = false;
-
     return dev;
 }
 
-- 
2.20.1


