Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE460BC56
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 23:39:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on4Ka-0007dV-B9; Mon, 24 Oct 2022 16:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on4KX-0007dD-On
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:45:54 -0400
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on4KR-0007OV-Nc
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666644345;
 bh=nJ0wueOxq1vqycFHTvKBkdR2E6kvvVqX/k6i6o/MM1I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=YrYwXbDFSl8TKFE+XiY/Ah8Y4gr4IKFqAgrSqCDAc6SaRiboJjbtqWZbfSKZEuHsR
 cRt5d805IAi/7rjACUq26E515hcpWG0aRoodaDJxMSDFKLrGBlGcRwJWow9tY2/8ER
 ssB7v6wxeUxfH73Uef8iyz8qx1oVc61pOLIufPoA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.136.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FnZ-1ohHZ81p1L-006Pss; Mon, 24
 Oct 2022 22:45:45 +0200
Date: Mon, 24 Oct 2022 22:45:44 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Add strace output for timer_settime64() syscall
Message-ID: <Y1b5eIXFoMRDcDL9@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:ACqgxNX1rVsqaGJkKFAWLs+f6fJsQnmF6NwAZgRS+traLJiiBdM
 0HUcZ0eo4lUjsTCxWtNyOo9dlTIqWJJCan9S8QgNNs8XaClfDiGsThmoxNO7aDxViQfcPgt
 HPGAXWAWJhYzXWAtXmw2ldwVxNDEAGEFafRS/fbXLGkkN37mp3ouBbQH5u44iqYw2J/9hCj
 Tgf7k4aw9v5VXu/myy6tA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K5AyY5nV7qE=:AopN0mp0dGqKmDm6HC/d8S
 k71dEGwg0TAwzFVrH2t0gfZMqWsjVjWN8N6Fgop+cO8BRvupsR/IaUPJvaI/cCeAiWif9yXvY
 xEyhXfCfqoC0CQdrjNckbNEgKxmpIlna0hgp8IOYZUSdZLqvCZziICENGgMaH1LoVwGf0To96
 Pna3mGHDGJIbEQ2HYcAOWO4xMmS8vuhB6Y+c6WIcqWFUgYYEQYTnfOSLpTPFcHGRuDFt2kv1V
 X+4Wr9QTwjAIOqTWTx5C6bLhs8l/BIEqjofzDouriv5jtTwou1UQtp9S4xt3GLBXdnC3cE44J
 nBs4FOt82i6AJLdK/XQRQJ901VWEtjRm61d9xab9psHg6T9oOuyQT+WF1NSlnw/NtFK2mshGN
 m4IBRh3zONoP9757b6qRiW4fJSc7AiRcfdawcLcjQV9XT60OAEe1TgR+dUIfzuKxKWoWIjj3h
 YcmaKeubuf1OYsbuNqH8d/yyp3IFoHIR45c8tnd2GAtMeEkUJLI+gb6mLXnW5IyABiaT9pxqx
 5Um4LXvgk1QLFp0zbhYcaaILpY2Qa4swc5AyjlCytA1vNvGCnJRWcGYIMCkDdDic3Z0zluEYU
 2+FWPHCc6yfOJcjRsAd32PHfc/U/Rjx1WtUVHH4t+v9GK1sWntiPITCh5nJMDYZVcB7YSdo7M
 CdF0zbj+9FYgDWdDyYZ/TgLYAlUx6XFxUr8+7rrrfsX00uZSmpQl7RH0dqVwY3sYvgKKwtEgl
 4zmM1iZr/ZwauVzemGdlI7Twdw3MB2B6YBGChmDKOmWw1RXI4NGbC6ZiIXfMvadOtE7BzhLJv
 WnSi/m17DU5ED/sbLpPdOuZT3VcnUJoyR+KSdXt6w1PXE1qH3EGQgLqQ+m7mePojisYSZ1ked
 TDXdCJG6RnQlrYOBCEnjcwr/skA2PIgSv8cP5vM8VTn/Gi94L4iREcglOMIFOorm7PD9Un5Nc
 yiFTMslXkKmmEFhGR+7NBM4W6SrLe6xP7xXcTZBT+XWLA4DwKAVYHpEr25cmKwoKkbdZ93uMC
 ulTMfizgoC3AtQLqF5Wi6Lol6HmRKpZXlN7PbUulJWJOIuA9wmVShtmxWnPaZrIJbEu43HrCp
 XuxUstH1nZ8q9vph5Z13wEJgsIcYfBGiAoJLaz14y+EBWVtBzedQ64g0xkS4oTwYbNfgc9LkB
 TaajXGwaKdX0n1jqUKro5fiHiO4KSl3UCKpXupMzapL2zBJzuWAtrdp1+5A3ZLIHrL1x08stZ
 tHi6RSApBNICRbk7WF86pom3V1y6gsfnPchZAuDOY0LEFOVKHOGOpzxFGTLdyetd5sw9SIw9A
 QAYMHSOxCFsv24WV85p8XOl1gggSFk+A5r+bsmReQ63PQwLPhTkAkIhRDYVQq4aFqW9rgoxWl
 uq/QQq+d9jjz49cv9kHx7A4QOzX+/6DzFPVmos+lQAvLHNBluJpyddTc4Pfs6i+Sveb0yrmGm
 h0TWTHHR5xKZ36KPig7UKnQG7mn0E3D2sbddpu0vklPGAV0SYfuzFTpv/oV6JJX31VflDKulA
 vw4eQuQQ2uOqlT3Hk6E9rjowhkPhss1CNf8sslkrm/VW4
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add missing timer_settime64() strace output and specify format for
timer_settime().

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/strace.list b/linux-user/strace.list
index cd995e5d56..3a898e2532 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1534,7 +1534,10 @@
 { TARGET_NR_timer_gettime, "timer_gettime" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_timer_settime
-{ TARGET_NR_timer_settime, "timer_settime" , NULL, NULL, NULL },
+{ TARGET_NR_timer_settime, "timer_settime" , "%s(%d,%d,%p,%p)", NULL, NULL },
+#endif
+#ifdef TARGET_NR_timer_settime64
+{ TARGET_NR_timer_settime64, "timer_settime64" , "%s(%d,%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_timerfd
 { TARGET_NR_timerfd, "timerfd" , NULL, NULL, NULL },

