Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A73DBE5E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:30:17 +0200 (CEST)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XGx-0005kE-Ui
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XFF-0003fW-0l
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:28:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XFD-0002HM-1N
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:28:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id nh14so4709587pjb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkE3dQf5TIvMZgo2onGkpvFXTYfGsfBXurvbs76LBNQ=;
 b=sRtOpnbELr4HJZfY24dYbi/AT1N4D/foyRDx5VytkvTt8pzAiIZDFRus00HW0Vo7+/
 3Q36CVcLeCJMU5v4GoZIH4YX5qphn2y5KZsspRuqZ3ARwAQIHff5M8a+H5gtPE8luN2/
 yOt3r7gHmv9R2GyDpEtxagNhqhjkKBeyNDnfx7+TEHBynUDnn1hZtff7i0DuYufSI95z
 D9s9zCeRu3oQme9MGF4HEIaAjMcXEdnM0LMAEEHrge6ZAjwdMG2Q+uKAOs6C7nUVjF94
 3p6HPkKbYqZhn9rMASMNsyvzUGF2R7swtpkgi0nHf66XiUpN09PBdNDKS/kwSNmaKeu5
 +cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkE3dQf5TIvMZgo2onGkpvFXTYfGsfBXurvbs76LBNQ=;
 b=dctEnFCAY2Ik19LHF97kt7m/WPWhOQk/z7lHc3fKcAFWbfxvi4e2Ed6EqByKcvkK0K
 i7EYWVQwiPdMcmqgYUYT0U1AXgc0ZzqIetzsfGLpLdXnO0mdkEqmzpqQdCpfWNEFQtol
 rmcoOBjP49z9Nb3b2XzCvpoRh34AtzLfsftP2G1pV6zGajLT0tYIfXuDg29YhxZ0Fb8V
 RAt+/PHJFPBOInLFPFk4k0AdOokRXbwhQYa9xOhGX9fb6is11g9v1xMfX/UVLCn50CxE
 VtmNhZQFuGmjzqVvz7MTk30KhosVjeLcdKOQpTNAcKDu7ZeJOQYrnbHint6cyoZHMlY8
 Xc7w==
X-Gm-Message-State: AOAM533IFm4cq0rZHsh0yBj1BJeAPE0ETuBsKDIbZMiEoDhdsBW76x8x
 u79J0eTdaNBDNvO7Oo1Ov+1KuwuOoISrAQ==
X-Google-Smtp-Source: ABdhPJw3Nhql5xpPpl7CNFSBvZxRW1MCSY4x6XgZ4uWFn83zvZ2iEXuThRE3Iunm3np/KG56Ro7tag==
X-Received: by 2002:a62:5a46:0:b029:3ab:9434:4eca with SMTP id
 o67-20020a625a460000b02903ab94344ecamr4214005pfb.39.1627669705882; 
 Fri, 30 Jul 2021 11:28:25 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id k16sm3004185pfu.83.2021.07.30.11.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 11:28:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] target/nios2: Mark raise_exception() as noreturn
Date: Fri, 30 Jul 2021 08:28:20 -1000
Message-Id: <20210730182820.451248-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730182820.451248-1-richard.henderson@linaro.org>
References: <20210730182820.451248-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Raised exceptions don't return, so mark the helper with noreturn.

Fixes: 032c76bc6f9 ("nios2: Add architecture emulation support")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210729101315.2318714-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index b0cb9146a5..6c8f0b5b35 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -18,7 +18,7 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(mmu_read_debug, void, env, i32)
-- 
2.25.1


