Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11AA4926DE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:14:02 +0100 (CET)
Received: from localhost ([::1]:51344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oJG-0008Sj-2b
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEY-0006GJ-Sh; Tue, 18 Jan 2022 07:05:07 -0500
Received: from [2a00:1450:4864:20::334] (port=52878
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nES-0005t0-77; Tue, 18 Jan 2022 07:05:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id v123so27148623wme.2;
 Tue, 18 Jan 2022 04:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k/TJoOTmrdQNcD2ScH61YuPzvbvm1o8CHXuK6a8Oc90=;
 b=exDKgMG4odtjKf2VRpEenThSL8rT5j5SWSUTmYJz0JHRHeLqP9bEeSvRL9s4Oxip8S
 HTe5uUR1NJyrZeJFnX6A4jDGDY5+dDZZn82k8pSQnIfASQD66TwvTHo6Hmxemr3Bjuon
 fX5MQJADpUrxA6NjOsPOKQkjEEZADO6H9Wh3dIZUHAvSmQtHqiiI2wbN7TIsEy1+EoyF
 nEb6VExAhI2LbabAtYSD77M6UluGO7Wi0/nQmWnAAfj0uZTjcuIRfvhDBeeWVR6B8tXZ
 0D2o9rKbA8z6oe8OAVAOHOPV5WJJ39d6pZhdHBRZ43XwaBNCRSFgzERFXu4aAYN7IAqD
 Odxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k/TJoOTmrdQNcD2ScH61YuPzvbvm1o8CHXuK6a8Oc90=;
 b=3z4kfvbyQn51sf4RJl47jqkOyE5F0gqkUtAsQE9ZfsEWY62uoV5z4TGEinIf1OhVD7
 KMqP9/IPZUo7LmYG/EULRfQ6RrnUj80qI3Tdc1ZKbUujDej0OOnJJYiW11SE316LSHXV
 fg+wSHMvqQnwwdp4lT1t2BMQupICU9bzbGtjx4lDwGxtUyVE3Re9hV0FsBJaGiPxm9bF
 nF+NGxn8p3WAzFqvudfb048y/46flg+eL/c1b0Ii5l8jK4J+GFUHUZjScnXLrwLPDroN
 ROxAtOXoqMjp2xtGp99k8tof1/ARTktRQg1YbwEZ+9vt+2wM1Ed1v+GNn3Z1PntJAuLO
 qC8Q==
X-Gm-Message-State: AOAM530SttYlf3LwcXIrwKiOBzk+jvB+TgVCNnFxnGLoeFKQUqiyuLsq
 vIon/qS1gjQSKZy2MavZadVQEmBe72Q=
X-Google-Smtp-Source: ABdhPJzYt8LN6ShSJx391omQu4rSd6StlQ+R7Nl8husNW/bsfB9ALdCEJWW+YRxHfi3A+0u3zXnY2A==
X-Received: by 2002:adf:eb87:: with SMTP id t7mr24235458wrn.147.1642507409092; 
 Tue, 18 Jan 2022 04:03:29 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 e17sm16029717wrr.34.2022.01.18.04.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:28 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 12/19] hw/dma: Remove CONFIG_USER_ONLY check
Date: Tue, 18 Jan 2022 13:02:22 +0100
Message-Id: <20220118120229.196337-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

DMA API should not be included in user-mode emulation.
If so, build should fail. Remove the CONFIG_USER_ONLY check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111184309.28637-6-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/dma.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index b3faef41b2f..0db2478a506 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -31,8 +31,6 @@ struct QEMUSGList {
     AddressSpace *as;
 };
 
-#ifndef CONFIG_USER_ONLY
-
 /*
  * When an IOMMU is present, bus addresses become distinct from
  * CPU/memory physical addresses and may be a different size.  Because
@@ -288,7 +286,6 @@ void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
                       AddressSpace *as);
 void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_addr_t len);
 void qemu_sglist_destroy(QEMUSGList *qsg);
-#endif
 
 typedef BlockAIOCB *DMAIOFunc(int64_t offset, QEMUIOVector *iov,
                               BlockCompletionFunc *cb, void *cb_opaque,
-- 
2.34.1


