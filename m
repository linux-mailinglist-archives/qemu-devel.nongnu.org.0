Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A892C8466
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:54:34 +0100 (CET)
Received: from localhost ([::1]:35208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjihN-0007ex-GF
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiHs-0002MD-0k
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiHq-0002wP-AX
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MXxT8RqDFU/4dqy4lqiZsuLfBnk4s871jZRVCd4qZo=;
 b=L35qJ9l2GcFgln+BBPQbM20HoJBsw7rgKsY7SG7Pq4DmfDGVZ4z4tqwZrZqgDEMUQ2rAni
 PGkawIlrfSyNND65gWt9nZHlZhLk/HN3ZCjUaNX003TSu277I4aHsZAgg0+1ntY4j6A/rm
 G9ZkO6f94VKp6K/NhE0Ozp+O41tevEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-PxQ4rdN9Nd2f7AQe6Ltx5Q-1; Mon, 30 Nov 2020 07:28:08 -0500
X-MC-Unique: PxQ4rdN9Nd2f7AQe6Ltx5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04B4057090;
 Mon, 30 Nov 2020 12:28:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE08B19C71;
 Mon, 30 Nov 2020 12:27:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/18] qapi/qom: Add ObjectOptions for pr-manager-helper
Date: Mon, 30 Nov 2020 13:25:33 +0100
Message-Id: <20201130122538.27674-14-kwolf@redhat.com>
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the pr-manager-helper
object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index c8ee02081c..24bfa83af5 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -563,6 +563,18 @@
             '*hugetlbsize': 'size',
             '*seal': 'bool' } }
 
+##
+# @PrManagerHelperProperties:
+#
+# Properties for pr-manager-helper objects.
+#
+# @path: the path to a Unix domain socket for connecting to the external helper
+#
+# Since: 6.0
+##
+{ 'struct': 'PrManagerHelperProperties',
+  'data': { 'path': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -637,6 +649,7 @@
     'memory-backend-file',
     'memory-backend-memfd',
     'memory-backend-ram',
+    'pr-manager-helper',
     'rng-builtin',
     'rng-egd',
     'rng-random',
@@ -685,6 +698,7 @@
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       'MemoryBackendMemfdProperties',
       'memory-backend-ram':         'MemoryBackendProperties',
+      'pr-manager-helper':          'PrManagerHelperProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 'RngRandomProperties',
-- 
2.28.0


