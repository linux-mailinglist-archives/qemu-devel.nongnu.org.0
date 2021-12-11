Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E04715CA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:47:50 +0100 (CET)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8LV-0004vC-Rx
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:47:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mp-000525-6Z
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: from [2a00:1450:4864:20::433] (port=43560
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mj-0006GY-Tu
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:58 -0500
Received: by mail-wr1-x433.google.com with SMTP id v11so20314500wrw.10
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQF+uQ2XF/FL5n11Hhd7YnZeqtlVR0LDCO1BybZYM4U=;
 b=foB7WPMaYPo1gU+zp2YG1ZsUa3vIbL0Ge1SIbzAo2oN9pdEAW/uxLYBXFfFlN3NL/E
 bG6XZIQTuw5ooqpVuh6XmsEIBU7jcBoT+OPm6zkRXnDdn55aeO7wVJ2r7ZZFy+dWX3Jy
 aGrlh2s+WrI9avadO3dukrvCBy+l+mL40xkA5hYKwT4qbRVeKs4qO5iTiDRjPnHuJRXs
 XoPoJZyNOD0JGujUu5ctsRdGX/SVUheKXcpT0oFoqJo1+nNqmsdlWo+fm4IYl7XDLVtW
 xwIMkwm2w5WCT3VxU5APdUF5T/ngn5jt+YVqiW5i8V8Y3RW+q8p72FqLBQjlRBxJdREm
 rPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQF+uQ2XF/FL5n11Hhd7YnZeqtlVR0LDCO1BybZYM4U=;
 b=dPIDPBo0L6shn1k97YkKNVs+pi1gMzdWseUfWm/qs+BraE9ODFE5t7J1o3DL38FKZT
 O+W9jCndh+hactx1inq8Uvmp7eKmyYKJH0geTKXoX5Bgmh46f8tGuSKg27HFAS89vGQF
 S6mRtVeTjd/90+tevh80+17tFkp8KVe+cU/96BrejVBqCzTjxurBsq1KGdE43NzHtRPa
 bFULYcCwltj8dwO1MjdaCwUDfPfgbbbmsIXvh3si2r/QEFcVdr4MDGYjhk8DKekL7gOT
 3TAwPlEPBBuuCh6BbiASkhEzHW2emf5fwmN8nTn9DUNrtRmLjU5blJih7Lkg2K7heyML
 hHZA==
X-Gm-Message-State: AOAM533VqYvWAG5zGQkIp4PiXdZqC+U4LqD3HVHjTxnW/OFsZliG7z/f
 C5TFfBPuA4J5jix6ZDCI46fn7mQwCl6O+g==
X-Google-Smtp-Source: ABdhPJxroFemWincnjHTck/xixrrTgBKS9AkDYe1kZFzIv5PJI1bbacz9+QfGCPkdTk09T6uDhvGGQ==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr22309899wrv.310.1639249912021; 
 Sat, 11 Dec 2021 11:11:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/26] hw/intc/arm_gicv3_its: Don't use data if reading
 command failed
Date: Sat, 11 Dec 2021 19:11:28 +0000
Message-Id: <20211211191135.1764649-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In process_cmdq(), we read 64 bits of the command packet, which
contain the command identifier, which we then switch() on to dispatch
to an appropriate sub-function.  However, if address_space_ldq_le()
reports a memory transaction failure, we still read the command
identifier out of the data and switch() on it.  Restructure the code
so that we stop immediately (stalling the command queue) in this
case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 32cf18c10af..f3eba92946d 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -670,8 +670,13 @@ static void process_cmdq(GICv3ITSState *s)
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
         if (res != MEMTX_OK) {
-            result = false;
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: could not read command at 0x%" PRIx64 "\n",
+                          __func__, s->cq.base_addr + cq_offset);
+            break;
         }
+
         cmd = (data & CMD_MASK);
 
         switch (cmd) {
-- 
2.25.1


