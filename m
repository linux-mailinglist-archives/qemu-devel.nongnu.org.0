Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2335DE49
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:10:30 +0200 (CEST)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHsD-0001bq-Iy
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpm-0000QI-GM
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:07:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpk-0004g3-Rg
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:07:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id g9so164777wrx.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TZi3a++hHJ8/RuSozHubV+jvMjnNryNqhY5lxnqN274=;
 b=diNfmtb2u86kG67INmACsmbn7OFOJC69xmY8QPMhH2B2zxIB12MHBcnVd4PKEet9Fd
 N1Fh/SgaaxeFOCfFoKXXSqnaZlgDr4O3F6PJRV4u7hrW2C7eq67a0GW/l0s5z9sYFczj
 nmY5By4fE5r3kzZQJQW5h9hqcPRADK3f3ZeTLn0cInvyFB4+UGJizO+a7PTqYnpzCnQ+
 QzPuKQJxN/A/a7JF1csJNCcwWHLhXVTVwyBcrUSgcmG8uvQ3j4dxe/43WoG1YR5/yz33
 okLtzPaJlq/5zPbenYqmglUoA6wHqEKT8U5vNAMSNztiHhqphZWrhjpw9G+vWHbiGshI
 N4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZi3a++hHJ8/RuSozHubV+jvMjnNryNqhY5lxnqN274=;
 b=ZIkHpv+i7NlBi22LbeSSioysMm5s/Jk9+xH54kQItfuJdTLi5X/Tr1UxfxI2/c/FNy
 ca0+2z8CS0wLcuzEl0j8WbMwJDRhsNGDkKWkAe9QDgBTm1YfnaDCvuzHl0GarTIP2Ed+
 vgQfEDUdJud+hMam1sLyFMPoKC0xsODvsLalUOiwXzfDJtrNFQHX3gkNsiMBqLIRJ/pB
 R8eL8+CnanCK/FcsQZx8OVA+XLvMyV6h+kfijMVHbBo5zFbZXgcOoT41mAPAgQEHMPbG
 bdaYoczWUXpw1lsP24sjfH1W9QkyBiGfOFNi0SIwGCWHMpDdwBdRcafX1cJaXPfWEhgv
 mcmg==
X-Gm-Message-State: AOAM533wx2+3gRlDYP4bxUQ12q7y6LoAl03WViC5DOj7gC7G3MU3a8pp
 n2AulPaQ5phCOSCFzB8oQcLSdW5M6hP2FI4T
X-Google-Smtp-Source: ABdhPJxnP72AQRhcM3ZSEga6DNvyckA3fkwZrzDfFADIJKMmwnhPDevhG0ibAElcHB1iJ1RA1RKjMA==
X-Received: by 2002:a05:6000:10c7:: with SMTP id
 b7mr36628991wrx.143.1618315675480; 
 Tue, 13 Apr 2021 05:07:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o2sm2245275wmc.23.2021.04.13.05.07.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:07:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM block
Date: Tue, 13 Apr 2021 13:07:50 +0100
Message-Id: <20210413120752.18699-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413120752.18699-1-peter.maydell@linaro.org>
References: <20210413120752.18699-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fixes: 25ff112a8cc ("hw/arm/mps2-tz: Add new mps3-an524 board")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210409150527.15053-2-peter.maydell@linaro.org
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


