Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E82D7051
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:41:21 +0100 (CET)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knc7E-0007Pt-O1
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knc3X-0006E0-OH; Fri, 11 Dec 2020 01:37:31 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knc3U-0008H6-3K; Fri, 11 Dec 2020 01:37:31 -0500
Received: by mail-io1-xd43.google.com with SMTP id d9so8378790iob.6;
 Thu, 10 Dec 2020 22:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=d7IOUo4AcRyuLE/rbBKw0HMgY33UrqSXYHbEddqnYjc=;
 b=DAb6ZZQKZve5NIZRuUSWLhCP2fqnyRR8VX9g2xXA+hUhaRF2gzYWBm0wBTr3CoLVEe
 0HfQoZSQw8WXxgdRKIafHDMl1ROB/eh6/VhLYzfzNViUFdGkVqKAwsKHBjGRVSNqxrIK
 lOw9GcAV1NCjgeh0JQ4/xZSGF2edo7mJjTVQgRdkPf7S2RfjBAuori07At5O80UCjLzI
 k535qZF86CE11G5jCAvECOGTe2Prr7zLqXeHYnX+7GY5qLxBDjg6mfe7ESkqRSt4jUec
 q+SRWaBf1u996k0XPSrvX9THPSRuFqV7T16pDqkkYBuAD+lh+kOEEdOTPa5bfV1IXx9z
 leYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=d7IOUo4AcRyuLE/rbBKw0HMgY33UrqSXYHbEddqnYjc=;
 b=fd3CdnHoPAAV+tZBRVZYpM6DBIWuWVf5kE7hsZVJ95pSZHh1VMAIylHMckvdOQm7NO
 jEFQqP8FykdxEtDi1kCsFcqSPx4SAmeIBYNazidvbUd6TH97R2VZsNX4XF+KgzRb7g9J
 b29tTzpiQTEHKbnoHPYIw7sW1Ybo6vpkavVUSzizxznoRsOtG2IDQ++PryL/PecK7UW2
 i3RtK9lK9cUC1hw4P8K49H040fYWKs8MtEFwdivTiu2UVLsDQ9iigkhPDVXLpExFRbE5
 F3+kp4zOoxOxS0Gt8XVPjGUgR8BeY7EGzkPTHI4c23W+/1rH6qFaUK7sS4ZOyVIBTTXE
 nWig==
X-Gm-Message-State: AOAM531d/HoFBH4KPHV2xv/BwWsWZIOrW5D7GEqJ6bsgYE6gZydlTnLp
 XpmsKrbDawe2is+AtYBF9oY=
X-Google-Smtp-Source: ABdhPJyIEojVHY118XQcZ4ltG8x1zERmgHqZKzOKt5LtcbCPTk9SOYP6ff5nyaBdjAXunxku1SpnAw==
X-Received: by 2002:a05:6602:2dcf:: with SMTP id
 l15mr13154785iow.120.1607668646619; 
 Thu, 10 Dec 2020 22:37:26 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id k18sm157620ils.73.2020.12.10.22.37.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 22:37:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
Date: Fri, 11 Dec 2020 14:37:19 +0800
Message-Id: <1607668640-33970-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd43.google.com
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

When write is disabled, the write to flash should be avoided
in flash_write8().

Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v2)

Changes in v2:
- new patch: honor write enable flag in flash write

 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 483925f..236e1b4 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -594,6 +594,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
 
     if (!s->write_enable) {
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
+        return;
     }
 
     if ((prev ^ data) & data) {
-- 
2.7.4


