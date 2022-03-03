Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C920D4CBCE2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:39:16 +0100 (CET)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjnf-0004LR-Nd
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:39:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmH-0002KZ-J4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: from [2a00:1450:4864:20::430] (port=40501
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmF-0006VQ-9r
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id n14so7374707wrq.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsvhK/ifUeSvWeX1rdfKJDrF5hLi+OAvYK2zDd+7vVs=;
 b=H7lcVf0FuhiLUwxNtWR1RDNJgta9PoZ3PPESl5zQ58stQXj/YtwEgScfD0I1AmbzQR
 oBT5b540dFeqbNii6iIq0GQe0bek44KK61RHD6P9UvaAvDgbJtXYEQ3jiAjVTUfz0QDr
 Yfa7pZnrbw1nk+T7ijqO4jLnp59GC34AXJJvRcxkCpYLtLzhLsi27AKW14pj3pTco+ci
 LpjriDhnRLy/Db8GoWeCghU4OWCdp0hTl8NbpfllMaKDy56iN+DI0zTgoUKT/ADFSud/
 NHCP430n26hm6f6NWL8H0V7m7BIQo4qenYF+nNq61Iol3v282fFxvOu1gKJUJpbCdQh6
 3NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsvhK/ifUeSvWeX1rdfKJDrF5hLi+OAvYK2zDd+7vVs=;
 b=dyuWS9fT+uWXCwiBlPmpe+h1z63yuPlGse5izUTFKMXX0eTE29m/NKfa4DoXI5citr
 bjXoQFewz3k8RBJYgOqVlWvRzA0Ine4howjUs0L4FUhgEptNQ5VUJKBA8rXaEZL+ubBl
 7pPpqfUk8xvzUhOaQ4xMv6oPXwMpx7GdDbFhg1Q0JF7gxbG81vVANWJcqYlY4h6Y0sQd
 caWLpR8FKp4pVNGtu9nrxajapck/GA6PxDWQF+XQ9hUUKS1/2SDzzDXp/YFs/sJcgBGr
 L+KirJ3SvehBmk8ldzVY50Q+CjwP20+eIECNrjRKsG1xcaT8tJOhIZKd/DCULeBnT++O
 Kryw==
X-Gm-Message-State: AOAM533dgNc7yyzyazFCTO8Uwi6aGRLJ65UZC0+hXxWWP4vF61/60vaq
 Aik9cqg+GroLBGW+ddys0KMncU/QgXDGqA==
X-Google-Smtp-Source: ABdhPJwET2JbiPemGMDqQTO70kA4eaopnA0dZ3Qmzv+DKWOf34XoYXuI0wEDKKT3kWUDTac3aeeieA==
X-Received: by 2002:adf:fa8c:0:b0:1f0:47ef:a04 with SMTP id
 h12-20020adffa8c000000b001f047ef0a04mr3764509wrr.398.1646307465738; 
 Thu, 03 Mar 2022 03:37:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm10240093wmb.48.2022.03.03.03.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 03:37:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm/translate-neon: Simplify align field check for
 VLD3
Date: Thu,  3 Mar 2022 11:37:41 +0000
Message-Id: <20220303113741.2156877-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303113741.2156877-1-peter.maydell@linaro.org>
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For VLD3 (single 3-element structure to one lane), there is no
alignment specification and the alignment bits in the instruction
must be zero.  This is bit [4] for the size=0 and size=1 cases, and
bits [5:4] for the size=2 case.  We do this check correctly in
VLDST_single(), but we write it a bit oddly: in the 'case 3' code we
check for bit 0 of a->align (bit [4] of the insn), and then we fall
through to the 'case 2' code which checks bit 1 of a->align (bit [5]
of the insn) in the size 2 case.  Replace this with just checking "is
a->align non-zero" for VLD3, which lets us drop the fall-through and
put the cases in this switch in numerical order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 072fdc1e6ee..384604c0095 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -665,16 +665,16 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
             return false;
         }
         break;
-    case 3:
-        if ((a->align & 1) != 0) {
-            return false;
-        }
-        /* fall through */
     case 2:
         if (a->size == 2 && (a->align & 2) != 0) {
             return false;
         }
         break;
+    case 3:
+        if (a->align != 0) {
+            return false;
+        }
+        break;
     case 4:
         if (a->size == 2 && a->align == 3) {
             return false;
-- 
2.25.1


