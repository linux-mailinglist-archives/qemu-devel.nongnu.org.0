Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2D58B097
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 21:57:45 +0200 (CEST)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3S4-0003gw-Qq
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 15:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pq-0006aA-HN
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Po-0004V6-Vv
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o3so3517708ple.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYksRbozJz/8hpYBfMoGN+EQkbHN1ocDywW1SbrIXTg=;
 b=tJX4ZaOcVG9la5ThSfcF3f59T05kNoCjjvlfQVvxd627cVTFIsZ4k7gVVOkvKne9I4
 AAUHcJy1YFi/wOOTiUZ/T2paWW7wzzOE9HI/TBdyvF7X6TgyEkt9o8cGiALATCND+iBf
 tIiV7a8S4A+RJWgLzfj1V0j5nLy/8kje0/zS3DCDVWpdN/fPU15lWLs22CUqKfWNQOkO
 VYmRlGnyEz2zyTXZQFJ9dSVWAff1HT86jJ/CjsZs7eWSksVq+rgaUADBga7EYNUKVkpS
 BvUXK7iFoVccQJKSRXzNZ7uObYpgOwAF0LE07jtHecD9/MPrchWr5K+JzjhBxcUIJI0L
 RZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYksRbozJz/8hpYBfMoGN+EQkbHN1ocDywW1SbrIXTg=;
 b=IHKacgm+ZJMPtiLjGc2o2bwzMkM90lgtvW0i63qmQkayg/GWFaV0xnj/N+VuMUn96Q
 b881g3t3JGR7UdSFywAflgYzZDt4+jYljrzZ/EOTcNjfwfjx1zQM2OtjwtmgyoOPGWCO
 ZEmLahEfYDCY7/nioQB1dahbBb6diL4SbHeUjd0Vxd/kKpIkvetbSNA11zuVVaI4r7bR
 WXkYlQBLJ0ZRzzftgqTZtOlpQkh1aWuT2H3BxMJbstGmHaTYOeJos+utbcNubem05ePh
 eo7zQrne3oAcIJkpN1mTFg3/LeRnVmFo1d8lztbl6V7BL5jv3J3QYr4wwUzi/rrug7CA
 vQKQ==
X-Gm-Message-State: ACgBeo0MtJR1SZ42TIC8HOpL/xGkQ4naLkujCvHhw7Kj9U+X+rWTXmtm
 jReGV9BWNkTyBMfrkF8f05KdjNhIAECJ3A==
X-Google-Smtp-Source: AA6agR7GecYv7QXGtJwZqI7TSJrI8tmAus0YHB6m/JHtDEy5THoYPb2gPPqqlXBUwoM7zEIsAxK7tQ==
X-Received: by 2002:a17:902:d50e:b0:16f:eb61:157e with SMTP id
 b14-20020a170902d50e00b0016feb61157emr2542213plg.3.1659729324158; 
 Fri, 05 Aug 2022 12:55:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 5/7] target/loongarch: update loongarch-base64.xml
Date: Fri,  5 Aug 2022 12:55:13 -0700
Message-Id: <20220805195515.349768-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
References: <20220805195515.349768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Song Gao <gaosong@loongson.cn>

Update loongarch-base64.xml to match the upstream GDB [1].

[1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/base64.xml

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220805033523.1416837-4-gaosong@loongson.cn>
---
 gdb-xml/loongarch-base64.xml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/gdb-xml/loongarch-base64.xml b/gdb-xml/loongarch-base64.xml
index a1dd4f2208..2d8a1f6b73 100644
--- a/gdb-xml/loongarch-base64.xml
+++ b/gdb-xml/loongarch-base64.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<!-- Copyright (C) 2021 Free Software Foundation, Inc.
+<!-- Copyright (C) 2022 Free Software Foundation, Inc.
 
      Copying and distribution of this file, with or without modification,
      are permitted in any medium without royalty provided the copyright
@@ -8,9 +8,9 @@
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.loongarch.base">
   <reg name="r0" bitsize="64" type="uint64" group="general"/>
-  <reg name="r1" bitsize="64" type="uint64" group="general"/>
-  <reg name="r2" bitsize="64" type="uint64" group="general"/>
-  <reg name="r3" bitsize="64" type="uint64" group="general"/>
+  <reg name="r1" bitsize="64" type="code_ptr" group="general"/>
+  <reg name="r2" bitsize="64" type="data_ptr" group="general"/>
+  <reg name="r3" bitsize="64" type="data_ptr" group="general"/>
   <reg name="r4" bitsize="64" type="uint64" group="general"/>
   <reg name="r5" bitsize="64" type="uint64" group="general"/>
   <reg name="r6" bitsize="64" type="uint64" group="general"/>
@@ -29,7 +29,7 @@
   <reg name="r19" bitsize="64" type="uint64" group="general"/>
   <reg name="r20" bitsize="64" type="uint64" group="general"/>
   <reg name="r21" bitsize="64" type="uint64" group="general"/>
-  <reg name="r22" bitsize="64" type="uint64" group="general"/>
+  <reg name="r22" bitsize="64" type="data_ptr" group="general"/>
   <reg name="r23" bitsize="64" type="uint64" group="general"/>
   <reg name="r24" bitsize="64" type="uint64" group="general"/>
   <reg name="r25" bitsize="64" type="uint64" group="general"/>
@@ -41,5 +41,5 @@
   <reg name="r31" bitsize="64" type="uint64" group="general"/>
   <reg name="orig_a0" bitsize="64" type="uint64" group="general"/>
   <reg name="pc" bitsize="64" type="code_ptr" group="general"/>
-  <reg name="badvaddr" bitsize="64" type="code_ptr" group="general"/>
+  <reg name="badv" bitsize="64" type="code_ptr" group="general"/>
 </feature>
-- 
2.34.1


