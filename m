Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105843B40FC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:57:23 +0200 (CEST)
Received: from localhost ([::1]:39226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiaQ-0003RX-21
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3n-0003rD-Ji
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3l-0001XS-Uw
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id e22so9837434wrc.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gz6y+LXm6Y2GsD6kiV72O4IHW4d4JM1W8BSMcONGr5Q=;
 b=uv8uReOB3tOqhZzwjDR3y8nku2uC3YNc5yO+z0H4W0qUsuHux1IAXgTMm7pTc8zXq1
 YM92JY7FuVFyyzeis4B/7yVpvdKQ14ub+/bpX/9EtquQAJp66p7eJyhA3/06NE41TeX6
 bV9nJLv8WKhm5bD6Y/8goQR3hD19BhvshoIi7k8Uj9v6rhUb79T+1zz60SLjNP6uvKWu
 wBe+snuDrpJKtWRRdpPAMOtterrIS0a+B9JniYVbIt0AUxm0hhsSc7K6BPkglKrTPdEj
 aPrnzy3go9Ntf1zzWFaohpUGC4tkMr8qRX4x5QAUf1qVyHCYW/JCFys3zSsPVwi8plOF
 tSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gz6y+LXm6Y2GsD6kiV72O4IHW4d4JM1W8BSMcONGr5Q=;
 b=irBOFPBxCcjuSCIVaZv25djnNdEgF5wNkX17oFy6cl8fXEEQJAem6RYC2+9HH1SpZo
 jzp9FcsKurLpqm23sMy63Q3sxf2+4resY5h7EuF/E04dVkZYnzOYQy3nGVSW+bZoopRz
 kKXuoUoQ3nfolZl5sI1/CZ4X1jHHVy4Fhgtjs3zTaxehhv+edzjquhmcJt3wETwvK7bX
 phMlStNx0kvIYAFSCpJ6V3//E4Kr136fewp0tLZf3YHmfwq29Hgtv9mHvt3nQ6W7srh+
 stMl4hcMp+NNzQ1J4Afi1VRFAyYNgDErFsAsFB7tJxYVnJSFW8mpMrAQoesT5LKpRGQj
 QZIg==
X-Gm-Message-State: AOAM530z8hF9J91wUGmGC3H6ZOKPFPyLuRwTYaJ5F7Mucrum6OF1ocTH
 ikVvgfClfVrjSzUMI1UsD41r39f43E7HiA==
X-Google-Smtp-Source: ABdhPJzpMEHTloVfP8WGQdc3KecRuNknXbcLZ4SU4YedJjvQNz2zQIQ7Zb1Epsh0qMShItAjnLREhw==
X-Received: by 2002:a5d:6583:: with SMTP id q3mr9933130wru.360.1624613016406; 
 Fri, 25 Jun 2021 02:23:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f5sm6485034wrf.22.2021.06.25.02.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:23:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] target/mips: Fix potential integer overflow (CID 1452921)
Date: Fri, 25 Jun 2021 11:23:15 +0200
Message-Id: <20210625092329.1529100-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the BIT_ULL() macro to ensure we use 64-bit arithmetic.
This fixes the following Coverity issue (OVERFLOW_BEFORE_WIDEN):

  CID 1452921:  Integer handling issues:

    Potentially overflowing expression "1 << w" with type "int"
    (32 bits, signed) is evaluated using 32-bit arithmetic, and
    then used in a context that expects an expression of type
    "uint64_t" (64 bits, unsigned).

Fixes: 074cfcb4dae ("target/mips: Implement hardware page table walker")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210505215119.1517465-1-f4bug@amsat.org>
---
 target/mips/tcg/sysemu/tlb_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 259f780d19f..a150a014ec1 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 
 #include "cpu.h"
 #include "internal.h"
@@ -659,7 +660,7 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
         w = directory_index - 1;
         if (directory_index & 0x1) {
             /* Generate adjacent page from same PTE for odd TLB page */
-            lsb = (1 << w) >> 6;
+            lsb = BIT_ULL(w) >> 6;
             *pw_entrylo0 = entry & ~lsb; /* even page */
             *pw_entrylo1 = entry | lsb; /* odd page */
         } else if (dph) {
-- 
2.31.1


