Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E223060D919
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:15:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtX-0004r0-03; Tue, 25 Oct 2022 22:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtP-0004oV-2j
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:43 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtM-00015y-6l
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:42 -0400
Received: by mail-pf1-x42c.google.com with SMTP id e4so9967785pfl.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2X6gsd8PMcmjrRwm+ALtjbDa66PQBauc/+3lmBMcwY=;
 b=zDU6duHfkG1yU2wM+HV3RNjISmRIzC1pAQLu4i8qAAxVmwvypm+qCIumbtzLcnfvZS
 FBg8HwDG7JrslisNat4l8cESKlk8tqZGqh9BdVSDC64BxvUVa8iL1y8IWHL0O8zDaeIs
 scJDjUqQZ5Tsr6n0Go6EaupPAPDAT2g/0JSRIJfSugz9K5E08QgrVTMAVLg6WHCzBdjJ
 KdEMNbprBQxUd9Tucz8dfBG/qswh5GOZkiP8dSGxjh/6MZFuJsmo4fQPS0Vgrjol8i1X
 mBPy5idT7cdn182SdPOb//VeVXI2Ev8x/OGhC6MhzZ15gYkFt0moIpigf4gsqxtGBsIv
 JX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2X6gsd8PMcmjrRwm+ALtjbDa66PQBauc/+3lmBMcwY=;
 b=oXbOPEyAAI6d43ArFkFAl4ZyChYlXbItlBS7gzM5H4Kilbl4jSWsaP5lrU9b9VxcDu
 8G94VMZFDWhQ/awOZD/VwhLhC3jy84leRz9NbbNAt4i5E9OBzl0b4LmLT3bGxtgsXkgD
 6ZO/dRFt62OUuBAiOqlAl7rRvRTYWA2wHZW9nAqAXrjQ93RvDOfV+eEI61Qr5BNuyLvQ
 nVmtqNl/rcnoS3r0jkJ8tDGY1KV0WWLhMF0nFbesVA7nCcZchh0Fj/seOSVlsqhd/+Rn
 wo6DY/qG+ZdyoRHyqOhtqbCeVJAm92GIP5EZPv55BkpT9p4iiOq2DzyfFDc4w/KxSfL/
 u5rA==
X-Gm-Message-State: ACrzQf1AXvg3/ZMW3BxfdXc9kj7M60S9eLMCQ7f/OEOIHUnUPdedNPdS
 oznZUn9hGsgJxCXeKh9xw3tKvjipVxSvD/cC
X-Google-Smtp-Source: AMsMyM7CT4C6wGbp5Y33NW8FjWYnKPAZzOjnaa0XnNriHOjmWia1ZoMi60RUidbjKVp3x/07am3y7A==
X-Received: by 2002:a65:5605:0:b0:46f:1e8d:ece9 with SMTP id
 l5-20020a655605000000b0046f1e8dece9mr8611000pgs.249.1666750298814; 
 Tue, 25 Oct 2022 19:11:38 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/47] include/qemu/osdep: Add qemu_build_assert
Date: Wed, 26 Oct 2022 12:10:34 +1000
Message-Id: <20221026021116.1988449-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This differs from assert, in that with optimization enabled it
triggers at build-time.  It differs from QEMU_BUILD_BUG_ON,
aka _Static_assert, in that it is sensitive to control flow
and is subject to dead-code elimination.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..2276094729 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -186,6 +186,14 @@ void QEMU_ERROR("code path is reachable")
 #define qemu_build_not_reached()  g_assert_not_reached()
 #endif
 
+/**
+ * qemu_build_assert()
+ *
+ * The compiler, during optimization, is expected to prove that the
+ * assertion is true.
+ */
+#define qemu_build_assert(test)  while (!(test)) qemu_build_not_reached()
+
 /*
  * According to waitpid man page:
  * WCOREDUMP
-- 
2.34.1


