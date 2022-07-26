Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9B58106A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:55:18 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHHZ-00085A-E2
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7T-0004Vq-8K
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:54395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7Q-0001Br-HD
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:50 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLRDv-1nxuv808jz-00IS2G; Tue, 26
 Jul 2022 11:44:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/3] linux-user: Use target abi_int type for pipefd[1] in pipe()
Date: Tue, 26 Jul 2022 11:44:42 +0200
Message-Id: <20220726094442.4452-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726094442.4452-1-laurent@vivier.eu>
References: <20220726094442.4452-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ei6CBTuZ+9iJ1vettyhZqKCyodmjUuvBYLs+pyLcc/0cMy4vLtA
 RXgwLRUPIzosp4AQm51lCotQQs17rxTWHsA220KvVJ8R6y3jTFDZlxALZSeWC8/fCWmkrvo
 Vy/7pkWnwkbGk+uDhpTQQhIei6IENKaLL7lisBQ0WTR/b0OTQY0Cf2iXKkvBz/XRg4S3K+R
 BtJCd5F3ymhFR0ikVzFYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HtKUKB076gg=:P1eop1lKu4wltJExXiOfZT
 8nbqswSXD8c6tW3BHxPA0xiglTvVksrGob8Ygr5qRU7sQDVy37JzVYC7HaKgp6fS2RL5zue5e
 S+KBhnRsgIwsae46Re4hQ/RGnIKIA1XNVM+oAdjkozpuqrpvtwItv0qLeQjRrlfWwjULVkBdU
 Me6sZVm6IMJEJEK5DoluT50nlKZeMW1rVUPMZdftXJ7ZvYEBmfWV2B3yEIjEkdmp9f5Wma9DT
 yK3h6IY+AkZLQQihpSuvQegapp2mdpxozE+5X0C3q+e48Lu2N5U/Qkh0jEqCirDMpNnZ+bEzB
 zSHB59H7rRShsHi80ytaLm8flLmd8h250MOpYwoDdwqujDXdgkS7yS+UfOOfei6r+x4iBIQQx
 laMKnCNc2fyQOaKcazNm7u0ShYxPSMSrk/TbmEJhJ1bTJVYxjvoUQiWaGpEfe962pbCQhAS1G
 dhMFqqNtv2r+opi4elVKHEbki2ho49qeu5rUYVoMCk6Zo+VG8wXAogTmeoKTEtRPjkjk7GpCH
 /JPEC8DD/ALFn/qojxGyoY3cwf7Aow1fco8NMDWUXa51quhMhijRwq9O91p2Okw3f7oCpQI2I
 WwFzOYm00yDnJE6I8hvdJDXER59MLUz93D97eNM8mTK6sOqb1XKpUEueiDlFgCTHOLYKPC9Zh
 B0F7wRn+saIpuScEUu1a+VeKhrnu0PevqK+ekIafhZcA0MVIWYbkkTwP1HfjxyOFALoaP+Ejn
 kOwiRRNMAxwcUF2CzIDuslKY69g7z5x2JpW3+g==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

When writing back the fd[1] pipe file handle to emulated userspace
memory, use sizeof(abi_int) as offset insted of the hosts's int type.
There is no functional change in this patch.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Message-Id: <YtQ3Id6z8slpVr7r@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4f89184d0585..b27a6552aa34 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1615,7 +1615,7 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
     }
 
     if (put_user_s32(host_pipe[0], pipedes)
-        || put_user_s32(host_pipe[1], pipedes + sizeof(host_pipe[0])))
+        || put_user_s32(host_pipe[1], pipedes + sizeof(abi_int)))
         return -TARGET_EFAULT;
     return get_errno(ret);
 }
-- 
2.37.1


