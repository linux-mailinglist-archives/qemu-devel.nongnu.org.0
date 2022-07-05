Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE305668F6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:14:13 +0200 (CEST)
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gVQ-0004vn-2c
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gI0-0006wC-3n
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHt-0000hU-B7
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:17 -0400
Received: by mail-pl1-x633.google.com with SMTP id k14so10696698plh.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ky07ThqARHiFkhWeIFBW8AVKAgEQoX250iifcE1+G+E=;
 b=KmtB3jfzz+e1Wg51/pnc8hIK7nGZDNyHlF7SF6Xyjwe3WHxEg0PE1psm6Uca243pLX
 mrPEyuRnSQ/uEacyX7/0nIhewkth3BQZgoptzfwoFZ/zZL+EMoIRPS/71xVZQUnPQjU9
 OBOcC8wo2wnk1E+HZS5KALz4mIetaCAXLvtHMCf8heoFvrqtRwkf2tI+ozERf72Qs+dZ
 WNAVXvuLGGW4Ew/fmozyTlFmVIdL9RO8KgQTYZeGxAqNNpPoBh9jZSbLxkYPM+a3DI5N
 Ga8bx79bWKbffHSI0v86qrRyv0imKKZBuyrb1+p7iHnsBEU3hHRwmtnjNgOrki/+rkCX
 M03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ky07ThqARHiFkhWeIFBW8AVKAgEQoX250iifcE1+G+E=;
 b=PlqV1qd9xV30rxe6qHhxa4yTy8eQwJKZAfHYLCN2osrz9cftbQ/C2FiNuoqmXYHN9H
 Ss1ylGTJj6lhW1IKgkC7DzCtZ+DrpMV1QLdxhwCIU0sfC4006Nqav3d43WPnY8tnLyY9
 SAS5PZfmY2uAaLFSbmwJ/xlDe9tsUwWABjgK48IKLq2qreY9mU4mwcwyss62BFtRk2nG
 MqknzRc6kyoX74qVIrjaZL0zHvqsVB8cf+yFLcX1AuX84gyzPKJOV/rs7pdRHY6syF/R
 eRG4kFtlGURMILK6nCocOKWZr7mSvaVzSI7prKar5NueqTU+pBP5kDt6ziPu9Z0O/64g
 MODQ==
X-Gm-Message-State: AJIora8WVtJEf5cdKeiNp0Q2g/ETauak7UjCHucchO33wVs5wJGzFiNA
 lKy9PPp86UmgR8U2kV9IV7AolGHnd/lllzx4
X-Google-Smtp-Source: AGRyM1vdVrE6wWXJkw7QAoqcSmFDDoO5q1NhrAVCbjaae0l2L40gpCR+DQrJx2V903RPhQ77ozDh5g==
X-Received: by 2002:a17:902:d2c4:b0:16a:5c48:8312 with SMTP id
 n4-20020a170902d2c400b0016a5c488312mr41318856plc.45.1657018811905; 
 Tue, 05 Jul 2022 04:00:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 3/6] scripts/qemu-binfmt-conf: Add LoongArch to
 qemu_get_family()
Date: Tue,  5 Jul 2022 16:29:54 +0530
Message-Id: <20220705105957.1144514-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

From: Song Gao <gaosong@loongson.cn>

qemu_get_family() needs to add LoongArch support.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220705065943.2353930-1-gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/qemu-binfmt-conf.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 1f4e2cd19d..6ef9f118d9 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -171,6 +171,9 @@ qemu_get_family() {
     riscv*)
         echo "riscv"
         ;;
+    loongarch*)
+        echo "loongarch"
+        ;;
     *)
         echo "$cpu"
         ;;
-- 
2.34.1


