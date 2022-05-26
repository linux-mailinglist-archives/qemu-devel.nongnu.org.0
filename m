Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453A5355FF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:10:32 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLgc-0007q3-6L
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCp-0002B2-O0; Thu, 26 May 2022 17:39:43 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCo-0008Ez-9s; Thu, 26 May 2022 17:39:43 -0400
Received: by mail-oi1-x235.google.com with SMTP id y66so3687944oia.1;
 Thu, 26 May 2022 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QcCjekbr2Se/ckjmCMK2hsHUP/DoIy3aVBqGpiabIM=;
 b=Qck3pKNSGXDkZKrm2MrgrNf+ceWM/SpPDCJwVOhWsKz+KlJ8KDQxZsoAyHVOrObknH
 nzab3kJet5l2pYwfE6G3g7L16U2bDFMKvyur4qmESU0ymd0cmhMu2ZkSrM2ySAruA2QN
 aaC4MeLenO+Z9kR9F+PdLbq4vVn0XWIi3/dOH+tEyYIiatbt1JkC9BFONGYFG5PJZL/f
 BP0K4qkhu1/UoS3Mm1IGw4fODBa5QL+yoaNdMD3iA/ZASTHonZ///ITUDaaGXlrWZbDB
 nw39lFwA6i8lMrnaA4wPnBkXLfYRdQYXwT6EdKBnu+NAwKIyGoZJ4/2CWGWkoKDZ3Ebu
 p7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QcCjekbr2Se/ckjmCMK2hsHUP/DoIy3aVBqGpiabIM=;
 b=OuVOU6FIK2GCnmd41HnMSgvhJBo857iunr12MZMsi6CrOnxaX/UiGH5XvEth1Fd964
 aX434C0eNyfeOwffUA0HHyhbkheP3MPqAxxUQea72SWz9wf7GZTe6OK0oRSl8Ud1Wybd
 zx1vjrZQhDWwtN4tmtd6w/pfm7HJfHTl6OEomTVwHkXyhSOgePzcHnnzIftp9JpX0W/o
 O7376TA762A0L9AWHYQu4zG6skRmsdVbEtoQzprBkNDUk/Cz/Uc3VNEY6SVX4Jq3Glav
 IOPVJ7iXRwo3HsR5qKnmjZ/53XJqLZjH1MVXV+Yxsyak4YjZIMfQ19u0fjNt8OsTdcJ1
 CQ1w==
X-Gm-Message-State: AOAM5301KNSu3IXm9ZEzo5u45DAfeh0ScY5jlZTZZtAvdERNFYT5+NMS
 rhP94VCCEOZtYRnps8MOHTNsnAjoCW8=
X-Google-Smtp-Source: ABdhPJzrI9N+yK9aSx4FOwYSbSpCiibv93Ayc7tWXyNRLhcB6pYqy1SO5p98cnfcNXC3HDPZAGH0NA==
X-Received: by 2002:a05:6808:1b29:b0:32b:6a06:8135 with SMTP id
 bx41-20020a0568081b2900b0032b6a068135mr2369916oib.220.1653601180947; 
 Thu, 26 May 2022 14:39:40 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Nicholas Piggin <npiggin@gmail.com>
Subject: [PULL 25/34] tcg/ppc: Optimize memory ordering generation with lwsync
Date: Thu, 26 May 2022 18:38:06 -0300
Message-Id: <20220526213815.92701-26-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Nicholas Piggin <npiggin@gmail.com>

lwsync orders more than just LD_LD, importantly it matches x86 and
s390 default memory ordering.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220519135908.21282-4-npiggin@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tcg/ppc/tcg-target.c.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 4750091c9c..de4483e43b 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1832,11 +1832,14 @@ static void tcg_out_brcond2 (TCGContext *s, const TCGArg *args,
 
 static void tcg_out_mb(TCGContext *s, TCGArg a0)
 {
-    uint32_t insn = HWSYNC;
-    a0 &= TCG_MO_ALL;
-    if (a0 == TCG_MO_LD_LD) {
+    uint32_t insn;
+
+    if (a0 & TCG_MO_ST_LD) {
+        insn = HWSYNC;
+    } else {
         insn = LWSYNC;
     }
+
     tcg_out32(s, insn);
 }
 
-- 
2.36.1


