Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6FA629EC9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouydK-00071c-NN; Tue, 15 Nov 2022 11:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyd5-0006xP-Ay
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:17:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyd2-0007Oc-7r
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:17:41 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o30so10008199wms.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAqW3APFFPPxvWVL8GIJzMzxW4dvUOLuylOlFBUME2g=;
 b=TcCH+Pd75oykupDMLAkJtddHUIklztDt6cWO8/3OHFdQNNW5kNrHtBEmJKzsnAXQ9J
 y5efqVOd2up1BhldK4CtzuLciIL/TxARW3puo1+NF2q8mKY5+oRRohcQ1Lxcs5L1xWTl
 hBxJE1tQcOS8oLHD4/b32XfLokfP4nrYBWnYBaMuDpwzhYpzZ7+ZFXpb1nkNpTUyRmll
 Z8Y5yG8ehZqctBPB/vWId/ezzgtxY0d9LcwI1XC1n2w6L10E83PvqeDrfFf5PwkVMmlL
 0rqjTqe7nc4harY7UJwbObSb4XOuvK47kxMLRvGzUfNPRoDcwXd4GfkLRsGOrc8mcZnk
 QrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAqW3APFFPPxvWVL8GIJzMzxW4dvUOLuylOlFBUME2g=;
 b=71KTAiZtnVxv/nN/i+nv46bJQM+twDUX+Ba36zxjNw+v9W+MIaiHdEA9FSKmXaI1fD
 4uO5qIYai9vl+uq6onNNbJ8EVnytl3An4vmKxEDxZhbKW+1gXu5gE99zxqR0sI98INcD
 FuCsw0pOWVwLsBB3j6xQPJ55wGaB4lm/vostz0EViw5veXmMVCPEroxYeAF5N0SJlJIq
 aX4GxXlD4RqZxlx9pr8UFxU/X0aVawmLyz/u0q9osUDTMxoLoOZ6hPZqgOt1tZMD5h3G
 vnGCv0kYgke3ebLLXvLAv70UCZ+ZtFtJ1vulcyWJBHVP3VfLGdJDJYcGHakw45cxB84a
 0e/A==
X-Gm-Message-State: ANoB5pm+6yRrWMbjKx3Quk1m5DIWBcToy2LXjq8DEDb2mV9IdocW0nc3
 5DHullmt/PFeCAoQurgVgZbDPQ==
X-Google-Smtp-Source: AA0mqf7U8oEHb9SB43nSxrvreYQ4LqwewQ6qbTfHmcVhr9thzgQr7u6m7tRRxwj/M2Jx8F1BPOWhmg==
X-Received: by 2002:a1c:f709:0:b0:3cf:b287:7718 with SMTP id
 v9-20020a1cf709000000b003cfb2877718mr992407wmh.75.1668529058776; 
 Tue, 15 Nov 2022 08:17:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a5d554d000000b002366e3f1497sm13055736wrw.6.2022.11.15.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 08:17:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C8711FFBA;
 Tue, 15 Nov 2022 16:17:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Tue, 15 Nov 2022 16:17:36 +0000
Message-Id: <20221115161736.2425584-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115161736.2425584-1-alex.bennee@linaro.org>
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch fixes.
v3
  - re-base on re-flow with if
v4
  - fix the commit message
---
 hw/intc/arm_gic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 1a04144c38..7a34bc0998 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -973,8 +973,18 @@ static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             /* GICD_TYPER byte 1 */
             return (s->security_extn << 2);
         }
-        if (offset < 0x08)
+        if (offset == 8) {
+            /* GICD_IIDR byte 0 */
+            return 0x3b; /* Arm JEP106 identity */
+        }
+        if (offset == 9) {
+            /* GICD_IIDR byte 1 */
+            return 0x04; /* Arm JEP106 identity */
+        }
+        if (offset < 0x0c) {
+            /* All other bytes in this range are RAZ */
             return 0;
+        }
         if (offset >= 0x80) {
             /* Interrupt Group Registers: these RAZ/WI if this is an NS
              * access to a GIC with the security extensions, or if the GIC
-- 
2.34.1


