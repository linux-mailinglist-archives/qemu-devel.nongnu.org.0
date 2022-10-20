Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408396063A4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:58:00 +0200 (CEST)
Received: from localhost ([::1]:56408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWze-0006XR-5m
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:57:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWpu-0004s2-VQ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7c-0004zX-Kc
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7a-00012B-H3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id y4so1219182plb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5vQArXkcT1RDMZRTO1vvTA3LiXCIJpRLbh9UK0Nx/ps=;
 b=PwzN2oEjJ6ZCCBg1eBrS0el6pn6MNkWb0t6fQvc29aUC4M471+SJE5zwL/cdRbhxC0
 Iaei/8yIOKzEcUFFsJK9lo9dEhmlSegZ7acgOmpnuCK7wUyMSD4yUecQlFHfho0v/ase
 oM1GN8baFC9+X/zQ8qhVcBLC1981d1IYZyh7rI7XGQgy9DOAC92pUmFQ3ioNdRH/AZE1
 ue6KylKRlKWbQBBENdM26MW2s1gMLNPD9MNlzv4+4Na+yff2MY7VXcCc65Bwo/9cq6/b
 Dep6LwagbRCK201ozOfS6oBqiNWy5Q6CjNQuweRglT5l5fqx0But6Bzotj6l+zhUgU12
 eJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vQArXkcT1RDMZRTO1vvTA3LiXCIJpRLbh9UK0Nx/ps=;
 b=ioIpYzUX2s20YWGD9VUz+Qv6x97+1nmtdXRJ++5gyQHBI7fLfTlNb9TNEYTLF2b47J
 c6BoZKvWE82OgoHo7G/oOQ0DWnzberifiI2vuhjTH301QLVE7merZXEGMbC8Qu79rK4n
 GEVnE4y9fP3lS1RhfhF3i11UlzD6yra8qauxoy2zvG0WQ8uwHkhEH1yqlAIHJn1GPBt0
 hQ/WzltPrHFyVX5lvQ1NMjZPq8ygQK4/RMYY30Mxi6jh8YpbTQaif/cxMPF9K762OVfR
 ep7YhkiKKLNYH036zLnJz40C67E2iwUDNZAC/YLiAr/SrwcxreOh/BaMnFLp0MdwyGLe
 1+iw==
X-Gm-Message-State: ACrzQf0j9ayy1aSfVeoYxlTQRP22/dA8TXbd6Vpd9XWbBTZezq0RbXYX
 eB2PqruIxnrdp90sBfF1n9Cc+jxsk9Q4cvhC
X-Google-Smtp-Source: AMsMyM6nodqPcLn7x6hLcq6IV/SQfO3R5nMPBoBrzi1ik3UHzBMtZWBdy8tTSFkkZCGMqV9Nh+Rhcg==
X-Received: by 2002:a17:90b:e0e:b0:20d:ac00:d261 with SMTP id
 ge14-20020a17090b0e0e00b0020dac00d261mr14950454pjb.214.1666266836081; 
 Thu, 20 Oct 2022 04:53:56 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/31] tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
Date: Thu, 20 Oct 2022 21:52:25 +1000
Message-Id: <20221020115242.2301066-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Prepare to replace a bunch of separate ifdefs with a
consistent way to describe the abi of a function call.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2c06b5116a..f574743ff8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,21 @@
 
 #define TCG_HIGHWATER 1024
 
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+} TCGCallArgumentKind;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-- 
2.34.1


