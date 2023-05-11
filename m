Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E01F6FFC96
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 00:13:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxEWK-0006WK-4Y; Thu, 11 May 2023 18:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hunhoff.erika@gmail.com>)
 id 1pxCYp-0001lY-Lm
 for qemu-devel@nongnu.org; Thu, 11 May 2023 16:06:47 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hunhoff.erika@gmail.com>)
 id 1pxCYo-0004XV-4c
 for qemu-devel@nongnu.org; Thu, 11 May 2023 16:06:47 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-52c6f81193cso6370022a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683835604; x=1686427604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v93tO0u1p4vZGKuhXXyIIJNOv3SaWCDnNQqdYqf4+3c=;
 b=o3gTLFCe1ou1NBMKzJ7uALAni+GkaKSL4IGAi/lDtkXJZ1x72DefpaXbxq7/a4cG90
 Jaqje1T3Gu6r2/cyTlaxrhQ/sauGBX1j6gn0nbGinTdrjXF8+uzF4LyKR/TKBHBQjx16
 aYQdw6WhBgQ7yRjM5LdP3G6fDhOBpN2nYTAZrMIDlCvxNXjQHMQCrZZ4EYBhQN4sJlUg
 AhqpjAux3ye8ExURl93ZRttIzRRBdCUkLE7nc71pkfJuRx5YXoXsqFDsxtHlThXB/uzJ
 GSAvKjdNgt72WH1b5trEYexOLqTnTIQxDWh1+PWrsAmkFizjhQqAt3AzQu08zHcTs010
 0s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683835604; x=1686427604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v93tO0u1p4vZGKuhXXyIIJNOv3SaWCDnNQqdYqf4+3c=;
 b=ScSPLqY2jZUIVKOrAEIw0xa1eZSKF+SDhwqC3C8EWR2nxPDfEkNvfNOls6suZedA5g
 9ZV2641rdiby3Pro+NK4oJxzxI2LfJGX/mry43/B4Rx2wk+YKJ3E2qjQO+PrwyHrlgpb
 WHIZSbWraxcmYMMbBWHbfNvPhMqM92YDqZLmS2WdE6Y/vjHaOZcmnzE02Ak+1wuG8lGd
 hxLaIFMBzsMudZIHzDmMOA269Wp3JyT+JMG5/VZ0O4JBxtndL1x06MCNNidI7aGdIxzq
 PMj4dcaEG/WJLzs0uyTN2Sk/VUDGVLeJhsclRnJZn5f70PUspBNVwfry5LD7U+FU2se2
 S4Og==
X-Gm-Message-State: AC+VfDzV+AJVjT6AY4i6CKc5p7LaQUrNM4Jxsm06NIstmGoi2itf/896
 d9GXeQv8ldnbRzk+md0s5WiwHZQqGXY=
X-Google-Smtp-Source: ACHHUZ4aMNsHGCD92LAF5FdLTxq6KV1fiOx++rewO4kW3LFifAys2/U+ZaD9B3Ouqx98eIluOclrqA==
X-Received: by 2002:a17:903:1247:b0:1a6:a6e7:8846 with SMTP id
 u7-20020a170903124700b001a6a6e78846mr29070179plh.40.1683835603996; 
 Thu, 11 May 2023 13:06:43 -0700 (PDT)
Received: from w2-vsandp-esx101.eng.vmware.com ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a170902989000b001acae093442sm4589201plp.82.2023.05.11.13.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 13:06:43 -0700 (PDT)
From: Erika Hunhoff <hunhoff.erika@gmail.com>
To: qemu-devel@nongnu.org
Cc: Erika Hunhoff <hunhoff.erika@gmail.com>
Subject: [PATCH] contrib/ivshmem-server: allow 2G ivshmem region
Date: Thu, 11 May 2023 13:06:39 -0700
Message-Id: <20230511200639.1197930-1-hunhoff.erika@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=hunhoff.erika@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 May 2023 18:12:17 -0400
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

The ivshmem-server failed when configured with the following:
./ivshmem-server -F -S ivshmem-file -l 2G
This is because the ivshmem_server_ftruncate fails without calling
ftruncate.
This commit allows the ivshmem-server to create a region of size 2G.

Signed-off-by: Erika Hunhoff <hunhoff.erika@gmail.com>
---
 contrib/ivshmem-server/ivshmem-server.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/contrib/ivshmem-server/ivshmem-server.c b/contrib/ivshmem-server/ivshmem-server.c
index 2f3c7320a6..ef31f07914 100644
--- a/contrib/ivshmem-server/ivshmem-server.c
+++ b/contrib/ivshmem-server/ivshmem-server.c
@@ -239,13 +239,17 @@ ivshmem_server_ftruncate(int fd, unsigned shmsize)
         return 0;
     }
 
-    while (shmsize <= IVSHMEM_SERVER_MAX_HUGEPAGE_SIZE) {
+    /*
+     * This is a do-while loop in case
+     * shmsize > IVSHMEM_SERVER_MAX_HUGEPAGE_SIZE
+     */
+    do {
         ret = ftruncate(fd, shmsize);
         if (ret == 0) {
             return ret;
         }
         shmsize *= 2;
-    }
+    } while (shmsize <= IVSHMEM_SERVER_MAX_HUGEPAGE_SIZE);
 
     return -1;
 }
-- 
2.25.1


