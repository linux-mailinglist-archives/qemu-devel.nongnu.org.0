Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9756336ED9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:29:13 +0100 (CET)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHd2-0002pt-P7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBo2-0001SO-K7
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:16:10 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnw-0000kR-Rf
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:16:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo11905898wmq.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rt7Yoj3Wqvxxfhd2fdBXz/8HCzsyO5MYxMXGF410eTI=;
 b=AMBjqtFPmUKv7qdJjGztV+Dhf7Sy0EbsQA13UCRvr/XqLY2HIrEYgaoUkOylnmBUvf
 Bs7JYtGXMTu0Zczb6zGkvxs6WPj6VqYUpZyP2jQHGMCfwdcT9vo4lxTQwth4l79tboJH
 r+TfqLnhkdwZBB7njk4ddTbuHKWcHH4hl14PitQuoh9+UeetW6W2aU/NkDHhal03Fnbl
 jzQXbZy6ELirMa6XYoI13cJ9ph7B6gkqSKJgIV8HM0JltawBN1IJhJOVbueuMK3h2Guo
 sLno8lvquBrs0L9tdnRxRfehU6fKanIlzuQBXBGk2E58xly/brecuJcYp26W1L22y6MD
 3GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rt7Yoj3Wqvxxfhd2fdBXz/8HCzsyO5MYxMXGF410eTI=;
 b=N7Y7ABGp3OZclXy+J6acUermaPidrRrmgMd9IAV+Az0PR0J8nI3Ql/D4sY9ZiXllMA
 EPNfP/ybvJdVbYd89XKaBH6iC68BbG0p8wqrXz0xSGpxtk+fX0cTQF9JED6hWbDS2wir
 fRmsP8kduxmg7rR6XHIy3Fampr1Zm5T4wpZTGMPKbHVetBOLTtjO0Fy30XQv2hplptzx
 kx/bkg/T2/j3jyFLFyF+b7GJKrFegfS6OY9VAvT28OWVYLlAjkluRNqLbdjaJk3P9Ikx
 rvJA3Wd8qEX122CZ3AmWT7rlhKJxyLyWr7Jhc4jju3+tHol1WWLdgfb3Hqm6goAso+ht
 uGdA==
X-Gm-Message-State: AOAM5317s4GkI9EepdWvgyvdNaqih36hA6ijPf38WIJMVTOYIb4XEl/M
 mtsM3w/8Co+Cp5PxDUn4l8p9ISRkrj9loTB83TY=
X-Google-Smtp-Source: ABdhPJz3AYUnICiSdcNSOreCpjFwc1zEBRngTkbby+k/5qVu9sNXixyW8i7BEe8uczQZ3h3klF5pkQ==
X-Received: by 2002:a1c:e4d4:: with SMTP id b203mr5787965wmh.105.1615432559640; 
 Wed, 10 Mar 2021 19:15:59 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:59 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] hw/hyperv/vmbus: replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:38 +0200
Message-Id: <20210311031538.5325-10-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:25:10 -0500
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced some calls to qemu_mutex_lock and their respective
qemu_mutex_unlock calls with QEMU_LOCK_GUARD macro. This simplifies
the code by removing the calls to qemu_mutex_unlock and eliminates
goto paths.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 hw/hyperv/vmbus.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 984caf898d..7c966ae399 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1616,11 +1616,11 @@ static int enqueue_incoming_message(VMBus *vmbus,
     int ret = 0;
     uint8_t idx, prev_size;
 
-    qemu_mutex_lock(&vmbus->rx_queue_lock);
+    QEMU_LOCK_GUARD(&vmbus->rx_queue_lock);
 
     if (vmbus->rx_queue_size == HV_MSG_QUEUE_LEN) {
         ret = -ENOBUFS;
-        goto out;
+        return ret;
     }
 
     prev_size = vmbus->rx_queue_size;
@@ -1632,8 +1632,7 @@ static int enqueue_incoming_message(VMBus *vmbus,
     if (!prev_size) {
         vmbus_resched(vmbus);
     }
-out:
-    qemu_mutex_unlock(&vmbus->rx_queue_lock);
+
     return ret;
 }
 
@@ -2189,10 +2188,10 @@ static void process_message(VMBus *vmbus)
     void *msgdata;
     uint32_t msglen;
 
-    qemu_mutex_lock(&vmbus->rx_queue_lock);
+    QEMU_LOCK_GUARD(&vmbus->rx_queue_lock);
 
     if (!vmbus->rx_queue_size) {
-        goto unlock;
+        return;
     }
 
     hv_msg = &vmbus->rx_queue[vmbus->rx_queue_head];
@@ -2241,8 +2240,6 @@ out:
     vmbus->rx_queue_head %= HV_MSG_QUEUE_LEN;
 
     vmbus_resched(vmbus);
-unlock:
-    qemu_mutex_unlock(&vmbus->rx_queue_lock);
 }
 
 static const struct {
-- 
2.25.1


