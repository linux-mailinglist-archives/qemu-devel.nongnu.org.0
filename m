Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828E3D4D5B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:27:49 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dES-00080v-9U
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBD-0000RK-21
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:27 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBB-0003nK-Ko
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:26 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so10251580pjh.3
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hBw/k/z1d1LuXlQIfNytxkYVglrkLJic6NwTbw5pZ6k=;
 b=sJy7zBVGQg4uRG9RykxQYUTe6BHcjNm6ixAgvpXWXq/Uj1kn6Lm1aE3nq9vKRaOm5G
 isAJNbFDEeb9HxzFpKbuEMH98Lni478HvIpK0//Gq0l3dUDxl3GyfqinsJqmmqN6eD/U
 COzSLma20B2nxrPqTJujnd1upMWfUrVt2JAc7LYd02pT/BsQy+8OooBPMKwQnoE57l5T
 IQTE7P0XXY4+L7uVLz1pX+Mgmgoi5CoNtX2FcAvwA18LBPym7FYDQaJDu6cbc3JiIgmC
 VF58sC0tdb26dwzPxigACFZhluucx8pbp49CqjY7rBhrkoin+pnamum7IzoRe1m5+PtG
 1V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBw/k/z1d1LuXlQIfNytxkYVglrkLJic6NwTbw5pZ6k=;
 b=FIvh5oVcc1Ozoj/pU6JNAhc/lBsKOY8hWTcm4pdO6B3+CZAIUUG9610U7CZokODKpX
 gLybalwmLEdNI3Nmk6ZSEff4+zjoq6Bl1lomXpJEot9i/SExCNwfHs8MAc3zvNRSigNQ
 bvR6ybmzcQTSPaIJtfAv13ydH9l7+J2n0jBRG4RyvOSdflrbMcNE3Ityfr551HGi2YaH
 i3/p+ExgXrMv+m5jPGd9nop5WkYHCQueDEwwHqkIGgBljsjbYYZq4iDnBx0hpv5+Mf2p
 X39brhUqMW/1mnJP5rm692ZI4gGb1Hz9imIujiRl0TTsNPAP/hccSbjlifuQVPbA4aI1
 an8g==
X-Gm-Message-State: AOAM5335auIiWb3xMI/tVIo/2N+JiGFz74aMlSHaGAfmx/KIQM9985m6
 YULwBq0GN9XQTSyCg+RlIUlLAOEQDjW4Og==
X-Google-Smtp-Source: ABdhPJw2g8Qcv04y0AX31f92X1vd9eOXHMKwqC58xgwCvBc24gcW9oce7lwgwxQLQ8hPqjoR77S50w==
X-Received: by 2002:a17:902:e051:b029:12b:4f40:7c7c with SMTP id
 x17-20020a170902e051b029012b4f407c7cmr10695366plx.20.1627215864413; 
 Sun, 25 Jul 2021 05:24:24 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 5/9] hw/audio/adlib: Remove unused variable in
 adlib_callback
Date: Sun, 25 Jul 2021 02:24:12 -1000
Message-Id: <20210725122416.1391332-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/audio/adlib.c:189:18: error: variable 'net' set but not used \
    [-Werror,-Wunused-but-set-variable]

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/audio/adlib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 42d50d2fdc..5f979b1487 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -186,7 +186,7 @@ static int write_audio (AdlibState *s, int samples)
 static void adlib_callback (void *opaque, int free)
 {
     AdlibState *s = opaque;
-    int samples, net = 0, to_play, written;
+    int samples, to_play, written;
 
     samples = free >> SHIFT;
     if (!(s->active && s->enabled) || !samples) {
@@ -219,7 +219,6 @@ static void adlib_callback (void *opaque, int free)
         written = write_audio (s, samples);
 
         if (written) {
-            net += written;
             samples -= written;
             s->pos = (s->pos + written) % s->samples;
         }
-- 
2.25.1


