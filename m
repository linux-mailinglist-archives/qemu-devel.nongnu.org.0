Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD343B20C1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 21:03:01 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw89M-0002QM-E7
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 15:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1lw87j-0001ie-03; Wed, 23 Jun 2021 15:01:19 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1lw87h-0000VS-FE; Wed, 23 Jun 2021 15:01:18 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i4so1647063plt.12;
 Wed, 23 Jun 2021 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=067aX85YeQTpLFcxK2GuLhvHqY0zDks/abAs3JdfsDw=;
 b=Mz22zgLZKUeiHPHe/+P5/StkIhQuqWBZ6G9Nkja77n3z2kjO6wcfxOOUbAQqwiyNq6
 DSESvwgkyEtzLGALW9BWdhgskgBiH/h+RGt/3iQEGw0pULP1GP529WH6nnlT3/O5N6HN
 d8G3rz4A6DlA0rHJ8/8bsft3uivUSzGjTXGzPC5QtNrEFKRhSOM8QohkIiZqPDxYymt5
 AemnwGrDpeNvZWEIWRiWKZCcU5rAkY+FJ5XvwX/x+seNV0dxgh0OhwMU8wxrImISiaSu
 tSOWlnE6J9ZRsDNzkj7VZ3ZuJd457vgUgPcrbEg8V3t16mGoGjRPcz6uvIcWHghLK0b0
 Dtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=067aX85YeQTpLFcxK2GuLhvHqY0zDks/abAs3JdfsDw=;
 b=qB4ogZuD1TbzPz0z357Xd8B3EMRgyFJeNJyXcADzeXaJ6JxeYgwCinrsO2efr/JGDX
 Aim9gsDnwPLtWof9CcUHD1YT+a02T80IrZ0CjJquoz4F6H9+gjN+M9ya7eRg+xXkcTfi
 uzJ2QerJnD0k65HWcD+aUAyGtgJfAlzSrnuHtPnjeFPKpnpMaCTXQ/38Ehku/c1KGlR0
 aU6SPWvOfKM+kCP1kINHs22Kg4Q4T+kZC5DqFiEJ0ekZy2iCtEH4EdR4KcQiLHjzp/JB
 jyXW3gi3OfHytUhWmSI1U3gj/JpwhQvf8xDv4LZcEk9A8uA56F4xgEn4V98HRDgRhWN1
 5Gbw==
X-Gm-Message-State: AOAM530rkWHq+MmE29aGkHzGSzdJ760But6kGRgKPYEk+Wt2lEZmzqU2
 PJfc3YyI3+chr8tTIavN0XIwSG6ApcZJ7hymu1Y=
X-Google-Smtp-Source: ABdhPJxGPIS0IeX4EWJaCGNbZEYw9RRhLEMK2idKwQgzfagmqSOGu875qlvut8HCaa8NDzjzxh9PLQ==
X-Received: by 2002:a17:90a:e644:: with SMTP id
 ep4mr9949647pjb.43.1624474874652; 
 Wed, 23 Jun 2021 12:01:14 -0700 (PDT)
Received: from joannekoong-fedora-IT2212005.thefacebook.com
 ([2620:10d:c090:400::5:95d8])
 by smtp.googlemail.com with ESMTPSA id d6sm528641pgq.88.2021.06.23.12.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:01:14 -0700 (PDT)
From: Joanne Koong <joannekoong@gmail.com>
To: qemu-devel@nongnu.org,
	joannekoong@gmail.com
Subject: [PATCH] hw/sd: sdhci: Enable 64-bit system bus capability in the
 default SD/MMC host controller
Date: Wed, 23 Jun 2021 11:59:21 -0700
Message-Id: <20210623185921.24113-1-joannekoong@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=joannekoong@gmail.com; helo=mail-pl1-x62a.google.com
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default SD/MMC host controller uses SD spec v2.00. 64-bit system bus capability
was added in v2.

In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1ul << 28))
where 28 represents the BUS64BIT SDHC_CAPAB field.

Signed-off-by: Joanne Koong <joannekoong@gmail.com>
---
 hw/sd/sdhci-internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index e8c753d6d1..a76fc704e5 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -316,16 +316,16 @@ extern const VMStateDescription sdhci_vmstate;
  * - 3.3v and 1.8v voltages
  * - SDMA/ADMA1/ADMA2
  * - high-speed
+ * - 64-bit system bus
  * max host controller R/W buffers size: 512B
  * max clock frequency for SDclock: 52 MHz
  * timeout clock frequency: 52 MHz
  *
  * does not support:
  * - 3.0v voltage
- * - 64-bit system bus
  * - suspend/resume
  */
-#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
+#define SDHC_CAPAB_REG_DEFAULT 0x157834b4
 
 #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
-- 
2.20.1


