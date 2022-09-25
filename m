Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F95E923E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:01:56 +0200 (CEST)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPOV-0005Sm-91
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEo-0002jB-1h
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:54 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEm-0000MU-JS
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:53 -0400
Received: by mail-qt1-x832.google.com with SMTP id w2so2590635qtv.9
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=SeIr0TcoiSWdEtUQ0CBed/Veb3zjAFGhK3Fx7VZ92YQ=;
 b=emXdrSMpB13C3cBcTgMjZWBH4CBMs+We1f3GAUIN5KrjZ2u+MgHJo5eWfsoUYe9g40
 FhGfzvOjURrB6KO85Y1fTW14YMrpJStPpcx3UIefxQ1b3LFLb+tDun/U1/ivifbJADv9
 boPKdmfvJ4sEYGcwqexn2IGJ/Rs+ic/1jr0SE7zn2A33iRPbqgRCQEsN1XdjwkqxtxiP
 7zQQjcm886ntbjuJEK7Slbsm0UcSE16sDwurgsFva5DbR/SnHhnWfzBDXmaulxZ1gtPb
 FL0n+/44r/C0xkFWUaKy54cx7BOFsbNzoS8XKpjxJpRC4qBb/9Z3CYZpc7fsYC5DOHDD
 xXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SeIr0TcoiSWdEtUQ0CBed/Veb3zjAFGhK3Fx7VZ92YQ=;
 b=q+DdLJpyhuyeHhZCajjcY8R9pRyrkYy5l9YDm0WccJuSOWjvKW6aeAzAf2e1OmiEm7
 hS5GimK7JX/EofDHNxFv+I7DTJ2l1//WeohpnmmJkBpPvk2wmMxUGYp8zBrHR5MdaL2v
 /CZDUtdWqXlLRRArZgdnDlj789V5Jf99QWSdJcHKD3YDA2ARPsxelY0rk5rfE9WQedTe
 5G8JmmHZqgqmQHmP5BL9On8OsAtZvBtgzF9J01Zr/pEEgOFZYDbHOPP1yg/lfOszHLf5
 sLpO81jOGgfY7S2ONhZd5eEL+J7ybnt4w9fcniR4Xshb+drXkuEDcUE7RBIS1pSTVqxO
 gsng==
X-Gm-Message-State: ACrzQf0bFsNfcsH/x7jhpkQ+OWx6yflr3xgroacvwQffEEOeS4aezxyG
 50xNWRlDJM/0oQCnFWtpGSpiIaDdn6En+Q==
X-Google-Smtp-Source: AMsMyM6U+Jaww4KHxUZ3lTNfyigroNOgaU3kVlw1bqSxYgcyYcW3fLyVb9Rq94lGdjy4GeGcsSpaPg==
X-Received: by 2002:a05:622a:1002:b0:35b:baaf:24bb with SMTP id
 d2-20020a05622a100200b0035bbaaf24bbmr14036866qte.85.1664103111723; 
 Sun, 25 Sep 2022 03:51:51 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 06/17] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Sun, 25 Sep 2022 10:51:13 +0000
Message-Id: <20220925105124.82033-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the target to cache items from the guest page tables.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 5e12cc1854..67239b4e5e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
 
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
+
+    /*
+     * Allow target-specific additions to this structure.
+     * This may be used to cache items from the guest cpu
+     * page tables for later use by the implementation.
+     */
+#ifdef TARGET_PAGE_ENTRY_EXTRA
+    TARGET_PAGE_ENTRY_EXTRA
+#endif
 } CPUTLBEntryFull;
 
 /*
-- 
2.34.1


