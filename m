Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530A3B93F5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:30:07 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyydd-0004hW-CI
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZf-0004SO-S8
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:57 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:47064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZU-0008AY-00
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:54 -0400
Received: by mail-pf1-x434.google.com with SMTP id x16so6163972pfa.13
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uAAmFhWv7ETFd0R5nmqABtUFi5nWOXa6WEzfz5fyTtw=;
 b=asJ6kI5G2uAY8rqPFp5tlwuic62fDFbksWKoeJ2ddtD82IJWGxj/jYFXLODq4h4Tp0
 dd+Yt7SNzTF28/WnZ6UUd05KAguMzAZLDny/wGiBITTVzEaRuvI2h44cvMnNQar1JYgD
 a0N+QB7S9Zq/KRoVv7awpUERj0/+a28Xw2nno/XeGsxBk5VHgXM9NBpMayUGCmq3osbc
 JPto+wCtxulMF1U/HEMki0y4PkKVSX60upslBLw898qrr7j6EW3KBvKew/2lwMq/0ZgT
 Nzi9RE0zH3yybUpmPHKwY5iNE26htCAiLKHfzrH3S/bQCXM+o/GTaOpr8DXpv2NNMLjE
 LYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uAAmFhWv7ETFd0R5nmqABtUFi5nWOXa6WEzfz5fyTtw=;
 b=sz3hLNx3+crbgblpkZsPlRx5Ke6s6ZxLiuP+9D5p/Q/33O+ytmqg4jPswxIekAlmFk
 J7i++x49iIS+zS7W5vhYWmawcDw9qhfBJZSmBdhNb/w7NqPo+o5gVyacaIlpCzPkx5UB
 MDakjYnarFuqKh5fz13/TIt3iFGWmVIqAMNzC4irscv0nPAVTbyXXupLxur74RX5e7lo
 gTRjL3ENL139P6vW05TghvggE94+8tFU74BTwXl/gCuVW3H18qT4kCumToQ++mt6/ysF
 VFr3JcnF2bf1u5jTLa6C5KMHPipUy3HoQFS29nNLkOIpu3OdwCNfpoi2Y5Zu7zleioYa
 9GBw==
X-Gm-Message-State: AOAM530jBL5eYgSnQmln0YLsnlW52NoapSJ0b1NQzSF8+qH97X71wQ4l
 b++5ga+fdcjcVsUcOjwr7CHldjX169WH1Q==
X-Google-Smtp-Source: ABdhPJzTm1b1OBHItS0/YH6EgdB0o5GgbhEpZZNP9qTMNhzyC3FuvaHhzwegUpFtyokZA6I6WKT3Vw==
X-Received: by 2002:a65:4985:: with SMTP id r5mr183835pgs.122.1625153141665;
 Thu, 01 Jul 2021 08:25:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] accel/tcg: Log tb->cflags with -d exec
Date: Thu,  1 Jul 2021 08:25:25 -0700
Message-Id: <20210701152537.3330420-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 67ed25beb9..e22bcb99f7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -183,9 +183,9 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
-                      "/" TARGET_FMT_lx "/%#x] %s\n",
-                      cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc, tb->flags,
-                      lookup_symbol(pc));
+                      "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
+                      cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc,
+                      tb->flags, tb->cflags, lookup_symbol(pc));
 
 #if defined(DEBUG_DISAS)
         if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
-- 
2.25.1


