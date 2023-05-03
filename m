Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC96F51E4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:39:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pS-0008Kt-96; Wed, 03 May 2023 03:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6p3-00073o-O9
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ox-0007Jg-6w
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so7183865e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098557; x=1685690557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoXYOQHQNeBbfwjUDNzuW/Is90ENoYHXRPtx24KBX6U=;
 b=zlgYqoNfJ4/CGHLJePDnBqZmlAohq5Mj6QMRVBBMG1neHxkb+OLKc72+NDcbd3cKdn
 wEgFlA+vURs18TLVgQZO3mByK/mhJ8254ziEYCL7GXaKuLb5dgAocS30YuacCrCGc4Wu
 M1W7BmlFWcNIOv4TVRkRlXwOUUEmuTzHQ7guuXLtEq9jqZKrnnA3whd4iz+q+479rqX0
 yaFA9E648fexjHWPzZnkFiJ1upBO+ZJzgzwoA3W8n3x1VpjouwoHmaefsOfh1QYT6nN+
 +zQnfXFc+9cRIdgRM0fqgoU/OC6JYuNi7rpVzJxPxDqHdJedZFpriYUB+3SP6NfL69ui
 lDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098557; x=1685690557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoXYOQHQNeBbfwjUDNzuW/Is90ENoYHXRPtx24KBX6U=;
 b=JPGCKj9vdRbcIDpWDhGQCDyAcKIMbtaZvevSPxizPmKcjODKMjjyTnycDR3WLkfroc
 ZG1fFDAAyW6/UohgiEC5jeALib97+FaYxsEurxip49s9TU/mGmBB4VTBxuDO7hZh5DKY
 wM9O/GMyTSEnFR9EJrDOark/M7u75jkMfZSIFojymRJQhrxw2vAUVf3XLA6KtJNno84k
 dLkaGkcQTy5/eVWEGzoNHSCkkYIzf1vXPIec0ycTYFjb8xyuGsOxBL3yexs0WFzIGm+s
 HUb4o4vypFRCGkDMG5dZlsDmx5fLUM2jRamBMjjCJ4mISjSzztSXctzc01IzMQRqxmz5
 w2Hw==
X-Gm-Message-State: AC+VfDwRgodQkTXpF63T/1tnrddPkJJPXlYJNYNQAu5nYglPuK02syqB
 vKQg26NfSWZ6WBJRib11euPR0ojEGOq1QcqrnhjfDQ==
X-Google-Smtp-Source: ACHHUZ6mwJzi9ZFDsyc1TpkuLXzrEzRj1PMsIa2LV0Uz5S0T8om9t9enrsvV/Zt+Zj9Gr1vUn5Z9hw==
X-Received: by 2002:a05:600c:2285:b0:3f0:b095:15d9 with SMTP id
 5-20020a05600c228500b003f0b09515d9mr13420207wmf.40.1683098556858; 
 Wed, 03 May 2023 00:22:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PULL v2 10/12] tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
Date: Wed,  3 May 2023 08:21:05 +0100
Message-Id: <20230503072221.1746802-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via ".w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 21c2fc9e98..0940788c6f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -463,7 +463,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
-- 
2.34.1


