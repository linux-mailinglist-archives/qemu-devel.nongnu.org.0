Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B45EC615
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:29:32 +0200 (CEST)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBaV-00023H-0b
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od9wU-0004Km-12
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:44:06 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od9wR-0006RM-6U
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:44:05 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MEC8L-1oVhpT48ft-00AD4X; Tue, 27
 Sep 2022 14:43:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 0/2] linux-user: handle /proc/self/exe with execve() syscall
Date: Tue, 27 Sep 2022 14:43:55 +0200
Message-Id: <20220927124357.688536-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xLpn1GHM7HBcpa4ncdr/ERYKkAHU0AJl/Zn1fa1oZVg+8ZDHvUp
 6k3W0qSoq1t4yi3XE6LjL5lmUGMlnQjOlu7ttM80LA7zblJDpsA7QAa1LyFMUmflCkmQh7J
 VmtCb/HBpyOmSsLs1Ghi09QsD1CSEkb+L/wp/VWJYsRx9ByXBrEZPaYOMjltMFJm32wOSlk
 TOv8yfh9hlDmVbN3qAQBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H+hUSDX64Uw=:1P8+AIZ/R2qREeOC9Hs6Uo
 p7QicaY4V1PH/aTNplSd2KDex2/3g6dIbwys/ZW6q0poFpCeyQ5Zor9jf42iVpPLnoY+GdlbT
 CWJwOc5dIxw2HU8/nuWRhDztPuMiQ4L2ZuZBNeTro8QDdPc5OVcC1vWnoKznbJ7n/lorZyB5N
 GfjJM8e14HM0t/9Nfiecrf8RKCVpOFD6RArpqEw5HKomJz/Py4G0fQzNgTEZc3ff3H3wS+URd
 0yRqUZEwGaPrBlqo9SgKIMkXBhnUuYkhlTFXIWS+UccQqMsXeNkDTbnHz/R4Ymbepsnkb1rC2
 xJ6lFEBDDuSK8WGiyqfYVaLtgjnMcMo5Wf+eP2774CDK8R0pDrq3MnsfB21Cfd1UzUaOanJVd
 9VobpYjsE9V4pQ3BzM46xdKmDOyQnqjv0/NDGlA8Epas5MnVFrv2M02oo+oAHcOuRQhK149Br
 w9qJWQYNsYuNF86q9LEsIUQa7FBWmfzWv12Ld3T6Zk9cWQXWg522O4WhYAA1ILwyF2Esc71YT
 JqEvlYWmC9OKrqXLVgCvKdJBCE9thxMVliawVC8akFAVYgLxdWKDyauw2CHuKnRgj+reFbHiu
 ZoiwpWGKXgAjxUd/32/O1eOSA5vhYdJkPD+6DKatVihsApBIwgoKfRyd7isZQq7zdIfsQ5opU
 SuNSweLqD7tp32X6rC/AfpeeN+BzeINfZZH2JUxOqaz5qighXqjQezP5FzWeQr1chmWFR9wYK
 rSiLnt9SbSzcSHLSRdMJfXK0vhw71AkbS31+VuvwbT0lkc9tAAdRmGFmSrv4klF0FKZ2WrBGR
 CaOzXbu
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use exec_path to re-execute the binary from /proc/self/exe

Fix do_openat() that should not use execfd.

v2:
- don't use execfd as it can't be closed and is usable by the child

Laurent Vivier (2):
  linux-user: handle /proc/self/exe with execve() syscall
  linux-user: don't use AT_EXECFD in do_openat()

 linux-user/syscall.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.37.3


