Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49B533AC8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:44:30 +0200 (CEST)
Received: from localhost ([::1]:60576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntoVB-0008J0-3t
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRs-0005hA-Us
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:05 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRr-0002Eg-4B
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:04 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MOiU5-1oCK843Pjj-00Q8MV; Wed, 25
 May 2022 12:41:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 2/8] linux-user/syscall.c: fix build without RLIMIT_RTTIME
Date: Wed, 25 May 2022 12:40:51 +0200
Message-Id: <20220525104057.543354-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:91PlVt1mt/Uv5diSQzvOx/MDj0Nq+267cAXwd2ByrdBr7ni5BNQ
 L/C9QQevGn826pHOTWo5rb692eSnOnLDw1yy2f/7S6nB+w2C5w+HaCPJF9VjhG76o3noJan
 syvpUHtSABdI5MBFoJ7tSG63hvXfm+Y7I+V8/JjomHpBHBnPJq8tSdsEKlA4BhufVlvOTZd
 OiTRpgXvjmku+flKmESnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wo11K1zsA6w=:F4US/Xh/juAiXygAgVT3rw
 Wd9Qrgi4+XkQAPW9hkrXR+05D7otkrShspCliiTFBdkozENnNb8gbl967HzowZwtEvMmlPmf/
 h7KwtldNEqDFagX2i0sqPzHaSbjByXTreoN3b2SO09+N3EnpkPH3lMmldYmMQMeeeQvTNkuZ7
 DmIoqKTUkXbHJ6FI0g1MK4WXius9SBSL/GFu4xHjEv+e0hNE5ZUMfSK7moBzAwRHQF7LK/Hgy
 NJYqBGvuXjDAki+oXHX5rygY29hdVNV330UlA+wIkx5f+uAicdrxHOCPCdub3BoXYUROSMs0l
 hFGOE1ZI/SI/HjKLAHekjInSBZiR3MUty64j53NJQJFYcNsFch40F93YMC+Sh7Ko8dQukg5MN
 +LhAl6GtcrTUgEaABY4B9bvp7axbZFEINycU+/+v92yphTCy0wSfVlEIagFwU++YdOEN+WF4i
 yDJe4R/RtDhCjljHwqhzmICMc/NYC3yniJVOjtN+GPAlkY1Yc7DQ1GN5pgQEB42ZQACLFV+Tn
 jnqSsd78ZxB2RQ9BP9e68ynLJ94a9NJxnEXoVRBkw73IXsRJjNQ4hvHVkoAoVsDWx2xpfHzy+
 mbQW6q5aep1w/U6WU1ntHKatGcA+uT3rr2ZW/KbzfhuuHz4Dxoz1dgvbLGtSgnx31MApm3YPI
 t8yC3ZBED+CuZQshfDpYwlfwPvi/0DvSAHCjbM7liryn2SV+Ircz4wBDy3Ep9fWHSpJflvcRC
 EKf436J9h5LZ5ZlYyIrHXkAzHan9CAzwvWV1hg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
1.2.0 and
https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
resulting in the following build failure since
https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:

../linux-user/syscall.c: In function 'target_to_host_resource':
../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
 1057 |         return RLIMIT_RTTIME;
      |                ^~~~~~~~~~~~~
      |                RLIMIT_NOFILE

Fixes:
 - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220523105239.1499162-1-fontaine.fabrice@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dd0d92ba4ee0..488facb3560e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
         return RLIMIT_RSS;
     case TARGET_RLIMIT_RTPRIO:
         return RLIMIT_RTPRIO;
+#ifdef RLIMIT_RTTIME
     case TARGET_RLIMIT_RTTIME:
         return RLIMIT_RTTIME;
+#endif
     case TARGET_RLIMIT_SIGPENDING:
         return RLIMIT_SIGPENDING;
     case TARGET_RLIMIT_STACK:
-- 
2.36.1


