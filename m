Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED460C697
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:37:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMP-0002Fb-2w; Tue, 25 Oct 2022 04:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETx-0001JE-Rr
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:24 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETu-0003GN-K9
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:17 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MmDZI-1pV7s22hX6-00iDpq; Tue, 25
 Oct 2022 09:36:10 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 4/8] linux-user: don't use AT_EXECFD in do_openat()
Date: Tue, 25 Oct 2022 09:36:02 +0200
Message-Id: <20221025073606.3114355-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FasWSiQEGXXU505rB4KLG475g78LV0gnuq3gpwDhTTprLBb9ANd
 VIhRJ8ZkrvIvarB1p6tqf7ivEVbT5R5ilGOxGHMAK9Mn7vH1e4CwwXZhgRCF8RBuHxs52Uf
 GpiFNXlFs9pkstRTPhAIjtDrQHiKGlF+orPOraxXllGdRAKFHsUdWbz54ssF+7ACq92yU1s
 0Hm8dRqCgMlFr09X4EQBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5XZtzPtxoXs=:B0ZtI4BUR7AX3WU4PfaqVo
 IgLtx6JX6cwm6V+d03CT8OJMEMot127AN0W3Cx+swr9XZSEo/2wsvXOudafr/c/q4wawSEU5c
 VCSmyOEoOeuTFoH51MeaIZSUITCGqn/pBdemUQLsODoZy+rhyCCzyJAJxapr0baqGsnc5bGJB
 TvpFWySL9VWXDYwWFn8ciqNFJSC6h9q6XOyYPVTXfAsdIJcQIDV5jQBjGJ9ZoRtcXcnHdeBb+
 5+6OM2pBYNUxfEdw2XEtmhakeRg7r0e1bsuGbGp9FDsWE/gP+Pisg6Rn0xAnOeAjDE8CLrThv
 E1fkD8GySh3tVkRnV0MLOkAeMbg2wZCO06O4pePMvuzfzBVmwchuT2WIVTRV0U3ONNlfAFWSo
 rlzUJt060ci7WpGbZwdX+48DQnByfEmFWD4xcuI5OmyYBKK+kxfAkNQJEvCpRrGkQmbpn69Sb
 RH+drlsn4mlDVr0tiN4d3v5b07yukiDytdzLr+5oVyJrRAXTcpj5Nchdj0KwYUgTXEBGf3Xm0
 mRMzCFr+7eOgTgKlzgYtkvlB2UYdV3p9jtBwbo5ETtciUqApqJPnL1yGwqKeWtINcACf813KY
 GcvvpMdy2JUlP0WjvUjRre7fj+xM+1wrcUgtS7eyYRem4vJhBVVIKQFYzt/2t+JC/UZqwB9ao
 nKrdakEaBtrpgHG8lFy5SG34615suwoYe7xl6dzmRRs5neFQsrwXENiMI7gb2J3z1JVO4aWGD
 fFHdcDqI/J5Tx/CXBgpK/0zqlZwRqCl5VJglbuTeMN5ak0lk+GjhxfrWwhvzyPFRJ1jd0uaeb
 69WL8Ty
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

AT_EXECFD gives access to the binary file even if
it is not readable (only executable).

Moreover it can be opened with flags and mode that are not the ones
provided by do_openat() caller.

And it is not available because loader_exec() has closed it.

To avoid that, use only safe_openat() with the exec_path.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220927124357.688536-3-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a7a29091c91e..665db67c0598 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8251,8 +8251,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        int execfd = qemu_getauxval(AT_EXECFD);
-        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
+        return safe_openat(dirfd, exec_path, flags, mode);
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
-- 
2.37.3


