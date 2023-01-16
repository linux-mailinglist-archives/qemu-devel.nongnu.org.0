Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBC66D373
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 00:57:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHZL8-0002qs-15; Mon, 16 Jan 2023 18:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZL0-0002pO-Rw; Mon, 16 Jan 2023 18:56:27 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKy-0003pH-9x; Mon, 16 Jan 2023 18:56:26 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2DEA732006F2;
 Mon, 16 Jan 2023 18:56:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 16 Jan 2023 18:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673913381; x=1673999781; bh=Oe
 4bEoaKwr4xDqovRjPov9DRBuv6ITCSqDIW/zgXVbI=; b=ydsaOgmV7icWKFJS1s
 Tik0opUD1SDNbgMSlX6nyLJgrHQVEhh51PJls5IapqsQ/8igiTAM2RL1FFKuQ/xB
 XrI+z7T6tmQ907qPRPk63Uksx/vIsGtlOU/LmBQhZMGCBC1BSK5gaJyGzs/2VLya
 SaOERQNvUxg0LTNMOesxy9qlhslkoNm4nraK9+QOWvv6pKKNegTuaTZhnPK6T37f
 GRWxm+bZpY+r0Oy4kceNfWrLmUHH8feWpFPsjSgVqHwgWA1+HRLvlxOqqtH853W+
 IiWHmez/tjwNNbX3i6TVFUYzmqyTMgg3KTgX0tCveHf9fbwVt+bJYO4LwiPUma1u
 0abQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673913381; x=1673999781; bh=Oe4bEoaKwr4xD
 qovRjPov9DRBuv6ITCSqDIW/zgXVbI=; b=LIlzgmmZYtJ56dpVwGH5b+XRF1VCV
 ZO1dLvy5PGgD/11B+Zkqy7urZmW+zgg72drlTMq9BW4iHc/zNUOoE6Y0eSmtBsHu
 cH/AWZOfY5WctEU3Z5F+grL4I88GVhowcozMV7XujrlvdrsmtmUcriLOsR8xEjyT
 38HN+/Qcdb2nU6GUAaFDqiY3Po6t1K3MrqmIPObns1vjfgknHVjsJv7L2BWHTD7t
 6ZAL7OnPVv+YOXiQXonQHzPf4Q0PgMQTKFMIuB2ayPxIlah+DwAnxKHABHtRLq21
 lIqGFFieEWha7A7oU50junScUPzijlRDcIQIQdY/dfzHR3D4OV6YK5C5w==
X-ME-Sender: <xms:JeTFYwuaxJSIVbpjFk27bSpF9pPSi4aMY-S686QqnzeZX0rMAf-0dA>
 <xme:JeTFY9eUNc5LeYuHdn0lHmqvLDgpSpBpuUW6Hdk-ODDp6DG2q3aBIfYMwqWXR_Xku
 ADcWdH_fr7-pk5eOxQ>
X-ME-Received: <xmr:JeTFY7zhHZAO94EhFLyon4ZBbmHj0UAHNwezGcL3yZQ3i1a_u6wj45ngGIi4cDU9Uph-VZztcT8kvpMOoKHmYRUz9q0QLa-y2JdBSViCCIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:JeTFYzNxu5v1FcNIpUy--i5AQ3_Geal7FwumLvHt5Rg6jrUgigfg4A>
 <xmx:JeTFYw_JyoegI7S8sklcUMgtQK-mFXYQB-DtNe3FfzyWK7jf973zOQ>
 <xmx:JeTFY7Wxtd7lCBCvX8ia3OvYLlvDeUMDM-cK0GE6XnaSYr9Mq1mAjw>
 <xmx:JeTFY9MCmspmjPX8qN9Jowu6VmlVfIyEI1MubT9ZqusWaT2ds4mxIA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 18:56:20 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] hw/nvram/eeprom_at24c: Make reset behavior more like
 hardware
Date: Mon, 16 Jan 2023 15:56:04 -0800
Message-Id: <20230116235604.55099-6-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116235604.55099-1-peter@pjd.dev>
References: <20230116235604.55099-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
I would expect the I2C state machine to be reset to default values, but I
wouldn't really expect the memory to change at all.

The current implementation of the at24c EEPROM resets its internal memory on
reset. This matches the specification in docs/devel/reset.rst:

  Cold reset is supported by every resettable object. In QEMU, it means we reset
  to the initial state corresponding to the start of QEMU; this might differ
  from what is a real hardware cold reset. It differs from other resets (like
  warm or bus resets) which may keep certain parts untouched.

But differs from my intuition. For example, if someone writes some information
to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
retain that information. It's very useful to be able to test things like this
in QEMU as well, to verify software instrumentation like determining the cause
of a reboot.

Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index bb9ee75864fe..6bcded7b496c 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
-
-}
-
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->blk) {
@@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
     }
 }
 
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+}
+
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
-- 
2.39.0


