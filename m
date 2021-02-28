Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801323274DC
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:31:26 +0100 (CET)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUaz-0005mq-EH
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTT-00073y-Nb
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:39 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTR-0005e6-Rf
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id o16so12648314wmh.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 14:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BA9fHp0tz5MYhveCk5mzHivQ+nHb9ytTCGrDQKwPjuM=;
 b=ZrBJq4LqsxPl2rGTMV53tLOBA0IWS/cOBmRi0BPlj6iD+Dnh0RBsMchqHaQKgbNNUR
 HLb9TaGSD6dyMY0JL0LPquO98d+aROLacQgB8dFDen5yK7GrdCe+RO5D5zT+JKm5kci9
 QklzK5xjjNmIbFPoaerADde0bH9L3XPepebCuoaVDrmtULc4CklLRi1pSc6oEhi/6fZd
 5eRD3kWZSX1pSzhcEBaSlJDcfztNNE4H7SvTLHkjSP7H475P/mYEATmN59u+Ze+4urel
 vgxSE7qbkc9e8NFRnVTylbFFNOZZ7vTJjhUmFZLKU5q1VAcbraSc9rKN2dhhHoqMnKmF
 SLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BA9fHp0tz5MYhveCk5mzHivQ+nHb9ytTCGrDQKwPjuM=;
 b=V4m3YO0Ytp/DA6TGTSiz5Lgeh0QHQ76d9oLf6Gs0PMv6SS/+XZB4YbrR6s+7QKGO+t
 9SwGBgmQ8eUQI3C/AmPdIknt/bI5asi/Zq075CCTpnQyDksylgZ4rZqRq11A5FiemW0Y
 N/gNCAYh+8ecVeMiFqj2xKXoxZwT878pISc48r+KP6wf/zMOtjCF1ckWfR9pus0VdLSR
 4kHfl0UXZ0sBsPRZFxsxvnCZtPs0nQfeuG8EwQh5xNqqM8NUKbdiOh4LUx2CLA7SpAtx
 OtjhueXkS3mNDS0VXzUvnoWsCybRuLXcubBw3wG3TRxSN6qbPaV8W68Eo4/8ujQm7eN9
 yi2g==
X-Gm-Message-State: AOAM5338tJeGOSFsKmKgY90A2Bo280UnURdeXNYffZL2+/9CXuzaWQ+F
 YPk/R7af29H2rTGqIUn6aP24RY0eTGM=
X-Google-Smtp-Source: ABdhPJyQe9OZuTSvATcd2GFhb6Kb+MmzTzzjY1XyyU1PwNag0qteZu/7Px0Vw1m615f9PWT9Atygyg==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr12697785wmj.54.1614551016376; 
 Sun, 28 Feb 2021 14:23:36 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f9sm16422668wro.77.2021.02.28.14.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 14:23:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] tests/tcg: Use Hexagon Docker image
Date: Sun, 28 Feb 2021 23:23:14 +0100
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210228222314.304787-1-f4bug@amsat.org>
References: <20210228222314.304787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
[PMD: Split from 'Add Hexagon Docker image' patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/configure.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 551c02f4691..489ff8e53e2 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -124,6 +124,10 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_image=debian-hppa-cross
       container_cross_cc=hppa-linux-gnu-gcc
-- 
2.26.2


