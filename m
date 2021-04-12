Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877CA35C411
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:33:56 +0200 (CEST)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVttD-0007sx-L1
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrM-0006dV-1S
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:32:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrI-0000GU-B8
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:31:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id y204so5095998wmg.2
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9+bh8eVoMeOAJ6lrKtP7/rJGWDFxQo0M/ATCBKga2/g=;
 b=yyaHmiiUIpTITKA4nBFBtOrKKVDMiv7KTikHRufqxuLDh7T4+uo6dI+7Lo1UB0g39l
 sMfn599ARc2Rs3hGd71boUBZJN1qGLkQFHOWL6CIk/hxXJvKWz6eWwJjRS/qGcVuGqmy
 7gxUksX2PveHpwLYZ2N0bg+OSnIU/QjqN31Ei9ZuUPnFEoCaxCfEfMG4XFQps17eikBZ
 hOVFU7F8qeyI+OUeIYhAsvJmecfuSVAZh8t5nY+DRuz9XX0KTnVUpsrI5f5kD0/r7PkL
 8wIgxgvQ5yUwTPJNoQOU4wMSsPl4qjWlhdtqIbryYR9eIQyYJxqo3qOnlmx4EG2l1Q9b
 T7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+bh8eVoMeOAJ6lrKtP7/rJGWDFxQo0M/ATCBKga2/g=;
 b=XIHHGneshCPuNxkCUYg3zgLjLFSpDQUdXyS8f0sHUQizooV6Z5hh+kRHfOYkEY/Ebd
 6XaUksbidchnuhMqz/HEV8nDHFnfeZphHjCAPYXmorgbHdpli2GWERxGsZvQHrQpDHYH
 gyCYUSOGRQm2Mu02BWv37Ku5x0BIlVmmFtadUWf/xkeDbaZBJd6wWivRKlukCn5ihgrp
 cUx06ToSaZItzQNtfWsLMqEGF38MOrlg4IiG62JOUJ9HyBPVXZpCP86EyUpX5WBnSOI4
 BazhXAKhzLeHcj27hRGXXeoh+PtlyVbfIudG1uzD/5j8hGVLlK3RosO9zl7NkOBV+FmA
 WtMg==
X-Gm-Message-State: AOAM532TsRV3h0sWiRgoA2v8MLztPkVH+aP0BF3C/yU41lhVmwqIoQn4
 SEohbO9kJ+BmzeNziq90xTpV/iG8ruXrq9tX
X-Google-Smtp-Source: ABdhPJx2ZW1+o1UFMeMdOHlIUFh/nj6AK6FKSqIClsPgnki6VyAjVY9xIP9a04j7RdLGaFH4PcD+LA==
X-Received: by 2002:a1c:2587:: with SMTP id
 l129mr25800038wml.135.1618223515098; 
 Mon, 12 Apr 2021 03:31:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d2sm16878651wrq.26.2021.04.12.03.31.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 03:31:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned range
 of StreamIDs
Date: Mon, 12 Apr 2021 11:31:49 +0100
Message-Id: <20210412103152.28433-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412103152.28433-1-peter.maydell@linaro.org>
References: <20210412103152.28433-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

In emulation of the CFGI_STE_RANGE command, we now take StreamID as the
start of the invalidation range, regardless of whatever the Range is,
whilst the spec clearly states that

 - "Invalidation is performed for an *aligned* range of 2^(Range+1)
    StreamIDs."

 - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
    aligning the range to its size."

Take CFGI_ALL (where Range == 31) as an example, if there are some random
bits in the StreamID field, we'll fail to perform the full invalidation but
get a strange range (e.g., SMMUSIDRange={.start=1, .end=0}) instead. Rework
the emulation a bit to get rid of the discrepancy with the spec.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210402100449.528-1-yuzenghui@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b87324ce22..87056125357 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -980,16 +980,20 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
         {
-            uint32_t start = CMD_SID(&cmd);
+            uint32_t sid = CMD_SID(&cmd), mask;
             uint8_t range = CMD_STE_RANGE(&cmd);
-            uint64_t end = start + (1ULL << (range + 1)) - 1;
-            SMMUSIDRange sid_range = {start, end};
+            SMMUSIDRange sid_range;
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+
+            mask = (1ULL << (range + 1)) - 1;
+            sid_range.start = sid & ~mask;
+            sid_range.end = sid_range.start + mask;
+
+            trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, sid_range.end);
             g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
                                         &sid_range);
             break;
-- 
2.20.1


