Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56619687065
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:13:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKPl-0001XX-Vw; Wed, 01 Feb 2023 16:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPk-0001WO-Ae
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPi-0003gO-8z
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybriR74drHlRAEAQF8rbl5sN7iUBs3zLUCO6HyZbwMU=;
 b=VasPufCKncUaK7cwj8yzo5NSZqaPq6Vl9kCzCYN9xxpSUhWKI8hB9VBne1BDFJ4O6YNV7g
 VpFKZmaFh9cy3e+NHD4Ss4rh0hVzQjpGdCxtEQs7gKwxa8m1wTkkBmeVTHM0b5+fBmeFVj
 hEyw5IJx49jCgZpkx1Jo3ebAUIGX0C4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-V-LhywrRPz6ukhDLkrgZ9A-1; Wed, 01 Feb 2023 16:13:01 -0500
X-MC-Unique: V-LhywrRPz6ukhDLkrgZ9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AFA03C02550;
 Wed,  1 Feb 2023 21:13:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A05C42026D4B;
 Wed,  1 Feb 2023 21:13:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 5/5] docs: add throttle filter description
Date: Wed,  1 Feb 2023 16:12:34 -0500
Message-Id: <20230201211234.301918-6-stefanha@redhat.com>
In-Reply-To: <20230201211234.301918-1-stefanha@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/system/qemu-block-drivers.rst.inc | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index af72817763..ea4be5c210 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -1004,3 +1004,113 @@ some additional tasks, hooking io requests.
   .. option:: prealloc-size
 
     How much to preallocate (in bytes), default 128M.
+
+.. program:: filter-drivers
+.. option:: throttle
+
+  The throttle filter driver rate limits I/O requests so that the given IOPS
+  and bandwidth values are not exceeded. Limits are specified using the
+  following syntax::
+
+     --object '{"driver":"throttle-group","id":"tg0","limits":{"iops-total":2048,"bps-total":10485760}}'
+
+  The following throttle group limits are available:
+
+  .. program:: throttle-group
+  .. option:: iops-total
+
+    Limit total I/O operations per second.
+
+  .. option:: iops-total-max
+
+    I/O operations burst.
+
+  .. option:: iops-total-max-length
+
+    Length of the ``iops-total-max`` burst period, in seconds. It must only be
+    set if ``iops-total-max`` is set as well.
+
+  .. option:: iops-read
+
+    Limit read operations per second.
+
+  .. option:: iops-read-max
+
+     I/O operations read burst.
+
+  .. option:: iops-read-max-length
+
+    Length of the ``iops-read-max`` burst period, in seconds. It must only be
+    set if ``iops-read-max`` is set as well.
+
+  .. option:: iops-write
+
+    Limit write operations per second.
+
+  .. option:: iops-write-max
+
+    I/O operations write burst.
+
+  .. option:: iops-write-max-length
+
+    Length of the ``iops-write-max`` burst period, in seconds. It must only be
+    set if ``iops-write-max`` is set as well.
+
+  .. option:: bps-total
+
+    Limit total bytes per second.
+
+  .. option:: bps-total-max
+
+    Total bytes burst.
+
+  .. option:: bps-total-max-length
+
+    Length of the ``bps-total-max`` burst period, in seconds. It must only be
+    set if ``bps-total-max`` is set as well.
+
+  .. option:: bps-read
+
+    Limit read bytes per second.
+
+  .. option:: bps-read-max
+
+    Total bytes read burst.
+
+  .. option:: bps-read-max-length
+
+    Length of the ``bps-read-max`` burst period, in seconds. It must only be
+    set if ``bps-read-max`` is set as well.
+
+  .. option:: bps-write
+
+    Limit write bytes per second.
+
+  .. option:: bps-write-max
+
+    Total bytes write burst.
+
+  .. option:: bps-write-max-length
+
+    Length of the ``bps-write-max`` burst period, in seconds. It must only be
+    set if ``bps-write-max`` is set as well.
+
+  .. option:: iops-size
+
+    IOPS are counted as a multiple of this value, in bytes. For example, a 16
+    KB read request is counted as 4 IOPS when ``iops-size`` is 4 KB.
+
+  Throttle groups are defined separately from throttle blockdevs so they can be
+  shared by multiple blockdevs.
+
+  Note that the location of the throttle blockdev in the graph is significant.
+  Usually it will be one of the topmost nodes so that guest I/O requests are
+  throttled. When the throttle blockdev is located below a format driver it may
+  see a different I/O pattern due to image format metadata I/O.
+
+  Supported runtime options:
+
+  .. program:: throttle
+  .. option:: throttle-group
+
+    The id of the throttle group object that defines the I/O limits.
-- 
2.39.1


