Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F8134E242
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 09:32:56 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR8rv-0007z5-Cg
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 03:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lR8q0-0006Vw-QW; Tue, 30 Mar 2021 03:30:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lR8pw-0006GO-SZ; Tue, 30 Mar 2021 03:30:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so7222476pjv.1; 
 Tue, 30 Mar 2021 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ojrt5t/5wucWxCWMoxCNgmQZ+w9PtkN7XZjE40rykMw=;
 b=WaRtCIKRf4d4Ffq1Vkg64urvDvCCuvH8+B9hFWvYrwXYK2cxoioX5l8l+UAbTFoqA6
 kbinesHH1wjYFvopf+YbnGVlC0tJ0uWs3Elif2KdVxAIgwCdYyrmzAmi5xzOfCDZIFru
 B+bxc7T7Kz1l5l8S0EbZAbgcNJ+vZUr0lScsIjDqRKMHiOZEi0lgc42aAHu8pB2njA8d
 QA3wQczIIhVS+BuiDO3IVJrLTqz4LSqyC7RrUiNSgry112RqT8auhqjze0L2Eeqo05cC
 qs5qcW/d0tFxZq5Bc8AZiF4fkWcCHHWLP07lIb3xX6H6QCXDcCsWt2L7Pd2Xplx5HV7M
 0t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ojrt5t/5wucWxCWMoxCNgmQZ+w9PtkN7XZjE40rykMw=;
 b=XwcrBkXToreah2TLcynVqVp5PlBlDIMuTztUwx0WMqyqV2J201pGBM8hMAYl82ckRe
 3rQlRh0wyUkmuxmSac6UTXJRUuXKPGWoRzdYsQtqLpj5hBjsRXLGgS+H/OH0n1qtn2Bc
 CPiB8hjdTTDwfMRatDnAHx5o9PZbwD29zv5A//g8VDCQ4VCa+0smJpQBIKtpMb6dyoUi
 8DFZJK3NYRhUtY9zNU916lWCiv2//RQt8cZsil7J8ZPF2mR3rxCkYW5HuRvXJiLW4e2e
 fJPnob642qMF3nlUAjW+pXyUr7eum5RAi9L0LBUVNWSaIfk54cCqCU8gUovBSemHdYv3
 GXeQ==
X-Gm-Message-State: AOAM533ibBBFQ2vq5e15cBPq9Pjv6hsAnllmwEmWkTkSmCT0xwMyIVIA
 sPZWNompRMRMwGv3S9lzRAahr6x590U=
X-Google-Smtp-Source: ABdhPJwehb6dQFkU4kT/95EqKRNhQTKqlaQF4T99il02WFYw0sPgWZkjlST25z4lZfnOcQGOTjfKKg==
X-Received: by 2002:a17:90b:798:: with SMTP id
 l24mr2875261pjz.63.1617089448586; 
 Tue, 30 Mar 2021 00:30:48 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id v27sm19859016pfi.89.2021.03.30.00.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 00:30:47 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: fix core import to meson.build
Date: Tue, 30 Mar 2021 00:30:36 -0700
Message-Id: <20210330073036.24575-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

import_core.sh was not updated to change meson.build when new xtensa
core is imported. Fix that.

Cc: qemu-stable@nongnu.org # v5.2.0
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/import_core.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
index c8626a8c02eb..f3404039cc20 100755
--- a/target/xtensa/import_core.sh
+++ b/target/xtensa/import_core.sh
@@ -66,5 +66,5 @@ static XtensaConfig $NAME __attribute__((unused)) = {
 REGISTER_CORE($NAME)
 EOF
 
-grep -q core-${NAME}.o "$BASE"/Makefile.objs || \
-    echo "obj-y += core-${NAME}.o" >> "$BASE"/Makefile.objs
+grep -q core-${NAME}.c "$BASE"/meson.build || \
+    echo "xtensa_ss.add(files('core-${NAME}.c'))" >> "$BASE"/meson.build
-- 
2.20.1


