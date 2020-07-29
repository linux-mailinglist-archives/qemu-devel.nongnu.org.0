Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6432325DE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 22:07:40 +0200 (CEST)
Received: from localhost ([::1]:46242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0sMV-0001UV-Hc
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 16:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <T.E.Baldwin99@members.leeds.ac.uk>)
 id 1k0sLm-00014R-Jw
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 16:06:54 -0400
Received: from [31.132.33.241] (port=47472 helo=pi.majoroak.me.uk)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <T.E.Baldwin99@members.leeds.ac.uk>)
 id 1k0sLk-0000sI-S3
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 16:06:54 -0400
Received: from [2001:470:1f09:8f6:2e0:4cff:fe39:267e]
 by pi.majoroak.me.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <T.E.Baldwin99@members.leeds.ac.uk>)
 id 1k0sLf-0001t3-4P; Wed, 29 Jul 2020 21:06:48 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
From: Timothy Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
Message-ID: <72cc725c-f344-b7f1-d559-401867067d80@members.leeds.ac.uk>
Date: Wed, 29 Jul 2020 21:06:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-SA-Exim-Connect-IP: 2001:470:1f09:8f6:2e0:4cff:fe39:267e
X-SA-Exim-Mail-From: T.E.Baldwin99@members.leeds.ac.uk
Subject: [PATCH] linux-user: Map signal numbers in fcntl
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pi.majoroak.me.uk)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 31.132.33.241 (failed)
Received-SPF: none client-ip=31.132.33.241;
 envelope-from=T.E.Baldwin99@members.leeds.ac.uk; helo=pi.majoroak.me.uk
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 16:06:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

Map signal numbers in fcntl F_SETSIG and F_GETSIG.

Signed-off-by: Timothy E Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
---
  linux-user/syscall.c | 10 ++++++++--
  1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 945fc25279..8456bad109 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6583,10 +6583,16 @@ static abi_long do_fcntl(int fd, int cmd, 
abi_ulong arg)
          break;
  #endif

-    case TARGET_F_SETOWN:
-    case TARGET_F_GETOWN:
      case TARGET_F_SETSIG:
+        ret = get_errno(safe_fcntl(fd, host_cmd, 
target_to_host_signal(arg)));
+        break;
+
      case TARGET_F_GETSIG:
+        ret = host_to_target_signal(get_errno(safe_fcntl(fd, host_cmd, 
arg)));
+        break;
+
+    case TARGET_F_SETOWN:
+    case TARGET_F_GETOWN:
      case TARGET_F_SETLEASE:
      case TARGET_F_GETLEASE:
      case TARGET_F_SETPIPE_SZ:
-- 
2.25.1



