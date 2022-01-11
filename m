Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2F48A966
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 09:32:38 +0100 (CET)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ca4-0000R6-NY
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 03:32:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7CWf-00076v-3j
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:29:05 -0500
Received: from [2a00:1450:4864:20::32b] (port=54142
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7CWd-0002W7-DJ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:29:04 -0500
Received: by mail-wm1-x32b.google.com with SMTP id l4so10403907wmq.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 00:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DA0QY6YbjR+5Z3Sy+jHJuWIqiYWx6oF9Mgo53B/hv/o=;
 b=W12ChCoBQDzAd8JZZe1N0MTSKjdGhNTWeP0OElb0xphwIIDy9huDuE+bYiV4P2fedA
 PRf/rUvFj9VboZSG2m35RawoA0AgSJ8b+GmO9vRPwdY0vf7OOzwWL4dm7N3NMCtLO1IH
 FO93eGSgyfWiT1iewQrQVhCCxBU3WM9E4/SVGdzlM/tzIRBZmZ5euIND3SkBNsO48d8L
 NS8lPMlgrFfEXNCFZZ+FozkGQE2HBRGOq37keWVWqlznkzVwjVAl/YnsYJsKx0+6G1j0
 dj3Knuh577Rac0kMLyNZw4fkiG0MUA/ghnXUW9SyZw4W3xnrF0uTtlZy5cUlkQ8RZbQp
 hdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DA0QY6YbjR+5Z3Sy+jHJuWIqiYWx6oF9Mgo53B/hv/o=;
 b=xCg2Vfd1o39zU3z8E21ov1LeeEtCRSONefSA+YDOMlPLnS62i0Kd2O5QzBhKmzuKPb
 8dczy34Ih18J0pJkw5DUdNs1GGdWpSqtKUHU+gZm8Z0Et9iMZpJAj24yTrjR2bV7PEHs
 7dcG80qBmn7pkQRknZghu+330OcsQ5m/rt9Ove1g7TM1eQLCkvsSugDsQ89TIDeQx5Hg
 uKM8n0jV6vd7Hel2M2sUbKrntliSN9QEEFgJ+ChIgeB+y8j699ED7GQ0cW6mGC7C6+TJ
 u013NJGwJznQZiisX4ZgP2AeVfXa1bdGbg2iz5xMLydw1E2BcT0Dakvl62bUwZOgSeSa
 519w==
X-Gm-Message-State: AOAM533og4PIWUdpeSpDF+AdvSnOmn+KA8DqKkCTuoKEUX4o59FgfcEG
 tXa9RZH/p0JE08hc4SGypyGaicZwvQGfeA==
X-Google-Smtp-Source: ABdhPJyDMW7eoXdUw0t2BCNkkq8OVpIhm5rr3Kh2wXqt9QxPOKWcBd2xrAzccmGg/Rxk0fpav3GZtw==
X-Received: by 2002:a1c:25c4:: with SMTP id l187mr596201wml.55.1641889741971; 
 Tue, 11 Jan 2022 00:29:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id a6sm5486624wrq.22.2022.01.11.00.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 00:29:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Fix clang warning for nios2-linux-user code
Date: Tue, 11 Jan 2022 08:29:00 +0000
Message-Id: <20220111082900.3341274-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The clang in Ubuntu 18.04 (10.0.0-4ubuntu1) produces a warning
on the code added in commit f5ef0e518d03 where we use a
shifted expression in a boolean context:

../../linux-user/elfload.c:2423:16: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
    } else if (LO_COMMPAGE) {
               ^
../../linux-user/elfload.c:1102:22: note: expanded from macro 'LO_COMMPAGE'
#define LO_COMMPAGE  TARGET_PAGE_SIZE
                     ^
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/cpu-all.h:231:31: note: expanded from macro 'TARGET_PAGE_SIZE'
#define TARGET_PAGE_SIZE   (1 << TARGET_PAGE_BITS)
                              ^
1 error generated.

The warning is bogus because whether LO_COMMPAGE is zero or not
depends on compile-time ifdefs; shut the compiler up by adding
an explicit comparison to zero.

Fixes: f5ef0e518d0331 ("linux-user/nios2: Map a real kuser page")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: fix sense of comparison (oops!)

 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 329b2375ef1..d3274edfdb7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2420,7 +2420,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
-    } else if (LO_COMMPAGE) {
+    } else if (LO_COMMPAGE != 0) {
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-- 
2.25.1


