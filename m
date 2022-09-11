Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050D5B509A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:33:00 +0200 (CEST)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRlL-00038E-KT
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXV-0002RR-S6
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
Received: from mout.gmx.net ([212.227.15.15]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXR-0002lR-Od
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920314;
 bh=hdJ42ybplqITg2E5Kl2mdXF9WOlHmOsWF08yplJbwKI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aZGw5lB5DesF2a7+R53Z/jNbzuls9MUqa3RuQhDi3q4fO6K9DYVjvV+fH2TDPPO2Q
 xuiDx1y0HYwmRIjgFM3slqqOg0STz9pZ2eRQF9EqOwfpFxE8Q0ui+MSjQSoYP4jJjF
 R60jG+XVoCfV7KKkNn5ZQi+vi/0webTzGaWvlmpY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRRZ-1or1dp1czb-00XtXa; Sun, 11
 Sep 2022 20:18:34 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/12] linux-user: Fix strace of chmod() if mode == 0
Date: Sun, 11 Sep 2022 20:18:25 +0200
Message-Id: <20220911181830.15851-8-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8772qsfz1VsEAPA1zJQdG0XHErySVdSGGoVQvf+E0NjSCSIQ6+D
 T6JVp8nv3rPaUd5GQPr0VWO3XoLwjpq/ejyTzPksOP/vm5rR64LVlRXJHWMObFfQJxR5t+m
 0ATWQfCwWRDBJ2iqhui88S5HZObaGRqYQAer7Lxtq4poNnAw5i4NqfCPpqG1XeOVHXYgrKu
 lIGXQMpJsMll1zy0MYqxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aLRe+wcNTx4=:tLborNuD6axDrL8tj4iV/2
 ypcEGGIsrPMlMrTTRdcaDT+jXkEzqj4ANsDKifPum6U8FxdI/B2OAbwcpVHoOl7+XQ7daGmM4
 4njdz4Rc9oeRR2P2ht+TzG+vMQAFgaEF/NFxtYTAqL+Rh8Ix8T9M8z/8QX2s3CKjB3SHjQR0m
 tRjEI85hvkF8C8TQEVXqSZw4XTMB8bTN1eBSh9qEnNNTDHPcx7Nly8of9Kn29NxXbxvG8UrIv
 c48QLUJfS65W5OnpzQANZ3QzR/daHaOQkoAPOc35EMM36uPvvb8wTmWhai/sQI/87TsFb3Oqt
 UqZ+wMHwKo5J4KiVsRlLARDBmBG+s82CAWJ3ec/px72zP66nP+TcJaeNkihn1mbrZlCv0vBe/
 xILo1j+acY79LBDCk6Jez6h6ZTZ41vNmE2jxPjVmGLLfcs0kdGIhqKRtx3lFkK4fwZ7G0ziTf
 atJdyOic5Q5d8EVY+l1vxY5L1CDW7FVcwZZ7sqsT4IU+odvQVLwprd7zbLR+wOyJoyr2gIenn
 uz5YoIC7eHIsxKGYA0OXj9orvSwy9ShcSV57YR4+o1qdTkHBKsiTcyJqsvbwP5VgPonr5lVRj
 VDhONDqHYyGUK2b2CkV77nDU49sEEqc3hkmYsGR8J96dY/TDVvDDM72x3nxMLhYnBxsnRYnS+
 /ci6yKuLEnuWYvYy9TyNi47/w04M0fbxvdmQPWnXm/tciL4d6p9h4SaK3DHstO52WiVdR8QAq
 u7vGKhQsWOdLfvwEmwEIYbMcHouGoVwjloFyark9VovZgDGBqMO22ZYeHV71EAGrGZjdhiNHD
 sS/SIGxsY5S3b2imNN+T2gIFDH2z2fgyh2gFAo60cTHTsuCdamt1hgG6G9ZQojWMygkroKKWk
 QJWe05vSyGXSLFoAC1F9edcoLqoDHMR3M9+7gjh3b7mpFopPPybFZ+HsfpXP0QPsMGjo+MCkb
 BvONXfy/EveOOcsVLTKsiu9wHNFO6r+fdAitD+2V15wKezSgqMd9soA+1dugAVMckEtvX4099
 7k47rEWKBsa65tGu0Bm1g/zxB1doIHMyJlKutueeA5MiPzvgJlBNmmOfgfEwz6C6uPu9wkK3p
 sL9MRhRpZX3kEZjwo3Xgek6ylc2VzuB0OZyVkYELNn6IhcqE7OsXYEVrvPlCEQufrD9/Yr2c4
 wHPs4Z9vUoruSzOMkLFp1YE7ka
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the mode parameter of chmod() is zero, this value isn't shown
when stracing a program:
    chmod("filename",)
This patch fixes it up to show the zero-value as well:
    chmod("filename",000)

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 5ac64df02b..2f539845bb 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1505,6 +1505,11 @@ print_file_mode(abi_long mode, int last)
     const char *sep =3D "";
     const struct flags *m;

+    if (mode =3D=3D 0) {
+        qemu_log("000%s", get_comma(last));
+        return;
+    }
+
     for (m =3D &mode_flags[0]; m->f_string !=3D NULL; m++) {
         if ((m->f_value & mode) =3D=3D m->f_value) {
             qemu_log("%s%s", m->f_string, sep);
=2D-
2.37.2


