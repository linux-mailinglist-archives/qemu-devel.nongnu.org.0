Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06F931CC97
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:06:16 +0100 (CET)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1vb-0005z7-QY
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sO-0003tp-KY; Tue, 16 Feb 2021 10:02:58 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sE-0006Gv-Vf; Tue, 16 Feb 2021 10:02:56 -0500
Received: by mail-pj1-x1033.google.com with SMTP id z9so6084264pjl.5;
 Tue, 16 Feb 2021 07:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNHsYjJ4o6EKBsRClxcIj8D2KvENAwyWtLKbAfGkZ0g=;
 b=gTNMOJKCLhYWfJ/MACn13yTVucLtNdMKeLHA4cF0M5ZlbKlrRcYeLK1+WilNFtJrj+
 32fzdP+s8JY7Qm2w1IODKg0XQ6AvPpfIsIYnIuFP04lK5RuCogI/Anf5Vk4hSSgNdOkv
 XKMGdGcdrL/dm79Usg+Ho4FTxAsm9Zwxv96uT977XPntlLhJi1gbHg83OilI3OD3DiHF
 +kq5hgcDOnuO5dDUkdV4o7JoFrVPEvcaY7X8XfdNNduLEM8U7/C/CTt6xPOisTe/UxZa
 1UAROR0FzK8Tst9/5M5hiZ3i2efNVk5Nz+iAIz5PKkBgJMJRSs2kxuuBT27G75zrReMI
 7k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kNHsYjJ4o6EKBsRClxcIj8D2KvENAwyWtLKbAfGkZ0g=;
 b=WOCBF0KC7kAbTXXGZfUh61Ccv4z+UZ5jdV3We84mcqCaA3F4HsVKj4Kngih6HPvk2o
 HW0uCHUhdV6SBxvGTTpYSMccbgQN799z0ZaZWMDegTRMHB9ODseaW05RP3LjWQS58rCC
 sKIwtWWNu+hjU1Uh26ABXZmbEtgCTAWqnADYXlbmyNmI3E1SGOYt3bOOij0Gc2ChDcK3
 iOJiQPxelktjhpymZrz3iqMGXFuaCGjHnRziPEBCfAdlJ4p2CMd2kpCtZ/Dh4Gxs6wKv
 zXEOFmkBisx/2FWf1rD9TMLwftn6ndlJY0n1vdEZf1ImU3BAbcow+17jPQVafWG6qvdt
 ebng==
X-Gm-Message-State: AOAM530EuY4rEKFr4Lcc9s43c0hnfmjkkIsJCQd9ZZ8AbdSNWFz5yAqg
 SMq9nmPDE3J1uuJTtixkysgUHd1I9Yc=
X-Google-Smtp-Source: ABdhPJy/eTnl3koEIGVbHahDAt6lgHDsdjl8P4UPu1QLQlPLcnx/NCNF79LI5khqe9qs033/nzWPHw==
X-Received: by 2002:a17:902:b487:b029:e2:d2e2:60c0 with SMTP id
 y7-20020a170902b487b02900e2d2e260c0mr20271027plr.32.1613487762943; 
 Tue, 16 Feb 2021 07:02:42 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:02:42 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] hw/sd: sd: Only SDSC cards support CMD28/29/30
Date: Tue, 16 Feb 2021 23:02:19 +0800
Message-Id: <20210216150225.27996-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per the "Physical Layer Specification Version 8.00", table 4-26
(SD mode) and table 7-3 (SPI mode) command descriptions, the
following commands:

- CMD28 (SET_WRITE_PROT)
- CMD29 (CLR_WRITE_PROT)
- CMD30 (SEND_WRITE_PROT)

are only supported by SDSC cards.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: sd: Only SDSC cards support CMD28/29/30

 hw/sd/sd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a6a0b3dcc6..273bae0a9a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1284,6 +1284,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Write protection (Class 6) */
     case 28:	/* CMD28:  SET_WRITE_PROT */
+        if (sd->size > SDSC_MAX_CAPACITY) {
+            return sd_illegal;
+        }
+
         switch (sd->state) {
         case sd_transfer_state:
             if (addr >= sd->size) {
@@ -1303,6 +1307,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 29:	/* CMD29:  CLR_WRITE_PROT */
+        if (sd->size > SDSC_MAX_CAPACITY) {
+            return sd_illegal;
+        }
+
         switch (sd->state) {
         case sd_transfer_state:
             if (addr >= sd->size) {
@@ -1322,6 +1330,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 30:	/* CMD30:  SEND_WRITE_PROT */
+        if (sd->size > SDSC_MAX_CAPACITY) {
+            return sd_illegal;
+        }
+
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_sendingdata_state;
-- 
2.25.1


