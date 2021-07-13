Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A641D3C74A2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:35:55 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LNy-0007Xa-O4
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJI-00065c-2K
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJG-0006SC-H1
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ncj6UfgXfyYJVu5Zq2gUhaIY6oM9Yvm7OvqcPJwCBg=;
 b=KKxj0zTv5780RWoAQue9Jtj3Kmylig3GbSpjAikivkP08T/DTTpcZmaTLGdldv06gWwmJb
 mZYjMQG7jZVYNY0OAOsTeAblEWWFIEDoXk+j35VIJqvrZnsQ9iO3pc3o4OSvKAkpk21ppd
 GQa32nVH5ZEBlrpbIvqupjTDwKW78gQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-CWe_94lTN_6-rIDcswg9pA-1; Tue, 13 Jul 2021 12:31:00 -0400
X-MC-Unique: CWe_94lTN_6-rIDcswg9pA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 763305074D;
 Tue, 13 Jul 2021 16:30:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B7B260C05;
 Tue, 13 Jul 2021 16:30:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] qemu-options: re-arrange CPU topology options
Date: Tue, 13 Jul 2021 17:30:49 +0100
Message-Id: <20210713163051.2133045-3-berrange@redhat.com>
In-Reply-To: <20210713163051.2133045-1-berrange@redhat.com>
References: <20210713163051.2133045-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The list of CPU topology options are presented in a fairly arbitrary
order currently. Re-arrange them so that they're ordered from largest to
smallest unit

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dabc83..6b72617844 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -196,17 +196,17 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
+    "-smp [cpus=]n[,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
-    "                maxcpus= maximum number of total cpus, including\n"
+    "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
-    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
-    "                threads= number of threads on one CPU core\n"
+    "                sockets= number of discrete sockets in the system\n"
     "                dies= number of CPU dies on one socket (for PC only)\n"
-    "                sockets= number of discrete sockets in the system\n",
+    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
+    "                threads= number of threads on one CPU core\n",
         QEMU_ARCH_ALL)
 SRST
-``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
+``-smp [cpus=]n[,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
     Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
     are supported. On Sparc32 target, Linux limits the number of usable
     CPUs to 4. For the PC target, the number of cores per die, the
-- 
2.31.1


