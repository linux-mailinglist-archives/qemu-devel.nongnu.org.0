Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EA4CC7D5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:18:08 +0100 (CET)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPspr-0007QW-VR
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYM-0005kv-Rs
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:02 -0500
Received: from [2607:f8b0:4864:20::62f] (port=43945
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYL-00044B-2w
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:02 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e2so5861240pls.10
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z75EGj4CNGTU3HtUoe8PTzeS4bhGOlSVRpDZyhuG0Pw=;
 b=joT1F4WBbnIx1tRrBmaQwQo40/nUV/bJeGqeHko7w3LjW63yOtt/3I5DTfSMR3Ai51
 gEeH4cJh+lhxM8xObbEg2nM2nEkV3mt1k3MOnv1a7/be3enVxTlTzr5olM++bANxy22O
 nT4gWJi1TO1P7tbB/0BebWNkE2WOfpb89JnY3uKf35I9bfQo6qVj0x5wO2XvyIgm2dvH
 AKnJK8HLP4xWKm9y3JrxSd/cgfcJkTkuxykndPl3gyI7OtMoBKiToLhYg4qffwtkIIeY
 2JiGKqXEbqq716VXKmSiBRLwR5oj84pVxqc4o2BwHI2pXacGOGnlKIAXdZ2qUsj1Mdgk
 VFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z75EGj4CNGTU3HtUoe8PTzeS4bhGOlSVRpDZyhuG0Pw=;
 b=Ujix6RwvVACGyif7I1CzbJfMWTR3u4ZzVCE9vBy4m0xiXP1bZ1K8eA1KdhxReo96CN
 n6/UFEl84goT3l/sk5+U2UdkxxSQ1EsybPQdU+B7zaUFNsDeqlKe8br2+ZHG1atMtfeM
 ZB8NGYi0kUljyHD5fiXjINrRJXK8OpyQdoRYiSw4zNEj3Jmc9EN+RSsj53xiq+n76B/y
 N8upiy/6In6wsRrE8MiVfKqgK1v33/Goy+plrlUaledI7w1sSr4ZTV1eSmDdprCXcJ9N
 Twkkstg8WdYTs2jKUO/nitBRRYK3snsrkhD6S9O2ViCpEbAzGIYhK/955BRYOJmAQi4T
 ae8A==
X-Gm-Message-State: AOAM530/BHJKBJN3Ny+HU58fm8t7f0IjZ09Dr9D3ylleFsESIs0PL4tv
 WGUvcVcVgwaL6cx1ZwIzTiNydrALNQacnQ==
X-Google-Smtp-Source: ABdhPJxrjlyp0myuXSTgxTd0L30yD66w98raQUdUvrK6LYraURscKvyzP8E6eho/U7eS6BLto5ZVVA==
X-Received: by 2002:a17:902:f643:b0:14d:7b8f:14b3 with SMTP id
 m3-20020a170902f64300b0014d7b8f14b3mr38114402plg.19.1646341199788; 
 Thu, 03 Mar 2022 12:59:59 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] tcg/i386: Use tcg_can_emit_vec_op in expand_vec_cmp_noinv
Date: Thu,  3 Mar 2022 10:59:22 -1000
Message-Id: <20220303205944.469445-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The condition for UMIN/UMAX availability is about to change;
use the canonical version.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 89497b2b45..6a53f378cc 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3620,28 +3620,28 @@ static bool expand_vec_cmp_noinv(TCGType type, unsigned vece, TCGv_vec v0,
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


