Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB4F518EEC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:36:58 +0200 (CEST)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzGT-0003Xl-1x
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZe-0008EP-70
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZa-0006Ki-HO
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:39 -0400
Received: by mail-pj1-x1030.google.com with SMTP id p6so16255853pjm.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u2pM0xy41z8bwTr6w8WctOV/RUlItotfYG7rgV7aiRQ=;
 b=iW/I7U/jJBGN+A7kqCu0eR45y1rKsOL0eTfM0o2LgEPK8tfwtmVii8PXatWVbG/Iea
 ZVDhqb5MS9MlpLEgRZYBh1PUO2LajHqf7rUXYPH06s69rv2US2V/yxjL3XB6nxKhGiWw
 KKHWJScza/FIRmI23FXS2Z6QJO+RcDt/ujqEhShYfa+wa3WNPbAfASE5EJmreH7WcXYd
 KC+EoEeuA0ybjGNRl36gKozOTtqhOTRd27Ys4eY/NReqr2+mLdxedoWnEbNX/soisx14
 GT0F0YUviZV6++2gfM9f3LKHJmoc8rAjw+mdjgEjH90optyj/lFm5H39gOe2ykXO+NNy
 zBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u2pM0xy41z8bwTr6w8WctOV/RUlItotfYG7rgV7aiRQ=;
 b=DyZZa13bzhPV2/twqtT5a06k9S3D9hb6o6LVMp2nFdzJncyAg5ixriwiFRe9uyun0f
 NNmdKkidhqp+DnyUjPZEe4UGGq78zipDBIi8X7sxRNrlaD+Wf6hkP70v2YfzD1JE2R3l
 zBliB7HURkfn9WMhxQvgL4oTQM6eAsL6xJ4hEuDqC3v0a8fdIODRybXjJ/X3HQx96YTH
 RaZpxXY1LDE9hBCavWckkc4OghVr8/tKzuz9oDZy7PDcORzZ7ym1yxiz1Yq7gGDPQWva
 jlVK7kUcqn2nNvFQjusEDFD9Hftljq1MgP/7ixZZX4bXFHU5n8QA0jBHUVYFD9qYbQmt
 sldw==
X-Gm-Message-State: AOAM530dZ7C1oxy7JKKs/LitGH8T/jHIELQccDi2YEfPmbjktUQEMy38
 R8bM23iOGwxWREF4x7L3aKnGYcfXt5XRBw==
X-Google-Smtp-Source: ABdhPJyPc7/hbk/P7rHSccDAAAnDvr0jNBIP2qtrZIOy1Cj5Qk6uE17cQZnGA+egd4LFBDPsMT9cfg==
X-Received: by 2002:a17:902:d2ce:b0:15e:c024:6635 with SMTP id
 n14-20020a170902d2ce00b0015ec0246635mr1920634plc.28.1651607557188; 
 Tue, 03 May 2022 12:52:37 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 52/74] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
Date: Tue,  3 May 2022 12:48:21 -0700
Message-Id: <20220503194843.1379101-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Semihosting is not enabled for nios2-linux-user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index 2bd60ba306..c6e2243cc3 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -1,7 +1,6 @@
 nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
-  'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
@@ -10,7 +9,8 @@ nios2_softmmu_ss = ss.source_set()
 nios2_softmmu_ss.add(files(
   'helper.c',
   'monitor.c',
-  'mmu.c'
+  'mmu.c',
+  'nios2-semi.c',
 ))
 
 target_arch += {'nios2': nios2_ss}
-- 
2.34.1


