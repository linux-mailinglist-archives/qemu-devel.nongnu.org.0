Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28424CE44F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 11:59:21 +0100 (CET)
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQS88-00065o-MQ
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 05:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6e-00044P-Sn
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:48 -0500
Received: from [2a00:1450:4864:20::431] (port=41740
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6d-0002Qf-HX
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:48 -0500
Received: by mail-wr1-x431.google.com with SMTP id i8so16143400wrr.8
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9wtRAo/PrrlV5Bn1mFToRucomuxQO+/fw/ePLHNPTDg=;
 b=Vu9n0g1/QDVtu/lOsGTPfULn42L9DaUYBNVpK82c+A981JyRPa0dr+JxToslWsguoJ
 McdpFQ3Pdk5Xf0msM7EVv7+tNz0lu7MBo63k5P1Lz2EVh6HmYMXbrlA6yGiJe6JIKT7S
 8nSaY50chBHrdI162YKbMCUeHOL7n0BxILOwoylQb8bqvvp5cKP4IoAWRhD5332MY2Kb
 q9o24lpUf2qaD5GmyJJJapb9TRDOFv7GFS8Z1RMqBwNA8PPjrBIy4VUbOZL0fEvhhsRB
 YnrkWXtu6pdIWStf7VCVuExSuK4uUlX3k5nG7dHDrdZgKDhOThwiMsqO0yFRFGCpbR14
 rGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wtRAo/PrrlV5Bn1mFToRucomuxQO+/fw/ePLHNPTDg=;
 b=0b1GBzhuDSw29E5tI66W+tooNB1U7CZ3Kr0JRY/TyNw7UIaFKPElqsLjrKAfcfyFXh
 bW3w+zipofiDnQW0CEyQyTE2NhNkVapI4QUdjrKD7qh2x1sOliRmO3ymJASZhdsO9JHG
 AwROZ6HtJHVTyWzNhhzGO0MB1GwKdOw11hZdIu+iIglatfW/qN3Ci7r+FT5VqzB8AM5X
 BX8MSK2mlfwPoOcIyOTQfewQE3P58IznLdZd8wxvM2B34xdOfQxMBdQrI731ZJRsEqjx
 b/0yHmYfRFAbWorM1mpApkEJ9WMdEhhkbQ/pU1u+9ili57UjdYnSuTEky4ZJlBmY9ZEM
 9aYw==
X-Gm-Message-State: AOAM532MCvdAyV+oXFCl9jTFpf67PTTlYr6n0XWoaR+H+ve/cJxP+V1T
 m5t0nKo3pAdHVZcHxA+mSdNDglRub7Ux4A==
X-Google-Smtp-Source: ABdhPJxy10tDYW1w0OHGeCIIbHTVuJqVOJRlQRxwsjrHfBiaDeWhs7CTP4vqA4NAP6YbihFv56tSzQ==
X-Received: by 2002:a05:6000:1b8a:b0:1e4:b3a3:4c1f with SMTP id
 r10-20020a0560001b8a00b001e4b3a34c1fmr2143964wru.202.1646477866211; 
 Sat, 05 Mar 2022 02:57:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c4e0d00b003816cb4892csm24079324wmq.0.2022.03.05.02.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 02:57:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] nsis installer: List emulators in alphabetical order
Date: Sat,  5 Mar 2022 10:57:41 +0000
Message-Id: <20220305105743.2384766-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305105743.2384766-1-peter.maydell@linaro.org>
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently list the emulators in the Windows installer's dialog
in an essentially random order (it's whatever glob.glob() returns
them to, which is filesystem-implementation-dependent). Add a
call to sorted() so they appear in alphabetical order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


