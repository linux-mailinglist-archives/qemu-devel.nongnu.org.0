Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A74487B76
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:32:24 +0100 (CET)
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t6F-00039Y-Qq
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw2-000554-4I
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:50 -0500
Received: from [2a00:1450:4864:20::332] (port=46630
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw0-0007sN-LB
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:49 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso2628878wmd.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3lysZ/JZGCb/W/vOgl/A8X+COK6e6bD0XOz6b5zqsvo=;
 b=BNGaJOMmOPpu4gfzJDediJ0AqsvJbC1LzNZr2rPZAUE+UyHBnJj35eqHOnxu2rFcGD
 fww27ar51yS7PO5I5TwRn0v9sScuvZOdsvMXwK4KVkstmUoOsZQFDpw9TrrNWSNLS7pN
 OQAKv65KqkGe/bp2k/azraXvwqek8GIUcN7YHL/ayjJnsN9UULitl4sAPBx1PAYEbbt/
 tnUdLiSJWWJ48jOdA6LtVxPH189VVnDkDRIfKzvecgh3Lon9idnGycbsM8+TwvrqpTBG
 C7PPEGRle0hpfpl/olIbktigUMFWQJ3oQwoQlde+g+uZVZxb9b1ild+Boz9YToDi7NAU
 UMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3lysZ/JZGCb/W/vOgl/A8X+COK6e6bD0XOz6b5zqsvo=;
 b=SWBg/J8CQrvPqyjnPK6cKkTYEIZtrTkaQmxOBublZTxnGWDqS8e1yGzPn8Wf/oJfRl
 031CYTqN6A5OMR9dGhUEDYQQIU0lDuKE0iAcLTRsumOmwK5TZvgOuhYdPdRtPR2JFm5j
 HzQdCDWkCz0JjIJe6Jd1Q36CW4xYnLZ17VlYfIUt/i1xzL7JRbkhIzWntJe8LJ60SxIw
 p6VwC7Zm5I+niavAICc/xgvlXg79mwwabhsgPPfOyBS4rZtlhtxcq8p+rcSMW7IDrkHk
 5/C+AqHOgCr/9whR0CThU5rs+MOo1xnz3L6vJWglqJ8oTCrgYXj5sDRT4TYRs7J1XNeZ
 IC2A==
X-Gm-Message-State: AOAM533Mt1pME0fcsEDtKl1s3cQ8c1GIEfNPCRpa3s+1xI4h8Buh6oFP
 4+DP0sy8n1qsNrwJOTssSCSVMz0iTlSlAg==
X-Google-Smtp-Source: ABdhPJx2TVSMYEgLM6aFX/JWLy9FyScJzEDX1hilai8NeoU+rMm+soZHfQYXEUawWLU7oKyeGddSzw==
X-Received: by 2002:a7b:c0ce:: with SMTP id s14mr11971621wmh.135.1641576106493; 
 Fri, 07 Jan 2022 09:21:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/19] hw/intc/arm_gicv3_its: Correct off-by-one bounds check
 on rdbase
Date: Fri,  7 Jan 2022 17:21:26 +0000
Message-Id: <20220107172142.2651911-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The checks in the ITS on the rdbase values in guest commands are
off-by-one: they permit the guest to pass us a value equal to
s->gicv3->num_cpu, but the valid values are 0...num_cpu-1.  This
meant the guest could cause us to index off the end of the
s->gicv3->cpu[] array when calling gicv3_redist_process_lpi(), and we
would probably crash.

(This is not a security bug, because this code is only usable
with emulation, not with KVM.)

Cc: qemu-stable@nongnu.org
Fixes: 17fb5e36aabd4b ("hw/intc: GICv3 redistributor ITS processing")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b99e63d58f7..677b96dfe23 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -311,7 +311,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
          */
         rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
 
-        if (rdbase > s->gicv3->num_cpu) {
+        if (rdbase >= s->gicv3->num_cpu) {
             return result;
         }
 
@@ -505,7 +505,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid > s->ct.maxids.max_collids) || (rdbase > s->gicv3->num_cpu)) {
+    if ((icid > s->ct.maxids.max_collids) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
-- 
2.25.1


