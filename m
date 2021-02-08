Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B231429B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:11:20 +0100 (CET)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EkZ-0000oy-IQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCS-0003FI-Eg
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:52 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCQ-00069e-Pv
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:52 -0500
Received: by mail-wr1-x430.google.com with SMTP id g10so18424754wrx.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+G+BDRQ2Y2nPV4bMRufOluSE675gO6hBAOJ+JNH5TA=;
 b=vdjF7qpygnoL40iXRnQwfWmFIwdBBhqO+VgN6mqECtLR6sTAGeU387AflJ71LjV3iy
 UKiW7z8V25Fw2qB6UPwMTgeKHVFgex3Q5AAm7Pb/4fan4CLbiyHXbyS/ybYPSxi1KDZ9
 6o05o+25Oi+j7HgVRjNl//l1NDvPrV5PwL/39fVfKaJIt+MSt32NlL6beOfAIFlvH/Lx
 MMj6Orkid69+3bvcfVh07ayD5xHQI31uv7l8do3Upk/tgSFPe4JKsnC6+xTKgjHOCyq1
 VzrVu45nJ+xow+ge0ZduNSKloyHfSYvK9YqFSAb6FkBd1gKWBF3pRxusOtxcIPWYgMl8
 FLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d+G+BDRQ2Y2nPV4bMRufOluSE675gO6hBAOJ+JNH5TA=;
 b=SnLThniOh8yOMC3NpmdtfN5jzCEts/ERLahSfdjWpcXvfHkIt/EB50Sb/4KI46W96V
 /YpOW3CxXFs7BFpuBK8nOwBBwWnqWaE6f3TTGiy0/vNCn5OHvS3b8kg8FvIhP5c3dYB9
 MOp+eVVZeRNA1BVGESbUmMId2w26XJKtJdBs2XVd+rw3H73k0MK55SXjdE4XucCGnQH8
 q6a2TADQ/wf369c71n+H5R5iusS7S3O1UMKrwF+dzfk0DmGq4bBpnoqvsqwZNbkXD3D/
 0ewOK7HEg6UnZnBDAIVEn3T4kYnyyku6oxdsua8KD+If++lk/Pg9MLtOzXYCy9BrM6K0
 nE/Q==
X-Gm-Message-State: AOAM532xne+O8FY8UDWfB707lFdMDhZ8MUk2Y8VhEDCH/nTyqsuD8x8B
 GUiRhK85c9BbHUJ6iRvDpJp9DaRtgIJtMw==
X-Google-Smtp-Source: ABdhPJwyFdvp0qUmc7KyPbVGMcO1O2iHrpqPuMI8AZd8xpqV2j0SQGWSwUmFJrpg4bAmrh5RQMJjHw==
X-Received: by 2002:adf:fd52:: with SMTP id h18mr21411786wrs.295.1612808629214; 
 Mon, 08 Feb 2021 10:23:49 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/46] target/i386: Fix decoding of certain BMI instructions
Date: Mon,  8 Feb 2021 19:23:02 +0100
Message-Id: <20210208182331.58897-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Greenaway <dgreenaway@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Greenaway <dgreenaway@google.com>

This patch fixes a translation bug for a subset of x86 BMI instructions
such as the following:

   c4 e2 f9 f7 c0                shlxq   %rax, %rax, %rax

Currently, these incorrectly generate an undefined instruction exception
when SSE is disabled via CR4, while instructions like "shrxq" work fine.

The problem appears to be related to BMI instructions encoded using VEX
and with a mandatory prefix of "0x66" (data). Instructions with this
data prefix (such as shlxq) are currently rejected. Instructions with
other mandatory prefixes (such as shrxq) translate as expected.

This patch removes the incorrect check in "gen_sse" that causes the
exception to be generated. For the non-BMI cases, the check is
redundant: prefixes are already checked at line 3696.

Buglink: https://bugs.launchpad.net/qemu/+bug/1748296

Signed-off-by: David Greenaway <dgreenaway@google.com>
Message-Id: <20210114063958.1508050-1-dgreenaway@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6a4c31f933..af1faf9342 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3075,7 +3075,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     }
     if (is_xmm
         && !(s->flags & HF_OSFXSR_MASK)
-        && ((b != 0x38 && b != 0x3a) || (s->prefix & PREFIX_DATA))) {
+        && (b != 0x38 && b != 0x3a)) {
         goto unknown_op;
     }
     if (b == 0x0e) {
-- 
2.29.2



