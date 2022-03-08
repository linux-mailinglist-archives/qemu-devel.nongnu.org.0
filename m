Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E954D0DDD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:09:03 +0100 (CET)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPHa-00079g-64
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3J-0006hF-3a
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:17 -0500
Received: from [2607:f8b0:4864:20::42a] (port=41525
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3H-0007y5-Jf
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:16 -0500
Received: by mail-pf1-x42a.google.com with SMTP id p8so16017125pfh.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOqdltjaxLQFa3yHnfQPSfs2OpOZRBf+9EjEgUtdzng=;
 b=lFqDIrv9m0T4Ny/U60JdHEOvhH3eAJdYB55mQn9IH++rkht2j+Wdy19LR8SWew9VBh
 oO2Uol9jY3yK0hhOv+fCM1+n3/iHL+RoaKnrfXSm5R2k8iaMYXObgxzSHDcK4IZMjqbM
 SB2ydKlnyf95/L7bOtnz65Qycb96da5nH+XkEqRVCPGzEmHelwzZwPpi5syTU1U/sdgf
 mf0DbqCY/rt28BmdoysFSecA44VFhbxrZS7eQvrtW6+qHXwBsLBvyOktF5A2YSpYIudH
 97CwrqvSrbuG/vnpHDiYuPaDEt946v82uT/qL4FGACuk5U0f8VnAZrrOJ8nV/KJM7nxT
 HPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOqdltjaxLQFa3yHnfQPSfs2OpOZRBf+9EjEgUtdzng=;
 b=KVjw7BvavKJx2VbTLdhKZvW8oJKQwzhnRpyYaj+wRca4aASpc0EiKWbECwnHjGFRIZ
 PDQe6Ujoi0k3D187LWJ84/rEye1Yu34+5CZSvkWfhvNIWOXGH00ZJBpd3qYjjgHlEEkI
 dmrRk7WsrAUJvvMzCGGNr1+xmtqQibHTxZhld5glialbEBBlYY+qbUEJ5OmLFwl17x8g
 /gsBIRjaof7qS3DpesUkXtRdWbuOlcc2nB+m3zF7Aw9AvQAcJ7VkBvpi9GBOq3DoPO6G
 YR5tsZlBnTmbc9VJIO38xDjOWu44zn+0WbXaS3iQyKzfTrrFujQI3jI9kOGhtHtODXnk
 tYfg==
X-Gm-Message-State: AOAM5312116VX/r/9k5z8qh3GmcBEoJ3jwfN+wUD3XwtOMlb/kIKrALr
 5SBh/Sbz1MkvXE0nEajcaSuL50LXb63vOA==
X-Google-Smtp-Source: ABdhPJzHIt4f4R7DU0hZI8/qV6BW8w9ul5MsL/3zLL9foG7j3KG3S7jI7cJmiTHB76qzVmEXKRMlmQ==
X-Received: by 2002:a05:6a00:198a:b0:4f7:2d21:4531 with SMTP id
 d10-20020a056a00198a00b004f72d214531mr922300pfl.44.1646704454276; 
 Mon, 07 Mar 2022 17:54:14 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/11] target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max
Date: Mon,  7 Mar 2022 15:53:56 -1000
Message-Id: <20220308015358.188499-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220307020327.3003-7-dmiller423@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/gen-features.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 22846121c4..499a3b10a8 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -740,7 +740,9 @@ static uint16_t qemu_V6_2[] = {
 
 static uint16_t qemu_LATEST[] = {
     S390_FEAT_MISC_INSTRUCTION_EXT3,
+    S390_FEAT_VECTOR_ENH2,
 };
+
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
     /* generates a dependency warning, leave it out for now */
-- 
2.25.1


