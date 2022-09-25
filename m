Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9176A5E944F
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 18:19:25 +0200 (CEST)
Received: from localhost ([::1]:48396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocULi-0002vD-U8
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 12:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocUI5-0008KN-DS
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:15:37 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocUI3-0005Yt-Qc
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:15:37 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MmDAc-1p2zKv2GpM-00iDHg; Sun, 25
 Sep 2022 18:15:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] linux-user: don't use AT_EXECFD in do_openat()
Date: Sun, 25 Sep 2022 18:15:27 +0200
Message-Id: <20220925161527.374593-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925161527.374593-1-laurent@vivier.eu>
References: <20220925161527.374593-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:heDivYGpA7kVL/ZoD8ZNwfk2WHmNl+61vu8j9Z8m/bB8PZCkqE4
 QiLB+yeFadOInI/ZKjxVctIdr8k9caBYbrrjpfkegMBOhqs6OHXOwOCmihuorUTYWkegU3d
 BzHDJu8q5C972aO2+VKxKf60rU196jb/72CHLtIYNVOj13ad/qvx/iXm872I7LB9Qq0ci1Q
 BEKycMHhq4t7Nyup1/7xg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XpHW6CjWTmY=:yqsAqAEDxyMgYhiiRQVXc1
 FMoIiTq4jXnTvl/BwNQInMk7MIBI4O9SMzLgnBYO6qGh3guRfj4d1/PJmEWSZH8bPyvrE88Hz
 9EhrnyoCbf5j3DKp0Br7EP0lfljW2TspRMqRFMxYmRLHvx4KhghrxhiijeM6SM1w/ujTQW4l8
 2YLbT3k8D0sxR1O3JeJ4uXpwe6R+19K/zOHtSQ9KJPfjU9evg6ompalWNe36uBV9ahVASiEa+
 Odt/9pO32zWAzcKUa+wj0W4g2VKVg0G16lEGGh4UlrpWniaEmUMrKEwlpQhfc3wwZqD4Q3NMi
 +GE3kRI1fFlqjIHtCMxKaCWesRUKIV3GXVB5pWJnEiys0/gxYhqVtQNt0vI/HDdoxdQVYd7z2
 HWBo59WZWU6uFj1pcyVOrKY/DWeWI5zotZOIe4q0zpMKQurxjtO3xtnIp5wrKXoeIVydpwppA
 OvQ3PorITeRTBEv/g8MHAV2r89++P3Ope1Ux5Z9SoBcSuNl4nfaiXjA2Fd29rH1d+LmvEOZNH
 fjOllbB74AdlPE4dwCjYBueq9wn5buds1OYVRVS69N1mNJpzVfd8tb/FbGbvqO5z/bPJ+RJKH
 dYu4cfQeebUS5mVmOulMQe4LpiX1MwISB/D96VQlCcGwWxGPNriNyK7/GaQVGV1ebyILl4SSe
 Kwfvh32vN3mYVkTS9o7Sglg/ufaglCI5Ukd5UZKP1vnpYOFTmmaeH60SkTKq+rsN04EWsPMwF
 ozqsMxClg7LB2bYBjoPLDrGotq/a0bFkg6vh/hoDSi0B5OIWy5eaBmWJS+0z4CVYEQCk+V+3g
 3yMet2J
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

AT_EXECFD gives access to the binary file even if
it is not readable (only executable).

Moreover it can be opened with flags and mode that are not the ones
provided by do_openat() caller.

And finally the caller can close the file descriptor whereas
we can need it with execveat().

To avoid that, use only safe_openat() with the exec_path.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6642652b7644..01f03535fe64 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8265,8 +8265,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        int execfd = qemu_getauxval(AT_EXECFD);
-        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
+        return safe_openat(dirfd, exec_path, flags, mode);
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
-- 
2.37.3


