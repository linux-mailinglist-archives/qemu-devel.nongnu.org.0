Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C81B8145
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 22:56:38 +0200 (CEST)
Received: from localhost ([::1]:52426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS5NE-0003sI-70
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 16:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <deller@gmx.de>) id 1jS5G8-0002dY-Rv
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 16:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <deller@gmx.de>) id 1jS5G7-0002YY-Ml
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 16:49:16 -0400
Received: from mout.gmx.net ([212.227.17.21]:52723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1jS5G6-0002Pz-UL
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 16:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1587761342;
 bh=LvQnRTm41nEooI1EKKr1jhPTUVfEQ2eSNKomjh5GFNk=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=eoD1SN6Ddr+l8lp68ZuPekL1twS3sllnH1Z/gTVAMgS/BgenuxbqV5ahjaMGoM2XM
 6rmJHHgYvBCNkejIksPw1hWkxz26cfPu2m1YQOaEe4pdX5QposWqP79zcwLVBF4b3r
 xXHAcGAIkR8fflR6tRnlIbTYUA2ztId/5eYoUBho=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.144.192]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlTC-1ikoXY0lSY-00jqd4; Fri, 24
 Apr 2020 22:49:02 +0200
Date: Fri, 24 Apr 2020 22:48:58 +0200
From: Helge Deller <deller@gmx.de>
To: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Drop open-coded fcntl flags conversion in
 eventfd2 syscall
Message-ID: <20200424204858.GA26164@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:mC4hts6uGHyjPJC4xEEofF3iO6xyk4gUYj46ZQK7VSR2d/MaIkL
 uAfGTIGg77xuURtxq5wouOxXK+F90s+KQBymjHXQNzEqo8xL8CnNpDZiuglPNdHy3Q2F3IL
 0DkkkyZc4AP/JY8n27uyf1QVkG8x8Y9Pw8eR6VvzTayw60L8ZNCyu83fTbF1roOs4e+2MTb
 yBgl+C65tklzm/34FCryw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yaAWcvI57jA=:Z/3IaJIDisimYLezaQlptu
 0IOqz+GyCZ+t/K4B4Rti7sVepcSL+0ZnK4gd9M1ykFyuACEpO99OUMYEwhu7Gt0gRPlgJXOpx
 onZhgXTWhFLcpK+3RoO8zT18VBTaKkwbOc+57uOYSRf5dk3DZOTK6ZCMgUaDRZDJYDqZ+6WBB
 vAkHgpg2bPNR6SjuBsqk8ezA9vGBjbvdKcQD098BqX9Ptd5eQ3yIstu7xpc1Cq2nlf3BjLShM
 k64GHtBvt8hQuarWnWrLrOcRv8NmSPTY4vesrplvpdey0KC5b/eHfqqDVI1AqbURCiEGLe4CY
 PqCKO6F+xGXTnwK3PEAp5huq88mQAHBq6EfwwwCZ+FrW3RJk1ZXZCewRgOhLb9CdqxX0bdIzj
 yBexX2QeCZuUhn3zjcVn7DnezhDNVmM/sxqCe1le4AUXdRDo6fJzeSr2TULljvOjdQ0ZJdZH4
 9klmyOFqH66pEnzNiS4f1vczranxSzNJzOSpDATfP8drYGajpes0qFeexJY7qOx1yPfs7KZIP
 1l5ymsx1nzipwUV/dy1kfmFGsjDlX+ssqznIU5S1GyvTt43DUjDzp4Zes7fzQDY+lYqTS9WKE
 CccHMY0n1rf0r+r7Y3kaEa/E/IESZvUO8J4n71lMlbn/+Qe0viRxnrtf8C9y2Hj6xfkmIJkHT
 jty1TZ3pWdjG96quP+UB/U9GBIaE1SEqatWTvplnVABfAYZcB8YKCBMWwMU9xDwK5aq5qKbfM
 /ROBNfkdGRql7VARejUHdbYTPvgBf7bI8uDNm2f+Q4zxSDg0BW+57YsEnL8e5Dcvy29s8Nwb3
 8FgK0csEQBBb5GzASrjbUxwPKPmL6v/C9XdSxguS54AX1HC1SxYBxqIHXxXpw6LDXUZjFAJqP
 M4AnQy5NmYDH8wVso3NZ/aZwQxnNFawviPs1MsPit1klHsr5OtIX4FyGF4Hq/QGcjyTjhdoRr
 2NF6fLW2VvOLccL3BOYcTkXiSXJmxfP2QiC8JujRst6eJ7Qj602OGSdfW4uScX0ex26jxppzX
 WYH7yCFzMUwGU0vog9DHA2hkdFbytAEUWzKW8UZBojqqoyVKOaW6V2bPbB9QCilY+BiJoDCWP
 A/dzUzzjigmcjcriP4SUHoGHUviGkJcz/RKGHe5ET/o75EyjG2CVulePmCv5mhzgISablR77y
 vsoi7iSygsi44EpphaPZDmUcMT0S8JVVR45N3Ie7vHKo+tC3GI0mmjyVmupSg/8pOkFZFerAK
 +BwanQBDViIYfSubw
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 16:49:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.21
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Drop the open-coded fcntl flags conversion in the eventfd2 syscall and
replace it with the built-in conversion with fcntl_flags_tbl.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 05f03919ff..ebf0d38321 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11938,13 +11942,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_eventfd2)
     case TARGET_NR_eventfd2:
     {
-        int host_flags = arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC));
-        if (arg2 & TARGET_O_NONBLOCK) {
-            host_flags |= O_NONBLOCK;
-        }
-        if (arg2 & TARGET_O_CLOEXEC) {
-            host_flags |= O_CLOEXEC;
-        }
+        int host_flags = target_to_host_bitmask(arg2, fcntl_flags_tbl);
         ret = get_errno(eventfd(arg1, host_flags));
         if (ret >= 0) {
             fd_trans_register(ret, &target_eventfd_trans);

