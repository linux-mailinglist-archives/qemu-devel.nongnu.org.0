Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4857741A551
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:24:31 +0200 (CEST)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2nG-0003bY-CH
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2Qc-0004rr-E0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:06 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:39642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2Qa-0005v4-Ob
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:06 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id a14so12480070qvb.6
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3BaOtd2sKvGGMkwsWvzzoYXWYcfmOr52yRDlczbFYY=;
 b=oui9UMA6AgesmqmpfYq9aeAXTEwmmEGPD6QFeCJUsO2eHQb92viveCPew8SBg0s6Dl
 QWuP7Pthpe1w4fEzgS5OkEel60kCXKzryi3dok4GZ0+8FNKuc+Ma+2aByOQhODT9o7Qb
 xLejw/Um8zJ4PGC2bgeCE5KqCuV27yDLaok7itj2SgSTSdeSu8/EW/KfbNW6gXr2gj/c
 spXRd9eYa7mGHwXgOWPLECpmPoetPvYjFhY3lNvCCIsaDT6bkr3S9BYDjUy83034/cIX
 /wSPMpgAlfkb6R5IX/A34bGOteu3str3mmBk/kQ07FWTKkSRm/NO4fWdH4oqhvbA3Fio
 5OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3BaOtd2sKvGGMkwsWvzzoYXWYcfmOr52yRDlczbFYY=;
 b=3ZKvEL4C5K8c3xpXgxH7MnPUKPrBY+hh/Y7FaZ0HGFnXNcs/ORxXdUxtJ70kCybwx7
 VWGuwteqABI1wjZdJmAbrJguuiYMHCcGWvU4YVHP3nQ1O5R1OnBOFN9LSLaNAaORf18r
 zXEgjFulXU8PYCssl0jOnqoxBGqdR2y82dWnYsMGaKuyUHouS5NVf5AFwg6qIQaWb4i4
 KV5QRRMVIcdt5lHdaBIQ5T5wFRSLwDe2BsMMO0lXiOICuzoyyR3FtEwtqD/sshZVwGq8
 JgGUSatBsdDI2dMPgBUGu9Wf94oQD4J5rQEH24rYC1rTKQebY+bLahPwWs1Y8JjRqR0N
 PvzQ==
X-Gm-Message-State: AOAM531TAWXixXSwybaj/7oAud0NQZMWr/lrgVDhr5ka9/NakJtioU51
 aW0NhJirTLDu8np6c2fcFx6ATn2l/u6yqA==
X-Google-Smtp-Source: ABdhPJwx9UL0GIeOo8FyuE2hjWR1ShG1FRL1gzZ+na1hiQyyoejxA4K/YPeERYw2BENgdIzWwyNgyQ==
X-Received: by 2002:ad4:47af:: with SMTP id a15mr3046768qvz.36.1632794463471; 
 Mon, 27 Sep 2021 19:01:03 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:01:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/25] linux-user: Remove default for
 TARGET_ARCH_HAS_SIGTRAMP_PAGE
Date: Mon, 27 Sep 2021 22:00:39 -0400
Message-Id: <20210928020039.184412-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All targets now define TARGET_ARCH_HAS_SIGTRAMP_PAGE.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 459a26ef1d..2404d482ba 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -30,10 +30,6 @@
 #undef ELF_ARCH
 #endif
 
-#ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
-#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
-#endif
-
 #define ELF_OSABI   ELFOSABI_SYSV
 
 /* from personality.h */
-- 
2.25.1


