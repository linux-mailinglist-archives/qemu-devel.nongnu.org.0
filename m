Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29366381ED3
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:41:32 +0200 (CEST)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG5L-0007Tj-50
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyn-0007Mc-AO
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:45 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyj-0007kS-Ah
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:45 -0400
Received: by mail-qt1-x834.google.com with SMTP id m13so2984704qtk.13
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKeNDHnMG1Vsy9FW47wdnzGiSOuMJBBVUnKRaVqfH0g=;
 b=CucsNG3Iez8kGHjGeVZb0MiqE5kbpjEMOiG5Fl1ol1j2Wr3XnJu0GVmOv9oxg5rV29
 OubqA4ea2cHjpM740jF2UUsy5sZ+mlu8UVMtW4BxbpYJe6MPM/jkELFvXqDorazg14i7
 jg1HY8GWlvuGcmPGZ2AhrYzvBArkd3vMZMy2Yk0rxxHGNm+3tTuCOs2TsPpfULhKQVw9
 pqOoZJGbS7jqHN593fj4cwCBO1gAZi3i1UT8rLaGOJUKLJTXaw50ej9sSvqFdoKTqFxw
 aCzfGVgPmmI8C9voM6QYk26+HZuxkxHxUwW7D546TSFpvtiqLm1wctrHmBZxk+kUtIiz
 57OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKeNDHnMG1Vsy9FW47wdnzGiSOuMJBBVUnKRaVqfH0g=;
 b=X6i3r1rfnntjNmk6W7T66iirbMNxIdd5O82gWcEGUnMX1wPrPvjYWl4sSsZngQuLjb
 xt65EkUbZsNSvy44wlQ53GKDAAHZIac4V1ZNV30Fg9ttcjk+wZYqaEnAwrc8sLlz8jIz
 mljBxDlP4Hqd+p7jg6/bshTZcn0QEnaVbhONeTd4VsKS1xhuiNLBcKe6c+GSpuObhEKu
 PDgmIwywtTqgYn2LroeDm9g62PvWUc83m4RNFXHWDH4uI9R7ZEsOD4tVpNnfTM08XnXb
 ATvOovZoxzVDH+Oi0Dig8Gx0dGzLN36zNB97niPcbtubcIZjOnEKBcuy5GNVMsqxF/Rj
 Ul/A==
X-Gm-Message-State: AOAM5309L9P/L3iE2YWHTr78yh0V7iXS0uXyreGjXvMSqJjFViKfQ0f2
 2cj9nDUmpPMY77kfQjEwFUHu5VVLnV7XCsWn3lQ=
X-Google-Smtp-Source: ABdhPJyz8L/DQ1ezESf+P4qGaop9LZdfC39XFM1cUrQBKn1o8dnmB8FbCEDalE5ipKrzf/mk9jmLvw==
X-Received: by 2002:ac8:1192:: with SMTP id d18mr51191488qtj.253.1621168480540; 
 Sun, 16 May 2021 05:34:40 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/46] softfloat: Tidy a * b + inf return
Date: Sun, 16 May 2021 07:33:54 -0500
Message-Id: <20210516123431.718318-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason to set values in 'a', when we already
have float_class_inf in 'c', and can flip that sign.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 93fe785809..ee4b5073b6 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1384,9 +1384,8 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
             float_raise(float_flag_invalid, s);
             return parts_default_nan(s);
         } else {
-            a.cls = float_class_inf;
-            a.sign = c.sign ^ sign_flip;
-            return a;
+            c.sign ^= sign_flip;
+            return c;
         }
     }
 
-- 
2.25.1


