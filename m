Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71DC6C329E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:22:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebv1-0000By-5q; Tue, 21 Mar 2023 09:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuy-00009t-VK
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebux-0006fn-Df
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so11062916wmb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pcjeNQpYtfjnbCVp1jPfUN6yC3n9EwkQ1XDGv0Ar4fQ=;
 b=kLqkIEvzyhZ3uj4Bjw0mB41u3Ee/vnIIwB1pYlhSqaLKYXXkrl1NaP1wI4uUC4yuCO
 ToqHUW33GOieOThqM+iFJ5yeoWOjHUZcMhxciVmFtkNVgBejE3cRBN8q5i5bd6rnHoZV
 xBJA1SGD5y+DSDEE5LyuUwD3wayYfnTioSlHwuh+Wz4HsHlLiv30+BtxkW7j9KUwECt9
 BBCoDPMZMbsyD+xPAVA5xr3yZ/xgnAM6CAOVnjeANg2WqVG5xvvnSTw0nohbnBZN5Eyd
 Vn31xEcxtFvXQ2dEXlwMePGL+m+EbBeQTF/rsXAFVz/LHrk1W2tFRnuNYIof33+34ke8
 CAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcjeNQpYtfjnbCVp1jPfUN6yC3n9EwkQ1XDGv0Ar4fQ=;
 b=kkkZbE7JbgO6sP/P12hbYJdmXiRZgOeo4waDy6sQcZ72aYJI3UA8LvXlx6lQ8X4gyk
 lLeolNClZMz+XikiOfc94TIMsgIZH/hrRe57LE7QLJHeA9GLGtBp7Y4rP2Tczqlq/yrA
 H6WK8JfsWTxGGQwJp2vJfkM7uEnjgPutEyCx6m/ANOaiAVs13YnWgGS+DjTScIVVzoC/
 yUU880nIP6RUWnhmRtY63nBT/xUdjwLReJNtpzEAQskJcJJz1iBaTMuD6DbgYoUte/Mq
 xb0Q9ITpAxqZDWNP9SlV9h3pFbHiq4c7jbDoD47+Zc7WVRIGzmOvCBanuUGthU6AD4PN
 EVfw==
X-Gm-Message-State: AO0yUKXXlz5EpdC1TblZJ65tVMcCiBlmTPEedVBNMiu2Ms1eF9vjFndS
 Q1uCfR0qXcxR+EKWMCk3nhTP9iCJiSGUWKmHGiA=
X-Google-Smtp-Source: AK7set/7kJCzqoglfJOhME3Y0V6oSjTGPyog/Vp0wIp724rAtOCnyv9TlnmC01sXWpcFgZJKhprwzA==
X-Received: by 2002:a05:600c:2048:b0:3ed:cf2a:3fe8 with SMTP id
 p8-20020a05600c204800b003edcf2a3fe8mr2539339wmg.8.1679404846123; 
 Tue, 21 Mar 2023 06:20:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] target/arm: Don't advertise aarch64-pauth.xml to gdb
Date: Tue, 21 Mar 2023 13:20:36 +0000
Message-Id: <20230321132036.1836617-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Unfortunately a bug in older versions of gdb means that they will
crash if QEMU sends them the aarch64-pauth.xml.  This bug is fixed in
gdb commit 1ba3a3222039eb25, and there are plans to backport that to
affected gdb release branches, but since the bug affects gdb 9
through 12 it is very widely deployed (for instance by distros).

It is not currently clear what the best way to deal with this is; it
has been proposed to define a new XML feature name that old gdb will
ignore but newer gdb can handle.  Since QEMU's 8.0 release is
imminent and at least one of our CI runners is now falling over this,
disable the pauth XML for the moment.  We can follow up with a more
considered fix either in time for 8.0 or else for the 8.1 release.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 78105b8078b..3bd86cee979 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -520,11 +520,18 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
+#if 0
+        /*
+         * GDB versions 9 through 12 have a bug which means they will
+         * crash if they see this XML from QEMU; disable it for the 8.0
+         * release, pending a better solution.
+         */
         if (isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
         }
+#endif
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
-- 
2.34.1


