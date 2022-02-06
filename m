Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F44AAEE5
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:48:30 +0100 (CET)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGf5p-00060y-NV
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepn-0004Va-8W
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:55 -0500
Received: from [2607:f8b0:4864:20::434] (port=40842
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepk-0002OW-Kp
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:54 -0500
Received: by mail-pf1-x434.google.com with SMTP id e6so9138603pfc.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=veQnK6WaTjZ3A8j4hv7hC4c+w1i5jtwOSMWU/0mqUcQ=;
 b=s2H2kKG5xzFoKo5msj7vNX98PpxvnZw0q4MPyti7Se8jRwGsqp1zbzqZsu+Yjbs/eh
 ksACrSBxP2Xulnv+KNzwJGYXWghsPkLpch7FEk4d8KVx6vuO/FS4/ViQqQf+0+ZNOCeX
 aCPni6SQ9kSYDenj5+kOOsDDyGPEG+fg4G9Y/YA/P5ARhxTiUFQ1tidUHF6OJCAqrsBE
 PMciEeHCRi1SNoXii6a8jjxBso4W375RtmaY9pdRlBk7b02mpQj3qDfTmrkY3ExJ3lcQ
 DFJjwAoM+Q07WqveDCvLPyhY/FQdIcgR1+TxqgUv9VDs69DYmZHax+KvESdOGKKHy0Lk
 A0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=veQnK6WaTjZ3A8j4hv7hC4c+w1i5jtwOSMWU/0mqUcQ=;
 b=6eRB9bVc0XCIHyBvlv8H/fVkYCInTmwDBQJhHFNKmqvAvbk02FGJP5/VQqy4YW8dXa
 Mbd+M0qsv6H7jqoNW+quHIucud4pAY6aP0ZKUcc8rNEcKwAsVhBCLKw4LaE+PJ91mz7e
 EOZNNBf1s4cpd50/1mpy7OCeUhARREtjpaZ0N1IB7QmOIr0VoMKH5b0nOl/frwLp95TW
 tbO1mU4XLL9KkAz9MKieBWjvdKmL7XGaoM6bZsh5QV7NubPiOkqldJ19uNsYzkuw2Vs+
 4zsOzsbILo8XBrWojGyw43b288jkNvUpd/+aFO1p0LoqW3CDautI0QYeTLIE/nu/nuKu
 bToA==
X-Gm-Message-State: AOAM531EtsoWqU6ZYV6QRWI+eieE4kEnqq4NjQxdors0W/mp6rOZwbv8
 RS+WuFLaGXfs2SFq1dwqQnAE1O4qIfcbl1qf
X-Google-Smtp-Source: ABdhPJzodxVN9IjBGIDHM7/uA4SeD3F6HJ8XHcuHYhDDrDwZqgEDbMKQvUasT8Qd6e4tRGiGjTGpjg==
X-Received: by 2002:a05:6a00:1396:: with SMTP id
 t22mr11095603pfg.82.1644143511235; 
 Sun, 06 Feb 2022 02:31:51 -0800 (PST)
Received: from localhost.localdomain ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id s2sm5605937pgl.21.2022.02.06.02.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:31:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] tcg/sparc: Convert patch_reloc to return bool
Date: Sun,  6 Feb 2022 21:31:35 +1100
Message-Id: <20220206103138.36105-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206103138.36105-1-richard.henderson@linaro.org>
References: <20220206103138.36105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 7ecd02a06f8, if patch_reloc fails we restart translation
with a smaller TB.  Sparc had its function signature changed,
but not the logic.  Replace assert with return false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index f9afb1bffc..f3043e6833 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -323,12 +323,16 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
 
     switch (type) {
     case R_SPARC_WDISP16:
-        assert(check_fit_ptr(pcrel >> 2, 16));
+        if (!check_fit_ptr(pcrel >> 2, 16)) {
+            return false;
+        }
         insn &= ~INSN_OFF16(-1);
         insn |= INSN_OFF16(pcrel);
         break;
     case R_SPARC_WDISP19:
-        assert(check_fit_ptr(pcrel >> 2, 19));
+        if (!check_fit_ptr(pcrel >> 2, 19)) {
+            return false;
+        }
         insn &= ~INSN_OFF19(-1);
         insn |= INSN_OFF19(pcrel);
         break;
-- 
2.25.1


