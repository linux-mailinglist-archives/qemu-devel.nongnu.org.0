Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F338E7AA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:30:43 +0200 (CEST)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAfK-0005iT-Pc
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll6B7-0001iW-5a
 for qemu-devel@nongnu.org; Mon, 24 May 2021 04:43:13 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll6B5-0003u1-K3
 for qemu-devel@nongnu.org; Mon, 24 May 2021 04:43:12 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p7so23924359wru.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5vCchJTb7GEbpfbedteaBDjGdQPYwb2tJtpla8Bjo4=;
 b=GHe0wSQnIRdGH1QJmN15ywx4rSQhTHGol2S9l8b/BfcpvUfhZ9LRTRtxquKveayIZ8
 9nnkGYzNcSgunz0LY8Mj8LhaV9cN1BYCMvr5e4O88M1W39MqCocTKuc8xcAuDl+WAiAY
 poamHUv+B13uGmRFl/4OvJ9sV/qQr9sDVV3GZcknZHZK0N+bj+QeYksYReopj3YuFnsI
 AU9oQYcZ4d/khWRgXQEvXk41IeCwCX/HG1Ar7Z//X+0fU6FjkGxnXPyedIfZtq+6IXPm
 421ZV32yTFeamULJu7TlMdewI+4ZfyrRE66xTtUnVJevep2MZkkHt60035dwvZuLWWVL
 H4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5vCchJTb7GEbpfbedteaBDjGdQPYwb2tJtpla8Bjo4=;
 b=hTnfhn3Q+PYcIMNowEPfkYIKrvDM+qkuJFAQo9beMt9KfoplqVXfCglLvOIU5pENu8
 0CHECUz7KnJosadTZeiEwALCPN3j/pTrLyZEiq7opE0rHTGRpBkQhaa5atFtU74Jf8rt
 FAwlexup7Ptl2jinKTyEqLz+9EAMj8xLPijMZHGGkA/trn4rUdJGZZsPWRX4Dem0b/Je
 kZlkJRvE5QRWywbLukx14l4qt6FawBfAlGR0+wIVR0moP68NyRq7UkMdE0WV10AMy2tq
 +4AWpJQ1Aj98w8Tj8xzUjU3bE+hg1NS4zfvMWY939iEjzOMKbCf79DOuLax9jrbAAAiP
 8b3w==
X-Gm-Message-State: AOAM532kIBn55a6ovEB4sI2wuVXzgUg8EF0e6XTDzp2IcPqrJbMgc78K
 wUM5xivdGhR9g0BRkdfkONJxMQ==
X-Google-Smtp-Source: ABdhPJyZNwpeKIM2H2ijlHi/WzSswmXnpWo07RRp+kfiIE90kDNYZEV9ZOjza4FQskKIlB2DbEIaPg==
X-Received: by 2002:a5d:654f:: with SMTP id z15mr20791984wrv.64.1621845790357; 
 Mon, 24 May 2021 01:43:10 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id i11sm11505262wrq.26.2021.05.24.01.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 01:43:09 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: don't clobber ID_AA64ISAR1 pointer auth
Date: Mon, 24 May 2021 09:43:06 +0100
Message-Id: <20210524084306.1666265-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 May 2021 09:27:40 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 leif@nuviainc.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pointer auth properties are added to the max CPU type but the
finalization happens for all CPUs.  It makes sense to be able to disable
pointer authentication for the max CPU type, but for future CPUs that
implement pointer authentication and have bits set in ID_AA64ISAR1,
don't clobber them unless there is a property registered that can
disable them.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/cpu64.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..81c9e494acb6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -575,26 +575,31 @@ void aarch64_add_sve_properties(Object *obj)
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
-    int arch_val = 0, impdef_val = 0;
+    int apa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, APA);
+    int gpa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPA);
+    int api = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, API);
+    int gpi = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPI);
     uint64_t t;
 
+    if (object_property_find(OBJECT(cpu), "pauth-impdef")) {
+        api = gpi = cpu->prop_pauth_impdef;
+    }
+
+    if (object_property_find(OBJECT(cpu), "pauth")) {
+        apa = gpa = cpu->prop_pauth;
+    }
+
     /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
-    if (cpu->prop_pauth) {
-        if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
-        } else {
-            arch_val = 1;
-        }
-    } else if (cpu->prop_pauth_impdef) {
+    if (cpu->prop_pauth_impdef && !cpu->prop_pauth) {
         error_setg(errp, "cannot enable pauth-impdef without pauth");
         error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
     }
 
     t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, apa);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, gpa);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, api);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, gpi);
     cpu->isar.id_aa64isar1 = t;
 }
 
@@ -662,6 +667,10 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, APA, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, GPA, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, API, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, GPI, 0);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
-- 
2.30.2


