Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70857CA06
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:54:41 +0200 (CEST)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEUlM-0001R4-HV
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEUj3-0005uk-79
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:52:17 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEUj0-0006YS-BV
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:52:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id z13so1869787wro.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxJwjVAzbS0o6r9Gh4EM7dFWlXeZcq5sXf7+Lmnjej4=;
 b=JAlrrGIhijtxWfz2ZGXU1tU9NQqC6Mus2tb/9erwjDra90zriFK4jWhHTRa8f0RR18
 6xFcD/uNm1xjwRDVKym0toUF21QunzYNcR8/EBQ/iYLDNVFvaT6Fs5I0bIfjzmFT1EHB
 HFe8x5I9CS4PlvF+mT+U3E8AMN5dcoD45m+/ld1MEbJN9ZQTjXbMo3J4hEqd7O5jCxjM
 Mo+mRHohEqPJs4WfTEOa1txasr7u02DsIj0k7KmAMJa+odhgT29962XTLeZ54IcgZmVo
 UHVbqZ3ZM5H9axyMtfJ6NiXQZtaz1KfWAhaArTHY0p5aKVohHqPYtYx5CKfJ8aBIcky2
 Xwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxJwjVAzbS0o6r9Gh4EM7dFWlXeZcq5sXf7+Lmnjej4=;
 b=S6TuTMJsbaOo92khFXn29vqCEJRgxKnanHQdYs8APOnGuU+5xxRY/slOWxD3QDzYsg
 PYiCYGfqtta3RB2LMFHOXxOtjNHMJtxIfANiwe43b4aln9IqxXZW7rqrz4otgUX0B9P0
 TVyQST47vmoXKYIGnOGzh25hPp0uMlCSWToKApgUso/Snm2Gy5yiENn5PbHI+vpm67U7
 iO9dwOK4lPfp7ogYEKFb2J8joQTXacfxh+i72M726EQQmoFQY2mcqo5pf9bG+lG9+te2
 j+ID2VRGq0dAq76vmae87K3YdemY1ofzLW4RniKwYpMCgi5g8leTo63CgS5X+YyZSfHW
 Sy3w==
X-Gm-Message-State: AJIora9cLqk7yeFh7A88TsGgSxgABkhOp9DLGvlE448fOq/HdkNDPzwx
 XRqjHB4XG966y4XlgUuJuHTjnMtoZg/5Aw==
X-Google-Smtp-Source: AGRyM1vp4lPIC5QgiM1iUJdKCgqsXHDwNOus2Xs0yCq+ILV+wK9dR6Cv7tZQzmDySP+v4lOmNSzkGQ==
X-Received: by 2002:a5d:64c2:0:b0:21e:2e1b:d031 with SMTP id
 f2-20020a5d64c2000000b0021e2e1bd031mr10664854wri.8.1658404332957; 
 Thu, 21 Jul 2022 04:52:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a04d19dab3sm11772745wms.3.2022.07.21.04.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 04:52:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 2/2] migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long
Date: Thu, 21 Jul 2022 12:52:07 +0100
Message-Id: <20220721115207.729615-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721115207.729615-1-peter.maydell@linaro.org>
References: <20220721115207.729615-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When we use BLK_MIG_BLOCK_SIZE in expressions like
block_mig_state.submitted * BLK_MIG_BLOCK_SIZE, this multiplication
is done as 32 bits, because both operands are 32 bits.  Coverity
complains about possible overflows because we then accumulate that
into a 64 bit variable.

Define BLK_MIG_BLOCK_SIZE as unsigned long long using the ULL suffix.
The only two current uses of it with this problem are both in
block_save_pending(), so we could just cast to uint64_t there, but
using the ULL suffix is simpler and ensures that we don't
accidentally introduce new variants of the same issue in future.

Resolves: Coverity CID 1487136, 1487175
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I haven't tried to analyse the code to see if the multiplications
could ever actually end up overflowing, but I would assume
probably not.

 migration/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/block.c b/migration/block.c
index 9e5aae58982..3577c815a94 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -28,7 +28,7 @@
 #include "sysemu/block-backend.h"
 #include "trace.h"
 
-#define BLK_MIG_BLOCK_SIZE           (1 << 20)
+#define BLK_MIG_BLOCK_SIZE           (1ULL << 20)
 #define BDRV_SECTORS_PER_DIRTY_CHUNK (BLK_MIG_BLOCK_SIZE >> BDRV_SECTOR_BITS)
 
 #define BLK_MIG_FLAG_DEVICE_BLOCK       0x01
-- 
2.25.1


