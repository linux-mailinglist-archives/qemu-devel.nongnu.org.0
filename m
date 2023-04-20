Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C76E942F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:23:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTJZ-0002m3-PH; Thu, 20 Apr 2023 08:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppTJV-0002lE-4j
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:23:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppTJT-0000WX-GQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:23:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id he13so1146581wmb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681993378; x=1684585378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=6cd/R92LpLzp49y8yUdy/r7HZc5QLWjNbD/woMnw1OI=;
 b=EDCkDArKWhgcNDHyFS6BX64EEjV11nekanScpLmTSiTwW01NmUSkPjMOE3f6zSsjiB
 VLiFzSmcjgQiVP0cQjL9fpWiZd54IYFbR2OFZ1gc5YV8gntxStjtR2h2uXYQsv87Wh+T
 NeLGfhTpin+hyuWb/A1WYZRVddfva2BstxH2F33RjNYWYiGuaMV5HNM9P/KtFlx0k3QH
 OCo6BVvzalfL3I9eMTkyY+Of14VLELaLwq68nasbo2w8sBqY67yJ030YgeG+1NcUgWTz
 3C8AlLEWnlLjbjFuzL42KiTXSMBr8RZ2ZFKVZjx2eYsxqc+HAeG1oMETXbVkWv7SNfcL
 dTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681993378; x=1684585378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cd/R92LpLzp49y8yUdy/r7HZc5QLWjNbD/woMnw1OI=;
 b=ICxSdXn5R6bBL3aMNuPklzfK+2m/ZRFzsraUbNctq1XORZ7g+n7KEPO8QWWXpDum/K
 TtPOyruD9/JRUKzqV+bQM1v4V2E+2aA9fmGu1xGa67zAswAV4zIV0fbP17so+OOAur03
 jpBAmGU0gvQw9CLRiSuE42czQ+LVe6n5uM/CWt2+jNolqqcpN/12huii4PoidgTVHR+P
 Ix/ooer8QrxKGzbAfh3HYwcQxjmggh/A8Ij5lvr/HmJ5cfRlbFi48pNru/U00mY/wBuf
 8q2yHqlOZr443amp6/vYQ8dIb8vgy1XPxblN6R1tSUTMRAEx2fTVgTZN8Bu/BWciUvdN
 opNA==
X-Gm-Message-State: AAQBX9fOrInuyTkOAb/GnK1YUQSedTiaGPx2ryDVnI85ynEo/oCBzlki
 aha1gpCY+brwd86Y5s1CXOKmLvyBn83FGIE/1bg=
X-Google-Smtp-Source: AKy350Y5Ch8KqZKunNuvAZ9tFSr6E7lcjGFPyFVEi2zJmH8pRXvkL83pIgpTwYaGbyD15/xSdPWCyg==
X-Received: by 2002:a05:600c:4e45:b0:3f1:7b63:bf0e with SMTP id
 e5-20020a05600c4e4500b003f17b63bf0emr4799766wmq.18.1681993377906; 
 Thu, 20 Apr 2023 05:22:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm1851762wmk.38.2023.04.20.05.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:22:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
Date: Thu, 20 Apr 2023 13:22:56 +0100
Message-Id: <20230420122256.1023709-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
the virt board, but forgot the "since n.n" tag in the documentation
of this in deprecated.rst.

This deprecation note first appeared in the 7.1 release, so
retrospectively add the correct "since 7.1" annotation to it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
My mistake, since I added the deprecation.rst text to that commit.
---
 docs/about/deprecated.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d61..914938fd76a 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -219,8 +219,8 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
 System emulator machines
 ------------------------
 
-Arm ``virt`` machine ``dtb-kaslr-seed`` property
-''''''''''''''''''''''''''''''''''''''''''''''''
+Arm ``virt`` machine ``dtb-kaslr-seed`` property (since 7.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The ``dtb-kaslr-seed`` property on the ``virt`` board has been
 deprecated; use the new name ``dtb-randomness`` instead. The new name
-- 
2.34.1


