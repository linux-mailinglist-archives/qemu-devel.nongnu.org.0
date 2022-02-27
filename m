Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B484C5A9A
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 12:14:04 +0100 (CET)
Received: from localhost ([::1]:46286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOHV4-0001u4-Ia
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 06:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1nOHSj-00019j-Ce
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 06:11:37 -0500
Received: from [2a00:1450:4864:20::335] (port=32853
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1nOHSg-0002gW-Vu
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 06:11:37 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 6-20020a05600c024600b0038125fa8e43so2294369wmj.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Le5LxFUT5H5vzv4X4jcGdhI7S6MzB0j0cc6NF3sw2IY=;
 b=Nf4vgtYFLrbI2pwfn7oZcaVtoeBb2RljgonZxqA25E+wyXXxscMwiUv4C+MsdKq2rd
 P2jJ0q0sktS3nl10FgKhRt1apODqwJ+GViqMukvH7EyqPB8etlUeIy858X0tuzRcbQjj
 WTgsiyKwGEDaN7bNN4YP2VSZv2q7y9aLCCocY6jICHwqo4bNJTKE3v/rt7uPPrF9hSOG
 S2G3NKmXjDHRmnmAX0d6m7tisWBHLg0Zn7i0bHA8hoZA3kL+wYWWweZ4YgmkFQyzFAjG
 yi068uaSrwROznm0DU3ozYbQZUH9B+dNJSiXKHsOwu+3gZOCLkGc6mR/we50nMESFQLV
 A8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Le5LxFUT5H5vzv4X4jcGdhI7S6MzB0j0cc6NF3sw2IY=;
 b=LqsyGevVKBLPRvbLQhKwKB86JyKOBD2DOMkAlOMutgJlovpsxIYWf5MXhXV5ZJ8Ea6
 46pG9loOZ0zP/h76ow/9N3VryE0k42CPT3FudmZlP2ZzAvfFOGC9h8HtztxTyTB630cR
 fOSbM27jcbNtBwHjyPAi9vxWmT2UTtcVhOriwFW16VJFSAqnixzv1fjKOxuQ2SPUmmIV
 5L98DulLPbKNoRDjaA30NCsHovYzM1wMSAdsWDAKeo8AS8hUbYxvT+JJi74zgoLEzJcA
 r9o+gY2UQBD2D2ncrHbmecP4zKoHeI/X0E1HR7O3P0TxDFOtiabFKQwMvDvsWwX0QV1z
 JA1Q==
X-Gm-Message-State: AOAM53264c1b01nfGJsTvfr+MWTuVh3WAn3oMfASIKBGGrDxrpVNHjVR
 oy1pxbo8rkbIUtC4hi1HD3Mqsjv07h1ElWvh
X-Google-Smtp-Source: ABdhPJwclZWO/0l4B58B7GrgSSsaJNT8ysBs15wMzWb533rCm2dPtFE8LNj8veM1gtO6OhGKcw4+1Q==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr9804648wmq.139.1645960292484; 
 Sun, 27 Feb 2022 03:11:32 -0800 (PST)
Received: from station.lan ([46.140.159.18]) by smtp.gmail.com with ESMTPSA id
 o16-20020a05600c511000b0038141b4a4edsm5651105wms.38.2022.02.27.03.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 03:11:32 -0800 (PST)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Fix MAX_OPC_PARAM_IARGS accordingly
Date: Sun, 27 Feb 2022 12:09:30 +0100
Message-Id: <20220227110927.402764-1-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ziqiaokong@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: sw@weilnetz.de, tsimpson@quicinc.com, richard.henderson@linaro.org,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I notice that in the patch here:

https://gitlab.com/qemu-project/qemu/-/commit/5d6542bea780ad443c4f7f1496e64706101f525

The MAX_OPC_PARAM_IARGS was not updated as this path did:

https://gitlab.com/qemu-project/qemu/-/commit/1df3caa946e08b387511dfba3a37d78910e51796

And thus this patch fixes it accordingly.

Ziqiao Kong (1):
  tcg: Set MAX_OPC_PARAM_IARGS to 7

 include/tcg/tcg.h        | 2 +-
 tcg/tci/tcg-target.c.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.32.0

From d6fbd846dfed5c645e503bc9d0bd9bbb2fc44c7b Mon Sep 17 00:00:00 2001
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Sun, 27 Feb 2022 11:39:18 +0100
Subject: [PATCH 1/1] tcg: Set MAX_OPC_PARAM_IARGS to 7

The last entry of DEF_HELPERS_FLAGS_n is DEF_HELPER_FLAGS_7 and
thus the MAX_OPC_PARAM_IARGS should be 7.

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
 include/tcg/tcg.h        | 2 +-
 tcg/tci/tcg-target.c.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 42f5b500ed..939041103e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -43,7 +43,7 @@
 #else
 #define MAX_OPC_PARAM_PER_ARG 1
 #endif
-#define MAX_OPC_PARAM_IARGS 6
+#define MAX_OPC_PARAM_IARGS 7
 #define MAX_OPC_PARAM_OARGS 1
 #define MAX_OPC_PARAM_ARGS (MAX_OPC_PARAM_IARGS + MAX_OPC_PARAM_OARGS)
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 0cb16aaa81..3e17c0080b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -197,7 +197,7 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R0,
 };
 
-#if MAX_OPC_PARAM_IARGS != 6
+#if MAX_OPC_PARAM_IARGS != 7
 # error Fix needed, number of supported input arguments changed!
 #endif
 
-- 
2.32.0


