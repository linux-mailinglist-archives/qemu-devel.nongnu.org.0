Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B531C3E6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:03:27 +0100 (CET)
Received: from localhost ([::1]:44616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlxm-0002t8-6O
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBltA-0006RT-DX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:40 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt7-0007p4-3o
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:40 -0500
Received: by mail-io1-xd36.google.com with SMTP id n14so8241474iog.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AY0JUC3KB08rT1AI068cSkWI8i34wh3yvaVkhXHWL8Y=;
 b=SkVw2XH31K6ikyCvmF1DNjGgisZlZkiZC0mXlauRtKs/w1ONH96w0+LL4wff9QMz+V
 cvg/Qmk1/K37GYxVY/LtNpOh4x+6OWOIa7be1v+xaHTBK9ogo9SaQj1h6noNzjOzR4OM
 qV+QhvgYGRdxuYMbwyDOCB6UcguCidjS54kp5bp4Qa9WPTuPY6aOcHcpWY1KipaKdVd6
 JrFXumtNPc8ntijlNs6+TcTRC71VzfJBoxwUxJoV4+Dnhh/Oeuur+uozBpEgugUdI+OF
 XYMR2IJkHiZQAzXGOpSmAL65fuzxx0pn5WbY2703Kc20XEHWdAscW5qV2ThMtiXQDiKb
 oi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AY0JUC3KB08rT1AI068cSkWI8i34wh3yvaVkhXHWL8Y=;
 b=q8Yj28k0uiB4/FMj0QTACh0By0cFnxf4bxm++qN8aAtRbYcsHbbOteZvIEXzavyBz2
 T+DcLcZMBbcuF65TggJWztpbGC9NfQk1pSbS3Svp3IifDgDugc3XEML4dbv5kZpvn4FI
 CLb7Vk0IrvYgNdTbUaJaIRpCydJepxpLdGubV8B3RXFt1E3DojcH+jC2YeH9xbX34i1H
 7aVllct4Hm6Wl65WwQS5RIGOSSg/9/rL/rkbF0l/lyvKoJTe4/tBUCIqnYCMkgpS4Vga
 XISZY2rRrdR/Wc0PhFCEXvZeQXtlPNDqh/zoJkhiTBR2Za0W1VlgNqKvvsFQV4mf/1fY
 1dxw==
X-Gm-Message-State: AOAM530ML+IIo/r+vOXMJecT4t1mdv2y8QAqhCuM9WR9mGb7+chFSXSo
 Y4DfmILAmEK+nStenYIUqDz8cA==
X-Google-Smtp-Source: ABdhPJxhBf6gXZjY3GaazNFCa5ZrYGQpDAZXPVCKA2oFQDTReDUuR1oYLi+rCn4YkphPgByeBxH1Fw==
X-Received: by 2002:a6b:d207:: with SMTP id q7mr14444206iob.42.1613426316126; 
 Mon, 15 Feb 2021 13:58:36 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id j12sm9812254ila.75.2021.02.15.13.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 13:58:35 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU
Date: Mon, 15 Feb 2021 14:58:19 -0700
Message-Id: <20210215215819.1142-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215215819.1142-1-rebecca@nuviainc.com>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable FEAT_SSBS for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cf6c056c50f..88a6b183d325 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2206,6 +2206,10 @@ static void arm_max_initfn(Object *obj)
         t = cpu->isar.id_pfr0;
         t = FIELD_DP32(t, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = t;
+
+        t = cpu->isar.id_pfr2;
+        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+        cpu->isar.id_mfr2 = t;
     }
 #endif
 }
-- 
2.26.2


