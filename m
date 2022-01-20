Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4921449529F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:51:02 +0100 (CET)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAaeK-0004u9-01
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:51:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0004JF-Lm
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:14 -0500
Received: from [2a00:1450:4864:20::32f] (port=42949
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgb-0003J8-Ie
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:06 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso10085036wmf.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wdLUqpPXIVhIxJn/y0Ry8LmHLdVQEvWxzFrl/eWpdGs=;
 b=p0SLMOU0NDGYsPLinD0fQo5lKh5DfQsMqTLCy2OCuJF0mewuc38y6sihEm59kRxXbi
 8NF7py5s9Ge40QwLRqyys7WAFABsQl54yLDorJFMiFSyVGxwCMpBh6bmY4nz8CP5Gx6U
 Mjc2xgfjArUx7VyCcV+Mn0xIa//u2oGiQZ+92E8h9lNRcvCNwMYxr2Loc/5JaH2yXxwM
 rdhOoihmYH3JMah7dQyMppSupSpO8Y5Vujkh4CF8pBDGTBXS43cvDQUbpLEV4C99WCqw
 cIj3bMxNjwE8pR6VHK7WWNifTC82OMO1PfWAFrElAPoXr5/iFNQHZQEspy61UYE8OabT
 Sz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdLUqpPXIVhIxJn/y0Ry8LmHLdVQEvWxzFrl/eWpdGs=;
 b=cGpf6OpRW9fmXHOdwKXhgUlCY3TG2r7eFq6IQ8YGGiRnApVUwxhKsE9UZ+is4gytb8
 XnLSOpNQzhVFmXYGQaE486lFVAFYiGPQHnFJk+wklBk9A2aCu9T9GgiNqmeAP3uFdU5P
 VeVPNnhJoSlB0YuMdyfRdLZEHfkc5+8LFUZKUen+R3xVQF+sL1s9kNUbZ+k65h5PlyLE
 gBL3iATwIR5Scr+4FHmqN1g2LOjR7R3FzbR17HgAxKcJUl6QMywX9aFg9ls/kJ6N6KJ6
 n0AMK+Bvg2bjEHp0RoqePeFL/c0tncyIdygGW0K09AUa8RPnpOidQs1TA7IWZY9IhlUb
 Sd5w==
X-Gm-Message-State: AOAM532leHiahNXFcBtcoKhKsnKGNDFjH3c6kSLj5ZVSWHtVRsd2Lrfr
 PEWrkHICUZOWWLkw06GLQtztgxeMl1P3xQ==
X-Google-Smtp-Source: ABdhPJwXi45MBkXjkZCFKrhx65k9/JfyiAMETsiM6JOJ4c5caOQBo3udIJxoVR1lj6ggKctF88igtQ==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr20053923wri.386.1642682223294; 
 Thu, 20 Jan 2022 04:37:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/38] hw/intc/arm_gicv3_its: Fix handling of process_its_cmd()
 return value
Date: Thu, 20 Jan 2022 12:36:19 +0000
Message-Id: <20220120123630.267975-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

process_its_cmd() returns a bool, like all the other process_ functions.
However we were putting its return value into 'res', not 'result',
which meant we would ignore it when deciding whether to continue
or stall the command queue. Fix the typo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220111171048.3545974-4-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 5919b1a3b7f..a6c2299a091 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -678,10 +678,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
-            res = process_its_cmd(s, data, cq_offset, INTERRUPT);
+            result = process_its_cmd(s, data, cq_offset, INTERRUPT);
             break;
         case GITS_CMD_CLEAR:
-            res = process_its_cmd(s, data, cq_offset, CLEAR);
+            result = process_its_cmd(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
-- 
2.25.1


