Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A74B83B8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:11:59 +0100 (CET)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGLu-0007rd-Jl
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:11:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1nKDz2-0000ax-4v
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:40:17 -0500
Received: from home.keithp.com ([63.227.221.253]:53226 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1nKDyz-0000CT-K8
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:40:11 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 4629F3F3208D;
 Tue, 15 Feb 2022 22:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1644993604; bh=pflxpiPe4qdORwoSxhqmwc6wZlpKKOcj5j3UB3b8hok=;
 h=From:To:Cc:Subject:Date:From;
 b=vrvczwuE8LTdC5K044YJYzIzgfJUuzgcojrkyclPmndYoXixFkzsK9IXBAeG6F3od
 r32Ol2/VKqvDRl9oSKc/UIoswzIuAIFWjrXBm7Znz+JFLprGQWx+laKmBX++fV4Djp
 VFsnO6Q69fZtJjzr0+jRAiAsoWO/MQOnQDCACAimaNZlyI/CO4a5E2YjKLzZeC0SMJ
 39zxJ6gEg2aM9c6ftIgj/FyAwj+stlhpJajpmYu3f/6oNNY/L6U11hsioJ2axKwkqh
 LNjckxS69yWSNX3GLE0iQabpAtKKPb1aBHLiYitPFNFZ+pcRvzUjrKKsfUvvZfdDn0
 uPocpJ3gGqrVA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id guE2AbpBd1Lv; Tue, 15 Feb 2022 22:40:03 -0800 (PST)
Received: from keithp.com (koto.keithp.com [192.168.11.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id BBDC43F3208B;
 Tue, 15 Feb 2022 22:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1644993603; bh=pflxpiPe4qdORwoSxhqmwc6wZlpKKOcj5j3UB3b8hok=;
 h=From:To:Cc:Subject:Date:From;
 b=MTid/KUeoPXtVbIUjGjbEtqDZ2/WqrF+kgUfBmWu2IXky3/eYtgBwP8TT00hYUSLW
 q7WC0lqwfokSCxJTPzFdwSLs9E99rQZPvUAjSPU4IR1ZXK0suYjSNcsrP6oQ+ufaAB
 eMveHanwuyKCSwMmCwyHbrgIV8Zohf8AxP85PcbBxlIglSZfTHgKWGumOk5Ptb29Pz
 C62hQJsz0ArVcm1VO+NfTjvihGmNcrKQ/PgEQ4lhWYkA9k3TsyuAwoIlB7DDzcwRX/
 NlV07XcUUEw9eeJPFKRo1xroZ2fQ+TFL2/Tsz2RaBZ2HTB4EHxd3kaC/wxFaxQ8kXG
 qvH5UbcFijCqw==
Received: by keithp.com (Postfix, from userid 1000)
 id 94FEE1E60073; Tue, 15 Feb 2022 22:40:03 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH] tcg: Add 'signed' bit to typecodes
Date: Tue, 15 Feb 2022 22:39:45 -0800
Message-Id: <20220216063945.1986257-1-keithp@keithp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Keith Packard <keithp@keithp.com>
From:  Keith Packard via <qemu-devel@nongnu.org>

Commit 7319d83a (tcg: Combine dh_is_64bit and dh_is_signed to
dh_typecode) converted the tcg type system to a 3-bit field from two
separate 1-bit fields. This subtly lost the 'signed' information from
the types as it uses the dh_alias macro to reduce the types down to
basic machine types. However, the dh_alias macro also discards sign
information, aliasing 's32' to 'i32'.

I considered two solutions; switching away from using dh_alias and
expressing typecode values for all types or staying with dh_alias and
re-inserting the sign information. The latter approach turns out a bit
cleaner as it doesn't require dealing with machine-dependent types
like 'tl'.

I re-inserted the dh_is_signed macro with its values and 'or' in that
bit to the unsigned typecode.

This bug was detected when running the 'arm' emulator on an s390
system. The s390 uses TCG_TARGET_EXTEND_ARGS which triggers code
in tcg_gen_callN to extend 32 bit values to 64 bits; the incorrect
sign data in the typemask for each argument caused the values to be
extended as unsigned values.

This simple program exhibits the problem:

	static volatile int num = -9;
	static volatile int den = -5;

	int
	main(void)
	{
		int quo = num / den;
		printf("num %d den %d quo %d\n", num, den, quo);
		exit(0);
	}

When run on the broken qemu, this results in:

	num -9 den -5 quo 0

The correct result is:

	num -9 den -5 quo 1

This issue was originally discovered when running snek on s390x under
qemu 6.2:

	https://github.com/keith-packard/snek/issues/58

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 include/exec/helper-head.h | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index b974eb394a..eb1066f939 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -85,14 +85,33 @@
 #define dh_retvar_ptr tcgv_ptr_temp(retval)
 #define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
 
+#define dh_is_signed_void 0
+#define dh_is_signed_noreturn 0
+#define dh_is_signed_i32 0
+#define dh_is_signed_s32 1
+#define dh_is_signed_i64 0
+#define dh_is_signed_s64 1
+#define dh_is_signed_f16 0
+#define dh_is_signed_f32 0
+#define dh_is_signed_f64 0
+#define dh_is_signed_tl  0
+#define dh_is_signed_int 1
+/*
+ * ??? This is highly specific to the host cpu.  There are even special
+ * extension instructions that may be required, e.g. ia64's addp4.  But
+ * for now we don't support any 64-bit targets with 32-bit pointers.
+ */
+#define dh_is_signed_ptr 0
+#define dh_is_signed_cptr dh_is_signed_ptr
+#define dh_is_signed_env dh_is_signed_ptr
+#define dh_is_signed(t) dh_is_signed_##t
+
 #define dh_typecode_void 0
 #define dh_typecode_noreturn 0
 #define dh_typecode_i32 2
-#define dh_typecode_s32 3
 #define dh_typecode_i64 4
-#define dh_typecode_s64 5
 #define dh_typecode_ptr 6
-#define dh_typecode(t) glue(dh_typecode_, dh_alias(t))
+#define dh_typecode(t) (glue(dh_typecode_, dh_alias(t)) | dh_is_signed(t))
 
 #define dh_callflag_i32  0
 #define dh_callflag_s32  0
-- 
2.34.1


