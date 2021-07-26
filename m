Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D383D6910
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:54:44 +0200 (CEST)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Yd-0001uN-GV
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Ru-0002oN-PU
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rt-0006CA-CB
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso1996005pjs.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hBw/k/z1d1LuXlQIfNytxkYVglrkLJic6NwTbw5pZ6k=;
 b=l33IWsMQPbf86P04iYHNsp+qAgfxZphHHggKUMScjDzq1krMgmNj15Vdrg9+o5NgDm
 5TyFP7r6zI4F6RSdupyqKcAgpyHP/qAcjH74cDZU+TjEPMRVcwSk9lH7eEq0HzAI8qXZ
 Jcn0BUTTSGLJttviUsfG0OwLdM/VYYUZZnaer52xj7y7UUFfG/f/bBMSgZQCBA+bTKex
 KiesKJpMDi8ujIgiO5Iiw4WT0HqHGX3oRbCvcM1o9AfTiaBWMXXtrALcIOUor4IhMySa
 SCR53DfbI3C2qODUuTlG1CHC9hsTUKk1gD0S3eKJcNT7bQhwKB7gDZ1snw7T6vxYJkG8
 jnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBw/k/z1d1LuXlQIfNytxkYVglrkLJic6NwTbw5pZ6k=;
 b=mhBFaZM//MJ4s0U5giNbOk8aV1OC1aznrWVLCMInmihgZBzRbR8gLco/f5zlhJZLK6
 2xR21Z4B+Ul37fcV7jJgUcCSxpxtisaDxYhk/RCrqowgff9Xsg8B7i7kATaXdR2FiJ/s
 c78qhdG9FQrRICzfkNdn6T9AJDxPhGh1G3LUjQOLrh9W7yP5PD0d1vmMK9Cr6zJZXUdG
 EfZSfOMD9OEgO0c3hT3t+qW7tBHhTnN3sp+gU4fk2vnhQeJIyB4M9caVOR5UfMK0ECdq
 5RH1wUK0QfijuJIa4Jj8pgGoyA8n0bX7IiolDfQJGMFWjjZuM74Kv6NinoxBBPcO11V7
 +0Ww==
X-Gm-Message-State: AOAM533xOD1u3ys3kZ5Le48FP93OJqLqO/IH7QihTGUNbY3GJdOZ+aZk
 /Zl1Dk4cuG0QiFPAjteZQLu/Y0lIxAXxmg==
X-Google-Smtp-Source: ABdhPJz9JbY7l+UPXpi1UhR4RBsRHmtOA+kslfBAPIv0GIqEAqilKc3UjPWPydNeKlJ6eELyyow83Q==
X-Received: by 2002:a17:902:eb52:b029:129:bc24:ce5e with SMTP id
 i18-20020a170902eb52b0290129bc24ce5emr15754029pli.67.1627336064191; 
 Mon, 26 Jul 2021 14:47:44 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 08/12] hw/audio/adlib: Remove unused variable in
 adlib_callback
Date: Mon, 26 Jul 2021 11:47:25 -1000
Message-Id: <20210726214729.2062862-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


