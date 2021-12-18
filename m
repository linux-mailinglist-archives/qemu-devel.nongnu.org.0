Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB58A479C66
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:48:23 +0100 (CET)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfgs-0000BN-SG
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbe-0000Wx-O3
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:58 -0500
Received: from [2607:f8b0:4864:20::102a] (port=38894
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbd-0003Sf-82
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:58 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 n15-20020a17090a394f00b001b0f6d6468eso8908454pjf.3
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5X3wtuEA7K0MfXipdGCYFMj200wnivNx0M8eb7nyK+s=;
 b=abBVFizTRMK3F8e3Clm6vjdhLeIOKLdySdYCogbhkRhQITvIwGWApCzkBEjyxuERMp
 xjOoUGENro+bEdsHykpiSRQfTqcABEe4jecpt3i48vyuudfS56wY9CUqVxGTCfmhAfZD
 KO6U6Hj1l3ncHgH4PC6RMXA5STKeqi0TP6/nfRwKe9d4fEWUff0Ec2A2rhpT0QL6cnbZ
 F+lyRIDO3lpDk/Hj7EwfK4tlWCRtw9h8NM+vOIf/3u7T/uIjhdlS+WLqnL0JrJuhgX/7
 zY8PxwWYlKZJ+NPVpxtkwmfRCmRJuHCMyDsR2ZVUng2nCguu7RxPOz4AIDyv34FdE7Kn
 lxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5X3wtuEA7K0MfXipdGCYFMj200wnivNx0M8eb7nyK+s=;
 b=1uAIOTQbmP8jmkYKNY9kPwKotYVDShZgkdw5MvNfoIYs/BID/Hq9V3h4KZmL+Ouirh
 SIJ7jE+IwTrf1Tf2i+8yL+lAZmyE8TaYNHudSVHzyz9er/36sTOxQlogQCQqIfpeTusP
 LviBaX93uPrEj19mZ3V+omwJA4aqs8Nr1SpYogGwTt/9Uw6+6bQwL5Gu1FXq0g8Kt9Sr
 JhtglFuFFdfFaYfMUcHt92PEwEpZtBiKFostqzqQCwVZzqRSSgSRIt9nYgW4lMSseX0f
 Nc0vS5Z3rO3NuGrMerTHkP9nfgKT73PhFiQowiqUfoZ4DEqPmAzqF5mOMFKpuFx2Bf4S
 oXhg==
X-Gm-Message-State: AOAM533cYqtOb+Jt1vX6Nmlvhlywy318MXtfA8oVhpr4oXeCf2HtbiRU
 Nc5QCVzHT9JN9WA4LhW7V7s8+K/x6mqJGQ==
X-Google-Smtp-Source: ABdhPJzae7w/8CFIC/6LIKMlkJy14r61G1zNfJPDhIU/OIcyOuTWIrkk73kzxjTTlgMyIZrOugFQzQ==
X-Received: by 2002:a17:90a:f283:: with SMTP id
 fs3mr8089500pjb.103.1639856576085; 
 Sat, 18 Dec 2021 11:42:56 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/20] tcg/i386: Use tcg_can_emit_vec_op in
 expand_vec_cmp_noinv
Date: Sat, 18 Dec 2021 11:42:37 -0800
Message-Id: <20211218194250.247633-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The condition for UMIN/UMAX availability is about to change;
use the canonical version.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 44d2919047..316e550b38 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3527,28 +3527,28 @@ static bool expand_vec_cmp_noinv(TCGType type, unsigned vece, TCGv_vec v0,
         fixup = NEED_SWAP | NEED_INV;
         break;
     case TCG_COND_LEU:
-        if (vece <= MO_32) {
+        if (tcg_can_emit_vec_op(INDEX_op_umin_vec, type, vece)) {
             fixup = NEED_UMIN;
         } else {
             fixup = NEED_BIAS | NEED_INV;
         }
         break;
     case TCG_COND_GTU:
-        if (vece <= MO_32) {
+        if (tcg_can_emit_vec_op(INDEX_op_umin_vec, type, vece)) {
             fixup = NEED_UMIN | NEED_INV;
         } else {
             fixup = NEED_BIAS;
         }
         break;
     case TCG_COND_GEU:
-        if (vece <= MO_32) {
+        if (tcg_can_emit_vec_op(INDEX_op_umax_vec, type, vece)) {
             fixup = NEED_UMAX;
         } else {
             fixup = NEED_BIAS | NEED_SWAP | NEED_INV;
         }
         break;
     case TCG_COND_LTU:
-        if (vece <= MO_32) {
+        if (tcg_can_emit_vec_op(INDEX_op_umax_vec, type, vece)) {
             fixup = NEED_UMAX | NEED_INV;
         } else {
             fixup = NEED_BIAS | NEED_SWAP;
-- 
2.25.1


