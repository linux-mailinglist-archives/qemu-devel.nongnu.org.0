Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A288B5B7ABD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:28:17 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBZw-00019s-St
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLy-0000QE-EB
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:50 -0400
Received: from mout.gmx.net ([212.227.17.22]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007fR-Ty
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096405;
 bh=9HKRSmBH0uIQursAz/Lfos/ipwIs650RLsxkMdvi+zc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dN33Do1cNNxG1FCyutSc9bnGj5kgoSDU54aU/IWbHNYBAKVPssRMSvtGVdZsjf0o3
 sBX9J/hiVeaJAhzkwvxV2QLTTUb5RUwCRk4hn+ct20p/bOXzFAYuHPDhzhwXQDto/Y
 1pv3HcyuErXGP+8BdLwaZOQfgOt9iZ09zFObkx/E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXyJ-1opSQ60sdr-00Z0O6; Tue, 13
 Sep 2022 21:13:25 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 08/12] linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000
 for hppa arch
Date: Tue, 13 Sep 2022 21:13:17 +0200
Message-Id: <20220913191321.96747-9-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BaB1jCiMvlUM99S/4gpyeypF6Kj8ZwEq7V+wU39vhYmn1O5tsdC
 DCO3DjKkzF4IG+8BoJagi+ofhQ5wcKWvh9/mrpY8vG1XVbu75lUP5wwwgP0vKeL9T3w4tm9
 QcqLTChxjOihg/k6vED1GOgidfld579YX7ZnIfyVKQkVNXbgDjMwBX1dst6DBz19DiEUEnT
 s/6yVTDqRa0xHvR5ZeVdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I05aXBCsgro=:vwiamybuLKUYiJWFZYUfQ6
 NXsB+ddkdN7fRthSjOJMKjGkSrWAgSBpSqns5YA4hJcuKbkR8wali974BQ/1KQV37WWqkVKfH
 k8iSQpdNfIndgR27Zdyu/MBNoFwqBRqA9CfLXKpH01/lYwFbY9snreY/hfz1ILbO5ipvQa8zE
 sKoHv/lXqD80kzDdpvNn2XtM1r3SQ4mH3XKiFJ75qiRidgMGrQtETdFXbBWeqdwY3H39j30ro
 xghj//8sDlZzBocbblzoR83az+OlhXgETghZbSk9A15jsxuJ5QqZjHJBUdSa7n+n8UWzFMPYg
 sDj2ZnF56f+fka6p7+lLFtl0cfyp5Q3S8m+gm9PEoDrB7h13ZaRonjaKaxrST02dTpqj4pSW4
 Ia2SA1ikexNS/Ax1lmEPP3Bu7Y8cQdQ06+mRM2SacKWTYwU0rxlrVFwKy/sZ3QDRQ9MXilYcH
 PEUpahEE3sZdCu1BWe9fa6NEEEEwR7HO69phqVABDfcIjJNbtxk8uS4rAyWrjs1+iF8Zx3CXG
 DdmuGoILTRJxrkVPI2RWWtXZOCHzU1RQkeZBM5nGItkBEzU+AIJzGaj6xK5kt1OId8joE7vdH
 W9LMvIxsH7weqG8fAbs0Zy7lHJfRboA2eQwf2pv8GvBqvcz/9wBqIBRk/zWq3ArWCbGkvQddR
 JnQKgQi/IFruARd0FGmGxLZyAyJtcdZ6n69erUc2rvoU1/J/IGCCt7K8X3rIRxxr+D3X0NGsz
 f5xIzk/7chopw8dpMA5HnCmKg21JtDVp687uTKUv+ReyU693+1SgRXzEdcHcYlgpqURoIS/v4
 VSt1hcRUGh9lf76FN4BNs9irBSwVj5hogg8nYh5axCYDRgslzkUpAvhHwYZuZ4SbTxcJYGxSt
 ydbK/R1+dDItUYl1zhkQLSwxzDTZmyYeUDWzBob3DKCnHJSdbfSGXog9pX5xwh0p1wn2XVkbV
 CUjugUyNwRgsi/cIDKYiga0beTN8Ohhh1DTELXkaBL0kfspWCmwHSLkYp7imiS1XOjMKlAyln
 1+A5gdHphaMJhpkUHe3zBulJlkNmFc8QjHI7yDVIyy5SmR/RpBzHpSINNLRjGUJ+aA5T7as/G
 7PO7qyKLzFTmROPSIS4C5xsEQ5vz/aRimRJJQFhfTLNlA25XZ2+BQwxbu55d8KtcU5DdMUQo3
 Tnc8X9gJm6o32WuTBXD0P5vYXn
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On the parisc architecture the stack grows upwards.
Move the TASK_UNMAPPED_BASE to high memory area as it's done by the
kernel on physical machines.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 048c4135af..dba6823668 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -251,8 +251,12 @@ static int mmap_frag(abi_ulong real_start,
 # define TASK_UNMAPPED_BASE  (1ul << 38)
 #endif
 #else
+#ifdef TARGET_HPPA
+# define TASK_UNMAPPED_BASE  0xfa000000
+#else
 # define TASK_UNMAPPED_BASE  0x40000000
 #endif
+#endif
 abi_ulong mmap_next_start =3D TASK_UNMAPPED_BASE;

 unsigned long last_brk;
=2D-
2.37.2


