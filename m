Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64264BA86
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 18:04:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58gg-0006Ca-Px; Tue, 13 Dec 2022 12:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p58gc-00066X-Ce
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 12:03:22 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p58ga-0004GZ-5A
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 12:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670950991; bh=1TZlKM654CTTP7qEgehYkfI/qQ4VQ4bX9chbuQ584uQ=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=YmRPd4BITJ4uLPNpJ5nHOCPJpyHvbNBVL97m3SXfYwBAa1a1I4yXUj60dd6JTK7OF
 ewWDQkpq3NcwShvemzlHqoAV1nKvtLR7tOXVS6RnYWlIVSAeOtnp0+HUdxLbsNX8lU
 tAcAw1LO8x0XRg0nibGOvzF5ooGj4QPXk89zGnjApzObektj2LAQZYQFvrhfPVM3Co
 BjBy13usRFbrblYdjD4KTVfM38jH8v8mV2bUT6IY6UaGcaiG1Xj2JUE3KpWsV/MnVN
 53QYrCkvFX4MWc9Jjche9dzF8p+HEsGBJgwxKaoD8+RJ3Ya0+hCIEvssD2jDy7mAHG
 FSl0f48xavjRQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.135.201]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6qC-1odTyV2ovc-00lWOE; Tue, 13
 Dec 2022 18:03:11 +0100
Date: Tue, 13 Dec 2022 18:03:09 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Vitaly Buka <vitalybuka@google.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Message-ID: <Y5iwTaydU7i66K/i@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:R6CkkXD2HdebZ9MOHzhtaPoGr4iacfrCrxPxw5VV5d/75qaGd6m
 qOAcXirG4KHNVS+m52D2o9mw6cZPHFsvAt1sn60dIRvZKJ67WekQRzCcQeGC3dJ45JE76ar
 N7HTYj7vBDgfyn0sny1pNp2c8b1bHzjH9fUI5Ovj+NxqExSPJLP+1Tf1ChhqfG3kbO+mzU2
 1A78C4QlShcMvaP0myF0w==
UI-OutboundReport: notjunk:1;M01:P0:i+e5qWM2TAo=;tS7vfALVdy+Dya7828TVpiXMBb4
 hN/bGrajiSJ3OJxUtnWtuDz9UroU89ziraPd4AkYFBUU/hEaGOvWN3sRgfVC8U+5QXjvx156E
 ttznq0434io+EBtYwct/rDJKSFuF7YRZ8cE1qI57KPHr7CxZSSFWwy8Oe5cmDq8XEj7S5yAp+
 NKmtSlvcM7Zr7rTiLHQDv5VuvtWgTFyAIAqcHDxsOmfTmt7zdf/uJ9wKZZl6iJOroLxQLtp3Y
 Ta/4F2s1TtHT15qT0+yFouDLZVlGOVJNn8DbtU/R9u0AbQYScBSuu3Yp9sjVzQXscdzI67VN6
 Wz82zRVvqcPChEpLNsCnXdZOPCdkC7/i4tri3LP4Xx3zpQtDOvdHcbyvwWaAes3ylNVhl3Ifp
 BG/CYpwaOaR4hujXzdXQRODycIW9pvz69KwH6ked9Nq6my7n18VqL0AxIhAsgkXjiQDRkaSFL
 4e6Ih5vf9tDyysK+CbfrAHue5wXjVSNEUf/stbJzaDBS9Mpi3MH2jB/KrZneMMorJbqRedMgw
 g0OZXGfl3O7ApY0h+WyLTBRX9dR6nOLSeOv6ZpuBkgCvZJOS/4tlmOovw+VA4jHKf2r3a6o90
 jKaI5hs1SCHjIwgNvpWmfgQzT+3pDRcgXKQ7HO99vDIGrhljOBPVdnZ6Xz4axZ5GFCIAsjQMj
 IaCTMOBQgLIgTeL5c/6kmsa39D8i92k74L8t14G8DhbMbhwa++Nv5hewHZMViMHC0ibFHJHt+
 g5aNu0BwFwEOiGO6osRi8ChnphD0wHV7W+p6GH0TyRt/+jSzx6bPzpO1hQ5POVcMPCmM7CxIU
 FW2XQnRJjBvctsDHN3Wu7bK4X6mFS0LiEsD/ggqXYxEb9PdfNvgvMM5jXhJhgCxm02+vNu+sO
 SEppXfvsMwoutL9wQlbvBUFvaNk1rmZO3qJnx8xMfY3oVOci2SkaYvXKsrl8phThalGuEb9n/
 RqVYyg==
Content-Transfer-Encoding: quoted-printable
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

Both parameters have a different value on the parisc platform, so first
translate the target value into a host value for usage in the native
madvise() syscall.

Those parameters are often used by security sensitive applications (e.g.
tor browser, boringssl, ...) which expect the call to return a proper
return code on failure, so return -EINVAL if qemu fails to forward the
syscall to the host OS.

While touching this code, enhance the comments about MADV_DONTNEED.

Tested with testcase of tor browser when running hppa-linux guest on
x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--
v2: based on feedback from Ilya Leoshkevich <iii@linux.ibm.com>
- rename can_passthrough_madv_dontneed() to can_passthrough_madvise()
- rephrase the comment about MADV_DONTNEED

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 10f5079331..28135c9e6a 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -857,7 +857,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong o=
ld_size,
     return new_addr;
 }

-static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
+static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
 {
     ulong addr;

@@ -901,23 +901,53 @@ abi_long target_madvise(abi_ulong start, abi_ulong l=
en_in, int advice)
         return -TARGET_EINVAL;
     }

+    /* Translate for some architectures which have different MADV_xxx val=
ues */
+    switch (advice) {
+    case TARGET_MADV_DONTNEED:      /* alpha */
+        advice =3D MADV_DONTNEED;
+        break;
+    case TARGET_MADV_WIPEONFORK:    /* parisc */
+        advice =3D MADV_WIPEONFORK;
+        break;
+    case TARGET_MADV_KEEPONFORK:    /* parisc */
+        advice =3D MADV_KEEPONFORK;
+        break;
+    /* we do not care about the other MADV_xxx values yet */
+    }
+
     /*
-     * A straight passthrough may not be safe because qemu sometimes turn=
s
-     * private file-backed mappings into anonymous mappings.
+     * Most advice values are hints, so ignoring and returning success is=
 ok.
+     *
+     * However, some advice values such as MADV_DONTNEED, MADV_WIPEONFORK=
 and
+     * MADV_KEEPONFORK are not hints and need to be emulated.
      *
-     * This is a hint, so ignoring and returning success is ok.
+     * A straight passthrough for those may not be safe because qemu some=
times
+     * turns private file-backed mappings into anonymous mappings.
+     * can_passthrough_madvise() helps to check if a passthrough is possi=
ble by
+     * comparing mappings that are known to have the same semantics in th=
e host
+     * and the guest. In this case passthrough is safe.
      *
-     * This breaks MADV_DONTNEED, completely implementing which is quite
-     * complicated. However, there is one low-hanging fruit: mappings tha=
t are
-     * known to have the same semantics in the host and the guest. In thi=
s case
-     * passthrough is safe, so do it.
+     * We pass through MADV_WIPEONFORK and MADV_KEEPONFORK if possible an=
d
+     * return failure if not.
+     *
+     * MADV_DONTNEED is passed through as well, if possible.
+     * If passthrough isn't possible, we nevertheless (wrongly!) return
+     * success, which is broken but some userspace programs fail to work
+     * otherwise. Completely implementing such emulation is quite complic=
ated
+     * though.
      */
     mmap_lock();
-    if (advice =3D=3D TARGET_MADV_DONTNEED &&
-        can_passthrough_madv_dontneed(start, end)) {
-        ret =3D get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED=
));
-        if (ret =3D=3D 0) {
-            page_reset_target_data(start, start + len);
+    switch (advice) {
+    case MADV_WIPEONFORK:
+    case MADV_KEEPONFORK:
+        ret =3D -EINVAL;
+        /* fall through */
+    case MADV_DONTNEED:
+        if (can_passthrough_madvise(start, end)) {
+            ret =3D get_errno(madvise(g2h_untagged(start), len, advice));
+            if ((advice =3D=3D MADV_DONTNEED) && (ret =3D=3D 0)) {
+                page_reset_target_data(start, start + len);
+            }
         }
     }
     mmap_unlock();

