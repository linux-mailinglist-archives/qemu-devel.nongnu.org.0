Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875914942D8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:12:31 +0100 (CET)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJBu-0006cd-Lk
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BIboYQcKCsc8r0674rt11tyr.p1z3rz7-qr8ry010t07.14t@flex--venture.bounces.google.com>)
 id 1nAIk0-0000Ks-3k
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:40 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=38867
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BIboYQcKCsc8r0674rt11tyr.p1z3rz7-qr8ry010t07.14t@flex--venture.bounces.google.com>)
 id 1nAIjx-0007QS-Mf
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:39 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 g7-20020a25bdc7000000b00611c616bc76so7517455ybk.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 13:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=iEpIt+jrMCC4emLme9LBI3nLJIf4SbFAtZ9FnqwW0p0=;
 b=G9P05L1Ja5SU96apXlIGG1uQAhJpkYnzW8PxZo0ALRBmugMVvuh6kf8kYuvwgHeISW
 mcLb6CQczR7uSBHmbIG0NXVRdEtFBwTVQYXrG5cHB3Pq00dRtF/+thVccVrCh6lQGQZV
 7xYyMws7g4WloZS7kUTrhDVzJL0jak5jXyvSVRR1xdjPBBG+plAyh+onQ3mjHIBoywTw
 OVYI2u8ez/2e2KfCY7F7JY8Y3MPOEUuCH3StxCVu80j8fl8/JDRwYXfAwcaQLSWptQD2
 THI6ffLURudsX29z8X2WOf0DZLKayxg/V/9UFoPjqYkiOf93cfZXIM/yZdauSQPygm7E
 1brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=iEpIt+jrMCC4emLme9LBI3nLJIf4SbFAtZ9FnqwW0p0=;
 b=CrPGFY/TmYtIChbHXGa9g1X/E4GAjugBKNvrR5WF6ktmaVkNHZNRylD526medOHcmw
 y+5AfRPzd00MJuUnQIlMpRc7VrQI4N6oUtbcJOaLrjtduungaqa2i+xmW4u94OBCeBmR
 feTWUn0dPvqGZl8vzAeBNy12KF73K6IKaY/u4RdRkwehYLzmwAs1uB7myCk+TofjcmOI
 y6/4B/r8cBGRN0rM05G67DyHGBWn6BDXSBvnG92gS8/n7cNpZL4lMw4i64K+jwfhbz4M
 7TMm/pndhn51LZWwpVNlsZfke4m4yYtWisDlBNhCtmFgbIRPhf2YUkMecFaBBDTAKmsQ
 8q6w==
X-Gm-Message-State: AOAM5307rSymuX6GOtyj4R0epfCUi64XfT3DnSZCwX/lBQqLk7ROZ559
 FvvV0WTfeNeocErdx9Mvz/nWsRXi1s1F
X-Google-Smtp-Source: ABdhPJxSc472xPfKZ5u5rpja4/bSVHonNmxsLBLiuT5WW0RoNUHDfLDsC1ERxs5ijKE3AfebwIFZb6qDFbNZ
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:cf2d:c4c9:d443:837b])
 (user=venture job=sendgmr) by 2002:a5b:dcd:: with SMTP id
 t13mr41484810ybr.46.1642628612700; 
 Wed, 19 Jan 2022 13:43:32 -0800 (PST)
Date: Wed, 19 Jan 2022 13:43:29 -0800
Message-Id: <20220119214329.2557049-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [PATCH] hw/nvram: use at24 macro
From: Patrick Venture <venture@google.com>
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3BIboYQcKCsc8r0674rt11tyr.p1z3rz7-qr8ry010t07.14t@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Use the macro for going from I2CSlave to EEPROMState.

Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/nvram/eeprom_at24c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index af6f5dbb99..da435500ba 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -54,7 +54,7 @@ struct EEPROMState {
 static
 int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
 {
-    EEPROMState *ee = container_of(s, EEPROMState, parent_obj);
+    EEPROMState *ee = AT24C_EE(s);
 
     switch (event) {
     case I2C_START_SEND:
-- 
2.34.1.703.g22d0c6ccf7-goog


