Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D299B33144B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:12:21 +0100 (CET)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJQa-0003mJ-R8
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBH-0003wd-AW
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJB9-0008OK-CP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Nl8RFf8EAHNlAq+0ppc/JSVVYHnYUTrEVm4qCv3AMM=;
 b=METUa8PIeAWWKZy4P7nACL2msLb5N4zPVh43KBNg5MVYZAv/uIPwF/XqMMHX1tyUFP1oSQ
 SoXvNNDB88Cht+dUYkvq5cP6ECrkDKIdVRjjPA3yNH3iixLWaJvNeK8w31lFDV17NSyNmp
 gAVBUiTHu41DWfDeZeLwuuUTlDnY398=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-bFg_5oaqOCm5hch1V2EGHg-1; Mon, 08 Mar 2021 11:56:20 -0500
X-MC-Unique: bFg_5oaqOCm5hch1V2EGHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A4CBE5760;
 Mon,  8 Mar 2021 16:56:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453D95D9DB;
 Mon,  8 Mar 2021 16:56:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/30] qapi/qom: Add ObjectOptions for pr-manager-helper
Date: Mon,  8 Mar 2021 17:54:24 +0100
Message-Id: <20210308165440.386489-15-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the pr-manager-helper
object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 6fe775bd83..6afac9169f 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -577,6 +577,18 @@
             '*hugetlbsize': 'size',
             '*seal': 'bool' } }
 
+##
+# @PrManagerHelperProperties:
+#
+# Properties for pr-manager-helper objects.
+#
+# @path: the path to a Unix domain socket for connecting to the external helper
+#
+# Since: 2.11
+##
+{ 'struct': 'PrManagerHelperProperties',
+  'data': { 'path': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -651,6 +663,7 @@
     'memory-backend-file',
     'memory-backend-memfd',
     'memory-backend-ram',
+    'pr-manager-helper',
     'rng-builtin',
     'rng-egd',
     'rng-random',
@@ -701,6 +714,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'pr-manager-helper':          'PrManagerHelperProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 'RngRandomProperties',
-- 
2.29.2


