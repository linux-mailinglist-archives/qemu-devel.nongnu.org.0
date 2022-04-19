Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6D50644C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:16:29 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghA4-0005YP-UM
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglo-00017s-SI
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglm-0004Og-Pf
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so777403wma.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hLBhHXaZKYrV14/sIWGGHgjOzMy581GRe2H5TvaKgUc=;
 b=MVdRODd8Oe8fMIECdu7hGLGT6vukWq1gZh6eWon9oE353Y6XQ9MiLckWMU94ivSJuc
 QSmmWjqbcMaGRar7vGZJOKBvXxoEtatbRv08GCpeaeMSQVkYUfzs7CM3MA04Ss/ivDeE
 itAjezgponDGM8rmoXooIpOacgpG9A9zI3Q/94p5jLttrxOLRwHISE2no5Z2D/8rSp2J
 V2NTESMSlmrOw/H+YGCYp4OHy3wEj6zS3xw5maxXZg0j5Rags2UG3Fkob9LNiQn7hrgW
 BiMG2vf0Q5YLTR7UZb4IIDxEKTaiDpuSDaJBWsDnD9Djm9PlOTJIkO38WemZT8jr0R0L
 +0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hLBhHXaZKYrV14/sIWGGHgjOzMy581GRe2H5TvaKgUc=;
 b=u6GJWznc/Yf+9yEwnsFAo5xRT8Ioxe3HwNNW77typ7eHJBXjUmN8C6JVcftUZ5Q+7c
 QueX1+gzb4V0ixSHAoKOeWa/BnBM6pQaVfmIppyiDqDQtyW4azNen3KZBJMm8agcZq7N
 qKTyFjKZYJl13sjl8gfIr3ALq3Qwj5IiReLIFj+G5TDG+q8F7ogzZ+yTp8P9M4cEs+bo
 /WeVjOXzbpJ/sunUH+6p3IhdfcDR6XDnsdJmrWjU+wbZV299IL0ohUmsTD/xpJwE9yLN
 YrA5PcRtNLkfd7KHlZxlW298diydfT/HeL3H2JQHWjW74ESLB8L6q5qqRuVKW061JtVS
 HSfA==
X-Gm-Message-State: AOAM53081lIqczwjul4gG62P/85TEyHsNHeyt3RmjqJ0PQc2RSOBErpQ
 JkgypP/1GtFhY80kIUnrO2rr2WINxDUXLA==
X-Google-Smtp-Source: ABdhPJy2V3+LlQTJ1kksebTY2SikEruvY1i0cEagGanmlGA6sD/DKRPw/JUmMby5tedt1C2ZCRv1+A==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr18345403wmc.146.1650347481464; 
 Mon, 18 Apr 2022 22:51:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/53] osdep: poison {HOST,TARGET}_WORDS_BIGENDIAN
Date: Tue, 19 Apr 2022 07:50:29 +0200
Message-Id: <20220419055109.142788-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-9-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 9f06bf536f..95a14914d1 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -34,6 +34,18 @@
 #include "exec/poison.h"
 #endif
 
+/*
+ * HOST_WORDS_BIGENDIAN was replaced with HOST_BIG_ENDIAN. Prevent it from
+ * creeping back in.
+ */
+#pragma GCC poison HOST_WORDS_BIGENDIAN
+
+/*
+ * TARGET_WORDS_BIGENDIAN was replaced with TARGET_BIG_ENDIAN. Prevent it from
+ * creeping back in.
+ */
+#pragma GCC poison TARGET_WORDS_BIGENDIAN
+
 #include "qemu/compiler.h"
 
 /* Older versions of C++ don't get definitions of various macros from
-- 
2.35.1



