Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BF8495311
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:21:41 +0100 (CET)
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAb7z-0005Fz-VA
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:21:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgy-0004bX-Nm
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:28 -0500
Received: from [2a00:1450:4864:20::32c] (port=40448
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgw-0003P3-Bj
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a1c4409000000b0034e043aaac7so479775wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3qi68VF3hKwj9nbfCNrptYY2Ss41PAcXZjjUY+w1vZ4=;
 b=Nr1d250sksAXzUjDDT4NjLpPyUtrvJjW7oK4iUUo8V2E7EKyIsOGvRxwHXl2w6nvsS
 0l0gi1oiDqQqPPpGY6TS522dQO3C1m42vvsfQFwxnA5AqrVItsbKhrFrgoLmxolZgl2j
 cxQTLN5nhr6jhSxynpg4O0iZKR8IcKLWUoAHhSQxX0N7Y9ANw7V5G+sU2S4OmRI5BLVL
 YpJTUWfQbQg7RmMUHA4aOyo5JmlGK758s8Bj83ovGo4tWrkAF/0K4TFbL+FcFHBE7ya8
 YW3t+xefFIoCZo6re50XxFcrrH35uoxFAGLWBZJS7KIof9hRvkQbw5nZKAMAgt05ATiJ
 sjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3qi68VF3hKwj9nbfCNrptYY2Ss41PAcXZjjUY+w1vZ4=;
 b=VArJgqV8aE8ngyYjHeoLsgOFoT5w+eOfxtCYSSy9Rfd/6lqMHY1rew92bulRaDKSvg
 CL9STYCZrnqCOBveikRsyNdPqqyHadVPYNvYQm7gsw6s9JS9h9omsDoHX9KXwHqMgZIZ
 EaXoYSWs7+5oyehHC9VE/hK/EnmZLbJ7oCyMFrNarCAET4Mibc8EHkzDMy6asQSfKxsq
 6erGpHsx2HLR4GiYMdDtaNprgsapqK1CL5cKWD33RIsefMb6DSXJSJw0WS8xHsFIC4fN
 aWsXf4n7Idp7+eTb11vNnb+YcoZUEdCUU9iq75UGY7+K6bu8PBLXkTdRuU1kVlHnOxsO
 bzhA==
X-Gm-Message-State: AOAM531NlmYY1xj7yy8e4zxzqp+I7y2rz/wQGV5MUDXCQ0IupmPAaBCA
 TUDGuQnjNY8Wf0EU2yPQvwlTYBBL10uLrg==
X-Google-Smtp-Source: ABdhPJwPEXON+zIfB3HYEb7YS9N96mf9j6qUDF4cdKnQKNjf6JLj/1YPnBilaJ8bPnr9VS6fjUG3Fg==
X-Received: by 2002:a05:600c:2048:: with SMTP id
 p8mr8728686wmg.119.1642682245128; 
 Thu, 20 Jan 2022 04:37:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/38] hw/intc/arm_gicv3_its: Range-check ICID before indexing
 into collection table
Date: Thu, 20 Jan 2022 12:36:29 +0000
Message-Id: <20220120123630.267975-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In process_its_cmd(), we read an ICID out of the interrupt table
entry, and then use it as an index into the collection table.  Add a
check that it is within range for the collection table first.

This check is not strictly necessary, because:
 * we range check the ICID from the guest before writing it into
   the interrupt table entry, so the the only way to get an
   out of range ICID in process_its_cmd() is if a badly-behaved
   guest is writing directly to the interrupt table memory
 * the collection table is in guest memory, so QEMU won't fall
   over if we read off the end of it

However, it seems clearer to include the check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220111171048.3545974-14-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ef6c0f55ff9..b2f6a8c7f00 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -299,6 +299,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
+    if (icid >= s->ct.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
+                      __func__, icid);
+        return CMD_CONTINUE;
+    }
+
     cte_valid = get_cte(s, icid, &cte, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
-- 
2.25.1


