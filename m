Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54869FDB9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:29:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwew-0004Iv-Um; Wed, 22 Feb 2023 16:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUwev-0004If-An
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:28:17 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUwet-00028r-PW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:28:17 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so4485864wmq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g5v+0n3glU0TZt8E8BJ9xs0vGrV9RlnxBoz5HQEoVX8=;
 b=J9i2kS9nD0q3DCloANXwFbTCLgkoQWDJD1IvlKaO/cnF7Z6p9igKzBc7GwZnEXnx1Z
 G0tK7J8ousWhspyPFmoZlTyDug9JIt/lRrzQzxaH+Ic+FtytnnjTRQhoFJTYP10IiM2h
 wPNrz946skCKNBpdmHUQ0I3b0ymY0Sc6Lp3G7VtKACZoIwHFMayce6K39AnmmWR+fXer
 1R3nDlqT+wuYQvETDcrK26VbpFtVPOj5oHy3NWEUJf4BH6E2KknDkdXDmla1rey862Rf
 BLkjW9IK7dQ9sswT3CYuMPromtS3oACOrJUXsLciOeyJmQBW4AeGqKF71yLnfHNcgQvY
 8R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g5v+0n3glU0TZt8E8BJ9xs0vGrV9RlnxBoz5HQEoVX8=;
 b=VUJRe7OI/1ZzAQSwUP9JgZvbJZceo4SvMUlOUrVGqLGvoLIgvUVW8A9DaCUdrHcCCT
 f+xpGTX9cmZSzokZBq85QZPhw57YHiyWv5Twr6mwz2zsR2zbJuXUgXvW7fgLMv7sjWCx
 AF1odgcegrtozpG29xobsAAS59XKwudNqckqL/uAwU+xsmW1N7fB5sXGS6dCulJcbIuk
 SEEt7+PyNKM2nDepo9yqZJPHBi05HLcfWN3r8JFIUiWQCZmk4yjVZxc1M+VlVZ7DnEg5
 cRniewSyKerSpFixmDiaoP270wGvBxaVabsP8aJHGnYtTDBXOFfqs/wUnIF75SzPtB9G
 KYvQ==
X-Gm-Message-State: AO0yUKVtSWFDpwNpWpLGxdZYPmEuXNPF77QLvARCyuqzp5Cx7zbBok+q
 2AuYzQbJsaGn2izKcfR41suFSE5bfoyL9TDb
X-Google-Smtp-Source: AK7set/aIuxNnSNKap3EosvaLLubW1F1XJw3lpFKuIGKBxb1S4k71Qk88oioqJqVby2LADFkffc3lQ==
X-Received: by 2002:a05:600c:2e84:b0:3e0:fda8:7e26 with SMTP id
 p4-20020a05600c2e8400b003e0fda87e26mr7072087wmn.33.1677101293527; 
 Wed, 22 Feb 2023 13:28:13 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b003e1202744f2sm1203488wmq.31.2023.02.22.13.28.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Feb 2023 13:28:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] tcg: Allow displaying TCG_TYPE_I128 arguments
Date: Wed, 22 Feb 2023 22:28:10 +0100
Message-Id: <20230222212810.53857-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/tcg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a4a3da6804..3df2c6a6af 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1955,6 +1955,7 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
             break;
 #if TCG_TARGET_REG_BITS > 32
         case TCG_TYPE_I64:
+        case TCG_TYPE_I128:
             snprintf(buf, buf_size, "$0x%" PRIx64, ts->val);
             break;
 #endif
-- 
2.38.1


