Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A14332DE9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:12:46 +0100 (CET)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgqb-0005Vb-LI
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7Y-0000Bj-AX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:08 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7V-0002kY-94
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:08 -0500
Received: by mail-oi1-x22d.google.com with SMTP id o22so5784705oic.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34lemQd5zIzYiuHieHMv0eB4fxYwFhBfNJ3IIztazZk=;
 b=q+G3nnupCHprgfnvNQwKm5tEFHHItpSSzY4MT7WkgFPmusKZ9UQj8raPo3bMwhqiyK
 2X53mDkTV038gOIKvBz03NUs6g/iNNhG3UJOYSkGn5zJsNPJU5gFkzx8wx95wGGjVD39
 QhrtB3aKx+G8CZvF6a4hEEMsC1I/yLIOvBDAR+WV+GnMunO/VYfladoWVka2SBOkAgRx
 J0yUv0XcU2HrDCTxvzULUF/kuqFjWSxtoMeMl8Lo5q+/orh4WzY7TW/Pt7d++kmyCb26
 rypY8you0fsEINPcN7joDVb5zMviCXo1HDW+bMu7bN3kNKqQByFKkrTapyqvySY2fKsi
 93DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34lemQd5zIzYiuHieHMv0eB4fxYwFhBfNJ3IIztazZk=;
 b=N0NykQ57GpG1RzUE64p7Y9YIvF0CmHjmMbwIcUA7PCFoGHBZLZerh5ikBQYCGyBUl+
 5uWua9HfPpkxvlZL0qKBcwa1zeCoRPXpUBoVNlVNj+hJiuMcGXKijIsyqtlSOvOJghfh
 3WDys3KTH+77NrIxGw6DYzIORRwET63HiTcyBFd4jdvGNCt+0xlJjf7nUbk2xqzTXMQa
 JWtFRBsTVnXAzatbBPBK0TUtPk6BljONZW7A9sIYNapvIFQDhi7kptCVVtrjyR8moDMf
 HMEj5v9TbJCR9MI0BsrvoLVBwVjDyHGl+en9jFqh/wAAKn0vPmWAmhhxLjX+/YvCibys
 kkzQ==
X-Gm-Message-State: AOAM530Y/QpRzp03J2/5hSpm7eYFJcgs7m11/C7WRE0O0x4wcyIUAFpb
 CWbi3BuAfPcCVNj8jQ8NBRa4N57ewbP0EA6Q
X-Google-Smtp-Source: ABdhPJwcN9S0DtUneNgC7yU/w0A4/cksNgysr8iErP/djFEZuRWGILnY85Nco4uYx5bhLh6X/fDSKA==
X-Received: by 2002:aca:de82:: with SMTP id v124mr3485851oig.125.1615306924296; 
 Tue, 09 Mar 2021 08:22:04 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 44/78] target/arm: Implement SVE2 scatter store insns
Date: Tue,  9 Mar 2021 08:20:07 -0800
Message-Id: <20210309162041.23124-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
store insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469..5cfe6df0d2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1388,3 +1388,13 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cad61f4577..895522e3cf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6168,6 +6168,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.25.1


