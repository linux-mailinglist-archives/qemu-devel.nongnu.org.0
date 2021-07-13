Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B33C7497
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:33:22 +0200 (CEST)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LLV-0000fz-3z
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJN-0006DS-9L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJK-0006UM-FA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mrGQC4nMimEf69c2Haf7GIkeBy/SGGf2OzTrY/k8/o=;
 b=F/GD45ko2KX1Fao6BXtGe9TJr8GPWnoza2RKY/wSwzYrHph7wBxDp+8R8hxw9pTb3/EyBv
 7KRek1sQaZHklkL3UP/+KXsE6N/2r5YRNFuc+W8TI44gS+e0zgWcvsLxwmOCgX2xImumqj
 H27PQrb+bV2STjXGplVAY1h3O+MioRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-iLTgZ6REOhqfDnCDfeSlAw-1; Tue, 13 Jul 2021 12:31:02 -0400
X-MC-Unique: iLTgZ6REOhqfDnCDfeSlAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8DD518414A3;
 Tue, 13 Jul 2021 16:31:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4C2860C05;
 Tue, 13 Jul 2021 16:30:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] qemu-options: tweak to show that CPU count is optional
Date: Tue, 13 Jul 2021 17:30:50 +0100
Message-Id: <20210713163051.2133045-4-berrange@redhat.com>
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
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The initial CPU count number is not required, if any of the topology
options are given, since it can be computed.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 6b72617844..14ff35dd4e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -196,7 +196,7 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [cpus=]n[,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
+    "-smp [[cpus=]n][,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
@@ -206,7 +206,7 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "                threads= number of threads on one CPU core\n",
         QEMU_ARCH_ALL)
 SRST
-``-smp [cpus=]n[,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
+``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
     Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
     are supported. On Sparc32 target, Linux limits the number of usable
     CPUs to 4. For the PC target, the number of cores per die, the
-- 
2.31.1


