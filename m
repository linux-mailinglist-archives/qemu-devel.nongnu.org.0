Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6F4DDA99
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:33:17 +0100 (CET)
Received: from localhost ([::1]:41492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCjE-000409-Gh
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:33:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZb-0006H2-Lt
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:19 -0400
Received: from [2a00:1450:4864:20::32e] (port=55235
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZa-0002B7-6t
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id r64so4832536wmr.4
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DEWExO7QLDaNCo9Eg6pGlE4QUxy0uT2YlPbVNfGUVoE=;
 b=f60ua8IfJNIfApX6NdqmL1eKNVwWpHG0T7BPhatNAsINzbmjr556JnNKLE2cUcAWxW
 oB85aA4q/HwApTkXOWFTR3wFKVU+UOChaBFuVUacvKqdedRs//8MuUrXqIQOnP4+RcJA
 Oe3PvJWc6Sc/U/rmQJGpL6JggH9o1r3NMZsEUlnBsjBYNk5/yy0Do2umB32LWMDCcMhV
 i2fZ4AaIxbu9SLkzp4dFmBSdiluVQljHPQz9V9bBMRW/MESLS6SAK09dYKHuUPyrpL5G
 kvRFLEwM/p0B6BPLuEy+Kte5Wbsg7Cg+8oirXaom71X4q9YxML2x7Rv7wXJGk0ainPyy
 8XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DEWExO7QLDaNCo9Eg6pGlE4QUxy0uT2YlPbVNfGUVoE=;
 b=g6tCMF5C4zrBO8fNXEAYEf4dEufAyavRzv3RLZh29e4n9tqnyOv3JlevrJ5dl/YGi2
 L/JK43IJOhCyoxQlpypWuNGK4FVWgnv4+CJDR/yJUE35tJVWXIueeaA7N1IY6Q6cgZtO
 /heK0b0gueRjim6a2Jx2FIcHfV1ma07AzNUp4agLoyLwmO0KQraAQS+KUGPoNhCVKNOX
 +uVoTdhtUd5vhQgpAtaZ8dAjVFPA3WThRQcWZ0AUiyWvepifNfgh5o0cbSr5wo4qnlaw
 CQMkmlPsO/4+1ozlRf5ZCTBjvzTerU02WZGAEx0sm5YCD06S9BQ/F9apI8xX9pJ4sjMj
 6vHA==
X-Gm-Message-State: AOAM531rB01pPXbs9uA8h6+Ae6lWWZmIQ9f1FtjuLeNniLaF0xVCstXI
 3phupk/pdrr92YNvwiY9mpWPPw/Ln3fHcQ==
X-Google-Smtp-Source: ABdhPJxX1D/hWLGXK1jXCOL7xcP8WTU9Nf/eG8ktdSI3Tc9RkGKT0A2qjxaMJ0YXg5GYalaB36I+mA==
X-Received: by 2002:a05:600c:1d81:b0:38c:c1f:16a6 with SMTP id
 p1-20020a05600c1d8100b0038c0c1f16a6mr13752219wms.15.1647609796700; 
 Fri, 18 Mar 2022 06:23:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] nsis installer: List emulators in alphabetical order
Date: Fri, 18 Mar 2022 13:22:51 +0000
Message-Id: <20220318132306.3254960-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently list the emulators in the Windows installer's dialog
in an essentially random order (it's whatever glob.glob() returns
them to, which is filesystem-implementation-dependent). Add a
call to sorted() so they appear in alphabetical order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20220305105743.2384766-2-peter.maydell@linaro.org
---
 scripts/nsis.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 5135a058316..383bef70332 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -34,9 +34,9 @@ def main():
         with open(
             os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
         ) as nsh:
-            for exe in glob.glob(
+            for exe in sorted(glob.glob(
                 os.path.join(destdir + args.prefix, "qemu-system-*.exe")
-            ):
+            )):
                 exe = os.path.basename(exe)
                 arch = exe[12:-4]
                 nsh.write(
-- 
2.25.1


