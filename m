Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB533100B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:52:47 +0100 (CET)
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGJS-000847-NG
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHy-0006OG-CF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:14 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHv-00019X-IK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:14 -0500
Received: by mail-wr1-x433.google.com with SMTP id d15so11546026wrv.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iLXz1N0BQOxTQbwmS1B/ilLFWZjmC6OV4ztuE458q0=;
 b=XZIB+zcEYJgPNwb1xpbuurmaRjSb+XfMqvyDqzixqfD9jpzJSLWcYWax3tfJf8DZ6j
 bOyxkWCc4N6ggnDmVKu//6MgpzXDrquKQAxe0LPNF366lpTDmGZVlQrPO1+19xSw5cUE
 x/ictljpO7nUPPnw3U9yWQx0/HzEjMdh38HRdOHN5pTzqQG8XMJoJJgB8dBqoAPoJBQR
 VJSoOHiSPpslH5aZjQHMnaMkqt9t3OJwwrE1AsRx1DqON+aiMs6VeKdLi4WKGP/yd+KC
 eiWiQ+TEabLo6wi0oe3nBNFvCnSWCWZp4bD3qDsLjJiwMVNYPRdsIHsaMOFRkkqJy5Hq
 RRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iLXz1N0BQOxTQbwmS1B/ilLFWZjmC6OV4ztuE458q0=;
 b=DCfj6YT0AF6DTPhZ4YvhVbLuocreHO0lOT/ejh14VahI0yPWkJecoMnJVoCZaRLt/W
 Bdh4FLfJW8czNIEztsmw1Ie2eyJDJe7/D5ho+oTsLYrAbytNXkMTXKIl4teL3iZB1wPf
 CKrVbqaycNKnwioqHpRZJ1T0T6BNmIm0Z4XNsA4+P7aQZIH6zFHgw46IGybqFbhhxYIa
 N4+iYicVp9nM9X5ax4TBbn32qjTWIRW2xJE9YOMGLVdv5eduyp42/fHB8cRFM0TJMXUy
 Ovz/XxI71M42hYv/nJjksKcCM4qlDnRt8upG2ZcefjDABr5l3Ho67sjCMR/AkE7TTS+t
 yTvQ==
X-Gm-Message-State: AOAM531zTNTaG96HV/fmpt0mc6XrjjTBA1F6t6HBymS1Hl4JP+Rt1dbd
 nGjtyGSMA/h4gHXHa9+YpGuciA==
X-Google-Smtp-Source: ABdhPJzB221c+G2pnLWzKLJg0kkEsl2CQFEhRnyhjrvl8a0iS2ptR8PC+GnM+zn04fX//FQISlwynQ==
X-Received: by 2002:adf:e582:: with SMTP id l2mr23269724wrm.207.1615211470313; 
 Mon, 08 Mar 2021 05:51:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t8sm20408018wrr.10.2021.03.08.05.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B4661FF90;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/18] tests/tcg: Use Hexagon Docker image
Date: Mon,  8 Mar 2021 13:50:50 +0000
Message-Id: <20210308135104.24903-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Message-Id: <20210305092328.31792-6-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 36b8a73a54..f70fd7435d 100755
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
2.20.1


