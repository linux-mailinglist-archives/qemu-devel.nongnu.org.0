Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B713678149
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 17:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzbP-0007fn-GU; Mon, 23 Jan 2023 11:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbI-0007br-SF; Mon, 23 Jan 2023 11:23:17 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbH-0003ap-AK; Mon, 23 Jan 2023 11:23:16 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id A8C1B20E2C03;
 Mon, 23 Jan 2023 08:23:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A8C1B20E2C03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490993;
 bh=virOuLJDaeF5ivJM510UpnLxkMlI9JeiW5cCdcZz2hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iAn5sQExDwQQq45pbl7lSgOpbHW/xfhFzkZ2LxH7ZDGZZ7ihYg3j8m+3vtevi/cTj
 F9iS9oAcWGIEBEApi2MtVsfp9BxOuCNZziOavPG1i5haSIRB3q04W4tQWIYn6piZTE
 AbZeHEpWT69uDdcUPx9xkxJiTGqcQZ6FTnQPatPQ=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 2/5] hw/char/pl011: add post_load hook for
 backwards-compatibility
Date: Mon, 23 Jan 2023 17:23:01 +0100
Message-Id: <20230123162304.26254-3-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Previous change slightly modified the way we handle data writes when
FIFO is disabled. Previously we kept incrementing read_pos and were
storing data at that position, although we only have a
single-register-deep FIFO now. Then we changed it to always store data
at pos 0.

If guest disables FIFO and the proceeds to read data, it will work out
fine, because we still read from current read_pos before setting it to
0.

However, to make code less fragile, introduce a post_load hook for
PL011State and move fixup read FIFO state when FIFO is disabled. Since
we are introducing a post_load hook, also do some sanity checking on
untrusted incoming input state.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 3fa3b75d04..05e8bdc050 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -352,10 +352,35 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static int pl011_post_load(void *opaque, int version_id)
+{
+    PL011State* s = opaque;
+
+    /* Sanity-check input state */
+    if (s->read_pos >= ARRAY_SIZE(s->read_fifo) ||
+        s->read_count > ARRAY_SIZE(s->read_fifo)) {
+        return -1;
+    }
+
+    if (!pl011_is_fifo_enabled(s) && s->read_count > 0 && s->read_pos > 0) {
+        /*
+         * Older versions of PL011 didn't ensure that the single
+         * character in the FIFO in FIFO-disabled mode is in
+         * element 0 of the array; convert to follow the current
+         * code's assumptions.
+         */
+        s->read_fifo[0] = s->read_fifo[s->read_pos];
+        s->read_pos = 0;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_pl011 = {
     .name = "pl011",
     .version_id = 2,
     .minimum_version_id = 2,
+    .post_load = pl011_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(readbuff, PL011State),
         VMSTATE_UINT32(flags, PL011State),
-- 
2.34.1


