Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C2332D4D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:32:15 +0100 (CET)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgDO-0002BG-IL
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6x-0007Op-73
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:32 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:38108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6b-0002Te-H3
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:30 -0500
Received: by mail-oi1-x229.google.com with SMTP id v192so7957014oia.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7rOIpXmUiahZQykYscgkQbVm3sAJxgER+idBTOFlEo=;
 b=kG0EzhpvRl6o9MWf329J/+5Xvf9lP3t/hnpnNbQA3goQxSgTY1KWTyxbGLwqeLFB5f
 f0lCBW+v+3lF/N+8lF6uJv3+IwO5dZ/BaBF1Sifpfl6xLxz4DWdKkmhzYYEQkwBEsPEN
 VLwCwl1ocvbrKgo8TzL3bz2IWi79VBOrKnVJLpgSAMCgUmnARQk+1VXOReR/frKoWZZP
 dRD3SKJiU5iUfHHdoU0nnvI7240XyXuBzylsHAiTLNu9ZZ4YCy0G48lhq0KYlX2rpBXt
 A1Bu3N+lvQG/L20dd4zPdjYomWRpDtiy5+B0YlB86JJwVRJ5OPsmO/aUGFkJOCajWFup
 rfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7rOIpXmUiahZQykYscgkQbVm3sAJxgER+idBTOFlEo=;
 b=Ke70VYZZmMtAzzC+ShihPb83Ge/XRHEiX07/dzLeSHOaCFGcOxue4wslgXgVocA5bn
 ol8clxNGX00g6x3HZCwC9liopQ+j9H4Qa9zC9zbrJ6qukhbdJ+YIeOCF0Q8nS3zQDlOO
 zRLErtRaDhlbB//teYlmkPZRrFggl9e6znS6dUjnpKB0rwLPsPhXwtDBTYwYFpyokelD
 8su9CfL65PgtXDsqqEVxJF9IRAIH7ekkR3KqV44i0H1rQY9dxdK8kcWKe731mj7whDJs
 4LRPwwPgvJv0LcBuQwcn0VAanllcH4rvE+/ZbyKPqB4Y1nZ9p8LMw00vAqohhsbP3wzq
 D2/Q==
X-Gm-Message-State: AOAM530mhCrdU0scuwOc5SovXiVR2rFlE5pAV8H80gybhPQQHIm27kxN
 rkOgTg2kT3A6yIom7vLuWusG9lbAaIKIK5jv
X-Google-Smtp-Source: ABdhPJyw+58Ib2Fe//ZnzrkDF/LLE+925+0fpKxmTByDNNN9lqoa9fWX1nRxXML1DTkTaTGrjJTibg==
X-Received: by 2002:aca:5bd7:: with SMTP id p206mr3460021oib.66.1615306867820; 
 Tue, 09 Mar 2021 08:21:07 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/78] target/arm: Implement SVE2 bitwise shift and insert
Date: Tue,  9 Mar 2021 08:19:45 -0800
Message-Id: <20210309162041.23124-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd1..695a16551e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bd4d6f1a69..d41fbd9697 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6429,3 +6429,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.25.1


