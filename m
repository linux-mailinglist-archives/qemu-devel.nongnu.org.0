Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595586A65DC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:57:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeC-0007rs-R4; Tue, 28 Feb 2023 21:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeB-0007ra-9e
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:51 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCe9-0002zp-Fi
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:50 -0500
Received: by mail-pl1-x62e.google.com with SMTP id i10so12542766plr.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIjAjxtb5S+uwMZAT57RX4sknZfmu2Pq05IzfQblq0U=;
 b=FsLwSBF/2ok5xnucVP8DQoRj8of07MiC5rUX/nzBm2USZhram0otaK5MbUwC5UEjHM
 5ytp7gbqrrqxgN6BJm8uzjtRJ1832Da0Zop1ZPOvrm4ZMrsbiUdExVuv1fsOPMebF07s
 w7Wiji12UotehVcWRhu2zwbkjM0NIMt9zAzQwkidfyfthb6WR7y4EvgQ+FjFXFI9IVX7
 1w6JG5UxcGwLqcIBnNPmLDRzjtFxL+jwDNmC19LcQrjp0eAKYC1wy1oB6TlU8VfH5P9Y
 edEs5q9hTKwltS/uovWOFvEU60c4JGZ1UXvUqDyvP9TQgrhmT3RcBsvctghir8N68M7+
 5uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIjAjxtb5S+uwMZAT57RX4sknZfmu2Pq05IzfQblq0U=;
 b=YRxpErCSzJEGY/a85xyl+BVSMkQDUbkbQsUZwlG8bydAF+1d+pXXv4xJ/ixaLhssQj
 OU3P9JFcvh71Cx4Pmyvt+fIQkOEDpvBttwEaEH2qn7AdBNOdIZYzodseeKGXE+UCKR6o
 WR+fvlnnJYkSAnIytFb5UUGLnrsu1xIWJ53QQlFzIRMeSCs9FnTVDZ8oBD/qqmugo33D
 0912lB93KH5ztdlK0tS0YeAVSETIfHdc3IHSzuuTkN3NXK6UucOjpMhlBY/i7CG6/N2d
 3B/QtJec63CXmVJlFIU0lzST1ut3lIuzydbOeBkJkEndkc01dWcLKesexSkVZGRyuzoQ
 xQqQ==
X-Gm-Message-State: AO0yUKUYwiU9IBvNXx6N/BLaz9MAjgPWrsuwqpQ1Y2oI0jLfqe1Ql7fS
 2EQ8AronC1X0XbUbKeL609s3bGCNIJS9ZtvoOVk=
X-Google-Smtp-Source: AK7set9nb9mlhh3w4Fz1jko8EDKPqLJ8gkaFTNAeEfFDMp4RHESVoRgYKz5bmPw0ax7DL7HJqMMBYA==
X-Received: by 2002:a17:902:a513:b0:19d:6f7:70d2 with SMTP id
 s19-20020a170902a51300b0019d06f770d2mr3717137plq.50.1677639408064; 
 Tue, 28 Feb 2023 18:56:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/62] exec/helper-head: Include missing
 "fpu/softfloat-types.h" header
Date: Tue, 28 Feb 2023 16:55:42 -1000
Message-Id: <20230301025643.1227244-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

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
Message-Id: <20221216225202.25664-1-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index b8d1140dc7..f863a6ef5d 100644
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
2.34.1


