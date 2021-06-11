Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631C3A4BA1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:09:23 +0200 (CEST)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrDG-0001Tu-6l
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmw-00037g-At
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:10 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmt-0002nU-5h
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:10 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k15so5692965pfp.6
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2B+8zz4r3rzDW6XJQUxvqU5pgzCPun35EtW6hJayB8=;
 b=nA/+k6IssAQirvFo5B6zylhJ8zl/YNDds04dx99IhTSLbdl6eO/BFmxdMvm7AKRb+c
 0tg09IpDsUfIxMi3pVWfPWhmT9BubWXgOJQEN/DjbpqdeSaAH9/uKhv4n0NaA7dkgUZL
 FC8bBI7wCI2L7YJNaX6fRstBRjLR/FNMhdgYld4u1xcsP4JicB5tlnBgH5/LEQ+qK548
 02d2UL8n9+0OPB/L7SgrbSt+xoQN56RSQLgRRJ/JdK70rvumTF5W3w2W7umu2UJUWgFx
 7EOk/Ly9xCFsqBTJx9zx4aH8IXIpHDUFa9hLs/rJ/r4zFniDgPo+j8S5AuSh0iqRlEQ9
 QBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2B+8zz4r3rzDW6XJQUxvqU5pgzCPun35EtW6hJayB8=;
 b=WJFVEfCH/69jYKt6e1wpBWPx8hwr+MVOLHk6jK5KT/KR9uczrDewH5Dx+J0DAhQkVj
 18WYdmwCd4tIxf7v9ucolN1XKrfJSvFiR55f41QCR8wI3cY1QAIvJtESXzj88e6uKEOz
 4MZogDliNT1he/O3d8BS5JTr/kzRFDcSTK0p8fkNEl2zQjmHAP+T7PFdFqrea1UV7H9f
 avIbv0OBLM5v9cwugDmOn2GeZkRntTWw4f8t4+A0brFt+7kuoqwyUBkqY53HDn8hYtfD
 iyJ53yxTsILkZZ3hL2P/8iR5Y7c8OFBIdgVHENQncw8L/iw6vvn4bOYs6lCLFPg0U1KN
 tQAw==
X-Gm-Message-State: AOAM533pSJPeWqho0vnkpkmbvnst2w7kzBKsaoIofRCDYIzzSdB2pHFa
 r2PLEULkBS501tWHhAHRNgcthdi4pAg2VQ==
X-Google-Smtp-Source: ABdhPJwauN2A/7CS5EmxJqEsNVmuGBaG6GOu3RgAqeR801O4Dt4uxesOg5C5kqIyee/eKV7XA7ZlGw==
X-Received: by 2002:a63:1210:: with SMTP id h16mr5949953pgl.189.1623454925562; 
 Fri, 11 Jun 2021 16:42:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/34] softfloat: Fix tp init in float32_exp2
Date: Fri, 11 Jun 2021 16:41:43 -0700
Message-Id: <20210611234144.653682-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo in the conversion to FloatParts64.

Fixes: 572c4d862ff2
Fixes: Coverity CID 1457457
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210607223812.110596-1-richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 1cb162882b..4d0160fe9c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -4818,7 +4818,7 @@ float32 float32_exp2(float32 a, float_status *status)
 
     float_raise(float_flag_inexact, status);
 
-    float64_unpack_canonical(&xnp, float64_ln2, status);
+    float64_unpack_canonical(&tp, float64_ln2, status);
     xp = *parts_mul(&xp, &tp, status);
     xnp = xp;
 
-- 
2.25.1


