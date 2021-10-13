Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2B42CC6B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 22:58:42 +0200 (CEST)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malKj-0002HQ-MR
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 16:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDa-0007XJ-H2
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:18 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDV-00086y-Ir
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:17 -0400
Received: by mail-pf1-x431.google.com with SMTP id q19so3559347pfl.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=D+RKIJSrxfJNHpcJGNzGycK6QYRa2BPNPGcZASr0Mla9czcCQPwiLvZkJ5Pm8bempd
 AdxdQtZrD+QFLcWmBPcMbS0WT9qFd3WekablEFYreDsdePz0ChK9v/8Kk8wHXkfZ2P1s
 Riordpm/8amCr94KJMuJFD5GdWdQga7xSqF+sKL3Z/7nAQsD9WYZSxBwUdOgf8sCb1a9
 HsU9FlXSGLag5DfSy3tUC3TPXwnEynKHXV7Iwaf1slawled1eZxfJNoKqGSC6h52wGHC
 CmUgJMyqWiD5bXIMBqbcoa7x/8/LE0DX9wlEgxfRr+h3iu/F27yUdyYm4/IM7On2pDhJ
 cDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=4UDDTrvhwSGtrPxvzQl2H8yMpEAlZMTGUnrfiALkH2KT2CjLkf41qjO3t2B88Byh+z
 5YHxtmp/XrBD5jFvGGNtkj4N2Qc7sFI3KCpBUFw1H6S9DAh2ghoQrvhk24PjbkJbLCT8
 hcJOMg2dMm9v6hwvW87HcrZHEj3Plni0+XbzQ+gaJIP+GEw9zUpwQjIk9yczY57qj5jE
 L/soanS+CE4N/dD2ESwTCIe9KqQ3FaYDUHzhnsyjm6DaR2qTPEauq3CyHf+CJ3XAmKdF
 d8DBp+94r+HHegMSJKK+g/FHEaqxKiE1b1ic0KzMP7LYm5TKYd62V+ze9xAJ34+EyLZA
 hn4w==
X-Gm-Message-State: AOAM531UqhQcIepcFb2NGzFz/LykvQIqQ1XOpsgvXt6XSOpzGcFOA4HV
 f11eEWX5AvL22U4U2erPnPYCW5k9AR0=
X-Google-Smtp-Source: ABdhPJxh0gc84dzAMCgttITqPpWRTfQieRfX3fWwJ6mQjXwixLmW3uE9hzJbdaId3iY0Jcpl9eShRg==
X-Received: by 2002:a62:e40a:0:b0:44d:a86:43ce with SMTP id
 r10-20020a62e40a000000b0044d0a8643cemr1533646pfh.69.1634158272192; 
 Wed, 13 Oct 2021 13:51:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Wed, 13 Oct 2021 13:50:57 -0700
Message-Id: <20211013205104.1031679-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..bbc5c93ef1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


