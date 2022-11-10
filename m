Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5B6241A4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5vc-0001ME-I5; Thu, 10 Nov 2022 06:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot5vW-0001M5-H6
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:40:58 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot5vU-0002IR-GI
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:40:58 -0500
Received: by mail-pl1-x62c.google.com with SMTP id 4so1246275pli.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 03:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LwP9Wp38sUSTJiInpg7KuOJ5x3Xk+Hn5+6sexlmjPbk=;
 b=ylpe9Ti/4sl2Is0S1VlJwCZZ54uXsJrKFfnCacqGr9VedZD78REieRNW5jgKqdJFLM
 xWXUHFbikWiL+3RAiKWEt002SDpt4CZJsrO2c2nN8HbmvGZVicOHfDCkOkN/GcUyUQZE
 aUEa5Iz9mdoT6rMvVlnTwZu3rKZBu04Fr0Q64RGk/sd/m//WlOSDIhHj3ybqnB6PRoAg
 OotqGEHDV7u5Qi4J00WsADYGmQjMOUVVBOgrJGMovPIbuO3x4PlDWMH0VByi0WhQhV0D
 SKLcmID24d/FiKDAiP6hpBmg2FqeyKZR0Vfy8YOQUA2+Db6uNnGh2cK113361oRhNQoc
 SwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LwP9Wp38sUSTJiInpg7KuOJ5x3Xk+Hn5+6sexlmjPbk=;
 b=vkn5KHaonuP9bqTe8UCDGeoiZkbzK+HGVcDU4N0fXe9McUBOuBDiLdsr/smlLwGHmm
 XfG1AYoNwGTLFUtKMOgCNMsN2XN2YuzIHUA5h6RInV6N3531gr8V3Toz9T1VXNu72mYH
 WkEKmR2stKQ0UBq0pbLDXi/Lzq/eOVl3kIzRE9p2VS/BcHm5RaNTFK4Cy+gqytfTlsx4
 g2T7z7npdd3ZTqGdXlAk6H2w3Wc+DdRayvg9WXm5ZMs4f1Df7g/R+e5HLXHUtlvnmAK/
 bJYeYy2AHkalAStIlB+r4CyAPb8r0eRUj7oP5W76kLV+kce4e0FxRkp/PJbjoXMWkngv
 dG3w==
X-Gm-Message-State: ACrzQf0fRaWeP0yNCRTOs3FUv7J/rPoR6I6NYkAeBzT2wn/R08fhefb+
 Um5JKvyQqeivo8JhJ5hbydHHhQk5nBXMk+cz
X-Google-Smtp-Source: AMsMyM6ZskixnYBhAb2G5DGu+ETYT36BIHYQ9JOshZdSG8AHSIXDmYI3oMBXT2h4u5EzC32MxeAXIw==
X-Received: by 2002:a17:902:b28c:b0:186:708e:6ed7 with SMTP id
 u12-20020a170902b28c00b00186708e6ed7mr63828461plr.98.1668080454312; 
 Thu, 10 Nov 2022 03:40:54 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a17090341c200b001766a3b2a26sm11068414ple.105.2022.11.10.03.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 03:40:53 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/libqos/e1000e: Remove "other" interrupts
Date: Thu, 10 Nov 2022 20:40:45 +0900
Message-Id: <20221110114045.65544-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The "other" kind of interrupts are not used in the tests.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/e1000e.h | 1 -
 tests/qtest/libqos/e1000e.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index a22f5fdbad..3bf285af42 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -24,7 +24,6 @@
 
 #define E1000E_RX0_MSG_ID           (0)
 #define E1000E_TX0_MSG_ID           (1)
-#define E1000E_OTHER_MSG_ID         (2)
 
 #define E1000E_TDLEN    (0x3808)
 #define E1000E_TDT      (0x3818)
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 80b3e3db90..3b51bafcb7 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -32,7 +32,6 @@
 #define E1000E_IVAR_TEST_CFG \
     (((E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_RXQ0_SHIFT) | \
      ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_TXQ0_SHIFT) | \
-     ((E1000E_OTHER_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_OTHER_SHIFT) | \
      E1000_IVAR_TX_INT_EVERY_WB)
 
 #define E1000E_RING_LEN (0x1000)
-- 
2.38.1


