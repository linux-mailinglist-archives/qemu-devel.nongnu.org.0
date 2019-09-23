Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489C0BB390
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 14:21:48 +0200 (CEST)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCNLd-0008Lj-U9
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 08:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iCNHN-0006TS-IX
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iCNHK-0001Vh-KE
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:17:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iCNHK-0001VS-Ex; Mon, 23 Sep 2019 08:17:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B26C618CB903;
 Mon, 23 Sep 2019 12:17:17 +0000 (UTC)
Received: from thuth.com (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D8A600C4;
 Mon, 23 Sep 2019 12:17:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Disallow colons in the parameter of "-accel"
Date: Mon, 23 Sep 2019 14:17:12 +0200
Message-Id: <20190923121712.22971-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Mon, 23 Sep 2019 12:17:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Everybody who used something like "-machine accel=kvm:tcg" in the past
might be tempted to specify a similar list with the -accel parameter,
too, for example "-accel kvm:tcg". However, this is not how this
options is thought to be used, since each "-accel" should only take care
of one specific accelerator.

In the long run, we really should rework the "-accel" code completely,
so that it does not set "-machine accel=..." anymore internally, but
is completely independent from "-machine". For the short run, let's
make sure that users cannot use "-accel xyz:tcg", so that we avoid
that we have to deal with such cases in the wild later.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 vl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/vl.c b/vl.c
index 630f5c5e9c..68f47a9c25 100644
--- a/vl.c
+++ b/vl.c
@@ -3554,6 +3554,11 @@ int main(int argc, char **argv, char **envp)
                     g_slist_free(accel_list);
                     exit(0);
                 }
+                if (optarg && strchr(optarg, ':')) {
+                    error_report("Don't use ':' with -accel, "
+                                 "use -M accel=... in this case instead");
+                    exit(1);
+                }
                 opts = qemu_opts_create(qemu_find_opts("machine"), NULL,
                                         false, &error_abort);
                 qemu_opt_set(opts, "accel", optarg, &error_abort);
-- 
2.18.1


