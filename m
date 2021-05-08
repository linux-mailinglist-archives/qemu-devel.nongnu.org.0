Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27756376E51
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:00:24 +0200 (CEST)
Received: from localhost ([::1]:44814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCGV-0007Mq-5H
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4n-0004Aw-L1
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4i-0003YT-4o
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:15 -0400
Received: by mail-pg1-x534.google.com with SMTP id i5so3882987pgm.0
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6bhXtvo5B12zNIaDrjXDyWAVuDsp1zJyuk3Qd7d0A8g=;
 b=GUM1XZJtgPGv8gnfU70ZwCBSdA0Y3DDOfjdadwgvfTdqcVO7You0cVocqwAl4IkCU1
 2hbd0bxtPHu61Mq4RLa8WTtaATkyAwmBwxrJhWqrER0WpaGSBUo5IMP2Xkw32V4WMuUs
 KRksm/6KZFfpWJHVS6PnC2HLe6w1YQKgFACXMkc4jX777gczRe61lNpbRLiBuPsr3d2F
 LZODvex5X0oQ3AD1i5yBLzVA5+4tIxal4e7yMibiNLLZ1+0kMsyNdZUGF16A3Xx3Rbcz
 qgWM14lwDaZLge+apmRr69Czch07WeErrywvoSM5up0ZBG4HpaE+YdLVLrzxbSbD5B1i
 Uy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bhXtvo5B12zNIaDrjXDyWAVuDsp1zJyuk3Qd7d0A8g=;
 b=IEAfvOLRLw9C6FFWCvFdpw4alVle1Npbx3cxprgOi3hi0oFa/QSXBRWtpZSoM68uFo
 K7Ax5wHQ7bP2eZxymulWRfvkDyl666khAKA1J1/eGEhG6AJTNJ4Mk89e69ULneHfRUf3
 /gCUFkHmxHEGQmu6qOo+wSbkO3TFnGYXZEbX4yaqlPKugs+ztV8kjSKsnL/gK2DeTc47
 4boa0zyFsDSGXHYgtPJP8HN2ImF4ZmlQ7yIBgwOrvkDdcxo0Gjjqoks2L9cAcu2IOr+m
 9QfCsJbk9kMmPweEqia4mXwxwBcASElgV123eluQgl7bABR92K+1SOescGoHBsZESSiF
 XQ+Q==
X-Gm-Message-State: AOAM532Ulu7Vptqx9XINhmoJRDs8r8t9fPV1sHyolY1qO5HnTn6j0vv6
 zkqBWSmOd87KzHlMPpYc304KosScAGkBCg==
X-Google-Smtp-Source: ABdhPJxaF43GM4J//lfyyw7WSz0T3ElFriAkYmrouj3cA6afYgqHd29E1alAjdRsVm9RLxVIuozqKA==
X-Received: by 2002:a05:6a00:16c2:b029:228:964e:8b36 with SMTP id
 l2-20020a056a0016c2b0290228964e8b36mr13539356pfc.11.1620438490910; 
 Fri, 07 May 2021 18:48:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/72] softfloat: Use return_nan in float_to_float
Date: Fri,  7 May 2021 18:47:01 -0700
Message-Id: <20210508014802.892561-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


