Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF275BBFB5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:59:32 +0200 (CEST)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0Rv-0001e3-T2
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Es-00071Y-Ra
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.20]:49853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ep-0007an-QH
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530357;
 bh=wsABdtA7mc4o7G8R1N8b0kDQgcZ9Rz4G69v+vaVuQF4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D/lbBf9TqkJX4O05h11mFXLWfLlNyA3YIV0YGpYY7ntmWz3EO9H8Vpo9M0hY08+Pz
 0+/9DfXun0J1+2cmxXx+2GpIv7iRDBpYAWPadstcy8E3uipNpiI20zN60uugvklWq1
 1e1Cv7FHLilHIJ880sl5StN97BJb6B136C6JT1xU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1p4L6F1lSs-00n72r; Sun, 18
 Sep 2022 21:45:57 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 07/12] linux-user: Fix strace of chmod() if mode == 0
Date: Sun, 18 Sep 2022 21:45:50 +0200
Message-Id: <20220918194555.83535-8-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1JIt/RjapBNvEonUshqOhDwTJJ6KBRSajqVyfH8H1hD/+GJEJx0
 y+mGEjYskaG1pUWL/dpVY6E6CGFcigzNjwuLlRWmE5CfWNQTZv89DcspdDtfORU84s20hV1
 Nh7fk/68IfCPd6xBwwwVEN+g4Br5eh36Eoixldl+4oF6bsFu/BWOrJDqmt8ojoR7jh0Fa5K
 uyqoAbhgobd6Bu9GBF3nw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H+ex7jpOijU=:GqGcFYZu0iNygHvktBkDYJ
 FzKfbF8uxSmBN344f0jxWB9itc0CTKjTY9kS3EUEgiNsFmh68own1Y77ZpLGYqg/2MoWdZcsd
 Y/ep9UtX/zrbOd+Z54rLkZ3V6nrv7MtvPUYLPB2x7Sd1F+7O0L1z99ZjYZorIMG1QHde6D4CJ
 Iu08kNoDalhre5n2X8jnjkFR4zjCHcWldVBdAjYxu3c4j0MgvTknJhyudiRz3HT64wKB/qn3t
 C4jLqo4hjFvrYUMB8uD85DjrFbcWXor/Klxh2t7h2mm4JmHQmDr8C/ErbKgQIhO5JdS6Z+IEO
 Q3rqhQ0eAYBmod+wKR8b3f8paUuV2QJGw0I3Qc2Vos5NzSiesx23olLbPDqgzjbHTdyjUSUJp
 Kc6B3srKzCYXMeIwaQR+ApfucNal+64W/WvxIYUc2IeosuiK90Xfc9J1Mgq7KWebGoNonSSa0
 hciOK+Cu7Cu40ruH+NhH+pSiksDyw+ga1Gt5XyIrBRdvIGrcnPmwlg16qF+0Tk+P2CWH0NCjX
 mOgGGWl6MUTfj6wFB+fX9cmYm7X5Gf3wo1stwG7nXTKBq0FiZXrbyEaczM3u9kdqFR0dDENsV
 ve1oKSlA0GP9hI7ejIXMIGmKl8r3SymAZa1X3CC8HRPm/mLV5I/o8wAp0XtSHcbzGFiPuQxsB
 jZXhxXSdTij78uB2DNzz/i5y4/ileyZ3CrQnQNW2CE0K9lgz5Lv9NLNFQ5zJg/wJaO4QLttbr
 ReGYwQEBZHmGKlKfIORPCCHOF82H+Py7KHX/vjLIM1dPWyybpTXl1320XPBmPtuHJpCiWCWUF
 QwGQBs0aR7N+G/Q5gev0blDxRpIozIsIOPOvxJJr9QEsBpjMh1cf+hf5xhSrd9yRV+mtNqxlz
 XwIvEJESJ+k5iPvs4EMutPz0GvVcX15y9PV3nx4HeBM0wLmJuu9utVAruxeFopTsq/f57iurr
 /z/8e3nng8s8mvKLAEmMKEOeIit3XBLduG8Js+vmREm+MU8cbG67oMhu7myYpaEOdDRKqv8Bj
 AzNjDmmGrT0oxqzKTfuIpsHVO5TTveB/ymOMvQrYedjo9ntPz2IbZOyjilLFyZI5fbJx07nNU
 5M9Il1SE4hGw85YC9PFNnQCi4CgW1ruHQsfGkCjZjkdv7kAbABNzWIAh/60Hb3nSIerNcm/zn
 rVEOeGCTM+/9g1vivLupUq5Knn
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
2.37.3


