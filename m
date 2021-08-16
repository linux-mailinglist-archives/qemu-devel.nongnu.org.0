Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0163EDF10
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:08:36 +0200 (CEST)
Received: from localhost ([::1]:56384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjqV-0007sJ-L0
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mFjoD-0004sy-Hx
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mFjoB-0004qw-DT
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629147970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9lgIWZB9Q254+CZPCuIXjxB1U0EFOzcnpWPNs/WP6M=;
 b=cvzJr+wBed5cPoVvfpskBA2gNTCVowa39Pp+A4CHXCxbEU1ab0TgE9er5bpnQ/92mQkDKK
 UCxZkCwf6ZC5qDkEOxXBZw/CPHCXb3eBd8Eyu6S0ILVHqlWTg7S8tvliUN+uTHWYoynAR4
 9aM+uU/vjydDxgHDaJ9GFxE/Qj1zbMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-cVNYUExAPy2zedTstS7rxg-1; Mon, 16 Aug 2021 17:06:07 -0400
X-MC-Unique: cVNYUExAPy2zedTstS7rxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A47A3802922;
 Mon, 16 Aug 2021 21:06:06 +0000 (UTC)
Received: from localhost (unknown [10.22.10.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6A22C00F;
 Mon, 16 Aug 2021 21:06:06 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] machine: Disallow specifying topology parameters as zero
Date: Mon, 16 Aug 2021 17:06:03 -0400
Message-Id: <20210816210603.42337-2-ehabkost@redhat.com>
In-Reply-To: <20210816210603.42337-1-ehabkost@redhat.com>
References: <20210816210603.42337-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

In the SMP configuration, we should either provide a topology
parameter with a reasonable value (greater than zero) or just
omit it and QEMU will compute the missing value. Users should
have never provided a configuration with parameters as zero
(e.g. -smp 8,sockets=0) which should be treated as invalid.

But commit 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
has added some doc which implied that 'anything=0' is valid and
has the same semantics as omitting a parameter.

To avoid meaningless configurations possibly introduced by users
in the future and consequently a necessary deprecation process,
fix the doc and also add the corresponding sanity check.

Fixes: 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Tested-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210816024522.143124-2-wangyanan55@huawei.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/machine.c | 14 ++++++++++++++
 qapi/machine.json |  6 +++---
 qemu-options.hx   | 12 +++++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587dd..a7e119469aa 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -832,6 +832,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    /*
+     * A specified topology parameter must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        error_setg(errp, "CPU topology parameters must be greater than zero");
+        goto out_free;
+    }
+
     mc->smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb2..9272cb3cf8b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1288,8 +1288,8 @@
 ##
 # @SMPConfiguration:
 #
-# Schema for CPU topology configuration.  "0" or a missing value lets
-# QEMU figure out a suitable value based on the ones that are provided.
+# Schema for CPU topology configuration. A missing value lets QEMU
+# figure out a suitable value based on the ones that are provided.
 #
 # @cpus: number of virtual CPUs in the virtual machine
 #
@@ -1297,7 +1297,7 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per thread in the CPU topology
+# @cores: number of cores per die in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920f..aee622f577d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -227,11 +227,13 @@ SRST
     of computing the CPU maximum count.
 
     Either the initial CPU count, or at least one of the topology parameters
-    must be specified. Values for any omitted parameters will be computed
-    from those which are given. Historically preference was given to the
-    coarsest topology parameters when computing missing values (ie sockets
-    preferred over cores, which were preferred over threads), however, this
-    behaviour is considered liable to change.
+    must be specified. The specified parameters must be greater than zero,
+    explicit configuration like "cpus=0" is not allowed. Values for any
+    omitted parameters will be computed from those which are given.
+    Historically preference was given to the coarsest topology parameters
+    when computing missing values (ie sockets preferred over cores, which
+    were preferred over threads), however, this behaviour is considered
+    liable to change.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.31.1


