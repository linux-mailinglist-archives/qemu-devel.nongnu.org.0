Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FF96F507B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:00:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Ql-0007Pr-Hd; Wed, 03 May 2023 02:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qj-0007Og-DV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qf-0001f9-Ba
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-306281edf15so4023211f8f.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097052; x=1685689052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Op61LyFiNoJTk9LIzK5doaDEyxOgewGDHJjDkfUTrQ4=;
 b=eSh4Hv2jAatJ++nCguLwRW3iHJwewQdVw9ILYpJJgvV8/OclknaipF5i34vXWVuniu
 wx+sToL0DcXMpw5jTx9RiAv3FYDNVeTNAvkEBckrjZ5TuMirA3a5ijJQ08KhD6KBbM3O
 bU/pufpthe24RMkbyJPuwbI+6M4cGiPnE4Js1SmEHpRWyJlIEF1WqwUfIqJyzMXbXJsD
 Qke4yeMfMI9gpGlMnpmhgkarGqzHGHwWVsOWqEPjINXUsJXVv/QmTcgYcxX0KYvZ534D
 blb6KlhUoflE5pn+c5xukLHYFO8Ab+Tgrebe3pIcEXsTRfM22uRqQMnv8jz7FsmiN36g
 B6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097052; x=1685689052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Op61LyFiNoJTk9LIzK5doaDEyxOgewGDHJjDkfUTrQ4=;
 b=hsOzwtnkPaL77LzVJV33jWsICWQdXk90up9pGZ9Ndfb90Brs8av7EwIKdbz8zVq20G
 czCEj/kA+HsjWvanBcgd3/D5f10BzKVfjYiZBF+5DA5ZT6UxsI9AYEiyTU5xQDKZsml3
 94mr0DjH3KWVds7U7DlP5Tl77b4xVNMHXFoiKbk1BvGymYvw+6YudX4MmLnNYQrUNslE
 158reElnpOaiAkgfBxSuejkFWjvCQPP2QZd7Jba/k0Gde33MGOLaP1lP+553wyd+Nsfy
 O88SO7vPOLJPUa/poSUb3o6DM81dJOxd372vWKm3mjgFZ7r5xu1WCQRWe2qlNHvR1Tdv
 QpyA==
X-Gm-Message-State: AC+VfDwmYJH/2sw7q3DnBvyNlYZW9lR213+fVPGiMTsbasbH0yGx75k4
 Sr/Ar0ZXg4PE7a40zEyoKyvatfPk4Sj7iObsUx2pTw==
X-Google-Smtp-Source: ACHHUZ7ktM1plJvcFd5+TvBk0st6EPODSkXef/xVI5X4to2oPjFsQYwLlB3nRfCFEFHwTOVpTwS+pg==
X-Received: by 2002:a5d:4b0e:0:b0:304:a40c:43c6 with SMTP id
 v14-20020a5d4b0e000000b00304a40c43c6mr15546265wrq.11.1683097051865; 
 Tue, 02 May 2023 23:57:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 02/54] tcg/i386: Generalize multi-part load overlap test
Date: Wed,  3 May 2023 07:56:37 +0100
Message-Id: <20230503065729.1745843-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Test for both base and index; use datahi as a temporary, overwritten
by the final load.  Always perform the loads in ascending order, so
that any (user-only) fault sees the correct address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cfa2349b03..173f3c3172 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2221,23 +2221,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
+            break;
+        }
+        if (use_movbe) {
+            TCGReg t = datalo;
+            datalo = datahi;
+            datahi = t;
+        }
+        if (base == datalo || index == datalo) {
+            tcg_out_modrm_sib_offset(s, OPC_LEA, datahi, base, index, 0, ofs);
+            tcg_out_modrm_offset(s, movop + seg, datalo, datahi, 0);
+            tcg_out_modrm_offset(s, movop + seg, datahi, datahi, 4);
         } else {
-            if (use_movbe) {
-                TCGReg t = datalo;
-                datalo = datahi;
-                datahi = t;
-            }
-            if (base != datalo) {
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-            } else {
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-            }
+            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                     base, index, 0, ofs + 4);
         }
         break;
     default:
-- 
2.34.1


