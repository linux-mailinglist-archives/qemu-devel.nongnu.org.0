Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77545512CF5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:34:45 +0200 (CEST)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyfk-0002d8-HE
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy23-00009w-5w
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:43 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy21-00055H-KK
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:42 -0400
Received: by mail-ej1-x636.google.com with SMTP id kq17so7615699ejb.4
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIc19+y8HXbEpfZV0NlYI8Ahv11lPhhftoNUYmFxI/A=;
 b=j2EfPN6uNHAgzyaKvWDOmJEqcnuC5lVZNWnlhG5EZbPhrT+J8sm/GK0jGgHqKs4URw
 WMvxgs503qXy3FSvCQ+1IA5tKcORd+7EmEQ91r+60Zv/VSpCxF/iDT+ftGOB/QmUOWGC
 sbv+PFzDk3Ki4ez5EQibp/yN8yn4bP06vP1d0fHGFVrl5bY67Tj/Ll8f0befMnQTz6z/
 bUExuRU0OU41hmcJb8bSZcEgTpba5/zoPFcMVRItw8WGjKbK3+zfHtI2wYcc/jm5GdI7
 cci++iF6xCrCG7xq2L26CweL350Nqi76USK9U0jJTHdOvkyA2QFklBnCs2oHgsPFMU8Q
 teaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AIc19+y8HXbEpfZV0NlYI8Ahv11lPhhftoNUYmFxI/A=;
 b=u+0lJSR8nu5Bfdm3dVN4nuyIG5L+6TR47MlguG4/9VU+i4ywor2sbc3cNCCRX5UoMn
 ZGtc4KqrAUZ4XTt38Asc9YCoHqBsmoADovOS4G/QvDJGTfopFSlJv8xGH6aad1ZZ3H+r
 mgovtuNb5MnRCFGV9GBsuqbq7pbXzaMoea+Q+drC5PKNUD4XlYZY2PcSibOGju9hftU7
 8VeR9exvv6XVdr2trLw2sBIy8LIUY3BE2KZK0RHjbtEo5+fob3FFfBesQP9MMzIlTEcL
 RW64K1CK3I2RGOEohmNWHR3eVScQvDzFj9YWNy/+6belt45WniRqrIiyG/PyUFA9+fLe
 VMiw==
X-Gm-Message-State: AOAM531juWWGapiF/D1bzm3Bab+p+IVmCz1QQMrBfzI9KinOgFJDnK97
 FS739f0vXPbSUAO/MlCW5jKEcCf8ZwS/BA==
X-Google-Smtp-Source: ABdhPJwNQhRgDb66fRz0MbVhAn8eXAVdcyV0v1v6Qhjcls37WFUkVDCfHJB6oQOIj+h4MG1ffdoKJg==
X-Received: by 2002:a17:907:608f:b0:6f3:891d:ccb0 with SMTP id
 ht15-20020a170907608f00b006f3891dccb0mr21113920ejc.750.1651128820214; 
 Wed, 27 Apr 2022 23:53:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] i386: pcmpestr 64-bit sign extension bug
Date: Thu, 28 Apr 2022 08:53:21 +0200
Message-Id: <20220428065335.189795-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paul Brook <paul@nowt.org>

The abs1 function in ops_sse.h only works sorrectly when the result fits
in a signed int. This is fine most of the time because we're only dealing
with byte sized values.

However pcmp_elen helper function uses abs1 to calculate the absolute value
of a cpu register. This incorrectly truncates to 32 bits, and will give
the wrong anser for the most negative value.

Fix by open coding the saturation check before taking the absolute value.

Signed-off-by: Paul Brook <paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index e4d74b814a..535440f882 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2011,25 +2011,23 @@ SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
 
 static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
 {
-    int val;
+    target_long val, limit;
 
     /* Presence of REX.W is indicated by a bit higher than 7 set */
     if (ctrl >> 8) {
-        val = abs1((int64_t)env->regs[reg]);
+        val = (target_long)env->regs[reg];
     } else {
-        val = abs1((int32_t)env->regs[reg]);
+        val = (int32_t)env->regs[reg];
     }
-
     if (ctrl & 1) {
-        if (val > 8) {
-            return 8;
-        }
+        limit = 8;
     } else {
-        if (val > 16) {
-            return 16;
-        }
+        limit = 16;
     }
-    return val;
+    if ((val > limit) || (val < -limit)) {
+        return limit;
+    }
+    return abs1(val);
 }
 
 static inline int pcmp_ilen(Reg *r, uint8_t ctrl)
-- 
2.35.1



