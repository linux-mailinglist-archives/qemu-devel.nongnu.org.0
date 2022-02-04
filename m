Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC54AA160
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:47:31 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5UQ-0001IJ-Ei
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:47:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qj-0006ds-Cb
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:41 -0500
Received: from [2a00:1450:4864:20::32a] (port=37605
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qh-0007Ka-H0
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:40 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso10193475wmj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynFU7GIrDRiFDHdJik7DGdtoBE+darFWUPkAFAGxRwg=;
 b=F0wmGj8F0x+I8yCZLvVIzTd4ugE+QQGyCglb0V/mQo9FIlU26lmoiNnEzm9LBe/wXE
 qDiHiDSYXkZFngU6dzsBuU2PKtbPKnTvN6qvJjN7CDRRABESVSkuuzEBpwcHxvXJCjaN
 mI+KGjpyeR4AycUdzd11QrS8+S/H1y+ZPPEazA1a5LOwdSHB+URQGK4qYnXizRTAKgxX
 7dLo1hy5VDm1YeBKwzT1ShK712Mznn1+st1PjQekwkDrzEyhM9zZND3VWP8gepNVQwV/
 rD4y+G0UeuFPhp5CKippjgriC2QqKgaahL5JgoumBjJ7wtmFh+rOzBYTW4C3jE8WnZLn
 kn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynFU7GIrDRiFDHdJik7DGdtoBE+darFWUPkAFAGxRwg=;
 b=qrSqE1k3q2S3M36sHugjPug1j8ihJ0LIJ8X7AFjrts1y+i9sxMyq/lai/cLjySPirc
 bx+NCp4yOCaV/tOyvRrVeY5ccWk84TZs+qslgQtkNUGtg3G5vyPWXXI4ryoBXZ89UmlH
 yxx2KehGQPWmnq/AM6uA6xb4SlrUfC4MyTAZNygNmoxYhZZlCfX0iWsEyaj73nsYDB0X
 UaBv6OaXwLZ/Bw5Cf5P/YRN3N51jGpAm3uvSwSlJZYqHDbFaZIs+FQhRgPH8TNcuDvpA
 kbmO/DTVml2sZkuXl3FfkWE1YCcLkvv/9Hl2i1vVhOlZCXqumXJeKf9i1iQyKEmAwEBd
 d8ew==
X-Gm-Message-State: AOAM533ggmfxFinhu8eEo/ZBlwi/VQLr79W8usuZnBFZ6pHne5QsMIxF
 dmpPgz+CDlp/zIoNcL854B5Sig==
X-Google-Smtp-Source: ABdhPJwrUp7J3N4bT0AEoPIj5vpYNDay2eIouihgQ1Kz+uz1Nj2Pro1GS7wTEaWJIJ/7jLHl/DzmJQ==
X-Received: by 2002:a05:600c:4808:: with SMTP id
 i8mr3695415wmo.23.1644007417714; 
 Fri, 04 Feb 2022 12:43:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p8sm3228490wrr.16.2022.02.04.12.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 399351FFB8;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 01/26] tests/Makefile.include: clean-up old code
Date: Fri,  4 Feb 2022 20:43:10 +0000
Message-Id: <20220204204335.1689602-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is no longer needed since 5516623020 ("meson: convert migration
directory to Meson")

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220124201608.604599-2-alex.bennee@linaro.org>
---
 tests/Makefile.include | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9157a57b1a..646c8b1334 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -34,10 +34,6 @@ endif
 ifneq ($(wildcard config-host.mak),)
 export SRC_PATH
 
-# Get the list of all supported sysemu targets
-SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
-   $(wildcard $(SRC_PATH)/configs/*-softmmu.mak)))
-
 SPEED = quick
 
 # Build up our target list from the filtered list of ninja targets
-- 
2.30.2


