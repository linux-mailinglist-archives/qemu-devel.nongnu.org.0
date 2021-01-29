Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C3308998
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:49:04 +0100 (CET)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5V55-0005hy-C3
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abid_qadeer@mentor.com>)
 id 1l5Uog-00055S-5h
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:32:06 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:43294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abid_qadeer@mentor.com>)
 id 1l5Uod-0004Km-Un
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:32:05 -0500
IronPort-SDR: 8EZaLYafWu9DP9BMn9qAz2z4ifQC27O/AYTP5Z97a5ZoDs+8+GDP5MFhMcsrOFnifCwN5W3DXx
 a8a6MLm4Vvd7El5+V4O/JkTipOkVwLIwJYzXcIe5462235VooxBY+ocjM1IXWU9JW0b6W0sVGs
 Dgn/toIlYIijS0kp4RGPf3KAFLRkhYgFL4JM0kwVvSCd3cXpO+/ITCaONPkmEEPJcUMDZJgR5g
 8Wrvf8surs9MKl0i5sMZOAL5ydRCPcHxm8BY2Wu+oQdZtObJBzRjoA4gAExK62K0HXOssjkAQE
 v2M=
X-IronPort-AV: E=Sophos;i="5.79,385,1602576000"; d="scan'208";a="57563128"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 29 Jan 2021 06:32:00 -0800
IronPort-SDR: x/LG2pJMrnNYr+HZB+iT7fSpdMyWysVreg2pifI5Ci/nuScilKeMddigiaz4rmfRU8Q8MzqBfL
 TDSS87KfXtEEvE3fYHlVNCDNLWzYq35xwdGg9N5D5to7muXRdHv4sqo8hoYdVLn+aUQOb0X2CJ
 MFpSG99XC7tHjUG6ZlJiHC8cu1Nmo5UJcE9BHCYiXNntXLl2UNiN8alK71VL8WJyB6eJU4FQt+
 PZmmbSZ2Xzo99ockPPTzSP/DWM/LmBmx80rEjY8McaA6vPTrNENk4Q7cHq2e9Hj7xftBZH2azI
 oC0=
From: Hafiz Abid Qadeer <abidh@codesourcery.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] Fix a typo that can cause slow socket response on Windows.
Date: Fri, 29 Jan 2021 14:31:49 +0000
Message-ID: <20210129143149.493012-1-abidh@codesourcery.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Received-SPF: pass client-ip=68.232.141.98;
 envelope-from=abid_qadeer@mentor.com; helo=esa2.mentor.iphmx.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 29 Jan 2021 09:47:18 -0500
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hafiz Abid Qadeer <abid_qadeer@mentor.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We observed slow responses on a host forwarded port on Windows. Investigation revealed that qemu_fd_register was being called with fd=-1 and this caused g_poll in qemu_poll_ns timing out. I tracked this behavior to following commit:
748f8f4 slirp: replace qemu_set_nonblock()

@@ -482,7 +483,8 @@ void tcp_connect(struct socket *inso)
         tcp_close(sototcpcb(so)); /* This will sofree() as well */
         return;
     }
-    qemu_set_nonblock(s);
+    slirp_set_nonblock(s);
+    so->slirp->cb->register_poll_fd(so->s);

It seems that calling register_poll_fd with so->s instead of s may be a typo. Changing it back to s solves this issue. The commit 748f8f4 made similar change in tcp_fconnect but I have not touched it.

Signed-off-by: Hafiz Abid Qadeer <abidh@codesourcery.com>
---
 src/tcp_subr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tcp_subr.c b/src/tcp_subr.c
index a1016d9..1b6d602 100644
--- a/src/tcp_subr.c
+++ b/src/tcp_subr.c
@@ -493,7 +493,7 @@ void tcp_connect(struct socket *inso)
         return;
     }
     slirp_set_nonblock(s);
-    so->slirp->cb->register_poll_fd(so->s, so->slirp->opaque);
+    so->slirp->cb->register_poll_fd(s, so->slirp->opaque);
     slirp_socket_set_fast_reuse(s);
     opt = 1;
     setsockopt(s, SOL_SOCKET, SO_OOBINLINE, &opt, sizeof(int));
-- 
2.25.1


