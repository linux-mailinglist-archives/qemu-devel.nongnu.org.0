Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3655B459517
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 19:50:46 +0100 (CET)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpEOr-0007e4-B2
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 13:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpEIn-0001hv-8o
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:44:30 -0500
Received: from [2a00:1450:4864:20::335] (port=41932
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpEIl-00011I-A7
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:44:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso647775wmf.0
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 10:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USR1GRpnXyMB7uLuhjpUpexu6PRCZ4StaV1dpc5U93E=;
 b=qus72UTqYaO5xFZ8QWbWbEZXp8AYXmSrjxZWX7sGpbObbmoyn7tpv0vDtc4uPdxlgA
 z2jNklhAPf9NkWcVWCXxuCtzHhH9ERhgLsXJoU6bsSLh7t1/0ZzwT/0+G1K5IeQHZWRQ
 774XdGzxmOFUH5vX0ODjaMxWjcmQltTFdhMxtDx40gpLgOW2o9Y7RcSsb3sYnP/xBNmr
 2ik7lEl8A4jtf/IvCsbj3si7fcEUp0yurwKAZNe8+pniAVdJyZaAKQNCRQ+pu4wKmsux
 ibyuCLBbAMK3Tvf3tz7q2zEy0pVcyQW9eFWabREvW1+G6QYds7ENUc/ifVBlz/Tno0HS
 zIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USR1GRpnXyMB7uLuhjpUpexu6PRCZ4StaV1dpc5U93E=;
 b=GCW+uRL0ZYs/GZ2ehEmKjUctrB+P4ML6n3JRNJYqMzxZjoRkZbFHLzf0K09ViUNRBR
 bpBN2MaJUUdN2c2qY/GBrJyTtH8sL5sO7qXBA2nJYIGhfym2rihRHy5NCfHAbHQzrW+B
 Ml9gRD4h0a1eSzqkpvVFpNfthyMyvqwtM7P9aqH+AV0FUUUo/UlH5xhWu3TTy8Oxxsi3
 YTw1sKyEQQNIgLW/8j5egdAsW6IoqfghsiIICHaMEa97VyT0p+1ZOWUILqAkoFpALTsj
 86+Fai1ENpaFaZNJY6KhNMHlHAiJ0/p97I4IrdHFLtezfWc1Q9smpkia6GCcEYSBmMZm
 Aaaw==
X-Gm-Message-State: AOAM532ThPMG4mwW1e6Keq+Rhx/lIfvsa6egTLCbrhIAl43ae5+IVbsA
 l/wK6pZUXLVvU6PimeMgFp9qKciWw3MEew==
X-Google-Smtp-Source: ABdhPJxdqeaScFbMJZHxT9Z2+LSmHTbnp3SXMWQuseWVffjJ8HIzHQ/6ZVrYDKEY7TduTf+TC8oblA==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr32928889wma.129.1637606665167; 
 Mon, 22 Nov 2021 10:44:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i15sm26298163wmq.18.2021.11.22.10.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 10:44:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] hw/intc/arm_gicv3_its: Revert version increments in
 vmstate_its
Date: Mon, 22 Nov 2021 18:44:22 +0000
Message-Id: <20211122184422.901437-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122184422.901437-1-peter.maydell@linaro.org>
References: <20211122184422.901437-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Commit 18f6290a6a ("hw/intc: GICv3 ITS initial framework")
incremented version_id and minimum_version_id fields of
VMStateDescription vmstate_its. This breaks the migration between
6.2 and 6.1 with the following message:

qemu-system-aarch64: savevm: unsupported version 1 for 'arm_gicv3_its' v0
qemu-system-aarch64: load of migration failed: Invalid argument

Revert that change.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20211122171020.1195483-1-eric.auger@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its_common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 7d7f3882e76..90b85f1e25c 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -50,8 +50,6 @@ static int gicv3_its_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
-    .version_id = 1,
-    .minimum_version_id = 1,
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
     .priority = MIG_PRI_GICV3_ITS,
-- 
2.25.1


