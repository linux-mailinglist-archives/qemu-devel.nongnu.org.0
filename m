Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9926D065E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:19:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsBK-0007VS-9r; Thu, 30 Mar 2023 09:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBH-0007Ma-M9
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:07 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBF-000206-KP
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id s13so10881193wmr.4
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQ1Gu7qVTMNET7Ilwd4JTbEMslTBn2t6QdfWWwcVZrY=;
 b=AKVyZGCXp5HbSUgAJNa1jehPofrabn355kzbNpxTOKZDZsM2XjDvRn3KuEZYlo9oNw
 n/+CZbBBW9a4fqPKvhUS7esg1T4hDN4LSb9tweCM9XciXMvfPKbL5CCLiobiA9DyHhUt
 44zccj95IBT5Ep6IJaIsSygTDnW5zCggQcSHNuEelWK8bcIFzWGK67Xql3/bHJ0udPwy
 UvLi1OfBAQZeq1Fz9xV32v81xClR/cZK6Jc1qA4JjHwE8VOTl28kYy/s8AT5/pCb9zxH
 pXZ2kl6lB9X7JVZ/hJ3BZLprYWif+XVkcze9HnEP/Ck8zABV3BhnZyc9pzqSW0s3pWcS
 K8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQ1Gu7qVTMNET7Ilwd4JTbEMslTBn2t6QdfWWwcVZrY=;
 b=L0stawrzSsnDYrUMx9FM6ZTvYl9d2/DTqAjzd7I63xvhXvSM9MzhylzJ/I97bO/EMU
 aQgu3ReUTHah3XhlkYakyjTNcnyPOoYNVpZ1be1t1zdKcdLL181mAupjtILzq/J8GzB5
 lgq13BUjIBGz2x0JzimzNINRobpei4EffUy6NeKM3kT1gf4ETB7KKqkZxQcRXRXTd+Ta
 fmiQBhzcHUre8+j0ZV+yhOADBktIkh4E6h4FRc0isTF7e3QxLeujX3EqFy5JJsC26PcI
 KuihngHjzFkHr+HV4pVuGLS2bE9toeOM5tXrWqpAk5BMrEhfHwqaZdlA13CIIqm373Bj
 oW+Q==
X-Gm-Message-State: AO0yUKVv6m3Sy/r1O9f8ZDVvYxw+y19mFw6cMpzj2tOaeKe4EfWl2QgD
 b5NqX9LfpNkCUyeAQtN/77j9EZAo8urPZwwfzcU=
X-Google-Smtp-Source: AK7set+SsjC75DX/ovNXm37ISRrvTRQ56ayUBc0uHCSjPl28MB/EcN16uVoA1Fx3jdH5cI1YP8l2Ng==
X-Received: by 2002:a7b:c44b:0:b0:3ed:301c:375c with SMTP id
 l11-20020a7bc44b000000b003ed301c375cmr18488071wmi.21.1680182343824; 
 Thu, 30 Mar 2023 06:19:03 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 fc11-20020a05600c524b00b003ebff290a52sm6193963wmb.28.2023.03.30.06.19.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Mar 2023 06:19:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gregor Riepl <onitake@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Zach van Rijn <me@zv.io>, Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/6] linux-user/sparc: Don't use 16-bit UIDs on SPARC V9
Date: Thu, 30 Mar 2023 15:18:51 +0200
Message-Id: <20230330131856.94210-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230330131856.94210-1-philmd@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

The 64-bit SPARC V9 syscall ABI uses 32-bit UIDs. Only enable
the 16-bit UID wrappers for 32-bit SPARC (V7 and V8).

Possibly missed in commit 992f48a036 ("Support for 32 bit
ABI on 64 bit targets (only enabled Sparc64)").

Reported-by: Gregor Riepl <onitake@gmail.com>
Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Tested-by: Zach van Rijn <me@zv.io>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230327131910.78564-1-philmd@linaro.org>
---
 linux-user/syscall_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 614a1cbc8e..cc37054cb5 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -61,7 +61,7 @@
 
 #if (defined(TARGET_I386) && defined(TARGET_ABI32)) \
     || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
-    || defined(TARGET_SPARC) \
+    || (defined(TARGET_SPARC) && defined(TARGET_ABI32)) \
     || defined(TARGET_M68K) || defined(TARGET_SH4) || defined(TARGET_CRIS)
     /* 16 bit uid wrappers emulation */
 #define USE_UID16
-- 
2.38.1


