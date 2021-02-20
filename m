Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B29332023B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:29:56 +0100 (CET)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG9j-0007DO-7k
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFup-0001q3-FO; Fri, 19 Feb 2021 19:14:31 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFul-0005oc-Ki; Fri, 19 Feb 2021 19:14:29 -0500
Received: by mail-ej1-x633.google.com with SMTP id t11so16891903ejx.6;
 Fri, 19 Feb 2021 16:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKECDGuoD/V2A2ROIUImwftJIuRHFRhmDb/rtg2wL20=;
 b=jwW3noLDelBIw/fDDFmd2mf0phG00bXjsaks5W+OrEXgaOMMwzB1SIE40FdDR1dhQS
 Bpeum4ADezWKUeOfcGBxCbM14V8FRuJ2OvgTW5D/aRK8xH9Xswu1pOPvkhF7jXrAxUHD
 gVDRJaCG2ZDS4v8DyhcVT5ZhEBpgH9hvT8zIXp/bGXANJbIf4t6CpZjcX1Q0mFqFv7SK
 8l0m2A6yEeiQ+2WDt13miwjmA/kBQgjAZ1xwkIur7+wvX1D4K9HykTdRJ8Zz1mW71kgO
 2ipxNS1K/mF+uwBttIjY9BQEMgRaUedpXuQBV6okOScoLyRcBNYek2v0uo8MX49dia3q
 JPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZKECDGuoD/V2A2ROIUImwftJIuRHFRhmDb/rtg2wL20=;
 b=s2oQ8ZqDF/Q7+K0262Sxr/athcjViiTX6Okpu5MGKLFLlvatVxG1L4iwU9LpHeX4aY
 yy3ZMLU6t2ITiX0Z54ySRf1FucOA4t12ySN/1BhOh+RloGOxqUgjk3z3th8tL1Yb4wAT
 wSwoMBgF/YwJLGjCSN/4u2hI9CG1Dwz9uADtyxqfYUiD8hFWJ5dojqA3bpX6cEIdWnRE
 vpunkOm7KrrpIheW0fQB4SK2OqABTVnHBDZHHfXBolfELxAuhkYAiQNLmfsWG2VJ6L0M
 hvmd1w586q5c5t14y5p8vqxX1bjD9lII615YneoHJHNb6A0P2VnS3VdClewxkssBolG+
 nbig==
X-Gm-Message-State: AOAM533WgasoSdly/CfFGBGd7JpT6vvHH3R7qWYIGgFHrHrIuoPZfZbr
 +i69jQ0fekSf0JHcxxjvYQ9att6xsBc=
X-Google-Smtp-Source: ABdhPJxtdOH5+1gh/pFBI0OCF1v4k7V2Ngd/24ja72SttqcQxg5nmM3HXxKSbvEt2r02sWbjRDNVjg==
X-Received: by 2002:a17:907:3e04:: with SMTP id
 hp4mr11201787ejc.188.1613780065825; 
 Fri, 19 Feb 2021 16:14:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hd39sm5044795ejc.116.2021.02.19.16.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] hw/sd: sd: Skip write protect groups check in sd_erase()
 for high capacity cards
Date: Sat, 20 Feb 2021 01:13:05 +0100
Message-Id: <20210220001309.2225022-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

High capacity cards don't support write protection hence we should
not perform the write protect groups check in sd_erase() for them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210216150225.27996-6-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4c6e7c2a33e..883c04de028 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -765,6 +765,7 @@ static void sd_erase(SDState *sd)
     int i;
     uint64_t erase_start = sd->erase_start;
     uint64_t erase_end = sd->erase_end;
+    bool sdsc = true;
 
     trace_sdcard_erase(sd->erase_start, sd->erase_end);
     if (sd->erase_start == INVALID_ADDRESS
@@ -779,6 +780,7 @@ static void sd_erase(SDState *sd)
         /* High capacity memory card: erase units are 512 byte blocks */
         erase_start *= 512;
         erase_end *= 512;
+        sdsc = false;
     }
 
     if (erase_start > sd->size || erase_end > sd->size) {
@@ -788,16 +790,20 @@ static void sd_erase(SDState *sd)
         return;
     }
 
-    erase_start = sd_addr_to_wpnum(erase_start);
-    erase_end = sd_addr_to_wpnum(erase_end);
     sd->erase_start = INVALID_ADDRESS;
     sd->erase_end = INVALID_ADDRESS;
     sd->csd[14] |= 0x40;
 
-    for (i = erase_start; i <= erase_end; i++) {
-        assert(i < sd->wpgrps_size);
-        if (test_bit(i, sd->wp_groups)) {
-            sd->card_status |= WP_ERASE_SKIP;
+    /* Only SDSC cards support write protect groups */
+    if (sdsc) {
+        erase_start = sd_addr_to_wpnum(erase_start);
+        erase_end = sd_addr_to_wpnum(erase_end);
+
+        for (i = erase_start; i <= erase_end; i++) {
+            assert(i < sd->wpgrps_size);
+            if (test_bit(i, sd->wp_groups)) {
+                sd->card_status |= WP_ERASE_SKIP;
+            }
         }
     }
 }
-- 
2.26.2


