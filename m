Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B424C6F0C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:12:40 +0100 (CET)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOglT-0006xi-It
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOXZ4-0005WA-Qw; Sun, 27 Feb 2022 23:23:14 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:33182
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOXZ2-0005X1-MN; Sun, 27 Feb 2022 23:23:14 -0500
Received: from [10.31.51.144] (dhcp-10-31-51-144.dyn.MIT.EDU [10.31.51.144])
 (authenticated bits=0) (User authenticated as schaub@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21S4GjXe021826
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 27 Feb 2022 23:16:46 -0500
Message-ID: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
Date: Sun, 27 Feb 2022 23:16:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Simeon Schaub <schaub@mit.edu>
Subject: [PATCH] explicitly link libqemuutil against rt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=schaub@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:40 -0500
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>From e77de12cc33846a3de71d1858e497fbf4cdbff96 Mon Sep 17 00:00:00 2001
From: Simeon David Schaub <schaub@mit.edu>
Date: Sun, 27 Feb 2022 22:59:19 -0500
Subject: [PATCH] explicitly link libqemuutil against rt

Qemu uses `clock_gettime` which is already part of more recent versions
of glibc, but on older versions it is still required to link against
librt.

Discovered in https://github.com/JuliaPackaging/Yggdrasil/pull/4506

Signed-off-by: Simeon David Schaub <schaub@mit.edu>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..dcf2f43940 100644
--- a/meson.build
+++ b/meson.build
@@ -2730,7 +2730,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
+                             dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman, rt])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
-- 
2.35.1

