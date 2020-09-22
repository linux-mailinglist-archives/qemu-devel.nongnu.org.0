Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D2273B63
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 09:04:55 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKcMA-0000cw-J6
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 03:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dtc-ubuntu@scieneer.com>)
 id 1kKZkl-0004jc-Uf
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 00:18:07 -0400
Received: from gw1.scieneer.com ([2001:470:5:c1c::1]:37982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dtc-ubuntu@scieneer.com>)
 id 1kKZkj-0002I0-8G
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 00:18:07 -0400
Received: from dtc-pc.scieneer.com (dtc-pc.scieneer.com [192.168.2.100])
 by gw1.scieneer.com (8.14.7/8.14.7) with ESMTP id 08M4HuWm010000
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 22 Sep 2020 14:17:58 +1000
From: Douglas Crosher <dtc-ubuntu@scieneer.com>
Subject: [PATCH] helper_syscall x86_64: clear exception_is_int
To: qemu-devel@nongnu.org
Message-ID: <a7dab33e-eda6-f988-52e9-f3d32db7538d@scieneer.com>
Date: Tue, 22 Sep 2020 14:17:56 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:470:5:c1c::1;
 envelope-from=dtc-ubuntu@scieneer.com; helo=gw1.scieneer.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Sep 2020 03:01:54 -0400
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


The exception_is_int flag may be set on entry to helper_syscall,
e.g. after a prior interrupt that has returned, and processing
EXCP_SYSCALL as an interrupt causes it to fail so clear this flag.

Signed-off-by: Douglas Crosher <dtc-ubuntu@scieneer.com>
---
  target/i386/seg_helper.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
index b96de068ca..be88938c2a 100644
--- a/target/i386/seg_helper.c
+++ b/target/i386/seg_helper.c
@@ -975,6 +975,7 @@ void helper_syscall(CPUX86State *env, int 
next_eip_addend)
      CPUState *cs = env_cpu(env);

      cs->exception_index = EXCP_SYSCALL;
+    env->exception_is_int = 0;
      env->exception_next_eip = env->eip + next_eip_addend;
      cpu_loop_exit(cs);
  }
-- 
2.25.4


