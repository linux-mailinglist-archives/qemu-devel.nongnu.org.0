Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9653088CE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:04:25 +0100 (CET)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SVk-0005KB-Ka
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnN-0004Vq-VJ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:33 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnM-0005zq-Dc
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:33 -0500
Received: by mail-ej1-x634.google.com with SMTP id g3so12439602ejb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+G+BDRQ2Y2nPV4bMRufOluSE675gO6hBAOJ+JNH5TA=;
 b=THphlfmEEtL/9SmHP3w9VZGafr6sCiqRj52ZNjWDcz2847KNC76LxWE2i2PKQ+sND4
 bthzPZhuhjANlwE0Zb5By6o0POLRr4US61bTclL3oy5pIru4Y/xbazKSeXWcF7HL0pBe
 i4k0VHTfUfiVsaXp9tdBnW4H4jHFtfDczRhM++Wt8adt1W1kR9lVVr33wsMWouO0Wv6A
 fvZ7CqXi6XxAz3PBr3Vzz1uBNo3gOXNsEcIkwe9jptMnW3a8w0b/ZTdm98652rnLLKPT
 CjBD6QFbeDuSopSU9fFxYc7dAvjECtHWKObKOOLs2laroOJWm8snCI+jWcalvU2Snr+5
 F1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d+G+BDRQ2Y2nPV4bMRufOluSE675gO6hBAOJ+JNH5TA=;
 b=j0i5wCevVvZwmyiif1othOomBR+ufI6wH3mJ629O2NkRaZzcLI6TMDRZTBd6o1MVQM
 NNGitshXolEaFOydEUIhP2dqsMuvdOc/5UyxHBWBoYwaQOh0gBF6sFYAwycSrW59Jo3k
 fw1jkgt0BC3QcsK6N9OxyqY7c/06fQWJ5dMOVmmhFpqowKzMgTUElePDpB8gFyfNJoIH
 DZouI03zBF3JU0QcrN4lJ/A9D6xPn96d99bEZ4zrnR2cPhPWHmTRLaHuSBvnh4aYJ6ks
 2eVIzJ/EmW5HQdeiPkPoVeu67HZ2Kgu2yqYGIyCqZPyRy++6wHO6G30K2XAx7yYR0yvG
 9/zA==
X-Gm-Message-State: AOAM530dGXnKLXv5Gey43Ctj+yUlPgbtQs19FoievPZyPf/7SLlw4WHP
 CBOfydM8oa7PKDNO9zkqnr91x3iQneLjGg==
X-Google-Smtp-Source: ABdhPJxkMT6fqtJX0WwMCQe3mGsTPnUvdSL0D0rm9zS6K72ItDMHGrwFs2dDhYht30+ehJsU8yYrFA==
X-Received: by 2002:a17:906:fa9a:: with SMTP id
 lt26mr4082773ejb.439.1611919111093; 
 Fri, 29 Jan 2021 03:18:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/36] target/i386: Fix decoding of certain BMI instructions
Date: Fri, 29 Jan 2021 12:17:55 +0100
Message-Id: <20210129111814.566629-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



