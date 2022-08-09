Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3C58D8AD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 14:20:49 +0200 (CEST)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLOE3-0002ns-KB
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 08:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLO6m-0006sN-9r
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 08:13:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLO6j-0003b2-VI
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 08:13:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so4028121wmc.1
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=Q/Vdb4g3NvCJHLVVaiYB9dNbfKbq468Y1+VUKHCVpbE=;
 b=AyR5jSTL/PrVgDNx8eFQ+2pUE6FOkPO9Tddb9txeGeew9Jq2AdOw0NcgHuRZFcWx90
 sJkezhIPyiuMVzC0lxt6CxTHgoVBgUEndP4Iz6EdKF3U45YQmUlFRNK+2F6RpmdOc+IS
 mji+Za0D8IiRUfDlAZs8D3jyOCEstqRTN+RTgdLuHJup54OuAMIlE54A1GkIKGSSXlSv
 +fe8jgnX/AXKQxaVaSgrsNLakUyn8ClcSkGgsYXRVK7nPe52eIjEMAzYfjqKqOmnNR39
 SsbTR6e5kxw6XXQm4nq5pwQ+HGj0nPqgXbJs3a1ehJcgrBPJ/uswhjnx+livC/1o3dz0
 OzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=Q/Vdb4g3NvCJHLVVaiYB9dNbfKbq468Y1+VUKHCVpbE=;
 b=pcHdDsGyXq6gyiWqanF/2oYNM0V0cD7ElRhEMFD7k6D25yd+PkAIE5cJ8W8RajDcDh
 9Ndn2RXronkSfRDI5q3Jn9XTvhW/dOEUsqZbXdC6LhLPrvE0FjNFCk0RPmqXv1/q+jIV
 8N1CeKBjeP57tKx1tsKSyF96pQV+yLrMAoyp3uNJnAUYPk5Sf5OhrB7MLKWcHWKJVEAd
 QXpXjmpTIRRuqt5c4wzPesHrmqNdKb7Ab6cEx/PtSl73gk0F5HPyIDQC9H6QPU4TUKf4
 KqFDR7VkLZubnHoPlVSoBl03wg1HTOqaI04MRF0p7xrQWZIHEXZVZbEk3Yv0/OolPAlO
 a6gA==
X-Gm-Message-State: ACgBeo10MURrcZgpP/pVu0AL18/PmPbP/Kl2kr44ThSZEr5kXF348U3r
 tFqc18gW811DARDvUZtq1scS+ZDSMX4XoA==
X-Google-Smtp-Source: AA6agR5GOM6hlTqJeXG+mzAyXbGLBaQck5zM3dSzr63LwcvMv5zFp6RLJSYQhmuRMOjzhhUmOWwVoA==
X-Received: by 2002:a05:600c:3c8c:b0:3a5:372e:aba8 with SMTP id
 bg12-20020a05600c3c8c00b003a5372eaba8mr8413944wmb.162.1660047190840; 
 Tue, 09 Aug 2022 05:13:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a55e5d0d54sm2423169wms.36.2022.08.09.05.13.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 05:13:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] icount: Take iothread lock when running QEMU timers
Date: Tue,  9 Aug 2022 13:13:07 +0100
Message-Id: <20220809121307.560286-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809121307.560286-1-peter.maydell@linaro.org>
References: <20220809121307.560286-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The function icount_prepare_for_run() is called with the iothread
unlocked, but it can call icount_notify_aio_contexts() which will
run qemu timer handlers. Those are supposed to be run only with
the iothread lock held, so take the lock while we do that.

Since icount mode runs everything on a single thread anyway,
not holding the lock is likely mostly not going to introduce
races, but it can cause us to trip over assertions that we
do hold the lock, such as the one reported in issue 1130.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1130
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-id: 20220801164527.3134765-1-peter.maydell@linaro.org
---
 accel/tcg/tcg-accel-ops-icount.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 8f1dda4344c..84cc7421be8 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -109,7 +109,13 @@ void icount_prepare_for_run(CPUState *cpu)
     replay_mutex_lock();
 
     if (cpu->icount_budget == 0) {
+        /*
+         * We're called without the iothread lock, so must take it while
+         * we're calling timer handlers.
+         */
+        qemu_mutex_lock_iothread();
         icount_notify_aio_contexts();
+        qemu_mutex_unlock_iothread();
     }
 }
 
-- 
2.25.1


