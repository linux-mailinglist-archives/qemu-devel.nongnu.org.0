Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D983932B624
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:25:50 +0100 (CET)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNlN-00018Y-TN
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhv-0004x1-R5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:15 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhu-0001Et-7n
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:15 -0500
Received: by mail-ej1-x633.google.com with SMTP id ci14so21769549ejc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IL5kg/255ghUpuIDJ0cd9ttgop2j3ymVFsi5sBFcIZo=;
 b=jQFfMBfIBH+hNtFdc0YaqKgIP7DjDDZvZyHc8DpSaIG0Pu7lKbAgxqURpjdYVbcFNU
 5GlKWtbmNdALqAK/D5ZqMcWSkDZYyZAK6+AXkUIK+oxHIdiL67KTwO9qYYIGYG3v0Z5I
 jYKif+gKhkqxzS9F69ESew4srEaWNr2xD5+rynGVHcxirLdhFJXE+SCfcVePhJqGUNYe
 e4jw+aI+bwuhzaClbVxkOCK5g7CbiIalHtclkva7FBLsDWrKUDFkdNJ4YKt3uuyeotuo
 OWQ4t/JZVPyCFDnOgSo96UYW+dAbVTkz7moGL2xnMXEvP10+PQxsH6Bheu3Kzno/HihR
 BJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IL5kg/255ghUpuIDJ0cd9ttgop2j3ymVFsi5sBFcIZo=;
 b=hbTrzF0qj5dW8tvsLO7tkzmImVjpxHqs0i/rCnzXEMn3vMnDq+Hh8Qi7ERN83qd85A
 Ng8c6UyQRbSWUOy1fz+FDsaAiw97SaZM3vYTK79G53Go8xARUXqXWgxd7ptfHf9MQYHV
 VmIjWIe5KqatcalZxzXpY3mfb8R+wmLfZR32YAM6qipvlMFOG6S2BaR3s/A86xShCr5j
 UrG9mw4Dy/CMp4eStjbqkpLcf18cDS1LXw3wi5GS+Fp2L3Vva4AWYGibIm5Ha5O/aZs2
 +zlXnwNP3S73kI1D/F6MiJevk+idyHUVmEQRpPZUBZUkzhmr4OViXoWuV7f6vqyFtyqt
 tgkw==
X-Gm-Message-State: AOAM530/mdmpI/Nj9YixqMsVA9ZSRwXEVkPgUkkEWt/XdxSPH3UQfTln
 hvEcx4GvvFBcaBibglLCFtY=
X-Google-Smtp-Source: ABdhPJxiIPf3UHl9LhkYffHyhoLlKKcHIaeaJLKRTFDTHQNnf4kEWJmrfeYnqOoc4olqlugqLPPpCA==
X-Received: by 2002:a17:906:c102:: with SMTP id
 do2mr24924430ejc.305.1614763332878; 
 Wed, 03 Mar 2021 01:22:12 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:12 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/9] hw/net: i82596: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:41 +0800
Message-Id: <1614763306-18026-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
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

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/i82596.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index 055c3a1..1eca2e2 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -73,10 +73,6 @@ enum commands {
 #define I596_EOF        0x8000
 #define SIZE_MASK       0x3fff
 
-#define ETHER_TYPE_LEN 2
-#define VLAN_TCI_LEN 2
-#define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
-
 /* various flags in the chip config registers */
 #define I596_PREFETCH   (s->config[0] & 0x80)
 #define I596_PROMISC    (s->config[8] & 0x01)
@@ -489,8 +485,6 @@ bool i82596_can_receive(NetClientState *nc)
     return true;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
 {
     I82596State *s = qemu_get_nic_opaque(nc);
@@ -501,7 +495,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
     size_t bufsz = sz; /* length of data in buf */
     uint32_t crc;
     uint8_t *crc_ptr;
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] = {
                 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -584,17 +577,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
         }
     }
 
-    /* if too small buffer, then expand it */
-    if (len < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, len);
-        memset(buf1 + len, 0, MIN_BUF_SIZE + VLAN_HLEN - len);
-        buf = buf1;
-        if (len < MIN_BUF_SIZE) {
-            len = MIN_BUF_SIZE;
-        }
-        bufsz = len;
-    }
-
     /* Calculate the ethernet checksum (4 bytes) */
     len += 4;
     crc = cpu_to_be32(crc32(~0, buf, sz));
-- 
2.7.4


