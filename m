Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613B6EE8A7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:51:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOXg-0002ZW-V3; Tue, 25 Apr 2023 15:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXf-0002Y1-9v
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:35 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXc-0007I0-Ly
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:35 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4edb26f762dso6618510e87.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451691; x=1685043691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naApWSmi65k1gRAeLMa4iVYTmTT0eNi8LAPHTVnKRRQ=;
 b=UYPRDzgZ3Vkg2LxIAsLUN5iX90IVZgBLD49ji+fhoMdZX6BwS4+SAEqlG61hosLF+n
 1IkoTvqg/h7iBAsimrbjG/OkqcZrFUB8OSeurY5B5N0nubZE0uFh+E/8jTaV6LTkYGN5
 qsDRUhd4LINtL3zKDrlLROil0HrccZkW1Q+0kDVnUR96RXUHP0Y6zKK/stjt7gkfu+j8
 IBiJMu9YfQQks94sAKv9RZFRKuuWpFBNQI8dqBBNRvX9lvdJ7fdGBTwt38g5WBNOYmkz
 De4NEPyIXLcs/J142EG5rUacSEHY3yOUb5UzE+6rq2J5Je7ini3j+U61CBgGoRaIvIs0
 eqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451691; x=1685043691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=naApWSmi65k1gRAeLMa4iVYTmTT0eNi8LAPHTVnKRRQ=;
 b=lIh9nB84W3Lk/2HRssL/uGZO4yasQE0oKDj/q6Z1pBKGgxzakdxgvgbn8f4d+12TGV
 sARJn9cV3QULrjJJMQcPqxdjea6w2zYEShpGxm3o9e6QEyviNaARncWVEPm6owDJkxnk
 cNTfjabpIGulkQ1CswEIOCpggKoRf8N6lBeFgA5m4QxD/2QY02zHNX4s3AM+U+vhE8Cc
 WXFcXe0OD6viCOSAJrHp9qswg28wAgF5yS03YzKr4hW9F21dKZL6ldjxYgnPo97ixFHJ
 grAL8fOpbKebZgmy+KmghQGdJFVZj0YBr3gd/jFuqkmzEEjJd+py+utkl5pQxgeaP3F7
 6BUA==
X-Gm-Message-State: AAQBX9cm020AevgWgy1yiGqPZ+vOF9f04CC8gHJ9MurzspyE0atNzRjL
 hRRu/iTSVqkX5CG2FbUe2lvmoz1CqRpmTlg7AYIO4Q==
X-Google-Smtp-Source: AKy350Z8Y/pdLFd83U07bAUNbuqZSnj/DnInO32Dr8/6LE39Hn+BaNEbpN7EhHuqWlBrGK0JVYqgVA==
X-Received: by 2002:ac2:4302:0:b0:4cb:280b:33c9 with SMTP id
 l2-20020ac24302000000b004cb280b33c9mr4483035lfh.24.1682451690872; 
 Tue, 25 Apr 2023 12:41:30 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 47/57] tcg/mips: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:36 +0100
Message-Id: <20230425193146.2106111-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index cd0254a0d7..43a8ffac17 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1139,6 +1139,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1158,11 +1159,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_u;
     unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
     TCGReg base;
 
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    h->align = a_bits;
+    a_mask = (1 << a_bits) - 1;
+
 #ifdef CONFIG_SOFTMMU
     unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
@@ -1281,7 +1287,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 #endif
 
     h->base = base;
-    h->align = a_bits;
     return ldst;
 }
 
-- 
2.34.1


