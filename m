Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D3697F91
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:36:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJoC-0004B8-Gz; Wed, 15 Feb 2023 10:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJoA-00049G-E4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:34:58 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJo8-00089T-N5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:34:57 -0500
Received: by mail-wm1-x334.google.com with SMTP id o36so13638738wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NKH73T8CoRDn773NUygCpVvIPtF8CVn6vI6nMM27j1I=;
 b=oWMZO8SDTBKsKLKV5arFKZkrAJOGtNpPBm7I7aWKb95hPiiIgSofZ2fkKU9tV1yKEk
 ezjXzyaIJvJZ7pt/cesNBdhWjhfCD6KYhuK3pUsvBFLzjuXN7TM3pj0Aj+NMo1rWX/D+
 HjCANU6Wo6wCGW/Kv//t8t8RmH8XJ2EJBasw66r5j5wcdU9lsvUIE3mQU9Vp7JQA2sI5
 +CUrsISj4deC6Zc/TrdvDLfz1UMTfaaVHV/WHx/zcqM5nvoBYV7XqNW0nYgniuMJfDdo
 OQ1fyZ5xzZ5uQqcPz6yGnEHfZanaWvSUEkKl05yMthFmyQCAbLDxwE1G6pJTej7KTPSv
 eo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKH73T8CoRDn773NUygCpVvIPtF8CVn6vI6nMM27j1I=;
 b=ggl1c83woeV7UYQCjqZsfJ7dVb4cPPcecFAwMR/A/pGPH2YbS01ZhuOsP2TgyAwLg5
 i+VrQTJEBNuhHaVS7MKwASSFrfwi00dPi8G3/0KO23vl7KZ0j6DZmiJnLK4YCPgUulzz
 JCqakpmfMj27lq8ijQ133IzSJHW2SH1d+OAUuwpp41U73O5Oa04Q0F5FUyoI0JqAcQ3q
 yE1PTOs3Ub6tok/2iI8yZAHfEIn4lbywz/4+tj6ygyxcRI82sLdtQrWepEX3AxELyKd5
 XCxyk/wEejVNN2xHbf+IBF1Bb1U+Hfw1ZEqgh8Qjd0FA0JvWjpr/M3tmyFG6tgXryKmm
 ak4w==
X-Gm-Message-State: AO0yUKUmMEhpUUboj/0hcwmJuKUrX9Q/JsxWAFTfRZHSpUVTuzExZ+ka
 /TCGu8QNDEGskn6XdmvY+05oSESjee7Q+PJT
X-Google-Smtp-Source: AK7set8VKr93YhBGymtNxoDV9uf+fr5u7KtD7OV4RU+JGE5FxHGGg56i8sDAFXLY5R0goR0ryEeC4g==
X-Received: by 2002:a05:600c:5024:b0:3df:fcbd:3159 with SMTP id
 n36-20020a05600c502400b003dffcbd3159mr2107593wmr.3.1676475294684; 
 Wed, 15 Feb 2023 07:34:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1c770e000000b003dfdeb57027sm2282207wmi.38.2023.02.15.07.34.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 07:34:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] accel/xen: Remove dead code
Date: Wed, 15 Feb 2023 16:34:51 +0100
Message-Id: <20230215153451.30626-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Unused since introduction in commit 04b0de0ee8
("xen: factor out common functions").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/xen/xen-all.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..c1b697a8bd 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -23,16 +23,6 @@
 #include "migration/global_state.h"
 #include "hw/boards.h"
 
-//#define DEBUG_XEN
-
-#ifdef DEBUG_XEN
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, "xen: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 bool xen_allowed;
 
 xc_interface *xen_xc;
-- 
2.38.1


