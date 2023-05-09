Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D966FC8F3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:27:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOIw-00024v-3t; Tue, 09 May 2023 10:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwOIp-00024B-HK
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwOIm-0005VW-SA
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683642412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DU4Qzxhp2XkuGZfqX/6z51krYVRKY7+fuJh3idHBquQ=;
 b=DLQ3dwIiwaZKrVtqGJv2szqa/2MR9Rm7x42DhupTnlNPM6+PdWVk1MdfRG2CNL0RLTsYvB
 bHsWK5ln8vM4xmDdpgoz3wS9ddz9NBQIs57kKV2smZ0ysacHcAvLQ/dHqTCtKG10UN42Sc
 ljhFH7ZwWNrJHnXUu2HZ5x/SjkwNDsc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-62fGGqO7Pjaddmu8ibWfSQ-1; Tue, 09 May 2023 10:26:46 -0400
X-MC-Unique: 62fGGqO7Pjaddmu8ibWfSQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-969c36898d4so129495666b.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642401; x=1686234401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DU4Qzxhp2XkuGZfqX/6z51krYVRKY7+fuJh3idHBquQ=;
 b=WqEvK/jrQZhLhylSgVSTwoVMarDc7d7hhrsBpQ77Z9XCLpxzenpuQ5BzwqRJeQishE
 eyZxaFGPbQcMLwUpx/mQpce6WY8/C/8sppp8rdElesgkHwRwOMZ2ASbOd9ufbAt0npLB
 eFcddzVlYbsl2FFpT85opq22I9YYQCimND+LqAfi8lG2oB59LkvCHepOSzd7Y6UzX271
 PmpFKgZL8RGl4aUhBxoUTfJy1p07Q0jZIbER8ZoUWzXXFUSRezc1fRL2hSi+MlUhPIrb
 06fc3Vo7Bz94GqDmkHL1BaYVbD3QnZEcc5rbGOMrAp2/r1xq3OQf3ezTb3QeYAPYCIEl
 kFZA==
X-Gm-Message-State: AC+VfDxNVwHBNX0lXyqwgMAWvaNb8xpyoIuGBzHjGeC9TW3q1aUvqI4p
 roccZL6XJUM1w1ukCH4tYUVJENHLL3Ir9ztCOGgMl8BmPPFnVIdtwo/o6wkVdcNkBIyn6hUAHnL
 i4/Mi6Uaa4swWJbfTOPPJnG4CtszE2plTnDUJTaA2DaX4fX7rrB2Kz+k+Ph+waSfpvUhycl+Nm1
 w=
X-Received: by 2002:a17:907:d1e:b0:965:66dd:78f8 with SMTP id
 gn30-20020a1709070d1e00b0096566dd78f8mr14040494ejc.56.1683642400958; 
 Tue, 09 May 2023 07:26:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64gyADUF81NHJnYmFve3czfAaGZoxtjNermzRWfRwS86XtNxTqHQtcNPAzcST5y/NB2xUvDw==
X-Received: by 2002:a17:907:d1e:b0:965:66dd:78f8 with SMTP id
 gn30-20020a1709070d1e00b0096566dd78f8mr14040464ejc.56.1683642400490; 
 Tue, 09 May 2023 07:26:40 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 nr1-20020a1709068b8100b0094f1b8901e1sm1407806ejc.68.2023.05.09.07.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 07:26:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: ricky@rzhou.org,
	Gabriele Svelto <gsvelto@mozilla.com>
Subject: [PATCH] target/i386: fix operand size for VCOMI/VUCOMI instructions
Date: Tue,  9 May 2023 16:26:39 +0200
Message-Id: <20230509142639.253947-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Compared to other SSE instructions, VUCOMISx and VCOMISx are different:
the single and double precision versions are distinguished through a
prefix, however they use no-prefix and 0x66 for SS and SD respectively.
Scalar values usually are associated with 0xF2 and 0xF3.

Because of these, they incorrectly perform a 128-bit memory load instead
of a 32- or 64-bit load.  Fix this by writing a custom decoding function.

I tested that the reproducer is fixed and the test-avx output does not
change.

Reported-by: Gabriele Svelto <gsvelto@mozilla.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1637
Fixes: f8d19eec0d53 ("target/i386: reimplement 0x0f 0x28-0x2f, add AVX", 2022-10-18)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 4fdd87750bea..48fefaffdf63 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -783,6 +783,17 @@ static void decode_0F2D(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = *decode_by_prefix(s, opcodes_0F2D);
 }
 
+static void decode_VxCOMISx(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    /*
+     * VUCOMISx and VCOMISx are different and use no-prefix and 0x66 for SS and SD
+     * respectively.  Scalar values usually are associated with 0xF2 and 0xF3, for
+     * which X86_VEX_REPScalar exists, but here it has to be decoded by hand.
+     */
+    entry->s1 = entry->s2 = (s->prefix & PREFIX_DATA ? X86_SIZE_sd : X86_SIZE_ss);
+    entry->gen = (*b == 0x2E ? gen_VUCOMI : gen_VCOMI);
+}
+
 static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
@@ -871,8 +882,8 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x2B] = X86_OP_GROUP0(0F2B),
     [0x2C] = X86_OP_GROUP0(0F2C),
     [0x2D] = X86_OP_GROUP0(0F2D),
-    [0x2E] = X86_OP_ENTRY3(VUCOMI,     None,None, V,x, W,x,  vex4 p_00_66),
-    [0x2F] = X86_OP_ENTRY3(VCOMI,      None,None, V,x, W,x,  vex4 p_00_66),
+    [0x2E] = X86_OP_GROUP3(VxCOMISx,   None,None, V,x, W,x,  vex3 p_00_66), /* VUCOMISS/SD */
+    [0x2F] = X86_OP_GROUP3(VxCOMISx,   None,None, V,x, W,x,  vex3 p_00_66), /* VCOMISS/SD */
 
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
-- 
2.40.1


