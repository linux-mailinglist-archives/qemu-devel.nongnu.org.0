Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0595BF0DE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:11:11 +0200 (CEST)
Received: from localhost ([::1]:45986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamOU-0003gJ-PR
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6H-00043R-70
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:01 -0400
Received: from mout.gmx.net ([212.227.17.21]:37997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003IG-Ld
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695114;
 bh=wsABdtA7mc4o7G8R1N8b0kDQgcZ9Rz4G69v+vaVuQF4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=I3JJVu7SPQwzWSOTsyEf69tvtMYohOXeFEED4bl8qIK+EeEB6h9UuFgZEmFpnpW/e
 OJXItSzZoagV7997WWyISKTozRoTp4H9KX3FLBuubgFoCdwoRqI2nnJmNqiM5Fi65q
 H47BV7Om9BIBND0ZIBjg4XcVI2MQu3tzf2qnDNJw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79u8-1pLjK213nQ-017WFF; Tue, 20
 Sep 2022 19:31:54 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 07/12] linux-user: Fix strace of chmod() if mode == 0
Date: Tue, 20 Sep 2022 19:31:47 +0200
Message-Id: <20220920173152.199359-8-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Uul6eBxuNzx317xURXEhC0HUoI8yOrmI9hsVPopOpde2imrApid
 aMkggwEhn+yWdK69iVf5ji8aOQn29vU8l2HTO8/spIbclEBQZCB64GzBNrH3EnELtzvcNw5
 Q8JHJEu+orwfkoICNqSNlhMy46AUbnBejh7srDiUWQ6CVAW2wDlMWyAhj9aWtcVXMg9VfUa
 /wOjz4VuURzaXVk/1lL7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VLJCGPVqvK4=:AtWZajVpwe9/NQoq2f7DB+
 6iNsI9S1tTW3kqDSZ1EUkX4vOKzaMfSXhiltAm3dRsnT+LVrtmgBwbAxXC8ChN3aCu5SMTsAJ
 p1YNFMoewocouEEJEyG/RCsQz7Q7oJVh1qW66r58cg1mO6FmcT3TRlYkKkAGYHBb+1VJMGqe+
 zgduXGzcdxy0uV40rGrs9FaDFdbjNdFUdDSSsLzeix3nxE6FOJR/FQKbT3QDR0tq7UGTWoYdC
 PzPazav6+c/yHYL7ryinipAy2T28t11w1nrSX9MpWGyRLYaRwrn/ynFTqWdmRb9yqmJkHhujN
 FvD1vpK1DZ7c3RAP9LpR0fL/LcaK1GyOR9QlP0jQa/2rCLvZIBYGjekwaapoQdXYjIc7jNSxx
 Doxk+C44W8jRuM5zRT5PtowAFUvwerfMKdL65q2x5UtzCR83+Q/pd7EYpJEugMKGb8vWNL0Rr
 kKekPqtXfIdAU15hsVPLe6PsYumgS1b6m6GqT7JK3gwhuwuSL97Lz89aeqpETQujjh1xzNMMd
 NjTcx1gMEkpTceHdu6ltZLY0HbTk3O6OPy62D8htvH35LTgzWHvbDjAdEO2HCwxiNaEb19NMp
 GwHxz/4uH4v1vx4emmCy8gVQ//kDuxohZHrfBAuXctxtoHo5NsM/3SEy08+M+uH2o0D2KqhtX
 XvV7Fs7W1L7Y+GXiX+Uunqgh8aCqQmsruL+Z45oL7XqY8d2ZPSsVmhVJW3WIq2o68816ZGhFb
 Jtx6KS15J0HfD5BdShbPGRtjmckhPqZyDC5MGh2twu3MUUgDMt+XFqGIYBjCTXOD5a1qcqsM2
 Kg/azDZT8sKkJwcmEG5PR12rCfwSE2Sx5hySK6S+O7HUjLbc1RXsvcJwvkcczVM8yuC41XE/Y
 SbbnrUJp6GVDZGIvs/L2F9T8j26VzY49aTQZg/0C3eEKQTZe3af4VUiSL2sjppAUTryydqpQ8
 xWy/ksseuhg+9Qfj6UZFdvnZX6gs0S8BsQEtbxB7//8mFxbkYeqee2XHHeLoQ+BjK+YzYY58b
 +e8DZewC4IdAyV5aHXfCSnGlD8kAsvFukFgXohc9Kco9fbXfuGhyKd7VJf3E4LZGyYjW8MhmQ
 tq+LsuFqOx/WXow0OlF2M/9IYTEQweF1z9MXUC4c3CeNBZRekeFUWsmHk/2cnUgaRiNAapTAr
 PHuLA=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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


