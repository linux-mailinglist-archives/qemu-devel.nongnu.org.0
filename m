Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640448FC68
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 12:52:57 +0100 (CET)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n945f-0003iN-QU
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 06:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n940f-0002C1-To; Sun, 16 Jan 2022 06:47:45 -0500
Received: from [2a00:1450:4864:20::32e] (port=56142
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n940e-0005SZ-An; Sun, 16 Jan 2022 06:47:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c66so14693698wma.5;
 Sun, 16 Jan 2022 03:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5WzYoThcsei8A9VEkMpBtgYA8Q7YWohPWelEZsybKUo=;
 b=P+XqAiDBcBJAqvcHTmxfJvFLXXLB+b0SAYPV2OFUP/kzoDn8gME1ojlHHABP3085MH
 yOuLLKH89ZUNteEoJ22FPq/xt/Jx0iPotQYP06skouT1yYdIIwXvWL3VjcTBifY0oqI9
 HR16PsEQTN+Pfo8ipJxM8kGto2qf0zBAfGVaNGzkCl3kP4TuBEOLfE4SG4Z671YL14XS
 lN4x6FSqGPm8BScw4mFYNywrQ3VmbLdkMSqUcpeVopec3lPqr2S5Lm7PJZ6Gc+fcTwkL
 0qmdBBrqrtk/zyi2Y01opmu7YhqbsjyRTKBPqlMWrjlYrKQBPE5iIPeW7YhL1uoiSd0P
 eoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5WzYoThcsei8A9VEkMpBtgYA8Q7YWohPWelEZsybKUo=;
 b=JDJm2cF1CPcNcu+ZB05S+9UMl46nwXatF168xqZITrVYJiw9qKfQTZU/1ObRtl8CEV
 GI3B1NFRHd7Vm9hggapw/XhpRf04g5ZjGL6pZ0AfRfhxUytuc7pl448/vay15Ae+DmRe
 rJ3VNDm47+Vz1BRHds+o8C45UL1j2kxDB+PMEOG8x6ceGwl5VUZg+Nk7CoN9ktzozZR2
 bWP/vGwTaLgW/u0pIPXMzKGskD00xo5i5G1GhnuiKyFx5WTsDUsrstu4j7ZpL4Yjvoin
 AkUgkaXpzK3kAJpP0z7dgV6MHKksq60YoyOVP9sVr5AIlZGz9RsSWUNZWoFAJYKEmfwk
 m2zw==
X-Gm-Message-State: AOAM533nc76Uyv1TnKqOMSer/Cav/9k6CaPzBzGMh7+ARDUzlx0Jpd6b
 KSzD/WM6j3/WhcdMRzC+3rH4YYbxwXHd5ExumO0=
X-Google-Smtp-Source: ABdhPJzV0oJjGR7QcvvX/+OftAD0E7PObsgvUvQRLn8SjPUMi6H0p9Xsn8XPjADNNnRY0KU4//tUQg==
X-Received: by 2002:a05:6000:1108:: with SMTP id
 z8mr15186236wrw.269.1642333661371; 
 Sun, 16 Jan 2022 03:47:41 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-054-082-013.78.54.pool.telefonica.de. [78.54.82.13])
 by smtp.gmail.com with ESMTPSA id h13sm10849769wrx.8.2022.01.16.03.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 03:47:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu: Provide a clue as to why device tree loading failed
Date: Sun, 16 Jan 2022 12:46:49 +0100
Message-Id: <20220116114649.40859-1-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bernhard Beschow <shentey@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fdt_open_into() obligingly returns an error code in case the operation
failed. So be obliging as well and use it in the error message.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 softmmu/device_tree.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3965c834ca..31d1066940 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -60,7 +60,8 @@ void *create_device_tree(int *sizep)
     }
     ret = fdt_open_into(fdt, fdt, *sizep);
     if (ret) {
-        error_report("Unable to copy device tree in memory");
+        error_report("%s: Unable to copy device tree into memory: %s",
+                     __func__, fdt_strerror(ret));
         exit(1);
     }
 
@@ -104,7 +105,8 @@ void *load_device_tree(const char *filename_path, int *sizep)
 
     ret = fdt_open_into(fdt, fdt, dt_size);
     if (ret) {
-        error_report("Unable to copy device tree in memory");
+        error_report("%s: Unable to copy device tree into memory: %s",
+                     __func__, fdt_strerror(ret));
         goto fail;
     }
 
-- 
2.34.1


