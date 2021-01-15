Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2192F7DF5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:19:19 +0100 (CET)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pwc-0005T9-42
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEY-0001Bv-4N
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEW-00087F-Kc
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id c5so9295666wrp.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moGIhp3Qh31dnVMf3+UGKfdn7lm3YI+E8Yw9+ZtUEYU=;
 b=lOJuv7iSRwTHqce2TNln6ZEgNB0vdm0gmjXxV9zBqbub3vh6hIDHDEN5OeL5yvrVxD
 3xaeLH2Hdn3MCjmY7z3BiCWKPseJCgBw+JEycugNlySc9G7YEUJUZrt2SDHP3BdG5R6T
 wAEtkZn+ETnvneguWOhEAIqDbLZuHDJQv5u0Q+79xZZFjsjQDNp9GZzbv8tKlEIyuQg4
 CmrcKP2BhqpNSVvL681ZDYrrX/oF4gsptopLJqvvHLdEB1TgreMn2JZMFT5zfld102Gn
 8rMOtjk8cczRqYzuX/io0Js8oHmoWskVHrHwXBnjqK9Oj2TnfJuMpKJKi7kJLz55qxYI
 ml6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moGIhp3Qh31dnVMf3+UGKfdn7lm3YI+E8Yw9+ZtUEYU=;
 b=WIP1hNATXLaxgD14WrJPm6CTKgL/7z+IhTLCFXDaTifmhCsJKDnnQ5BudxvUvyWeDj
 X9MCdyNkDlMRF2w1GMLqRkfYsR75Ip1b+XEnhkw0CT1GEUtS6rp4sfsHVgiXfgzMVgxR
 9bRO09r/BesNhd9f01MkNi4kDx87vCghpBCGmnt6ISVokAfOdjdgHr1Z2aL4mkV6PWPM
 bHL2dYhWPjjcku7iLb0Tjd9/59/JORCjShbuITrmVR5lrb31b2qzYg4jH+2Yp6GzMiGz
 wnQ8nfpp3V4MAE2R79cqitdv8+UNgoH+Or5c1aMlmbURe1bxYZQ0E7DAea5lsFOlfUHb
 OjRw==
X-Gm-Message-State: AOAM5327ioULshj8AmQrnS2Y72riLLUS4yK37kzAfrzNyC2zkvq+6IBK
 w70orayKxbOE3e9uDPsiHplSQg==
X-Google-Smtp-Source: ABdhPJy9Vd0jpIMhbNaM6nbQp+PmBUIbavErrXRUWmLQFDEMkqo8S3QH8mbz11yP7PAGm3ju0hKJcg==
X-Received: by 2002:a5d:6204:: with SMTP id y4mr13226251wru.48.1610717623301; 
 Fri, 15 Jan 2021 05:33:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m18sm15105670wrw.43.2021.01.15.05.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C41A21FF9D;
 Fri, 15 Jan 2021 13:08:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/30] Revert "tests/tcg/multiarch/Makefile.target: Disable
 run-gdbstub-sha1 test"
Date: Fri, 15 Jan 2021 13:08:13 +0000
Message-Id: <20210115130828.23968-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We won't attempt to run the test now it's gated on a newer version of
gdb.

This reverts commit a930cadd83b4681a98ce72abf530a791ee2e42a6.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210108224256.2321-5-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 230eb9a95e..cb49cc9ccb 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -54,9 +54,7 @@ run-gdbstub-sha1: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
 
-# Disable this for now -- it provokes a gdb internal-error on
-# Ubuntu gdb 8.1.1-0ubuntu1.
-# EXTRA_RUNS += run-gdbstub-sha1
+EXTRA_RUNS += run-gdbstub-sha1
 endif
 
 
-- 
2.20.1


