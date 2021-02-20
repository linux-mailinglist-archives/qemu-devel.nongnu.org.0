Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E4320734
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 22:31:27 +0100 (CET)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDZqX-0002A2-IW
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 16:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoL-00012O-62
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:29:09 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoJ-0003mp-6j
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:29:08 -0500
Received: by mail-pl1-x629.google.com with SMTP id z7so5330944plk.7
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 13:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YZlcIqbge5shBdwBo+gxH2PmfFRPNLK7+lY86kmx9Oc=;
 b=X9rwrJvvpLPkPiHsw2/TBcuTLcGc/066IQckwwr2PODBMSZtSGwNJXrMRwiMF6Csow
 nEytwxwYPmpxa6CRE5SLUzEZeAxYd8bRUfp6AC6ZRGTTEp2WvrteCbb+ScpyPTx4mBwD
 jccd2UD9TVbZOqNniTr29cVlBIC+xVqXN8iyvpNtcFHaPUuqbAJW6w3wp3fzkWwJCTjy
 p+9wCZ18PeV8AWP5MW1pjhosYW8UA+ey1pF1vfBfjLpTuRK9eWAiZC+PONhPKn3wA3bX
 8Bc1FPyUCYQD1r/S1r+kSpAPQSQYrWuVzEGejxovl+rumT9ipp3oFBU83IZUln79HUUM
 +qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZlcIqbge5shBdwBo+gxH2PmfFRPNLK7+lY86kmx9Oc=;
 b=tYba6gKFCpxXIKJ/EYdNuKadQIZHNz0AayM9LOWEYSeizFJASI8XyKrRc0RMEKW0Cf
 ei3kzi8GbJ7Ba/yJc7DrbD498BjIC9Q/FnRHuu6nU9kEtDEgpjFqBszLf1OFV9Ui8eD+
 du19ib8keoRgTYdaE3ZX7SL4oVYnY8TeAeACXVLb5NDoAkVLLKdlrFkSOi/VkIcAleS1
 RfycaGDjTmh1mKHVbPk3J1kDkMaN5epmf+Yaz9zumYTyqDHpJxZPxihgz5kQ9R64fio0
 r1a3zBthU5xGKkTar0WBpVSXBQXz+HSwU7F52y0erZaJr71wcKxlj/vUBxCXS7vj/ab4
 PJ/w==
X-Gm-Message-State: AOAM5311lBWRhLpRnzbPiQO/hINWolCneaLgvr5mLELSLza1hOrGLIWf
 tHnxYzwyF18vBZ06isEnaJotU8DA/sqB9Q==
X-Google-Smtp-Source: ABdhPJzwjzlZj0xXx0GmDXSgpUG3wFVii5Q7ICDjw1vKUn2fNgqPz+x9xNSLI4rne4OUCwT9ppOElw==
X-Received: by 2002:a17:902:e551:b029:de:8dba:84a3 with SMTP id
 n17-20020a170902e551b02900de8dba84a3mr15059086plf.8.1613856545848; 
 Sat, 20 Feb 2021 13:29:05 -0800 (PST)
Received: from localhost.localdomain (24-113-145-216.wavecable.com.
 [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id h186sm9726559pgc.38.2021.02.20.13.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 13:29:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg/aarch64: Fix I3617_CMLE0
Date: Sat, 20 Feb 2021 13:29:02 -0800
Message-Id: <20210220212903.20944-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
References: <20210220212903.20944-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo in the encodeing of the cmle (zero) instruction.

Fixes: 14e4c1e2355 ("tcg/aarch64: Add vector operations")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1376cdc404..903ab97473 100644
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


