Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA156BE2F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:35:09 +0200 (CEST)
Received: from localhost ([::1]:41674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qwe-0004q5-TD
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCr-0005Nr-Np
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCp-0002UX-Mo
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id ju17so13255705pjb.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LHt//Kp5lBRa8NZxlYvTpSA0XqF6ZFwISz/AY+ddgg=;
 b=a+kDYS9+DDHnlujQ7FveWMcc1yZAsL2DMiepCLOj9kTLof9Fswmv4XC1B8lbk9k2Ag
 R3ycjYLibZttVRN/ZePK4C54n9w70W7XHhGqMtf9IqY9eniBI6ZHgN7nF5YKhzlpZOsZ
 HFG/w6xyplbq9ZmzDHgciliaRw5Z94u+nr0WMuZVjHtOllIN1cAwE/Fbg6qEXc4JY6EG
 wJ5vdw+9M26p+2askJ4dhzQT43dbE95yyP3kLmR3WbsVwkymLja5ABtDDoUMOzdLAvxJ
 Axk4dxITK2xUrLYEtl9pC328plrYaDrkxglrUPuzmnPlkXmyZcBeDJxsPXUnGyDM+Q7f
 CEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9LHt//Kp5lBRa8NZxlYvTpSA0XqF6ZFwISz/AY+ddgg=;
 b=DfPdbf0FPzN0lfL26Ymwe35OzCjvQnNdYia3bS6atNWhu3NWIr3GC0q5bP6UoI6q0m
 1gwwsRn93rXb9qucLyhNHG8+NyqUvmRSqUy2vRO6gREobAJUCZ8O8ME+ZgzSWPQRIz2g
 3r2jETlH/AYjfa2en0Qu24amWr7OR3nV5pb9YG5taW3mHZknDmLSft5KCU9z8KlZudqm
 qzi+SnbOQxd710WH5gEfd4EXgAAwugUjbPFZg1ht3CM1iQiEmSf30tLhiMC7EqI1A8w7
 xlvza4JOWy2dKBfgnJ6PNt3QCXONvfz1NkZozv09P1rrIGUBc8Mg1OfWyKfV+87xxJco
 /uqg==
X-Gm-Message-State: AJIora/7FLPW9DEX/vFmhFOSrl8LT5S1A1Jq1jH4ZAzryvhD4ocuw8nh
 ec30+PYAViL/MVIKhzj8iRXu8rdx0yVpUHbt
X-Google-Smtp-Source: AGRyM1uT4OC6xz8W9op2T7Io1cZkbK7wrttdWF8bBOd/+GQaCN+Sla7dW0IyYAZ2CRHOuacL7NIvgg==
X-Received: by 2002:a17:903:2445:b0:16a:32da:cc9 with SMTP id
 l5-20020a170903244500b0016a32da0cc9mr4237591pls.148.1657295266402; 
 Fri, 08 Jul 2022 08:47:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 12/29] Simplify syncing with master
Date: Fri,  8 Jul 2022 21:16:43 +0530
Message-Id: <20220708154700.18682-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Do not pass status like RES_BAD_IO from apprentice to master.
This means that when master reports i/o error that we know it
came from master; the apprentice will report its own i/o error.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 reginfo.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/reginfo.c b/reginfo.c
index c37c5df..31bc699 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -90,10 +90,9 @@ RisuResult recv_and_compare_register_info(void *uc)
     }
 
     if (header.risu_op != op) {
-        /* We are out of sync */
-        res = RES_BAD_IO;
-        respond(res);
-        return res;
+        /* We are out of sync.  Tell master to exit. */
+        respond(RES_END);
+        return RES_BAD_IO;
     }
 
     /* send OK for the header */
@@ -115,7 +114,7 @@ RisuResult recv_and_compare_register_info(void *uc)
         } else if (op == OP_TESTEND) {
             res = RES_END;
         }
-        respond(res);
+        respond(res == RES_OK ? RES_OK : RES_END);
         break;
     case OP_SETMEMBLOCK:
         memblock = (void *)(uintptr_t)get_reginfo_paramreg(&apprentice_ri);
@@ -133,7 +132,7 @@ RisuResult recv_and_compare_register_info(void *uc)
             /* memory mismatch */
             res = RES_MISMATCH;
         }
-        respond(res);
+        respond(res == RES_OK ? RES_OK : RES_END);
         break;
     default:
         abort();
-- 
2.34.1


