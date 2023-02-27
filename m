Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1316A4D44
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:34:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl7z-0007CM-Lu; Mon, 27 Feb 2023 16:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7x-0007B7-Co
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:45 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7v-0004GU-Vr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:45 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i10so8244203plr.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=twBrrDzkWOr6pmuZqIkvXFM3Wf0S4OVTus4rxaK6MgJneyiLUPL+9hhI01xA2uHWgS
 dIqP3sMxkCtcQbzY40ABrnPJUGoZ8jmk8c4KX75Msga8G67kmBf6zaboH4AThFemzuVP
 sS+grnnp52GbgPYyYW5fntdVzMePQV/eY+Iv5Xt3gTjV9Z4c93dGsYcrdO0NIGdJz1BZ
 l1DQc12QQzaJmicZoY7bIpvkjarpYDe126rj43gYk79knMTWjmwLrNWoK9P/WPnMYDKR
 qpP3dl1nZ71G2bptiYl/vdLFW7dXcFX0ReJA1tRL1VBwYR9QekCAn3gTY1ksUr5HFHcS
 uiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=pf3Bice/manaD1fie8o50BulW1Hkh8WMWekO/VOlDoeCfvLHlq2x5SORjQ8WIH3Nhb
 j08okkLp2qZrL5LwcRfBWwL5q45CPGXAmtEDdLWqTYcVFlUFI+sFryyg6sOMHpAih9iP
 DKWP+yI3HwubTo9j9ucBnaDWYxZoHYavea46ndfnRHc4uqUS2D9gwvESQ3y9W/VPJmOC
 CijIJAfmGV9dQJaHgPVEGyV0bZ8qU8niAdiqQAGeUhRaIKolrcRAIQ2rxAV0VflrWrOX
 tDCx6C4M7LpHTXfSiMZ799OuG4sTCduvFWol97+h0+d0BV5H9A0z82NQY8jgCYryua6j
 UKdQ==
X-Gm-Message-State: AO0yUKVntDijhHqVdAmBqz4q66rwFvRTww+d0udISFSYUWsvaokcwdrY
 46xtmcOCLReUEFGbXiSrYhtrTvP/FtpwKV5g57U=
X-Google-Smtp-Source: AK7set9mEElQmc/EaBI92NsboGlSXdKYBah/LOz/AMZQoG4tzot95MtXOa8mk9nMD8Mp5SFOXDqrwg==
X-Received: by 2002:a17:90b:4c0d:b0:230:d6a8:a9e9 with SMTP id
 na13-20020a17090b4c0d00b00230d6a8a9e9mr523884pjb.48.1677533623242; 
 Mon, 27 Feb 2023 13:33:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/14] target/arm: Fix svep width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 27 Feb 2023 11:33:22 -1000
Message-Id: <20230227213329.793795-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Define svep based on the size of the predicates,
not the primary vector registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 895e19f084..d0e1305f6f 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -297,7 +297,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
+                           pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-- 
2.34.1


