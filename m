Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5076164E937
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67gr-0005m1-00; Fri, 16 Dec 2022 05:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p67gp-0005lt-I7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:11:39 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p67gn-00034O-O5
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671185488; bh=TSPATku/KmFylPUbRdwABPXGR3hVntq3JOpCGWA0uXw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=pvCAXBclbceCZmeaP+Sh4JOFjuDH6+sDI0hdLVynkK2tkQg4A6pY2BbpwLL2i/yHi
 9LJ+8YTvnWiZl+1oXsQXxrcoXBdC9BamTwCgvI7bx9iVdlzZEwzwqCkvOsKQBoVXDN
 ipKMGbcxGwWgsdQ2tcdLo1KOHe/UVEUrdt6erxzF0KQyas2pGPLa34DhHxIw2Y4vVB
 IkpQRst3oTyxLWQq2vhqWfi8v0vAIRND4WWho8FCRTLgwvILahBV3O8ON2qlncNI/8
 RViYJd8CndPtUm8kY2aWINmOGIq/Eha2DWu53MLItoRT28qcoTaDQIF9Avn6D3iNYR
 QPwtDm/eZ8s8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.155.237]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1pQSte0tdi-00XagW; Fri, 16
 Dec 2022 11:11:28 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Fix SO_ERROR return code of getsockopt()
Date: Fri, 16 Dec 2022 11:10:35 +0100
Message-Id: <20221216101033.8352-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:szSfFFkd4yurO99P+KAJTWcDj3ZX/y6sPaAkkVixN7qwbsTxj6/
 6ZUzvnKeZgiyqf9QohK4OZkVT6m4k/oX3YjcnILNHGhUPUKnZICgyUIdcNkryHizWz7d4Fw
 fqhS93trlqQaqG2dQ9bSlgBMoaam6b7sJb5rWXoMJv4CPhZSX7hMuzb4Sn4iaq/gnYWbe/k
 8od2DV9KQI937XJ4m0bpA==
UI-OutboundReport: notjunk:1;M01:P0:1SjuiBAoL/M=;BsCMN+z0cmZD6x+fiLyWLuIQGN7
 mTRCAtEPmYqOtg5/ud9XTG5haNLJBinvOd/JDDdeEu5PkrBmitrdTjN5/2/HPjldzPsHpG5Hl
 RyemQ9yFk/++T7TWB5Wkp/aBjtAWFSKKGmOJ/1/9npp+Or5WcOq8qU+6uy2LHDyUNfL4niHa6
 NSOgKlfmoBNj68D/eWuNCO4LljOP7U7lCKU/vuFsf8QI09L9EpyKgwAOaMg+xx/iTHkSWVFu+
 eoSbnzTb+1FPTav3sqp4oPEgkmG6cZQmhD6UbAvcgHTWn0ss5gfzenFAI0kGeNMqWmsjeSWzP
 kaBj8GEfi25J91OWUUq29tUFht3b0lOGin67grHHxYPWnHtGGAzWPHDHn61hRKWS4L/2Jkqjd
 GhtVM+iW2ZKeAG1I7rH8nAinLqjZL6gwwjuBXXHKzPj37gI5R06fV0Or6zYQRvVXKXb1B0exh
 kr8UaLCcpL27DrAI+HXJfK7+ceh4ihg4+Yjw3Di6av024nTWNEYTPSLzIiVqAQ3Fovva2ZnNt
 xqZoVrIxT1u16VOmM1LoJIogvZBg7rjjFNHE288Gy6D63dj8BmqX8Xd4WrjPVxOLk0M6stFu8
 ycsSGe1b2RgMdN5+xSMeTNea87FDhOtfxREkEoWo0/1lBFi1XKS6MUI3FBTkWklXUAadtYCHz
 LOiv2JRZXHEuOPRr6UvyPRqhXBxVXI6JpLGfcWP+kO5ZIJ3Ug/kUeI0RWYvS2gded7FE/gTeS
 zChWCZ7q4LT7HpWQauoY7hERhu4DMi0XdkHpL/AASz5f9TBt/u8CEZS8vb2IaGVyT71PCh/Ea
 Q1p6Y5ureS1p1uY7zEaJ6m/V8J0JYRI+U+gJxP3QAiyYgLiOA4LCkV06h5vBYu1tcUH8dz8Xh
 DUEo7mbWBjPql4vgmHVz5BaSn9IZkEYlxY+ifpdRxwkvgdCJQiBr7wHgpkHD9HuCRSHg+KelM
 z5QWpA==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add translation for the host error return code of:
    getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) =3D 0

This fixes the testsuite of the cockpit debian package with a
hppa-linux guest on a x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/syscall.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e541fbe09a..52693b4239 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2809,8 +2809,9 @@ get_timeout:
         ret =3D get_errno(getsockopt(sockfd, level, optname, &val, &lv));
         if (ret < 0)
             return ret;
-        if (optname =3D=3D SO_TYPE) {
-            val =3D host_to_target_sock_type(val);
+        switch (optname) {
+        case SO_TYPE:   val =3D host_to_target_sock_type(val);    break;
+        case SO_ERROR:  val =3D host_to_target_errno(val);        break;
         }
         if (len > lv)
             len =3D lv;
=2D-
2.38.1


