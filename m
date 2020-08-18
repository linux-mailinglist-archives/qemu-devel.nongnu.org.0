Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC402485B8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 15:13:02 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k81QD-0003fw-69
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 09:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1k81PR-0003FN-HX
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:12:13 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:48104)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1k81PP-0008MB-KV
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 09:12:13 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id DA5EB4270D;
 Tue, 18 Aug 2020 23:12:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1597756326;
 bh=cXS57NDAPCGIeK1kXV8kCuMpQt3dC81l7MZkFYpT43s=;
 h=From:Date:Subject:To:Cc:From;
 b=dPudK4QJirL+5+io8lpRZwx9SnRo9eVAlTOLbb/9pgW5lzGdTN66XiCkubMseJuJB
 yp30e7IUIFIvjF1p3X0OBo3rg3eeQJnweaLmgNDX6GraLpdulkRTdCdrv3Zsnzn1eF
 fHxE/8JlF5nB7OYLg031V1VQnuKHJlsGobUWiLEM=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id BB75F3A0B9F; Tue, 18 Aug 2020 23:12:06 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
Date: Tue, 18 Aug 2020 22:40:36 +1000
Subject: [PATCH] audio/jack: fix use after free segfault
To: <qemu-devel@nongnu.org>
Cc: <kraxel@redhat.com>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200818131206.BB75F3A0B9F@moya.office.hostfission.com>
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 09:12:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

Due to a ridiculous commit in the Jack library, the client may have been
freed already by a secondary audio device recovering its session.

https://github.com/jackaudio/jack2/issues/627

Until there is a proper fix for this we can not risk using the pointer
at all if we have been notified of a shutdown as it may have been freed
by the jack library, as such the close call is commented out to prevent
a use after free segfault.

At this time, this will not cause a memory leak as the recovery routine
will trigger the "cleanup" code in the jack library, however, if this is
ever corrected in the jack library this will need to be revisited.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/jackaudio.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 72ed7c4929..e8faf1bb89 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -563,7 +563,22 @@ static void qjack_client_fini(QJackClient *c)
         /* fallthrough */
 
     case QJACK_STATE_SHUTDOWN:
-        jack_client_close(c->client);
+        /*
+         * Due to a rediculous commit in the Jack library, the client may have
+         * been freed already.
+         *
+         * Until there is a proper fix for this we can not risk using the
+         * pointer at all if we have been notified of a shutdown, as such the
+         * below line is commented out to prevent a use after free segfault.
+         * This will not cause a memory leak as the recovery routine will trigger
+         * the "cleanup" code in the jack library.
+         *
+         * https://github.com/jackaudio/jack2/commit/171a3c4a0ddd18d2afae56f3af6291c8e96ee3ac
+         */
+
+        //jack_client_close(c->client);
+        c->client = NULL;
+
         /* fallthrough */
 
     case QJACK_STATE_DISCONNECTED:
-- 
2.20.1


