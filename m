Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE065BEF98
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:04:06 +0200 (CEST)
Received: from localhost ([::1]:35938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalLZ-0007HE-H0
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6J-00047l-R2
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:03 -0400
Received: from mout.gmx.net ([212.227.17.20]:48285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003Ib-KF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695115;
 bh=roH/tkWQlaK8ZoFaWtgJx1vvKW8Za+SwcdWg6wbUaY4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=V7GAILFzyVNyTBOq3Ijxj0yr4Nvh338Ceyoba2ZEk+2SJjMyr1z/qvpYrmKfXRkDN
 jWmrCwRSwgm5BfZKnr7KDr7eweWd734aX54VTanOE/BY7qQNoA6KieSqiol2pZrauv
 +ZLYGGP4l7VXXLDZ/r3QjwptmcZ0GwGu4oBDqE+o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs4f-1p51mk0i49-00mq3w; Tue, 20
 Sep 2022 19:31:55 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 12/12] linux-user: Add parameters of getrandom() syscall for
 strace
Date: Tue, 20 Sep 2022 19:31:52 +0200
Message-Id: <20220920173152.199359-13-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RB+RQYfaS5qaA7iI5fTBcWlbNOIxBHRIsZ9CWUeQEjGOv54i3ZC
 eWYrG7Wbbq09tJ+FCjy15eYiV9gDvpKhO5JfVDv0xDDl1NXlQ0c7Ge5eZkeXOwVM26vaEJS
 DfiUwIla2uQBDFHX55Q9931MLGZGmyVznLShage5TUot/1+sKFGsN36RD9EnUkjEDQ4XNKp
 I/gJ38y/lRnhu1StfEPxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ZpqlhZsQMA=:9YpM7vGm3sc1KvsdyyUSqy
 /So87o+UrFe2DHamilfe7ZWaH1ZlDyrZhOUxTYMO0hko7/QtAazUHobGM5KL9JzfoAfsaQiwE
 xNzr3gAQhe1N0lHElETqIqnOwjMcV4nLrAYEIHylwXOykbrL25zcw+djdBSgKJj8A2yz6NzuU
 yQ9SnyW3M18uBDyN8HpB6A976XtUt3LnGqnIaxDjEMIBkoGRyJNmw/MyUmsn9v8oiRzSjKJhf
 tuTW9wPgJZXQOhLclFElDHFPtogYdivzV1kZvC379hLRhsBXfVh8h2xOT4dozTm5KGeEEYpx0
 PNxGwgGBAvjmuyritH1tbXu4B/eAk3x1OvtgABGrCLjtxRefjFuzqA3TyiQKqL2Povn7cGq87
 88jtXPNVSxntM+wbCyISlAqLRQzTTp/C/EbLWCpRTVtjOMyDf+/h/gkfLlGhPPtKwYkvmXXhn
 PDJ28NQ7ByL/1Uv1V6GvKdRGyEjvh28rV6U32jC90DsBmKYxrWiPYVszqkRGYYBp3DGdh60AD
 +KfzaBUOt18OwIyla7h0dmB0zesMxVoxNAhvb7p+pz5Qw+OmSk7jPl2OsHyjlXvRvlbON5eEi
 e9gYzHOwuEC6o3TKewfUbEvrvepQYoj3UtrR2sC4V76gM27+wUbJvsKf9rEmrmKPGqU2BVssH
 1B5ZECP2NfK7s5F7wvWsHEXt3SXKg8Z/r1qpRbpvdw7q4pzx6YP/l02Jzin8qZk0WJjrTWBtX
 84k+ZeGEnX5tgJWeDDDP4h0SFFllwa93tKQgHcNzpRQ0SHp8HErcg/HWBrirDqY1UL86NgUaq
 fH9H+cowBZvTrT5hNIO/bOHRadjlD6jTCa1qrt0CuG7OmMeG5exIJs8jN3YxQNGs4rxPAz+a0
 8gfgcR9pNuanCO/ltOvcMWphu3+NndTLkJ6Pc9bXggbBZUHo/qSaL1fZppoL45nY5a6doF1wR
 /MBk8IvOs8mD5NrUmGl4g6gPKlzQ/HODal5qtDS8V51qyihq898Q+6WZjQXbbKPr2tsCTstmo
 ncPou/F7fx9LJxZ8kpiI3MBLe5I7lnYlmCZZIurKofcgkencVYx7gwXToYBEeftx9btnthc0O
 FZs3CM1cR0UmnF6m6h3cal370vRXlHtOaz/Y/1n7mq74lQuxo1DDCHUvQtgwukU74gjzogTnR
 js+1RQx85qhlnfOUavr7GuZXr1
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index ad9ef94689..97d8ccadac 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -355,7 +355,7 @@
 { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrandom
-{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
+{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
 { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
=2D-
2.37.3


