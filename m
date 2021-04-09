Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09935A1B3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:08:50 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUska-0006B5-8U
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshS-0002Zp-B0
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:05:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshP-0004Qv-Ry
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:05:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w4so2216638wrt.5
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZLG8bwrpw0+l/goPl94UIiaUdFIfsALImfUpgHbYc3M=;
 b=Dn3GJHLhS9rwcgNusmHMGrbzTyjMON/VJsK32/EmRUYIBaMMRiQ13Pwngspnkb2oVi
 EmTlvFSyFMR4Zd6Zga6CoCEBPV66JyizLoK4YQPP+FfaR73xtzTwljRlbyBo0ef9fTSe
 u66xLMFc3uXUqkmVQ/eLa+ftqUUUcBI47V7fkwQ31BG9e0UFFKoit3GBTuTFgZJV9Cri
 lHzpz3CNHpT2d1hgXFtsOiNvxdbmeL8FI+/6TmPw8fNVxSy7Jb7C4t4GKF9djqASYQ0u
 OeBdUSstbzxxydIo4juPkPqb63iGRcx81q+f6qkqjJt/evzvNr11o+RkicO5D/t519Vs
 K9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZLG8bwrpw0+l/goPl94UIiaUdFIfsALImfUpgHbYc3M=;
 b=Zj4ekLDYJjusy5pdI3NUnvMPWFMk5VpJQsEWczDYe1O09CJToZyFcf5Z3woGYWHD7c
 2HAX6gsIEVzKklWJNyrSSiGTm3HS1TNtCs0nGY3hUm831pxYXOYInV/djV7q2u6WomOc
 ij041zZXkB7/j9Vbitsq/u5TZZlEQ5d5FW+O/05n41rxZebEoQZxgR1CzqlxZvXlPGmd
 /ZPUoqkqxnbh5UtkqQjlFBlzM4zIXAR7SY9S35CppWvynowpJMf1QVWo3c+BTFLM6XrD
 hKaFdgtB5qfUT56wIdXCPFYfuqgvO2jrxCHAloezWpnMjJ2qkmCUNgHLkPE0vIMazvjk
 WMjg==
X-Gm-Message-State: AOAM531MSQQQHd4CIyvG3h+8uzI9yDdko/H61zkjPDBU+C8TzhBqYPmi
 BsjlXfAcPVjFnfNCHsiMmpHGhxDi8WKYaY5H
X-Google-Smtp-Source: ABdhPJzx3QOfdu0YIw/vkjzXULia26dv2thKa1OaMYX1zc65ao9rvuFZClur3kGq8wpDQ7dGoEcj6g==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr17549843wrn.323.1617980730383; 
 Fri, 09 Apr 2021 08:05:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c18sm5048094wrp.33.2021.04.09.08.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 08:05:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/2] hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM
 block
Date: Fri,  9 Apr 2021 16:05:26 +0100
Message-Id: <20210409150527.15053-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409150527.15053-1-peter.maydell@linaro.org>
References: <20210409150527.15053-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN524 has three MPCs: one for the BRAM, one for the QSPI flash,
and one for the DDR.  We incorrectly set the .mpc field in the
RAMInfo struct for the SRAM block to 1, giving it the same MPC we are
using for the QSPI.  The effect of this was that the QSPI didn't get
mapped into the system address space at all, via an MPC or otherwise,
and guest programs which tried to read from the QSPI would get a bus
error.  Correct the SRAM RAMInfo to indicate that it does not have an
associated MPC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 3fbe3d29f95..5ebd671bf83 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -238,7 +238,7 @@ static const RAMInfo an524_raminfo[] = { {
         .name = "sram",
         .base = 0x20000000,
         .size = 32 * 4 * KiB,
-        .mpc = 1,
+        .mpc = -1,
         .mrindex = 1,
     }, {
         /* We don't model QSPI flash yet; for now expose it as simple ROM */
-- 
2.20.1


