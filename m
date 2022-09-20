Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632DF5BEA90
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 17:53:31 +0200 (CEST)
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oafYv-0008JY-Ql
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 11:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangliangzz@126.com>)
 id 1oacxa-0004y3-Cy; Tue, 20 Sep 2022 09:06:46 -0400
Received: from m15112.mail.126.com ([220.181.15.112]:34345)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangliangzz@126.com>)
 id 1oacxU-00008A-4G; Tue, 20 Sep 2022 09:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bhm6c
 kdBWPnkoJ7YlE7d0BLIpXDAhpF8yrM5FTUJ928=; b=THfnhLc0D1O/ZWAY12fCY
 yFhQCRr1HlCMqIgph+P4vSrdTNqwtCvyIItydD+QYxh5sHSpXPSrEBVf8bWgzTdB
 8KXcjxkQvG7IKaDpI3re3US7c6IJeCJZ9zkIIhpqrc6alS+WBQ47Gb6ZkvryZ3Di
 eoFxo8z5Tn0Wmj+izrlAis=
Received: from localhost.localdomain (unknown [117.160.246.157])
 by smtp2 (Coremail) with SMTP id DMmowACXm7Bmsylj6TyqBw--.25196S4;
 Tue, 20 Sep 2022 20:34:48 +0800 (CST)
From: wangliangzz@126.com
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	wangliangzz@126.com
Cc: pbonzini@redhat.com, stefanha@redhat.com, silbe@linux.vnet.ibm.com,
 berto@igalia.com, Wang Liang <wangliangzz@inspur.com>
Subject: [PATCH] ratelimit: restrict the delay time to a non-negative value
Date: Tue, 20 Sep 2022 20:33:50 +0800
Message-Id: <20220920123350.205391-1-wangliangzz@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowACXm7Bmsylj6TyqBw--.25196S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFW7Zr15tF18XryDZw4xJFb_yoWfJFgEga
 y7X3yrury8Z3Z7ua17A3Zayr1Sqr1rXayxGr18GwsrAFyktrs5AFWUGa17KFZ7uF42qFZ5
 WF1q934vyr4kGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRK-eOJUUUUU==
X-Originating-IP: [117.160.246.157]
X-CM-SenderInfo: pzdqwzpldqw6b26rjloofrz/1tbiLQiC1lpD-keqAQAAs6
Received-SPF: pass client-ip=220.181.15.112; envelope-from=wangliangzz@126.com;
 helo=m15112.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Wang Liang <wangliangzz@inspur.com>

The delay time should never be a negative value.

Signed-off-by: Wang Liang <wangliangzz@inspur.com>
---
 include/qemu/ratelimit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/ratelimit.h b/include/qemu/ratelimit.h
index 48bf59e857..c8ea855fc1 100644
--- a/include/qemu/ratelimit.h
+++ b/include/qemu/ratelimit.h
@@ -69,7 +69,7 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
     delay_slices = (double)limit->dispatched / limit->slice_quota;
     limit->slice_end_time = limit->slice_start_time +
         (uint64_t)(delay_slices * limit->slice_ns);
-    return limit->slice_end_time - now;
+    return MAX(limit->slice_end_time - now, 0);
 }
 
 static inline void ratelimit_init(RateLimit *limit)
-- 
2.31.1


