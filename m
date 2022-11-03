Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9887561791B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVv4-0006dt-RH; Thu, 03 Nov 2022 04:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVuo-0006XE-KN
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:41 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVuk-0004B8-GB
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:33 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MelWf-1pQP6503xl-00ak5J; Thu, 03
 Nov 2022 09:49:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 3/4] linux-user: Add strace output for timer_settime64() syscall
Date: Thu,  3 Nov 2022 09:49:24 +0100
Message-Id: <20221103084925.3860524-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103084925.3860524-1-laurent@vivier.eu>
References: <20221103084925.3860524-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tIjU4I5Up+ove+yzfTiT39raIYDAdo8nf9XWPUxTxo4YCBTjKv7
 9OTZZvu0GvXvY8d+AH+KLz0FyuSMDp24CGILsqZcLLqPCLfF8pFEgFK3SJnYFM1x9KsUWE/
 GtW1AD55qhBmcGQzIac5wQSncmOz5jGN+HfHYkoWbOXNnFZX6kgx6zVwk8pj/4BU2A0o8ih
 F/LSuOGU2c3+wJWn/c+7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QjUCUJ+0Dk4=:eaxrq0whxB3ijSJljf50Fb
 P6cYBLL7vjnNR+cweRHuHdXROTZqHZ9hRZu8GSsrh08rUBRsLMvuZFcTXWSfV0Xi2T6yAtFbM
 QGbB4r/V0Rtvzg8l3nxDMBmAKPztxNhLfeejIliMRiPcABHh6HsS9Dkis7zMb0PyTQzO0jxu8
 7tHHeEIhWUmNGaRxiy29wwwW35w8nHpdGarONxpXN8rL+gLCMvUUoJTLvcKuw8E5950/LAuk2
 D9hCo+kVer6rJeSq9it42ieGEU7AWRMUbhs1LntdrEfPD4W99glfiWuMy/bRvQYszJ6tz8DYU
 yRIBfu1xK/6uXj8s2QpdW50iSy4UhvObIMqFZQrB3DergggYSYOagET/PvuRnMIaUX2n1xvr9
 Qs/RSl4GfLZnLFaduf1uNODxZBbA8aMWvP/0Xj7T/ntL7NZ+0Ht+Fvktqgae9iDi+Nn5zeIuO
 bCSgR2YWKUR1YAs6HrKfaJXXG3zTdIfL50YbRqiENekaq1MDkMwg/8Y0flGlJD0QdNcCmn8lx
 pVET1teU+VT7F03nHV/uIRglnraC9SovjjD28OjE+REwZh3tC6ZAcUx0XHcxurkoQCITWG8B2
 DOqea5mfDrUiw1hSmlxtKU+RsmJy4UbbbyPkL94z95/JLiazNAj59qxvi1YPHZIsiJQVuYLb6
 Co3VGkhBg4rbO8eShd2J1EsQoRq4GuKFOJ/C+AxI2ASKdd6FM73gyePsj4akg5DEZT/B6bReM
 Tii0QUtSbEJ5UwHkSeNUFi2u28+uz1z66C1zy0veh+ty7LO2UmqbCLmDfSVjmuYmsHHD3MN4o
 P9n7Loj
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

Add missing timer_settime64() strace output and specify format for
timer_settime().

Signed-off-by: Helge Deller <deller@gmx.de>

Message-Id: <Y1b5eIXFoMRDcDL9@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index cd995e5d56db..3a898e2532d3 100644
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
-- 
2.37.3


