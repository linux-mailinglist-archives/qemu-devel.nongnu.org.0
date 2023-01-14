Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5783066A914
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:02:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXii-0000JG-8Y; Fri, 13 Jan 2023 23:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiQ-0000Bo-Om
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:22 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiM-0005Io-4T
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:22 -0500
Received: by mail-pj1-x1032.google.com with SMTP id v23so24248955pju.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ATFnSDPaq/tF+IEyDiXxbVKp09i00iyKysrIH40kCSg=;
 b=I4fBQayI860aIB0MAKE16RY0angteCyELL29iabT8ydVYlHF4sKXt59mYcREAIDOPO
 88wYLzKRnFGWf1nD55WthkxJxYZQZe0cQ+LQ9CF7ysSWvXFKY4luOSNIYOlnfrwUm0nb
 eRSUeTHlCLxt6jU2QGJlZF5CC1CJqdKbh/orJZa1sUxu49ECRB3f1mWQAA/ylM1plnuJ
 V/5J+/fAD5GamePIoxygvdBjJcuTrAG66VxxKKoxbBhOHAv+fJRyo95/zsmODP2rWJPM
 bxdyUtgepb3DOTPMphMg848ZLdiYa0CPhXuzZChbWRJk2TZT9lmAmgyUffzftBolFQOC
 c/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATFnSDPaq/tF+IEyDiXxbVKp09i00iyKysrIH40kCSg=;
 b=o1Crl8VPJ/dkxtgOuSD3cn8yFjoBHBqmJSOhV76a6R84NF8PYuiZwpq+mCzq57xMbG
 +zzhY8vKCptH+E5M3mk+JFxE/yEMe4a7CF0bupnanHMjYeLmr3CDZYRUUwIWtXyBkCTR
 lyOcUmlZqdlX+pWbaLQXv0DkGZnaF+zRl8T07V9esiW3Nlh6bnPQVbl/wwhxTLUCDCKj
 nThU2f3XGho6RlvdSYVHFMad8oIfikGNH7KDcEEqqEzSOg9VimXzEO6MfZdsY6g4dIf8
 rmf99q8S/Y3B1YbXOQ6mHioFMjVeGpwbEnRf0agOFv1wJNBSC6qyquEwyRuCSwX80MXJ
 G4tA==
X-Gm-Message-State: AFqh2kp2sHTpuNXeXHgQuy3OZrKS+lRr8UXqkkvusA51+BRigis+Aj1J
 NsnOPJ8p7F/PBy5HmDK/qVm5Yw==
X-Google-Smtp-Source: AMrXdXudCUHU2HoDtP68D9R4002fh3b0crj2YA4+xGxna51JhdOT5MiFPhJeUEGrBqbtUtdjsmxrow==
X-Received: by 2002:a17:902:7106:b0:194:66db:7789 with SMTP id
 a6-20020a170902710600b0019466db7789mr6150572pll.50.1673668813143; 
 Fri, 13 Jan 2023 20:00:13 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:12 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 09/19] e1000: Use memcpy to intialize registers
Date: Sat, 14 Jan 2023 12:59:09 +0900
Message-Id: <20230114035919.35251-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Use memcpy instead of memmove to initialize registers. The initial
register templates and register table instances will never overlap.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d9d048f665..3353a3752c 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -390,10 +390,10 @@ static void e1000_reset(void *opaque)
     d->mit_irq_level = 0;
     d->mit_ide = 0;
     memset(d->phy_reg, 0, sizeof d->phy_reg);
-    memmove(d->phy_reg, phy_reg_init, sizeof phy_reg_init);
+    memcpy(d->phy_reg, phy_reg_init, sizeof phy_reg_init);
     d->phy_reg[MII_PHYID2] = edc->phy_id2;
     memset(d->mac_reg, 0, sizeof d->mac_reg);
-    memmove(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
+    memcpy(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
     d->rxbuf_min_shift = 1;
     memset(&d->tx, 0, sizeof d->tx);
 
-- 
2.39.0


