Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5F61E693
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornCc-0005OE-QB; Sun, 06 Nov 2022 16:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCb-0005O5-9Q
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:13 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCZ-0004H2-Q5
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:13 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 64so8833354pgc.5
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Bsi7O4XbopriKhsn7dvJD59smiar5hTpndzOsD1Z28=;
 b=XCoCn7KPVr5DYq4coICw+BUCJI40y5m281F81X9xr+3XMjIkzuwLmT1qWYsz/EdQ5e
 TJy5HSLLBYoetiIyAOo/3hnVqWqfZzHzbLCd4STx2t+q5SRiNG4XZAES7VLW8VTaZtVW
 INOaKeZFlglvmUsbN2KEMR3eFLLNW2uObuYNiuohmBo263qnldZXjittwywW8vtlSJ37
 ZmOVahmdQP/D9GAVMk5+z4gs/uTHIYI83FKOCV+Wd0pz2BwfVPBjPZasORztSrkhv8rT
 oXQ1JR/ifrKwB4GEhtXQxsaczWlz2D2tyG4/HQpP6IcGm/BQCGFtZCnSGhtM8ZwzQFdr
 B6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Bsi7O4XbopriKhsn7dvJD59smiar5hTpndzOsD1Z28=;
 b=UKsegaZByIoYVfVexwEgZybLVsBkVfyftrRjxJYTdKqBeOyeM6rtubJLkr3y992q/P
 U5x/NzoQ0b5roWFBwfdz6K/GG97cl+odM9m0eMYrWCqeiHyV3GAZOBklJl4hvhZ3xl5N
 9CXUEwj3VqoJwq0so/XBkggOQjvq//j4hbtNWQ1Kl3/HUlNJ5Lzkyu6PdKoswG2xWuhg
 sEw7GUOU1wDlY2uBeu2e12PIZBqHGJ1nzK9oqPCgY1cQ7I9IZwyRexEsKAilkbDsrBJB
 MocOEp2en2ublVs2udVv2UNJS9LHoCjgryuR72VP8ZMdsfW9F4Qme7qk74y9dkpCmzZo
 0W1g==
X-Gm-Message-State: ACrzQf03wP2L1kKg/GWhCDG3YxxACUj1ZNXnhhVmvbztAp9FGA7VIXz9
 iLx8IZ22I5AjnFVfe4ld02zdHRx0B31v5cyf
X-Google-Smtp-Source: AMsMyM7os/cl2oU0ZzWhlloSw/x8KLYvQqZs9sJqJ4DlNGpRCacWKxG37kVABLstYUrRNWWY3JJc3A==
X-Received: by 2002:a63:6b88:0:b0:46a:ff3c:b64a with SMTP id
 g130-20020a636b88000000b0046aff3cb64amr40019025pgc.196.1667770150520; 
 Sun, 06 Nov 2022 13:29:10 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621914000000b00563ce1905f4sm2998746pfz.5.2022.11.06.13.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 13:29:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu,
	philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH v2 4/6] disas/nanomips: Tidy read for 48-bit opcodes
Date: Mon,  7 Nov 2022 08:28:50 +1100
Message-Id: <20221106212852.152384-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106212852.152384-1-richard.henderson@linaro.org>
References: <20221106212852.152384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

There is no point in looking for a 48-bit opcode if we've
not read the second word for a 32-bit opcode.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 717fafb739..abc78ae165 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21962,14 +21962,14 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
             return -1;
         }
         length = 4;
-    }
 
-    /* Handle 48-bit opcodes.  */
-    if ((words[0] >> 10) == 0x18) {
-        if (!read_u16(&words[1], memaddr + 4, info)) {
-            return -1;
+        /* Handle 48-bit opcodes.  */
+        if ((words[0] >> 10) == 0x18) {
+            if (!read_u16(&words[1], memaddr + 4, info)) {
+                return -1;
+            }
+            length = 6;
         }
-        length = 6;
     }
 
     for (int i = 0; i < ARRAY_SIZE(words); i++) {
-- 
2.34.1


