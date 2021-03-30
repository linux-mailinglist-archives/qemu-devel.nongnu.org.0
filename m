Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D675834E241
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 09:32:27 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR8rS-0007oR-Tt
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 03:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lR8qK-0006uR-SQ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:31:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lR8qJ-0006ZS-F7
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 03:31:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so7223012pjv.1
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 00:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2VoVcGaEiPgk5Mq99BqLKAdS+Ux7k05G6j/p6L3fWQ=;
 b=Yya7ggj6rDy6nUE6awB56F5JhycqD1pHFY5ZxjDSWe+DpRmNMo7tYB7FgfVj16nMVw
 theame3zeOiZE5drFkY9eAaboiAp1cAsAhHN/L18A9i0mN61DIIak4bGBepKVxa6Lhfw
 NO0wp/2v1/FlIb/056QNcy2k7EkcY7JItO7WL8T3E5srbxy2uN5ITw3BO/n7DzCjDMZ3
 +ycE8PLxxJSuwqxqPkjfCPHa2bTP2qP3D0om9nkkUgqqHARk4M+PiEvkGNUdKJ5GWd/r
 Xk2Okba+HXAWvbcotAx0OKCpyGjskt1erPvlloH5iqkfcniWvw1BdGNp21SyoWtj3nXe
 +eZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2VoVcGaEiPgk5Mq99BqLKAdS+Ux7k05G6j/p6L3fWQ=;
 b=d4mJCqV0nD9JnRDUdSk58fobk/vDWfuPCu4ny1WHgLkmxmOAZhS0A0hAf5eOUdH0e4
 aXVnYrcaHq226u3BQLlB+39fFuQOJQPjX9FjOXX885I9NKYkvFcablx8Z97v1tGnow3W
 lksi3konPwkNHiOEMwdVm2PVeTGl02LPTWjl5mFJk3MWvmcy5RpVeaoEVblRufIzQKa1
 AwTczdfC+AA/k9ponvTWKJgYhz165GP+6HjuE+Ojtpb41cA37yTZQGiiaDnoa9WpsdM2
 zW7dKJDEZXnI2IJ3j1Ig+JPhd8q8rNXIhotqH/Po7g7xrLFdLPRODRbpC8Ajghbrm3Y+
 N0SQ==
X-Gm-Message-State: AOAM531k7B/jmrvg3EMwV2j0a9MY5flPibrzCqBSGhYEWpyfyOkHUFdf
 7ROriP3U3eNDPcWTuITuACpujKWGWVI=
X-Google-Smtp-Source: ABdhPJzWFecyR8Epb3SYVYq0BxZqtG2B1j4de/X3j1PF9e6raHUWmyxQiuzms5puiXt0UgaNgQFCSQ==
X-Received: by 2002:a17:90a:bd90:: with SMTP id
 z16mr3106827pjr.123.1617089473893; 
 Tue, 30 Mar 2021 00:31:13 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id e65sm19857751pfe.9.2021.03.30.00.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 00:31:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: make xtensa_modules static on import
Date: Tue, 30 Mar 2021 00:30:57 -0700
Message-Id: <20210330073057.24627-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1033.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xtensa_modules variable defined in each xtensa-modules.c.inc is only
used locally by the including file. Make it static.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/import_core.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
index f3404039cc20..53d3c4d099bb 100755
--- a/target/xtensa/import_core.sh
+++ b/target/xtensa/import_core.sh
@@ -35,6 +35,7 @@ tar -xf "$OVERLAY" -O binutils/xtensa-modules.c | \
         -e '/^#include "ansidecl.h"/d' \
         -e '/^Slot_[a-zA-Z0-9_]\+_decode (const xtensa_insnbuf insn)/,/^}/s/^  return 0;$/  return XTENSA_UNDEFINED;/' \
         -e 's/#include <xtensa-isa.h>/#include "xtensa-isa.h"/' \
+        -e 's/^\(xtensa_isa_internal xtensa_modules\)/static \1/' \
     > "$TARGET"/xtensa-modules.c.inc
 
 cat <<EOF > "${TARGET}.c"
-- 
2.20.1


