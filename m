Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24456BCEE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:32:16 +0200 (CEST)
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pxn-0000WT-7p
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pif-0002dv-C3
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pid-0002Du-RG
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:37 -0400
Received: by mail-pj1-x102a.google.com with SMTP id w24so18318330pjg.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=ykcqy5iL8i8pOvOURorfK4XajYxKOyu/nILzzejoGJJTomorraf8K0UoY66N4a03Ho
 EraPgnG9p4j39gAKdGJIb6cx3pOQoXGsYSyqE0Bxo6uuTYepuUYOJclouaOBUDio4Nby
 4mto7YjrmTJelbSupIdr/D8rvrJ3XqIZbGhlVhzkDD3hHfuZDtceJEQfaVPzXxUZCpBT
 IHpotTu/1b75bzRuYAWDegrm5Fifay3T/+DC1OFCU6ZgW9Bw0RvUSX/Vhulp8DoDXNuu
 D/OaTvGfgTTGHvhbEeh3eFWkTOwRB060RnFAPoISBBNHCeyfRKxwjvpE+9F4wUpGl73r
 2ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=MWujfKMPoLk2yBL95Dc62ertaoHXwoRxdKu5Q6+L9ahcpF16bCiQ5qIWF11znf/qOU
 7ywRq3ueM4YAVjlPEsP+jdkFDReEs2mOEcaM922VyJsKGGGjL1ZsQF8nKr++2P0/ovG5
 atv7UncpM/gdzMhBdoqLC8gd7HLAq1/arsC8RXUPjOC3rp+2+yj2lPFuuyQvp86P2Q+t
 vokq/LZKMxNUMi8xU+Z1zN2+pRKc0pZjmtSeQKfZBtCY8s2C8iIaXKcsX5sjrV7TgeqP
 +LsioNFoBrWdWxIlrIHwmwxNC4AuiotqO7fxc+hdJShxToQdHzl/OnmPHEgIVC+QSyEF
 ivHg==
X-Gm-Message-State: AJIora8vUFEQyAEYj+hLls3PTF9gjGWtAwFThviVgoFDuDLapZzaKbJx
 pZyAhlm4Tzyj+czgdyAbmLU/O4vCf5zrJINp
X-Google-Smtp-Source: AGRyM1stKrh+FGTLaKzYH6FfAOVqrN3sSYiX0B4eeK5G2yzfxvd74TDXgS7WlfIyEuFByM81bQIiog==
X-Received: by 2002:a17:90b:2c4a:b0:1ef:8f70:e125 with SMTP id
 rw10-20020a17090b2c4a00b001ef8f70e125mr401199pjb.50.1657293395076; 
 Fri, 08 Jul 2022 08:16:35 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 16/45] target/arm: Handle SME in sve_access_check
Date: Fri,  8 Jul 2022 20:45:11 +0530
Message-Id: <20220708151540.18136-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The pseudocode for CheckSVEEnabled gains a check for Streaming
SVE mode, and for SME present but SVE absent.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b16d81bf19..b7b64f7358 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1183,21 +1183,31 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
-/* Check that SVE access is enabled.  If it is, return true.
+/*
+ * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
+ * This function corresponds to CheckSVEEnabled().
  */
 bool sve_access_check(DisasContext *s)
 {
-    if (s->sve_excp_el) {
-        assert(!s->sve_access_checked);
-        s->sve_access_checked = true;
-
+    if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
+        assert(dc_isar_feature(aa64_sme, s));
+        if (!sme_sm_enabled_check(s)) {
+            goto fail_exit;
+        }
+    } else if (s->sve_excp_el) {
         gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
-        return false;
+        goto fail_exit;
     }
     s->sve_access_checked = true;
     return fp_access_check(s);
+
+ fail_exit:
+    /* Assert that we only raise one exception per instruction. */
+    assert(!s->sve_access_checked);
+    s->sve_access_checked = true;
+    return false;
 }
 
 /*
-- 
2.34.1


