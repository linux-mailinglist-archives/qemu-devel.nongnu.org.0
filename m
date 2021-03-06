Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F0232FD88
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:38:10 +0100 (CET)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIecj-0000C8-2J
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeaz-0006vY-U9
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:22 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeay-0002wS-3D
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:21 -0500
Received: by mail-pl1-x632.google.com with SMTP id g20so3116263plo.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+XOqZ5nVIKFE5Wvq06250YDVlIY9I1NmppdkJVW9Dc=;
 b=Sz/MmaciIMkFOxgJbgWOV1MZan9hflilUjfGq9gB4vrU1xEFXDN2Aa0mTGsCxxFizU
 DkoJKrBgPoRbJ4c4UreJYSt6klVXJfgut3LUbyZjsWKFnAE9gyfiCzsqzg6e1uh+1lAr
 EGjZdRhuScB9Qxyw7zmecdVn7pRmqpCChlR4Nwk0eCozebnuI+bvpRBmzsNxdtkzOryT
 rsGPR9LUB6F9WLgkHeN39iahMN7JdYnagwKU7isen2qX45qHAjz/PBBAG/Qud6ikkIJG
 az5+IxfUgu3uQ1a9M4ck//d/MCJLznXemOoJ/QFS0+VvndAj5JGzPJgTCZLoI8usrQXq
 iLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+XOqZ5nVIKFE5Wvq06250YDVlIY9I1NmppdkJVW9Dc=;
 b=YsmdO5/qUc8RrCFJGOXV2MtymQJSwe9vkHgxDNwKTNamM+XhZ09qwWs0M+peYPeT+H
 QHdYCspeFzBir5wi9AtzHau4LUTam8PyCJCicr+xA90lH6t6g7LjMzKe/3RMiJ0Bi+fd
 bo/S6NPfthLxtBTXqhau372BZW/K5RFaV3olTQv8WDAKbXYGyowCJ0eIjXJDuwQYE5lo
 iRm8v0MQ7XdRBnrLHSFKcMH9OxKOYyGUqqZgZVcP3vHzzzFnj9fTgW6ZCUnNol+LsobH
 9B9ursz0x2/58Ni1LKXGU5mgvRj6pmtYGVG8SdphAWVaEGnr+7Zqir7SJvLjgizrKBhz
 E3EA==
X-Gm-Message-State: AOAM531PBhxEoMjipn7u79ef7DyFY+iiXmA1GNmn1MQ7w7pQhFfYfJUM
 D86thS1CGwgHV9Tu1pnlPy4tH4pXxvPVCw==
X-Google-Smtp-Source: ABdhPJwIV5Iefcsa/GlOmfnD/MqmqaNYu1oLrxpQ27aWLKh5IVW1Zp92WeHLo0Vx3sV5lAO92vg5vw==
X-Received: by 2002:a17:902:c40a:b029:e5:b98e:a4a with SMTP id
 k10-20020a170902c40ab02900e5b98e0a4amr14217031plk.67.1615066577530; 
 Sat, 06 Mar 2021 13:36:17 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/27] tcg/aarch64: Fix I3617_CMLE0
Date: Sat,  6 Mar 2021 13:35:48 -0800
Message-Id: <20210306213613.85168-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo in the encodeing of the cmle (zero) instruction.

Fixes: 14e4c1e2355 ("tcg/aarch64: Add vector operations")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ec0a86d9d8..c8e41dd638 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -561,7 +561,7 @@ typedef enum {
     I3617_CMEQ0     = 0x0e209800,
     I3617_CMLT0     = 0x0e20a800,
     I3617_CMGE0     = 0x2e208800,
-    I3617_CMLE0     = 0x2e20a800,
+    I3617_CMLE0     = 0x2e209800,
     I3617_NOT       = 0x2e205800,
     I3617_ABS       = 0x0e20b800,
     I3617_NEG       = 0x2e20b800,
-- 
2.25.1


