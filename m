Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9364A607
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:35:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mhJ-0003Cr-Ni; Mon, 12 Dec 2022 12:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4mhH-0003CP-Uv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:34:35 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4mhG-0005tn-7S
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670866469; bh=5YFM20v6DzpqIRAHt/qL9cI5Ml3SHGz65BhEgBhfTyw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=CurWGrHbSi+Lu0cvdhXrCU8VCJcRcSRG/UOl0DhAMjj2989tXIWsxfqgV2y5XaG59
 ZdL3feur55S3clc4CCJ3Vu1T3l544lbzU4Ci4R1hcN616X9mZ91wNkE0dMorLc+8l2
 81YDVTlGk0e+jh16zuqC1MP4b3qUmHcFuLAnG6QKZ8jq4jq2ZGXxvmFSBvEBsMw4sF
 zpzqtep5zt0dC0EVAgJ1aj8UvcpsuvgueXBKbDqvH3lAY577DqKknNnKPFm/t5MGsu
 0aEtW9nxSKMuIMY0YpeFRUZ03IAakQLYSRZCCc7tLkvgVXsdiaNfwxjB3LvMI5j/XI
 VgFlKvbXyfYvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.137.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1pHesv3dS5-00MKmv; Mon, 12
 Dec 2022 18:34:28 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] linux-user: Implement SOL_ALG encryption support
Date: Mon, 12 Dec 2022 18:34:15 +0100
Message-Id: <20221212173416.90590-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qHQeIbpFohxS87vlF437ePmf2RsAn3XrsoOzP/CXeirD4TQq7dH
 bcYWEGxv6giFixBD9xyecirDlJXN98q+5TFDc0KyMoUo9AxgXf8iClOSC8FXlBHZUoTIqBo
 2L9cRCGg0bO5H3iuKXvfrrVdGfb8S0HJw29s3ZU+gjcoX4btnh3AS3FVCV08VixjWuEfz98
 PY1yK7ja6v8bm00Qxqr8g==
UI-OutboundReport: notjunk:1;M01:P0:dkufGFSddGc=;grirZ2YKXr1bNIwj5TxN6gmpv2L
 qh2+38JY7wDNFESJ8WGpgPtr604o377FkyPSOYVCYSVvwGyGLOaRc3pCYGJdAzIKAIl+K5i/g
 0EoR7rvLIPtBH1x1paTYgO9bXe6nOY/zoCha1teUx7aiyb2a5LlZ6eBFar/RFyFPd6uF/79us
 Ztu+08oG1/FFf4BFqa8Ghah5n531X9sotLYaU5ypoHhvLmBEwWghN7QhBHGU7GOPpn/8apVmm
 OG1MNargAZWiiLQxCvtDPzWBI+uOHlW+t8mjs7AUyEld/PVifVVs16qtXewg2IFIKPHePOFQi
 cgNZ6AIjpQ7pNc5h5Pj9jrze9LkZMRyrv5WwvMhbtGKHytfiU6iOheYn04wvdUhIV95CKx2Zs
 d8xcCkJbhEAmWpII5uMFRRb5Byk5cwbR0ZasbI66oXQomakdzcv+B2YehuPXPXuEc1xqbE0Kp
 njChF+GU9n0FptvuUGKUkaP5SK/6z14FDl9JUEUboYAYh6/AhDBI/YsHc04o9NPbQgNaBPq6F
 83V1g/HA8iBaPwrsXWkJOTwAqY2ZQY7RkPXHLC+6WEdH4MHKHM956OFvVhukRK7uDrMTxt1tE
 dh8aTYBu3aadOYIUXTVdTYy4B0QAwc5/z3kLJikQILMjFyMESSsT4fqWcMkuFfApur0EsY6/7
 hyIEh3LJO+/f+wtJIWuLXZxG0WLucOJFrKuuLc0xwq+4tn5RC3WeR8Dap7TSZjXovXAuQoyzm
 jIDwK+cIQoE7b87ceNe0y/mUgsiO5j8J8VGS60fEuQtKqIXUguV5AK4UE5gloPQJ0gAfA7J6P
 hAefJfpUYbdW+hvTOwUY+R6G1BnhJBIgjFdatLEDBIYcATy4dj38M+jV95ZIyrugpS3ISmwT9
 gSyD2/825Ap7ZTc1gJK8y3W/WdwCrwOY9GqHgvIuFxiwDAClocMncCrkOPhX0nU3fW2WmbI4v
 13SmIbfQ+PDz+6iC7/WyFShr5ck=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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

Add suport to handle SOL_ALG packets via sendmsg() and recvmsg().
This allows emulated userspace to use encryption functionality.

Tested with the debian ell package with hppa guest on x86_64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/syscall.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 71ae867024..a365903a3a 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1871,6 +1871,14 @@ static inline abi_long target_to_host_cmsg(struct m=
sghdr *msgh,
             __get_user(cred->pid, &target_cred->pid);
             __get_user(cred->uid, &target_cred->uid);
             __get_user(cred->gid, &target_cred->gid);
+        } else if (cmsg->cmsg_level =3D=3D SOL_ALG) {
+            uint32_t *dst =3D (uint32_t *)data;
+
+            memcpy(dst, target_data, len);
+            /* fix endianess of first 32-bit word */
+            if (len >=3D sizeof(uint32_t)) {
+                *dst =3D tswap32(*dst);
+            }
         } else {
             qemu_log_mask(LOG_UNIMP, "Unsupported ancillary data: %d/%d\n=
",
                           cmsg->cmsg_level, cmsg->cmsg_type);
=2D-
2.38.1


