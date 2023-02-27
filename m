Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D946A4460
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6V-0000lN-Il; Mon, 27 Feb 2023 09:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6Q-0000f3-Cb
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6O-0007sj-UX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r18so6363185wrx.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=svJiyNintebHpCD+9KuodOncD9FeucYY+coMyA+NL+8=;
 b=lptX7Dl1iyuywvsS+lpERxaj6sq7NegYKh6BOoqB9I3KqMDzIJv+Ck137VFqum9NMu
 xghr7EYaJAMnRENl7i8lR2lJ60TdbHdmQPqrP0I11O/dbG3podBzV0/PgI+pUOTrdR5l
 EpBd5rDU24HntkEvORBiiqXnzuQ/P5sAzwwdAs7+qcm39e3sPaRSMOzJZR1M7jXJ+sDv
 SIAlNUQS1fIB5V8lfmvrzqMh/5QtRqHQ7/rwjjnCkLmyJ81sQpt0K8oeha+qni8prRcT
 eGeHlzM4U5Mzv9/xtzLugX+f6GkN5hPgJCLm+bOYxjsK9g2/7zLc3RJhQnK7/4Lms2T3
 LSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svJiyNintebHpCD+9KuodOncD9FeucYY+coMyA+NL+8=;
 b=FKdTezGRkSDsk9pHB/gMlC22G0ZM0oilCD8jGe3bpi1u7yjheXabogBgAE8Phn81i5
 NfXf8lTDRFVGdz/ZVf9sUlnhxfMt2gMo8CIYGz39iao6g0V5n+RbStt5ykpB2F4zEFuh
 KTZRO+LVY6BJ4Vc7apEDq8Tt9klTNO2KQbwOweBVOWAOHVkaaU78/1w4iQ2FmK5DchVk
 Hj0NDGzXmumw+x+SyLK5NEkUdjkOduVtJq9ebV27wHkDJLE6U7VXSyTWXB9QOREHXwwK
 tlSG/pZzMSD/oAyHTiTi8WN7cHaX+Fxq9pY3cGzYplBK9iSehDKlTI+TySL3GvELSVxT
 rgyg==
X-Gm-Message-State: AO0yUKXAOWnQiMdQoAwvn8XRZIYDFsLToIVtK0MUeCzF5rvAu/b7t7vX
 r1b5wSZ7xgi/7NJBBijQnptHFHVZkht+gOz3
X-Google-Smtp-Source: AK7set+kVQe/zihjZLrZHxOajV8L0aUlzN9UAY6CpsMwfPpy41syHBx1FJ2+j6q4t4ZzH2BFY7q1Og==
X-Received: by 2002:a5d:59ca:0:b0:2c5:518a:f6e0 with SMTP id
 v10-20020a5d59ca000000b002c5518af6e0mr6236432wry.6.1677506619118; 
 Mon, 27 Feb 2023 06:03:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b002c551f7d452sm7297064wru.98.2023.02.27.06.03.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 025/126] tcg: Silent -Wmissing-field-initializers warning
Date: Mon, 27 Feb 2023 15:00:32 +0100
Message-Id: <20230227140213.35084-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Silent when compiling with -Wextra:

  tcg/i386/tcg-target.opc.h:34:1: warning: missing field 'args_ct' initializer [-Wmissing-field-initializers]
  DEF(x86_punpckl_vec, 1, 2, 0, IMPLVEC)
  ^
  ../tcg/tcg-common.c:30:66: note: expanded from macro 'DEF'
         { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags },
                                                                 ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221220143532.24958-2-philmd@linaro.org>
---
 tcg/tcg-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg-common.c b/tcg/tcg-common.c
index aa0c4f60c9..35e7616ae9 100644
--- a/tcg/tcg-common.c
+++ b/tcg/tcg-common.c
@@ -27,7 +27,7 @@
 
 TCGOpDef tcg_op_defs[] = {
 #define DEF(s, oargs, iargs, cargs, flags) \
-         { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags },
+         { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags, NULL },
 #include "tcg/tcg-opc.h"
 #undef DEF
 };
-- 
2.38.1


