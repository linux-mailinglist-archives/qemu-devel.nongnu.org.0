Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066E4EFA1B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 20:48:19 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naMJl-0005cR-Kq
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 14:48:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naMII-0004vP-4I
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:46:47 -0400
Received: from [2a00:1450:4864:20::62b] (port=40854
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naMIG-0006aO-Ag
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:46:45 -0400
Received: by mail-ej1-x62b.google.com with SMTP id p15so7642019ejc.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 11:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNzw+URHGp1u96ZqBNFo6KFfc/Xd8zer3eIM26tUpsQ=;
 b=sGkdsEvlOedtK6gMKbJ050WQZDz+RtvtwN35r1FKv3Tofovn7tjATTNcgXPlcpPK2h
 frB/lW5d86vWRZp/y0Gdtb6pj8P0AIkJ0NIAoyCnjf2/L6OD8ioNf6SFR/IfDnk/veRs
 Nw4nkLUkV+soc/cCXDwwcx8msBd5jBK7BCzkxb0HhUQ+smsoH+Q0K12TwcyJogOpxClF
 huhpqEmPpE7sX1/3eL2X14SEM/058BbdDFoFX6TvEWLyyovOgssrCmqAFh9AOGeqEU0x
 nAnnZIxyOAoWYvBi5Lg6ykHqFFF909gHTvwsnid2e5HgrRuaB/azfWQYrg+2v8I62SHE
 9ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNzw+URHGp1u96ZqBNFo6KFfc/Xd8zer3eIM26tUpsQ=;
 b=KVFu5IG+d4OYSjdhqjrkm3rBWfDs2GtnZ5tZCH1TJTIUOsbUktMOPdBmd48yovPTGm
 Opr3ZAiENwWTDRZJ5r7b3IA507dD/lFjHb+dz2+hv3rDHg4TbWT1MuLjANyHakeHodUf
 BtvvbXii7Gkzhxh7oblHI9iqqEm8plfrCmqG9d9aY39IEk236jNb4vChrcDyUrhlBO1t
 sIRIY65MYV8uEfTsW36xcLFH77ekiEoroJcDYyRiS7KqipxtHJTL/x1jx/uYW7DTM/AG
 SF0tHxHOUqM+3af2yRqM+IERJe8h1w/t58IPxi2WhkXMCe3729Z/6ljiKjar3bDUikr3
 WjcQ==
X-Gm-Message-State: AOAM5325o/ImiLn2GmP7tA3GKE0VY9dqu2JkOKF1ULqTpSN12tb0YJwX
 h2qFukIspPO8eu+tJxLt2inrMriEhYRhJVj4l+Q=
X-Google-Smtp-Source: ABdhPJzkahKnj07aGF5bEL9jXLcdqLoeRDNQyZQABfBiCc3NHiCR71ngZK9MLYBWUS7LZxCN9vPeyA==
X-Received: by 2002:a17:907:6e88:b0:6da:8f01:7a8f with SMTP id
 sh8-20020a1709076e8800b006da8f017a8fmr988856ejc.619.1648838802626; 
 Fri, 01 Apr 2022 11:46:42 -0700 (PDT)
Received: from localhost.localdomain ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402105300b004162d0b4cbbsm1476604edu.93.2022.04.01.11.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 11:46:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Suppress coverity warning on fsave/frstor
Date: Fri,  1 Apr 2022 12:46:35 -0600
Message-Id: <20220401184635.327423-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: eduardo@habkost.net, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity warns that 14 << data32 may overflow with respect
to the target_ulong to which it is subsequently added.
We know this wasn't true because data32 is in [1,2],
but the suggested fix is perfectly fine.

Fixes: Coverity CID 1487135, 1487256
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index ebf5e73df9..30bc44fcf8 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2466,7 +2466,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
 
     do_fstenv(env, ptr, data32, retaddr);
 
-    ptr += (14 << data32);
+    ptr += (target_ulong)14 << data32;
     for (i = 0; i < 8; i++) {
         tmp = ST(i);
         do_fstt(env, tmp, ptr, retaddr);
@@ -2488,7 +2488,7 @@ static void do_frstor(CPUX86State *env, target_ulong ptr, int data32,
     int i;
 
     do_fldenv(env, ptr, data32, retaddr);
-    ptr += (14 << data32);
+    ptr += (target_ulong)14 << data32;
 
     for (i = 0; i < 8; i++) {
         tmp = do_fldt(env, ptr, retaddr);
-- 
2.25.1


