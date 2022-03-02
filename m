Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5FF4CA637
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:44:33 +0100 (CET)
Received: from localhost ([::1]:35180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPHM-0006Wi-Nw
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4A-0001L3-OU
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:50 -0500
Received: from [2607:f8b0:4864:20::52f] (port=46053
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO49-0000em-9K
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:50 -0500
Received: by mail-pg1-x52f.google.com with SMTP id z4so1474171pgh.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tFB9N0+6/fehwQuRXDdcYFp1qjN2m+rAm/M1d8WEXJE=;
 b=hLMsPPbRtgGX1MCepAvM4Xp6CIf7oGKkXK6yuJe+4Uwx1/P0ht0qbFYblj1mvIxVMR
 7AyrNbY4uBZ2qkvyULtcxjiKRkQhDj4W4feMIQhB9EV9YEEe9OJLYCLVipfBrme0bPRa
 M+7tV/HcyJyqTTFrfaUA0wBfWBYaf98VMWXlsI/KhBjRbqvWrY6vlSF1jFkDp44MlGbn
 Rm/0nDljFF4vrFBtuTGMdcGrhBa6DaJXN3rs71a4E22oYHx1Ldpx0zvlGM3Dut8LUbeE
 RVzn0gx6P8a61hih9fItCR9DMGjYyRPvxVld4HxMb4CzPN4fO/BrSs6XOZSp5/RT8kSt
 J0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tFB9N0+6/fehwQuRXDdcYFp1qjN2m+rAm/M1d8WEXJE=;
 b=7+MRcwpupNCW82zq4YiCLaeZiuBZrue3QktHcYi2LgJrWnM5zeSKtdkVw/tFLfO/Ur
 AChsuro6enHk0s3fqmiJyS4QgNk04+0hmqh8doz+ZWm6kCK+Wo0Sq9ci6av0SJQbpzmX
 MpKJSIZufZbSEujxknOWtUxeW39b8vTSFzA4heVYI5td5jjnOjdf7W7hNUMxuCW4fD0C
 gUoCdvPZteAOf+0N3O0U3qc5o9NcTD+RkRCHnuVZCW9pVKLXtZRqSpQcfwI7DUhBs1jE
 chlZSBRSEcv+acVl1J7RudZnQLR2ALLoSfAXn2rq/KKINqDPzfTQ08ZXUpcK8YLzcM4R
 CMZA==
X-Gm-Message-State: AOAM5324bnyDunD8j4Yxhk0I1QMRyLVVeLtdlZV8hKH4WHnxjhK2T5rm
 A/iqhvIe2lUznBPcbRUmd6UgRDCRq62IIg==
X-Google-Smtp-Source: ABdhPJx1G9XM6aBAdmojaHe09mrUEIUgj5sO9zUuxq6Y/UozsN9Uu5Sk/hDghVXVnTMR4PCukdPxGg==
X-Received: by 2002:a05:6a00:c95:b0:4e1:3259:f7ad with SMTP id
 a21-20020a056a000c9500b004e13259f7admr32387248pfv.43.1646224007581; 
 Wed, 02 Mar 2022 04:26:47 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4912971pjb.14.2022.03.02.04.26.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 04:26:47 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] hvf: use correct data types for addresses in memory
 related functions
Date: Wed,  2 Mar 2022 20:26:05 +0800
Message-Id: <20220302122611.15237-4-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302122611.15237-1-ubzeme@gmail.com>
References: <20220302122611.15237-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the QEMU coding style. Use hwaddr for guest physical address.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c      | 2 +-
 include/sysemu/hvf_int.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 32452696b6..6b82be3220 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -32,7 +32,7 @@
 
 static hvf_slot memslots[HVF_NUM_SLOTS];
 
-hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
+hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
     hvf_slot *slot;
     int x;
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 8ee31a16ac..2c4a97debe 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -22,9 +22,9 @@
 #define HVF_SLOT_READONLY (1 << 1)
 
 typedef struct hvf_slot {
-    uint64_t start;
-    uint64_t size;  /* 0 if the slot is free */
-    uint64_t offset;  /* offset within memory region */
+    hwaddr start;
+    hwaddr size;  /* 0 if the slot is free */
+    hwaddr offset;  /* offset within memory region */
     uint32_t flags;
     MemoryRegion *region;
 } hvf_slot;
@@ -58,7 +58,7 @@ int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
-hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
+hvf_slot *hvf_find_overlap_slot(hwaddr, hwaddr);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
-- 
2.32.0 (Apple Git-132)


