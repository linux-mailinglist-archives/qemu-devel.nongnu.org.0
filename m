Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6FF51C534
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:33:46 +0200 (CEST)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeQD-000118-Ll
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBT-00027z-9u; Thu, 05 May 2022 12:18:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBR-0005kq-Qm; Thu, 05 May 2022 12:18:31 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g23so5789173edy.13;
 Thu, 05 May 2022 09:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97XDoGXF8ui7gYguRxMIJDkZD5oW/orGdMFAxRwFGnY=;
 b=mGOtyPyxMTHSW0IA88ez1nV+WDhnuTPBCSmslnflOR4EiRZMvfXnbHHVRijy+UwRf2
 LT/hFWuQcetaXkVYddYPbYPHTNw23Ij03saVSIyzoonkqyNenAgkL5YV64BTCSAsnSq/
 pXIt045SnkTODFbTMTpnCeikhXh+HevzdPQPsdI6XCdX/i8q1VfoTE9Rd0XGvCsgwYPP
 mT7B2l7T2U+mDHLuTd07Yy+WuwRIDa9f/7NB5CP75GWdPcObS2RoqcON10uPWQk7aTiV
 gI8pl/n7vb6HGpY134g/ophulmX2TUZvTYUkVK0NFCVGGgOMJX0bfULzkdhCAPwLmRVO
 /n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97XDoGXF8ui7gYguRxMIJDkZD5oW/orGdMFAxRwFGnY=;
 b=rRVn5XH1Bk67srst7OssGt1MedthnKC6Z08EIIF8iKLDIemnQeWa0jMOFjVQCpx/SI
 rBAgRF1d0AFOSNZZdMtzL74EHOG5r8aTEL36RPkPXuXBB4pNr1uIu9pocmXNGO8nRXB+
 DY7G89M5sDCV49VgBzhpYikYyEALmimmAR8QxZ4+Uz3nJ3fJ8NzMiwiOJosN42baebRw
 /Ymi+RFgabHJ/Qcg0elZ18Jmu3qbwibqzwmDf1nTW1pZyDNoFqMgD02NuKHAWMWK4M0E
 zIzfuLVBxdars/AwuCdu6jmoBtqZ5NxL9eWBsQb8QD9jbxhFMMEG4ivSGh6iSxpRyveY
 2HPg==
X-Gm-Message-State: AOAM532i8lwDxonZuQLgJvkparbO0LpfkIvdlUnrYgcHlWg6cFDALozZ
 NmxzLhCL5X5ronTSnIiA5tw0a+opy4M=
X-Google-Smtp-Source: ABdhPJzVQ2lRvObH/BkCHFg/IcL9CGRfogXyDEux2AYlHwfjP8OnFYwzvg4HRO2TbU5fR6sr+8v1mg==
X-Received: by 2002:aa7:c849:0:b0:427:d464:e66f with SMTP id
 g9-20020aa7c849000000b00427d464e66fmr19965123edt.411.1651767507619; 
 Thu, 05 May 2022 09:18:27 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:27 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/11] accel/tcg/cpu-exec: Unexport dump_drift_info()
Date: Thu,  5 May 2022 18:18:03 +0200
Message-Id: <20220505161805.11116-10-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Commit 3a841ab53f165910224dc4bebabf1a8f1d04200c 'qapi: introduce
x-query-jit QMP command' basically moved the only function using
dump_drift_info() to cpu-exec.c. Therefore, dump_drift_info() doesn't
need to be exported any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 accel/tcg/cpu-exec.c   | 2 +-
 include/exec/cpu-all.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 635aeecc0a..7cbf9996b7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1048,7 +1048,7 @@ void tcg_exec_unrealizefn(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
 
-void dump_drift_info(GString *buf)
+static void dump_drift_info(GString *buf)
 {
     if (!icount_enabled()) {
         return;
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5d5290deb5..9a716be80d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -419,8 +419,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 }
 
 #ifdef CONFIG_TCG
-/* accel/tcg/cpu-exec.c */
-void dump_drift_info(GString *buf);
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
 void dump_opcount_info(GString *buf);
-- 
2.36.0


