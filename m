Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4304774E8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:46:31 +0100 (CET)
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxs1e-0000j1-Rp
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:46:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxs07-0008JW-M6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:44:55 -0500
Received: from [2a00:1450:4864:20::433] (port=36427
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxs06-0007TK-4t
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:44:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id u17so44661865wrt.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GI0eDOxeONgRKehsh4Py4sxaPx+kahWhRhPA9tBcCiU=;
 b=Aw9xhtddQgogFo9hRrZ3zn1+Sm8ZrhNSEpy0lQAAF6MpP/JmOB4aiNbnzmw1e03ACv
 lFKroUZBBvkA6AQ0uVq94hS2GjVtSu3NPEoSaZ361FtGo5/xWaCNi+IhNoW+t6Ch9ZOH
 WjBeETSqf95zGqiRZITfRAY0gjYmwMShqHGGbIUL0/CXgSPL7f8YcBhyVOhdmPvx4Z4J
 bHmbbgD3x3r00COFZGIoit9Skh+NauRyuu/wax63BKqCv93xZyuCyvO99nHe9bBz5YRt
 oChtAsHbaH1OhtjvSx60qBiXwnAknGcKn8yVNvT6jfIQrhsvSLkiDPRzlXYZ8cXCd5Ii
 uLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GI0eDOxeONgRKehsh4Py4sxaPx+kahWhRhPA9tBcCiU=;
 b=y6APjkm1MjiA44I9e+8M1fHp05+4A6M6lNYHhYDY4EqGcjfiPkxtXkBKPWB90HqVDV
 KsScC4iY7u03HEeX+AzAy3A5m9dl2CO/kgrZ9GYed28HfJ+Mf7jH7DsoqCdPOHQOJyEM
 MbRizFHXQigjY6W5OoTj+/2ssS1Fb81gqBgvsBW95BT/8v/QUARaKKKTkRSO7wY4KdiG
 DT/x0uZnWYMsWHIkPuiBjG8z7dtxXmz3lk9t21fNuoDWN4hbx1tk833v8FoIMm8sG3gF
 4TUC1ZSSpwmcBBXxz7ZI+JeqV6FFfLhxWr0Sb2i78J0J0kLvNzARyJJqaumAV/JB58jM
 8udA==
X-Gm-Message-State: AOAM532C3BiQxIegPwpS/vy3uBfOwbqbnu27e55odYzEgyqL2OYvWhOB
 6Jn+m5g1G2yEqyvaGFBQu22tDg==
X-Google-Smtp-Source: ABdhPJxWiVzcVAfyYNwxl01a+Td9Sep3gEaGCM7cS+1/nEUSdrUwxfRJxGil7hoSO82O2A4janY24w==
X-Received: by 2002:adf:f587:: with SMTP id f7mr9331181wro.671.1639665892286; 
 Thu, 16 Dec 2021 06:44:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i17sm5635490wmq.48.2021.12.16.06.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:44:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 263D71FF96;
 Thu, 16 Dec 2021 14:44:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] linux-user: don't adjust base of found hole
Date: Thu, 16 Dec 2021 14:44:42 +0000
Message-Id: <20211216144442.2270605-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pgb_find_hole function goes to the trouble of taking account of
both mmap_min_addr and any offset we've applied to decide the starting
address of a potential hole. This is especially important for
emulating 32bit ARM in a 32bit build as we have applied the offset to
ensure there will be space to map the ARM_COMMPAGE bellow the main
guest map (using wrapped arithmetic).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/690
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 238979b8b6..8d839b79fb 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2334,7 +2334,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
 
         /* Record the lowest successful match. */
         if (ret < 0) {
-            ret = align_start - guest_loaddr;
+            ret = align_start;
         }
         /* If this hole contains the identity map, select it. */
         if (align_start <= guest_loaddr &&
-- 
2.30.2


