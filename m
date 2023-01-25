Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B577067B3C0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKgHy-00032k-6T; Wed, 25 Jan 2023 08:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pKgHu-00032P-DM
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:58:06 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pKgHs-00023s-N5
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674655081; bh=HkGwLXjkgZZUrwuFV1GwiV/pT2BDhdYe4tRvTvbOxgA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Hhiex53Zk8Znf5frDFXNsa19YptVgTteDG9WqNEIl7s8X/xv397hKVkarDtkywQt4
 8hbtav5zKYNOoWYQrPxx2cNXPNKwqotAfVuhVCTLCqya+cKKxcE9Fzq4a+q3HeWIQV
 GKAtJmXmppF66SofJLRUl2jH7eeOLDV/ZMg/NYW+38Yo7ohGLwp3SCeFHDlos+N4Z/
 jeuyQmyZ8n1FR0YNxEIClZei+DzmY6DiRAKxmApEeCtZSov72UEweM+CaXvGfmsoNG
 qjR4yZgXN4vWTs82O4XIBdIPDUNCChRnq0n26aR/O6zh6MIkYD8GYDkWtbX9EhxaJd
 FC0cvTKY0sByA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.173.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1ouf7q23qF-00j23s; Wed, 25
 Jan 2023 14:58:01 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] linux-user: Show SIGCHLD in clone() strace output
Date: Wed, 25 Jan 2023 14:57:48 +0100
Message-Id: <20230125135749.4594-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vh7lSImC4gDcQjhEj6YmS1uN93PL0uOi+zUzs5mN01vFKkVq/7O
 F2IWgMk8MaN/am4GK2TAl4dUAoVMxMpp4UE5z/bCydqc5xIe0ETSw2vvbka8TmlzQkqylhH
 Rr+YKZxbmpBJIpgapUWoTYzINGpTBe6ghqegBsbGzqccxX6mvMpo1IBQNZP/n9DIJl44ooR
 FWi1sdXjMUuVLj9/ZSxaw==
UI-OutboundReport: notjunk:1;M01:P0:vsNZw5Y9mgE=;6JUc/dRBHCgCyWYOBW8xFr47n70
 +KP0k5P9d2j5tiEOt9A/ZV2U8CwZSEPGmVUL99bHbtcOxPWNOJvyotNWslSg1cgvqBGHzbly8
 V4FHIAT6J6whpa+pTbfS9H7kLKFH3LeCLnTyS1kL0HBiPz646hWjjkh2McvjCZnepnV1H7CoA
 ZNl4tp0b1jTh3+LSFkVKSAwBOZfgkvBz+em322nGT5+VUsuk59i/MUALDGkWSt5xtv49q8zS9
 kmHShWN/Hj4NQxxvwyT15BOlWFfVLN1J3sWx6Uj3K9bJ6tKVmJfHbJEyNiyWGPHPNsXktEJls
 pBrjBEtjqQWftLtosVd7CBSdiorZb1HjcJg+7nqh7Mm/Y6LMwzGQ1+PkZvEUKmPRUeT5GXpgE
 v1Ojwq00YxhO493LD6EzMjByIF0mlVyhDx7oJ/kZRte4mLmbPmbcb3q/wYw/Q+OqV2qfkeYZf
 lG+EvYi+PYlENkXeBHjyB5DBUs+LXDJnSMEisezbP5nWZOPJdf4RuP+fvVgNqJ9Uxo+mtXtgv
 m4Qx5EzuaydkiZW2ix0UcdB3fcA08YjinQORWg6tKsAXe60pvpeDefTBMbXAirYMNz65UmhxW
 IyQ0nxEkyNZWgPf4mKAbia1vPfBPlW2sYEHVUmB9dt11RMhcN5VN1FIi94tS6qXbh5BmfksY1
 Vt4OPw4/IW58RVAxpczuyXmwnrQMo4Id9sxwdUCB7ewdUn5bQHdiadyjxrYrKY9NCqK3uLG/H
 +OQdaOvDvYj6MfjM/s9V3A0sXEFG55ekZShcYrBED+lHtPSQ+N3Et4gAHFklYqp0wBOb2V4Dr
 drmzxi8MQPNQUWYaEdgfu5fdkm9375yQ6fn5hvASNvxioJUWazEnm55+Yv1Zsk0b/WPrAWPND
 MyPJFA5Mnna8+sgTG2fjS64QF43Fw/4ORD4Fcw/gNHYC/FIXvmFPt2gBq1nYrCQm6YAt+wql0
 RhnNG2wCves6B6/rbr9rediwUcs=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

When stracing a program, show up the SIGCHLD value the same
way as it's done when running strace natively, e.g.:
clone(child_stack=3D0xf7af0040, flags=3DCLONE_VM|CLONE_VFORK|SIGCHLD, ...

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 82dc1a1e20..3157e4b420 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1136,6 +1136,7 @@ UNUSED static struct flags clone_flags[] =3D {
 #if defined(CLONE_IO)
     FLAG_GENERIC(CLONE_IO),
 #endif
+    FLAG_TARGET(SIGCHLD),
     FLAG_END,
 };

=2D-
2.38.1


