Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9C58008F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:16:11 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFysU-0006UQ-7w
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiF-0000vI-Km
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiE-0000GS-2N
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v13so8342039wru.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNWPEy+XnytumBC/Srj6YaFH4JrGJodkvAAc76627RY=;
 b=bYoLgcOR+OP02jBknYaZAZZ1i0VMBlHS8jukDi1gsVfT+awdnBtEz92G1g5qJdnCCH
 K3orX0a4TIiO7XARBp76FB1foIWmS5/Sg024kgSfEr9CEX5ZkfK7bxg/Tjy44m5bm6Bw
 OzJuzVDysFaYIYL4cHTV5qGfGrOXURKzT6jcaWf9TY30DQFb4houFY3OlIjKWxU2VrRj
 L1PyGuSGRDeWhYGetycYjleD1kIj+UVMU442e59Q76y8ZOHzBEQ88xLuZSpJfYLaZeIf
 H4U0S5iebgN2/rp/KwQfqvYtaepY3mytsrxv77WYTe/GQBwQo0RnkT/GJ2IIejbfB18J
 64/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNWPEy+XnytumBC/Srj6YaFH4JrGJodkvAAc76627RY=;
 b=MD8sjSXugn+iGFKohHSZkubJhF3tipW2K0kDnILUqqL3XRmTZe67i3IsEquYEajlLf
 XOIOnmq72pDOfXMNPhAE0ccUI/cjFTTptwHIW2S9BnqxKLvQqGTbKf3NnlHXzPrG5MOe
 UnUmBIiUGofu1lPoJ20acf/UOzRBOvME3sfEaQodUWLdoQfT0193+4hdt2olUzOc4Z8x
 N8s2ZHAHu/kjZtBphx9i8P+Pwhr0Gaozw5DgSJovTxlE98y/rv2egY5HiF/ppLOcv0cj
 Z1fuUWDm4YxUClhITg1oGiSNi1kiWY+0hikq/+AvA/dRYcxxcAdMJJAjExnii6kSJF8E
 bCjg==
X-Gm-Message-State: AJIora8oBb98jP4iXp4v/LPQhV2rb6egjXTkvqsayi9Qp1RmL+eKxuhG
 ky0E/X3dRxKzbLQOMsTrBJDHWQ==
X-Google-Smtp-Source: AGRyM1u+qJcBuHV75Yzlfmuy427h6zd2jqc+aP87F0y2CIQWbUE1q8ohi7ysLalOHbJaWj4ZyW6MSQ==
X-Received: by 2002:adf:f4d1:0:b0:21e:484e:ac59 with SMTP id
 h17-20020adff4d1000000b0021e484eac59mr7406811wrp.125.1658757932721; 
 Mon, 25 Jul 2022 07:05:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c304b00b003a320b6d5eesm17154014wmh.15.2022.07.25.07.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21E5C1FFBE;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 06/13] semihosting: Don't return negative values on
 qemu_semihosting_console_write() failure
Date: Mon, 25 Jul 2022 15:05:13 +0100
Message-Id: <20220725140520.515340-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The documentation comment for qemu_semihosting_console_write() says
 * Returns: number of bytes written -- this should only ever be short
 * on some sort of i/o error.

and the callsites rely on this.  However, the implementation code
path which sends console output to a chardev doesn't honour this,
and will return negative values on error.  Bring it into line with
the other implementation codepaths and the documentation, so that
it returns 0 on error.

Spotted by Coverity, because console_write() passes the return value
to unlock_user(), which doesn't accept a negative length.

Resolves: Coverity CID 1490288
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-2-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/console.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/console.c b/semihosting/console.c
index 5b1ec0a1c3..0f976fe8cb 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -111,7 +111,8 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
 int qemu_semihosting_console_write(void *buf, int len)
 {
     if (console.chr) {
-        return qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
+        int r = qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
+        return r < 0 ? 0 : r;
     } else {
         return fwrite(buf, 1, len, stderr);
     }
-- 
2.30.2


