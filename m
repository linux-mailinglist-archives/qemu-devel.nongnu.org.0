Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852464A606
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:35:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mhK-0003DN-Dg; Mon, 12 Dec 2022 12:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4mhH-0003CQ-W0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:34:36 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4mhG-0005u3-E2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670866472; bh=GuPxCVZcDKjDXkUI5yddoq53qjUKXs4MIQ/JW+el3nY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WqSqSwOrWWLzuc/oPc692znVxfiwJLZWjGbbDvPksiUZD83FsB7KMgBGl0ncGCh06
 dXHuGAQpj9yvN7kt8YJdAw06eJEM5xpXBkH2cV53sXv3s1RKBqu9VQc5jpKDsTBvDg
 2zDXaf1Le/pFhdogu8dzfwGO80XbKr7S4G7ymd8slTuFBGhklj2lUPh+FGOt+VmllK
 OZSYVWFhfrNgIDeypOK7LQaUpod6kWTh+W3UuJlfAUHFcfrnowatdsXK0ncZuEicXC
 L3XJnt1OLpimEaLy4Gqx2cUX728VijOYLKsVhQrDvRJTqAtRZXWmxEZn2biPI4SW1n
 1r+LOGh+WLOjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.137.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f9b-1p53wd1wkB-004EbP; Mon, 12
 Dec 2022 18:34:32 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] linux-user: Allow sendmsg() without IOV
Date: Mon, 12 Dec 2022 18:34:16 +0100
Message-Id: <20221212173416.90590-2-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212173416.90590-1-deller@gmx.de>
References: <20221212173416.90590-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SAW1mxBDLxoydLS8wO7RPxVV1dX38NY510CNAt43GoFBwJh+K0s
 xP7jJ7h63mEAktWWp5SpEATfS8awVVrPJg3OokaIDSfbhTUttqlcsthheazOxXfBmonrmaz
 Eot9rjK2H0CbVp2Qv4W9Pj57OOJwgZFFUA5OUGBFE7bc54ZGJ7ATBKYES9rq6/dPfOy8TJ6
 o2tdHlywczT09jRQfhv7w==
UI-OutboundReport: notjunk:1;M01:P0:XOgB7zVsOJM=;lAcVTT7mo/H/mTgOKUGdVWQK4Cg
 /P7IKVsK63qBHp/8CqbShfZu8GwbkOhemfi5gr+V+AFmgjvpbFoZY8MlRTfPnDiel6T7Q2MC/
 Lny789vbY0D4N0uFegy5JJB1KA65uUDEKgUsLe9xNBemuDfuJnY5+4RhUucuVjlyrqrHJh/q2
 MPMC9KtY8UAkUVaiyrGkgDq4f1cy6rMCpMf9+/EZoyVpAmFIWwEgs1Or+hU0rA0DPwyQGoHSA
 IDkYRrQA2SzDnz5rL9bGh9ngIYKMZUynlHmEabcH9Hn4p/IdCXgDZP9Nh69h5KR+jV+4DqEzY
 Ggrt5pOdH3k5Ul351/3FOHO68S2h4405I8gKBoG5sk/+tzhPIdzKWANsPBW89zbw6nGXChT+Q
 EquJ4HXkZbbGh9mVDyX3sRdz2WlA84oyqOK4jnryvXvETsluPalmj/yxKOQfH5O44eV2QGdI1
 MRSyPvuKS2hZkxY+hkYwOJ8TbPtz/Rf423Y4fXwXuE7VzRDkVRYfAw4v8BBCwGg8mQSLX8MF9
 UWSpMZWGtGvJD3aatQlKxr1Kl7MBbg9/l+WJaztRzusvI0F+GRyF72dwjaqndmQ0jGSScEZsf
 ZvMpLQCihPxG0yI8dp0jbGALrtQ7P8UF17p8MOaXtcho6ZUb4kLQZuMt/4JMUMSn0FqtmZ+hY
 fZ+DSMpQzXQD/8LFH9ilLrCiCmeNY3YhReDYcDvjctOjuT7WdkQWACH51FZFz9WTPEKLdvs4x
 +qHIeJ+AdKEcSvxHU81XIFoDOd7zHEieljZKe+S+VB6HtdhYK2ppIXlOUHarKFmEVfCKRo7da
 lu0R9QsY8Wpi7jUPQCCIykFiIFc63xQ65i9ZAujupZObuPAvlqO4XV+29HJjdlaMtSZgvn4I+
 C7+ouwnOvmvHjwaS4ag2dyEdnls8m8ypOCFyCOaVmk0AY/1FznCsrmQPzZsWbcTztU9GirMjR
 lIRYNQ==
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

Applications do call sendmsg() without any IOV, e.g.:
 sendmsg(4, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3DNULL, msg_iovlen=
=3D0,
            msg_control=3D[{cmsg_len=3D36, cmsg_level=3DSOL_ALG, cmsg_type=
=3D0x2}],
            msg_controllen=3D40, msg_flags=3D0}, MSG_MORE) =3D 0
 sendmsg(4, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3D[{iov_base=3D"The=
 quick brown fox jumps over t"..., iov_len=3D183}],
            msg_iovlen=3D1, msg_control=3D[{cmsg_len=3D20, cmsg_level=3DSO=
L_ALG, cmsg_type=3D0x3}],
            msg_controllen=3D24, msg_flags=3D0}, 0) =3D 183

The function do_sendrecvmsg_locked() is used for sndmsg() and recvmsg()
and calls lock_iovec() to lock the IOV into memory. For the first
sendmsg() above it returns NULL and thus wrongly skips the call the host
sendmsg() syscall, which will break the calling application.

Fix this issue by:
- allowing sendmsg() even with empty IOV
- skip recvmsg() if IOV is NULL
- skip both if the return code of do_sendrecvmsg_locked() !=3D 0, which
  indicates some failure like EFAULT on the IOV

Tested with the debian "ell" package with hppa guest on x86_64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/syscall.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a365903a3a..9e2c0a18fc 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3330,7 +3330,10 @@ static abi_long do_sendrecvmsg_locked(int fd, struc=
t target_msghdr *msgp,
                      target_vec, count, send);
     if (vec =3D=3D NULL) {
         ret =3D -host_to_target_errno(errno);
-        goto out2;
+        /* allow sending packet without any iov, e.g. with MSG_MORE flag =
*/
+        if (!send || ret) {
+            goto out2;
+        }
     }
     msg.msg_iovlen =3D count;
     msg.msg_iov =3D vec;
@@ -3382,7 +3385,9 @@ static abi_long do_sendrecvmsg_locked(int fd, struct=
 target_msghdr *msgp,
     }

 out:
-    unlock_iovec(vec, target_vec, count, !send);
+    if (vec) {
+        unlock_iovec(vec, target_vec, count, !send);
+    }
 out2:
     return ret;
 }
=2D-
2.38.1


