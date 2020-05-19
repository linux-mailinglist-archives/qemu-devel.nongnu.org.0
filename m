Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3A1D8DE9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 04:58:18 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jasSP-0005Xa-Tt
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 22:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jasOV-0005Sl-SW
 for qemu-devel@nongnu.org; Mon, 18 May 2020 22:54:15 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jasOU-0002SE-T2
 for qemu-devel@nongnu.org; Mon, 18 May 2020 22:54:15 -0400
Received: by mail-pg1-x532.google.com with SMTP id r10so5732454pgv.8
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqkKmnd9c2hIbo2X4DhmexDNHIE6TrbObnYZ+jtrN9c=;
 b=xkIkTWl4Q062EuTllCJkfwEWdjAjxDrFfB2GevVVsqalJMQs17ZATA7K94MxLyiUvf
 9Bbg9LgmwxKBGS9+EGr8MRYlVKYgjuq+0cH/LN8jRTkXZDHEVSLbGg4HIpsjPnK5AKj/
 wVVK+QfHJMFhRKh1MQJLNfyBs3QnMDhv7R0iGt6xpXYGI9I00nfgcCb/NXbieXjzxmEH
 2g08I2PluK+ZeUwGsMsmteBtYTVcuyV8oEzs+Sxrx4R0pKs3PbgeiCL85M1Gay6hjzxg
 d6rwTydLRBa4Cph6HzRWLldnDawKWZNE/rGn1PF4UBa/F2zkmQuUFb1J73weHNWK3vcp
 5fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqkKmnd9c2hIbo2X4DhmexDNHIE6TrbObnYZ+jtrN9c=;
 b=sby51huspMvWNkgt+sICaOwiJdwWwyQhJWRK4W6t0hSNW7eq4leQkx99Ey1O2OQM+z
 sElU95f5XsGKFvt/2gwObxbhBDVrSaZOoILg63zToFjnSmszX78lIgxDw8/lJ6e6wJFm
 HkacHRLekzK1IGmYicipGzKylgXXZgwYULXQ2tRVrIqpc5sJoFCUOxBVAW20LW/reJzZ
 MJuQYGeWpKNINEF3kDxYA7rqIb6XXaTbgBtuDAOBLOn89aMOS3x16xgaNRSnrOj3uio2
 xF7rwJh9jqVGYpZUd6t0QkiOh/JRxjYaXvZpae/FCsNh7od7YEsAaYWFqbYZCSwrZloF
 sHfg==
X-Gm-Message-State: AOAM531BGWscQmd0b2zU3UjoCx2+1OkwfLq/GOv82g2nYRNOhfaN5jWb
 EC52/JH6Ctg+e+KvKSuoe88oH5mzUTU=
X-Google-Smtp-Source: ABdhPJxM1imAvBm+mDxJZU37WoovtkYekX/2wQKh88iXNAJBDqL7omTazTKqNPTxDKSYHeU7K0XuKA==
X-Received: by 2002:a05:6a00:804:: with SMTP id
 m4mr13258262pfk.89.1589856853269; 
 Mon, 18 May 2020 19:54:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a2sm8772418pgh.57.2020.05.18.19.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 19:54:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RISU v2 12/17] Simplify syncing with master
Date: Mon, 18 May 2020 19:53:50 -0700
Message-Id: <20200519025355.4420-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519025355.4420-1-richard.henderson@linaro.org>
References: <20200519025355.4420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not pass status like RES_BAD_IO from apprentice to master.
This means that when master reports i/o error that we know it
came from master; the apprentice will report its own i/o error.

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
2.20.1


