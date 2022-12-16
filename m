Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917B64F447
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:52:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6JYp-0007Mb-CW; Fri, 16 Dec 2022 17:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6JYn-0007M8-Ko
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:52:09 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6JYm-0007Vo-3Y
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:52:09 -0500
Received: by mail-ej1-x632.google.com with SMTP id m18so9474987eji.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ybD/92qbfCBHmmXrwHRCoshpIk6o0/6l1Z1VWLP7xmA=;
 b=rNBJiI3rM2Xvt6sjAmLp9CfVQcRgqQ6bTx56qHumWphDmfZ43vrWSc97uX2fLosW2c
 CYPzadeZkcJgH0D4s+UCpP7qxEXnPtUxXLHz6gDoLJG9z9FnB6wdjiT7LKCAJliGyPyO
 h5oAT7TqnYxKyiRITKr1iBQk4/LJKgmi6T/vujWfKLkQO4DBPilL2BALqzi3JX09C4MS
 +m+pOFXTUKD0s1kAoIaunbVSVgeZ8zis2TXWWPTRTkf8L929U74DtoFO3OpmU/e6xmPn
 T6yxNH8J8/uj3OBUxiViTigwRGIYNJ4V4pa9/vg5IVOe+nQATwWJIrCsmdBCbC6Uk0HQ
 LanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ybD/92qbfCBHmmXrwHRCoshpIk6o0/6l1Z1VWLP7xmA=;
 b=JIS3KiP6E6Vm94hZ5bNzGCo19ZJL44IHVP3/d4GJcCRbWPvuEukvqVHxGq5Nl9C4tI
 W/bbbakUqEfM8hzIYdQFBw9urTiTemzeYx5E1y8ehC7umgOZBjco9xmG1verV3M1zvM9
 ER4zZPlnSK1HbSdZQ8P/5kKf7FHcIKzOAQ/9/7/VEfaAb7ykT6GyJ4lOjfstZ7lyu1Tu
 mAQ7byNTH7g3G3sofBWfBZZMUYiaTi8EZ/Tuc9sAM/RNvwZsrsfkITuc3hJZQVbIyQb/
 CnyWiSwMUiXBlE8l3v/liyWX3iTZVztMg+RWEoEYqCkMrUzv1Uyx1CWyy0yRENz8xCsl
 5hog==
X-Gm-Message-State: AFqh2kr7jQWYr6a8YvrN1FLQhnefoiGABVpCrY3eBM2gQrpI2nDm7Sty
 SMYMhczu+akUcntGfbBD7Auu7FEsHeG0BUTR+2U=
X-Google-Smtp-Source: AMrXdXtSZwzaH2+B/+YU0x4DYF4Cf5p13gFpO5UFY1jHuZg0GBzQTgnV4opQnuftVYjJoaqQOFOt/w==
X-Received: by 2002:a17:906:6b13:b0:7ae:29fa:ba8f with SMTP id
 q19-20020a1709066b1300b007ae29faba8fmr19988567ejr.2.1671231124516; 
 Fri, 16 Dec 2022 14:52:04 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a170906a29a00b00782e3cf7277sm1300090ejz.120.2022.12.16.14.52.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:52:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] exec/helper-head: Include missing "fpu/softfloat-types.h"
 header
Date: Fri, 16 Dec 2022 23:52:02 +0100
Message-Id: <20221216225202.25664-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

'dh_ctype_f32' is defined as 'float32', itself declared
in "fpu/softfloat-types.h". Include this header to avoid
when refactoring other headers:

  In file included from include/exec/helper-proto.h:7,
                   from include/tcg/tcg-op.h:29,
                   from ../../tcg/tcg-op-vec.c:22:
  include/exec/helper-head.h:44:22: error: unknown type name ‘float32’; did you mean ‘_Float32’?
     44 | #define dh_ctype_f32 float32
        |                      ^~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/helper-head.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index 584b120312..325a42b14e 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -18,6 +18,8 @@
 #ifndef EXEC_HELPER_HEAD_H
 #define EXEC_HELPER_HEAD_H
 
+#include "fpu/softfloat-types.h"
+
 #define HELPER(name) glue(helper_, name)
 
 /* Some types that make sense in C, but not for TCG.  */
-- 
2.38.1


