Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5384381ED7
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:43:15 +0200 (CEST)
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG70-0004lL-Ns
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz1-0007QR-LX
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:00 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:44628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyl-0007lO-VK
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:57 -0400
Received: by mail-qk1-x733.google.com with SMTP id a2so3284527qkh.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AF+ruYCNDH4UlWvIHqw6UVSO6vQwfwahqfCGjxjM9+Q=;
 b=z0jkEucPVfSO0sZKQVX5pZhn5pW0xMqsZprNhtPFV3IQiq/DfCoSjONp9G2aPbjY6G
 P09WcrlCzvG+fPsAlXazBXxr14gZSe1YeuzFLJXFyyOrA1WTqiSjdllhUHlvgRJBUaWU
 Mvjcg9BrIUfMKfQXB6TUPloy+0gBmdysBsyEN7Hktdc6fTChQSQGkSH4uHQoWZ4y01Ww
 NIOgxvXbqYm/mZRxbW5rV84C04e5eo2KAdyL3qpFRPS6wA36/MN7b1owBoJGQkt8yP4O
 5ma/t7n43DaY/aTvBAoHce7gRXZ0Kik2WezEBrXIk1rv52TRfi4wDObtR2Aj5dVSyEiG
 koFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AF+ruYCNDH4UlWvIHqw6UVSO6vQwfwahqfCGjxjM9+Q=;
 b=Meupz0/v4UUHIEZrsMt8wJsO+M4VFYgqmodSrpj253RwP/vdHPrJK183g0tLJelV/v
 nXiQxCO27cNh5XdTTaJedX059c4CCPqWqXKgkJFXz65DUbsvCPNQzdLGsdWEqBDLesL8
 vTKs/FZc3mbrYa13WDCa+uXHIVul7G4Y0QFlREOM1gN67w4/XFeX5JIDtgcF5FH4izJs
 BGkvt/gEEErpQVgHHxxK5smuANsDrnIzk9h468LGn6UgXW7uIBNpDieuLdktYAeSohVv
 UpW+EzPs3qNIL6st7b6DtG4J57CTCKPllbOIHk7ir0xAM64ugYlvY0wwYQQDloQ0iCVM
 dJfg==
X-Gm-Message-State: AOAM532VI4g30fJwiEuxwCQEnheDkUK/d0aSRDkBy8l/n6R1pu9QLnlq
 lmOoK6rbvK1IAGG7iE/LGp8iPnwtg3tGWmoTeyE=
X-Google-Smtp-Source: ABdhPJyOLmZSxUg7YbyYbvPjkRkqNEoaMeze5gx/WeHiSbyr5MwlOkLu0xIR3B+YuH1kUobJu08AzQ==
X-Received: by 2002:a37:a3d7:: with SMTP id
 m206mr51286755qke.343.1621168482306; 
 Sun, 16 May 2021 05:34:42 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/46] softfloat: Use return_nan in float_to_float
Date: Sun, 16 May 2021 07:33:56 -0500
Message-Id: <20210516123431.718318-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 64edb23793..b694e38522 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1931,13 +1931,7 @@ static FloatParts float_to_float(FloatParts a, const FloatFmt *dstf,
             break;
         }
     } else if (is_nan(a.cls)) {
-        if (is_snan(a.cls)) {
-            float_raise(float_flag_invalid, s);
-            a = parts_silence_nan(a, s);
-        }
-        if (s->default_nan_mode) {
-            return parts_default_nan(s);
-        }
+        return return_nan(a, s);
     }
     return a;
 }
-- 
2.25.1


