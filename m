Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559265158F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:30:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Odk-0008AP-F7; Mon, 19 Dec 2022 17:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7Odi-00089l-Q4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:29:42 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7Odh-0007EH-43
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671488976; bh=oFLv9u7tOQe+h4ZbQx3aX0DPJILTcZD6gWhdJFBFTHQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=tCjAZBR/n68zIuRYmizInelKVes3r7FDoXBuhzzo/9r6n3sFFHSeyIK2fpcrUXTJ0
 aJ7aBHoISgRQa/moivg0rEv4cnXDfcyMIXhLmb7WxUyoXvtzG9kkTUzeBrhg6JlEBl
 JCvw4+qmzdezlWYtTwmAHhUiss7yAjLP6Ym91x89wBl2kmD9uK1XJjG5cxPU7ijlgE
 /COiDCXk+v+s1MfiKWTFIjxw6FPHhFXGS4C+LhrKGWaW1XWylBzHqIO0I6iuqHSP7t
 l19RRvG45/rNUEAxgAdmtdYQOxqy7FHh61CtR4VFcdJmN7CptRVVmS1xxqmzOBizWE
 WT+FUP9Eq1EhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.151.196]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fmq-1oixuS0hkO-011xGq; Mon, 19
 Dec 2022 23:29:36 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PULL 1/2] target/hppa: Generate illegal instruction exception for
 64-bit instructions
Date: Mon, 19 Dec 2022 23:29:34 +0100
Message-Id: <20221219222935.284704-2-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219222935.284704-1-deller@gmx.de>
References: <20221219222935.284704-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ysyqZuqhbNoNUM3v1nL4Ci3gBF22o9y4BByCdQyzDTpMyKzFVe5
 O55Ud6EI4Q2mVopvim93vmtmLA12jqE97H2EoBtsNwTF5rBLgRa1xiGcN8YT6SXOwZBOvLC
 AA8swjX3kSHyWASI+Db8qjTgfGI0jlCVjBM3mdwBFgAIJPj0gLBtWodoH0pJPzsjKVQZ5zF
 oJ8VMqK7tMt/eSMobB4sA==
UI-OutboundReport: notjunk:1;M01:P0:VqBiWbZhPaE=;GrchB+KG7PRwGwp//p+JLdMCaoF
 SMJCCU292cw5zWafdL4fqRUJZ12ouALVQxcV0oSAFIpySColp0bXMZ9AcXpyUWVcrorUqXar9
 b2DCKsKNpLvYHk3U9T0EyiuIRj4WV5xuK1qz4YygFQjKDu8lKhACcW9GzHmkCHkhMlvAPc0TT
 DcvASNMEWwkIPGoin2FbbYS9Cs20fSAYtYoNcpoVHq4WeLm7sar9n6v80l79m4CusIORv7jzt
 ctUR2QFp6d/R8bHKto+FI+Ej9cRG3GeuB72CMj9tXzZb4lcK30FihOYmX9jT6JNRILoVMQFDN
 UEEQ2xOEN0y7eRPwZGpovipZ2JiygLijSDCZdtScR+AIo8BTLm7+DmlvNNIqJzMG7ge3wpvyu
 N6isW5oXG5FNC4BEZiqsxjIRTmks1//NjYAID9LUPY/lDyi6mQI1BXTI1DvSeqIl0IZR6Qemg
 z8MXF3dJK3yb9pm7uMhGmWHL096LeF1RGrLwDCFa7fjOqxjUmy3xv4T6dAqIYROB0bjgZHsg9
 SXvrWwmvNMjkFGP05x0XIPhUME6Fq9/PRvDnEAUmete4U3NOE4WyGLJRYEi0T2xjPJcZHoAzT
 QNLMFOBdJKyHv77KfBcTLfVOjnTk6MdQgT++zhdJWE1bFtC/FVeRJXF17j1w1kCd5rzLrmsMO
 Hb1EFz/32/ip0Q8OxhOYWFEN55TPeF8Iy4pNJW3hIWqu8alMt8LD5yJMZrBQTNlgWuU/2IZ6L
 7gbbtvSon8QnUF1sWN2eTRktbvGuVRvmd1RZ8k6cciVxvfPbtnz5o3uOJggxL/151myhS2wLI
 YAPAkFXHeXfB7CAfQwlbwlw2MBCr0TygdWnOBpo6LnqeIKjnTyH0q8jrOeF3+IS7oOry1Wgrr
 z0vmjcoky9FIbTHqnuw4gJwR03GrpJqe2N6c0EjqlVk6Xpx4Dl/ropDchitjOz4FzHa7bIocU
 Vs1oOKSiLVPTrXty/5ZRKPUQK7E=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Qemu currently emulates a 32-bit CPU only, and crashes with this error
when it faces a 64-bit load (e.g.  "ldd 0(r26),r0") or a 64-bit store
(e.g. "std r26,0(r26)") instruction in the guest:

ERROR:../qemu/tcg/tcg-op.c:2822:tcg_canonicalize_memop: code should not be=
 reached

Add checks for 64-bit sizes and generate an illegal instruction
exception if necessary.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
=2D--
 target/hppa/translate.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 1af77473da..d15b9e27c7 100644
=2D-- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -2899,14 +2899,22 @@ static bool trans_cmpiclr(DisasContext *ctx, arg_r=
ri_cf *a)

 static bool trans_ld(DisasContext *ctx, arg_ldst *a)
 {
-    return do_load(ctx, a->t, a->b, a->x, a->scale ? a->size : 0,
+    if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && a->size > MO_32)) {
+        return gen_illegal(ctx);
+    } else {
+        return do_load(ctx, a->t, a->b, a->x, a->scale ? a->size : 0,
                    a->disp, a->sp, a->m, a->size | MO_TE);
+    }
 }

 static bool trans_st(DisasContext *ctx, arg_ldst *a)
 {
     assert(a->x =3D=3D 0 && a->scale =3D=3D 0);
-    return do_store(ctx, a->t, a->b, a->disp, a->sp, a->m, a->size | MO_T=
E);
+    if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && a->size > MO_32)) {
+        return gen_illegal(ctx);
+    } else {
+        return do_store(ctx, a->t, a->b, a->disp, a->sp, a->m, a->size | =
MO_TE);
+    }
 }

 static bool trans_ldc(DisasContext *ctx, arg_ldst *a)
=2D-
2.38.1


