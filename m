Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CA4381ED5
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:41:34 +0200 (CEST)
Received: from localhost ([::1]:37034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG5N-0007ga-TB
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFym-0007Lt-7X
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:45 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyh-0007iz-Ks
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:43 -0400
Received: by mail-qt1-x836.google.com with SMTP id t7so3023936qtn.3
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORTAesgjnoHt5n7pCAJGj1DNtFaoHQTutdablpI0FS8=;
 b=HzYv8jL0fvOf1NeM0bPe4BcdnGiF9hl9TShsQEm5a7uUmai26sk3M9XgQg1OOK62nq
 TjACSywMw0XYtr4iWnahQkPRle/+OIVfLHR+z9o+gR/p3z1GQ5A7BvuNlXS1PSGgQz1X
 NOI/Ei+Ed5FMYPgmYo/4OQ8qOqxPHB5Kk6o2FmGuqmn5n+WjBy/0nXe6uhEkRlqptfhB
 lQmYumCKQ2WyFRVWgqhy4OlqidqqQAcKqQ1aghXY1f0U4dy3RaTnGGFGWvB7yvemOYlQ
 A9n+bCZQNRehuDR1IJqlN8ljTr6ZyZE8ZvKrER0pUqf6kC15hLXqP1nZ9Vkc+WeP43TJ
 ve3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORTAesgjnoHt5n7pCAJGj1DNtFaoHQTutdablpI0FS8=;
 b=RqzUkASCkU8VIET7ZYCiO+1fneWkJauHj2SjArZInZTOsP3wTF7nXcvn38yJTWdYxA
 U/NANeamUVFWEVOyM/cODr85h9OvSEJ1JW3qXwvKSLlcTMiAHKntUCPmwaF4xoCrL/Hp
 DWZ8vFDpw74+eudqndPI20rvpgYo/wp1mUftkXxK2PN0Y8RB/osQZeRWy6nOXHyEi98J
 cW5veP/C9YKZ9ED4sT9ttIl9+oI3Jzrq7nISapl7iQB0GJ29K4DDwFAW12LFD/IvB30v
 09oGECdPj0WTvmxKM4bsU0ikW4M81WCqTrfrYeLXGbczM6K0QmvataEX3fbS37dJsbyA
 UfHQ==
X-Gm-Message-State: AOAM5331qOXqdcYVWDSTR3ZVnpNO2DyygsUl8sm/94Pb6J3h/98qHbYl
 4hc+ZNThq2K08V2uOewY6glvST/JZq6aB+wcRAM=
X-Google-Smtp-Source: ABdhPJxm0OgoA9TTkTqHY61Qzs6fv3tkltxoyBIPfhJ5moGXmfCt5LrhiHZY4SGarGzB3u1g7EzQMQ==
X-Received: by 2002:ac8:5855:: with SMTP id h21mr50480165qth.281.1621168478745; 
 Sun, 16 May 2021 05:34:38 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/46] softfloat: Inline float_raise
Date: Sun, 16 May 2021 07:33:52 -0500
Message-Id: <20210516123431.718318-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h        |  5 ++++-
 fpu/softfloat-specialize.c.inc | 12 ------------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 78ad5ca738..019c2ec66d 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -100,7 +100,10 @@ typedef enum {
 | Routine to raise any or all of the software IEC/IEEE floating-point
 | exception flags.
 *----------------------------------------------------------------------------*/
-void float_raise(uint8_t flags, float_status *status);
+static inline void float_raise(uint8_t flags, float_status *status)
+{
+    status->float_exception_flags |= flags;
+}
 
 /*----------------------------------------------------------------------------
 | If `a' is denormal and we are in flush-to-zero mode then set the
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index e19809c04b..96ed8c1a26 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -227,18 +227,6 @@ floatx80 floatx80_default_nan(float_status *status)
 const floatx80 floatx80_infinity
     = make_floatx80_init(floatx80_infinity_high, floatx80_infinity_low);
 
-/*----------------------------------------------------------------------------
-| Raises the exceptions specified by `flags'.  Floating-point traps can be
-| defined here if desired.  It is currently not possible for such a trap
-| to substitute a result value.  If traps are not implemented, this routine
-| should be simply `float_exception_flags |= flags;'.
-*----------------------------------------------------------------------------*/
-
-void float_raise(uint8_t flags, float_status *status)
-{
-    status->float_exception_flags |= flags;
-}
-
 /*----------------------------------------------------------------------------
 | Internal canonical NaN format.
 *----------------------------------------------------------------------------*/
-- 
2.25.1


