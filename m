Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD62E18C6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:11:50 +0100 (CET)
Received: from localhost ([::1]:42846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxNG-0000MO-1b
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDz-0008P0-1J
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:16 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDv-0000Kw-Kv
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:14 -0500
Received: by mail-pf1-x434.google.com with SMTP id c12so9757276pfo.10
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zGMNyIm+K/W3aZHsjQzBQ/qpcbywBXoHa8cbHlQEpxs=;
 b=cRFinEUEnaaOyBNCL6bIgGjkVR8WRQ57xQm6lCRFAT+xhIiWua1Em9Ne6WdAb9Ia0M
 bwz8StynpWlz2n1uxbF34pZQl3pAyqwYKJ8Nb7xKwFPWSrb8O/obHhUALos2IrNIeOE7
 bdySv01yNqXW0cKy/fUVOH9JH+a9esF7ldc0tnEibhDlHPxxJkiQKzwOIF6pDbPonpcg
 KDvqUyEYQVUBtLICrH2QhOF8U7ZPZd+0hZJMg8nOaiXqIGnBrTvDueqiDbmwbOSPQhl8
 8cels7ZtbYIAascdCcgKjy+/5vsytp/l1H8YDvUsDb/r2cPZPqLh4ANm4nFApPHZiY/d
 4THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGMNyIm+K/W3aZHsjQzBQ/qpcbywBXoHa8cbHlQEpxs=;
 b=Rm+Xs69B8JB84NCDXvb1187/UtHAQvQTgiyJ83Ww84or+f/lDfRjjQT1VfsOqMUvvs
 to4UFQqGoolfsU6xYdW9ld6q9kVHvChWFfHCCbWlyVHLBClZ34NbaDT/GA6VMVfmqz/O
 hGvZTkSJzqUbK2BfQgYNxsny0Sw3Qab1JQAmN0sOZZL6QHS634kz+LAfJjhsVSZCqLwy
 /dHMBZuBxAlKbQxdPTbSIine4IBOi+/HH+t0D412mNcTh+se8iX6g2EkQNInY3Scxynj
 zo0S5tgMGRMfEABoWB/x4YxXB2Qa7RpeWHc7LN+gS64h1LjyDG+sjU+obPYvD+knhGDQ
 cDcQ==
X-Gm-Message-State: AOAM531wFWUAdvMygGGo9Re4BnSyxD4FXuGIEQucjDivP4qw54MDORG+
 6Je+TdzVjMyjOvZAsBekbk342U9VE9KLYA==
X-Google-Smtp-Source: ABdhPJy5RHRchrX1iFOvNZ6xbCLi0jRtBgxwO6xDxPMZz1VtcYCE21Fo3hAvdYkwZR9mqA4MkKem8A==
X-Received: by 2002:a63:5d5f:: with SMTP id o31mr23444902pgm.295.1608703328421; 
 Tue, 22 Dec 2020 22:02:08 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/22] tcg/i386: Move constraint type check to
 tcg_target_const_match
Date: Tue, 22 Dec 2020 22:01:44 -0800
Message-Id: <20201223060204.576856-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than check the type when filling in the constraint,
check it when matching the constant.  This removes the only
use of the type argument to target_parse_constraint.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d8797ed398..b73873f715 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -254,13 +254,13 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
         break;
 
     case 'e':
-        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_S32);
+        ct->ct |= TCG_CT_CONST_S32;
         break;
     case 'Z':
-        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_U32);
+        ct->ct |= TCG_CT_CONST_U32;
         break;
     case 'I':
-        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_I32);
+        ct->ct |= TCG_CT_CONST_I32;
         break;
 
     default:
@@ -277,14 +277,20 @@ static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
     if (ct & TCG_CT_CONST) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
-        return 1;
-    }
-    if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
-        return 1;
-    }
-    if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
-        return 1;
+    if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
+        if (ct & (TCG_CT_CONST_S32 | TCG_CT_CONST_U32 | TCG_CT_CONST_I32)) {
+            return 1;
+        }
+    } else {
+        if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
+            return 1;
+        }
+        if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
+            return 1;
+        }
+        if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
+            return 1;
+        }
     }
     if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
         return 1;
-- 
2.25.1


