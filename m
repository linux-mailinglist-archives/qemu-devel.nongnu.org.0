Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2D2D0042
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 03:18:19 +0100 (CET)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kljcw-0001b9-4x
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 21:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1klja2-00008o-SL
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 21:15:22 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:41964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kljZz-0004Q7-NY
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 21:15:18 -0500
Received: by mail-qk1-x743.google.com with SMTP id 19so1846914qkm.8
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 18:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2Uiiq4qQjczyfuHIEkIt5O5wZUUpd/eN4ovFrUj9k4g=;
 b=QaRMgZdQg83Xz+dMoZULdSf0W6EXZe08iGDYRJ5niglK8PSgsPol5wRXwnLusiv59G
 dS20Kb4NX74womh4Nghrsh6XszHa8jbPWv8UYhzWTjK2IMUxjgse+6Mma82eGasRMy6U
 BprWxLmLUdcYyFtGvGzl+PT0PPZ5D5PEfCf4PJTnMi3yabr7QjKw7H3sJtAYZc3Anijk
 +Z+1V3HbjCYVZAxbxo4oBuGVWuBwvrGaeUUeP5rg6/m5cnxc1m7StMwc4YHV+OrrrgFs
 v6FMRZzpTcgOYG07vdJ9eCExqodNAtw+KwsW71o8XsNVoRv2dZgKyrW+nWXhUWRTGx4O
 FSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2Uiiq4qQjczyfuHIEkIt5O5wZUUpd/eN4ovFrUj9k4g=;
 b=JGadR5u38UUis5d7/ekn9lg5+xNeOAhwLiX+d7i/nvi0lgsMga0RoUZ2+nfOtF5Kn2
 jSIPtShb+UosvRLc3EpG8xARIQxFPE/Cf6SU4o9hsH3WcUozRI0KiKANLZfWGD81OiNZ
 FbEArlxJNr0X+A2Gdyer510X/RpgFP3sX1ALKCp1jwmgHx0V/HWdy7lq2CRUJVbBpu/g
 hauDxriI9g2n1pBXRwv4b5U5Mh5oplPyXvIy5JENXJhUSpyHKJAI1cIyX0P5ZCwJFNiE
 9OCp90PRVO+qdOirMWo20zjFN8p76tkAque2ec2qHOluS3LSLjhbcYqxbXgBTlwrB3BT
 ExCw==
X-Gm-Message-State: AOAM532jUCRnXjGkc6P9evjePJVN/6LG0Tuz8flyt6U0zzcp8wBW/T59
 VTT4fwCl/LreSLX9TeIxaUnWJqv7kLY=
X-Google-Smtp-Source: ABdhPJwCNEKJ4A+fdNq1Fe7S2rSJEtlBTrnv5uQ8r3EVQagGIWqkooEimKsTh70C6OnENgpxnaItsA==
X-Received: by 2002:a37:a402:: with SMTP id n2mr17076189qke.131.1607220914097; 
 Sat, 05 Dec 2020 18:15:14 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id g18sm9296306qtv.79.2020.12.05.18.15.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Dec 2020 18:15:13 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] net: checksum: Skip fragmented IP packets
Date: Sun,  6 Dec 2020 10:14:05 +0800
Message-Id: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x743.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Carlstedt <markus.carlstedt@windriver.com>

To calculate the TCP/UDP checksum we need the whole datagram. Unless
the hardware has some logic to collect all fragments before sending
the whole datagram first, it can only be done by the network stack,
which is normally the case for the NICs we have seen so far.

Skip these fragmented IP packets to avoid checksum corruption.

Signed-off-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 net/checksum.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/checksum.c b/net/checksum.c
index aaa4000..5cb8b2c 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -106,6 +106,10 @@ void net_checksum_calculate(uint8_t *data, int length)
         return; /* not IPv4 */
     }
 
+    if (IP4_IS_FRAGMENT(ip)) {
+        return; /* a fragmented IP packet */
+    }
+
     ip_len = lduw_be_p(&ip->ip_len);
 
     /* Last, check that we have enough data for the all IP frame */
-- 
2.7.4


