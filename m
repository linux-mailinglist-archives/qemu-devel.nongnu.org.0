Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48D370D95
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:10:13 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDjY-0000wv-6j
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKn-0001Ym-5f
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:37 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKk-0005G2-UD
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:36 -0400
Received: by mail-pf1-x433.google.com with SMTP id c17so2399455pfn.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdUcyujGpauXTdAtiBYYXQP2ZLdHxofdS+1N9npM370=;
 b=QOEynRn24QF83HrLgPrblQWtp1aIE8IFDfbNp6SvYVNmywaU3d8NFxL25G7JeUNt8N
 CS72zFjmHZopOb8ffIkBpDJLN+JSarLpZvjg2SzGOwcVHfZnp/eh5ckNRTS4+B4kJrvc
 QimuzQsroH+OW+1s3gS6gdH6p7tzptEl6x/L9x91pmTZ0qOvKEeBykHswt8n62Owg/fe
 BIrqGz3YwETPiQ0VGpDrUEe/x9/SiDuWXCUXh3isPeXUK/+kjCYkW6cxvdlUkp9zpM7t
 K8eDBGzwQmXsQTjoYK/UfKMYw8ZPRmcIsaM4cdU/FiJBfdJImQhuXcbI/R8ekjsrtWhY
 A9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdUcyujGpauXTdAtiBYYXQP2ZLdHxofdS+1N9npM370=;
 b=TwsphOaekGTyKeAZcAD0HqczGBcVtcEdd4j2PQ+2awjLsEaLE0nBLLRSgQgqpIFxcd
 muI12QeXGMju2LOxndscoP7Ir2JWotAx8nJ2jxeTWtgI0q1T6O0+FHDJLzJ4F01AXcor
 ovbZhw3DpUzjd/dadldd4/StDA3OMNwCQcO8BRcVx4mIKraqD1qG5RklQ90P25HMksKI
 r8GGu1S+SkCNZcJCR46yhWDkoQY/tBWQdZrZpO2z3Cbesra9mAKcPKT2V9Es4xJvQJ3a
 I1s6cZ6tqvPk3fJ4a/Gwnvy84bEcd5qjahGyQnddAPyKNFE2sZ+37YZzBE9Vaar7Wmma
 ai2Q==
X-Gm-Message-State: AOAM533p3a/F8BIzpNEftEZxrJ1qOTeok2fMRSj77aOCQ+0Z/jWES6mX
 xLW4cTNraT7Ep2v5gIp9E/wqj+zGtPvKRw==
X-Google-Smtp-Source: ABdhPJyLw0yiDr25SP27Fox7oW3Gpp/LtZkkTafcltaoZ/sGljvWdPmRoLF8XP2GeJEeeRuA9n31xA==
X-Received: by 2002:a62:25c4:0:b029:276:a40:5729 with SMTP id
 l187-20020a6225c40000b02902760a405729mr14476350pfl.80.1619966673629; 
 Sun, 02 May 2021 07:44:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/31] Hexagon (target/hexagon) move QEMU_GENERATE to only
 be on during macros.h
Date: Sun,  2 May 2021 07:44:08 -0700
Message-Id: <20210502144419.1659844-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-16-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/genptr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 6b74344795..b87e264ccf 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -15,7 +15,6 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#define QEMU_GENERATE
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
@@ -24,7 +23,9 @@
 #include "insn.h"
 #include "opcodes.h"
 #include "translate.h"
+#define QEMU_GENERATE       /* Used internally by macros.h */
 #include "macros.h"
+#undef QEMU_GENERATE
 #include "gen_tcg.h"
 
 static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
-- 
2.25.1


