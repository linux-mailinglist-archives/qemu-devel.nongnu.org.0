Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AE4B1BEB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:07:49 +0100 (CET)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILLg-0007dW-Gv
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnN-0004J1-ID
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:21 -0500
Received: from [2607:f8b0:4864:20::42a] (port=40599
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnL-0007QD-Ki
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:21 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a39so12644585pfx.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtQTuzYRH3IYlPuAlfK2e9bXFz+7xqKrXCWRmmR5YQg=;
 b=RosGj4MBi2IpXThl9LAkqjZHBJF0/yybULfjgDVEkh/xvVpz+gWbCdOObtOCfAmrIm
 u9jpbDgN79uA2QD8KnZgVUEybSK0wOXkbIrKdGCjSgIURjNR3SY70ca5Sjvjlu9b9Gex
 Wog7+NQbvIS/OnlByB0Lm2Y2VEmFJZG2HQ23dt3tG/9HxmBZPh/cGxDvLJwYjDB+rJxe
 T6gWkscKLzoeh5qbcI98SvDebbIC7IBOHUNgZYeOlb+M1edm8S4b1XuWZPu0F3DQNg7b
 lzhdC2P/eGpnJ8NF0/yKWtqa5jbMu25y+wWzD1ByVScBJ4ylza3q8ycYdhK0cK944sxD
 Rr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtQTuzYRH3IYlPuAlfK2e9bXFz+7xqKrXCWRmmR5YQg=;
 b=QmjefTk0M79lxsITjLrEiu1tnmLm5IkSutvOTwQTEz72LbaIHnM9kGXzEtPKM8R7oA
 bjckz0wkfSskTFtd9R/9yTDWA001vgzX0CvYY+PatnewEGMDoTELnHWXTddbIljnq7Fy
 LkHY6MmpCyQzZYG4n2Es+HrH2H0cPgVte2SN2fgu6KIn/lZobkHsbNUqZfA+3MAhogV+
 riTyJFTxBioIbTpWKqRy7wN4t7aRHAMJdqFUNpFpKA8VmDHQ+X/+X58wP1Kk8u95sNl9
 q8JQEeqjDM1opAiUurd+JQJnGiIPLDFM7M06pWME0lYrtt1ODgYpw2oy3SBBinefM6Ef
 BgIw==
X-Gm-Message-State: AOAM533nMQFuEjbpliV5oB/tciJ57xUFpClTqm+6ym+LMJpWkUYrcdGp
 AAjrtBqkCylZ959Gl4VGiCVxH1C9DRSnCfSK
X-Google-Smtp-Source: ABdhPJy7NWb/cYvtsW68qDuadwAi6/hY7wip2DtYjDQJ+We3Kug2TGWss9Y44I5/C18o7ELLk6E6qQ==
X-Received: by 2002:a05:6a00:1345:: with SMTP id
 k5mr10328307pfu.29.1644543138428; 
 Thu, 10 Feb 2022 17:32:18 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/34] tcg/arm: Drop support for armv4 and armv5 hosts
Date: Fri, 11 Feb 2022 12:30:42 +1100
Message-Id: <20220211013059.17994-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for unaligned accesses is difficult for pre-v6 hosts.
While debian still builds for armv4, we cannot use a compile
time test, so test the architecture at runtime and error out.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 5345c4e39c..29d63e98a8 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2474,6 +2474,11 @@ static void tcg_target_init(TCGContext *s)
         if (pl != NULL && pl[0] == 'v' && pl[1] >= '4' && pl[1] <= '9') {
             arm_arch = pl[1] - '0';
         }
+
+        if (arm_arch < 6) {
+            error_report("TCG: ARMv%d is unsupported; exiting", arm_arch);
+            exit(EXIT_FAILURE);
+        }
     }
 
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
-- 
2.25.1


