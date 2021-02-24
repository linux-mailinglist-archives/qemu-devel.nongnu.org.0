Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCD323F46
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:54:39 +0100 (CET)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvYk-0004Bw-4S
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQU-0001rO-Aa
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQM-0003TO-Vt
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgngjCam0k6n9s8F9WpRYsDHsQSnHYz2VjdENDHxYZw=;
 b=Rhb2HJsZ9Nghwr9a6kD0ehPv8DfMcMgtktkfpXoryhh6ci2Iqntd03AidTwNtCSu3NOA4q
 zMP9xCdPUPHclHGZ4aADlniAi5ZnqwwBPkMNWa72bqJovDwxfY4j/oxcKP4xp98HF6qYSt
 mJoH4wVnf10InZxYp54XB8acyww6huw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-eBUVyKYNPr-xrXwKJ3rmtQ-1; Wed, 24 Feb 2021 09:45:18 -0500
X-MC-Unique: eBUVyKYNPr-xrXwKJ3rmtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B414B10BBDA2;
 Wed, 24 Feb 2021 13:54:45 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65BC15D6D3;
 Wed, 24 Feb 2021 13:54:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/31] qapi/qom: Add ObjectOptions for pr-manager-helper
Date: Wed, 24 Feb 2021 14:52:39 +0100
Message-Id: <20210224135255.253837-16-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
---
 qapi/qom.json | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index e3357f5123..e7184122e9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -575,6 +575,18 @@
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
@@ -649,6 +661,7 @@
     'memory-backend-file',
     'memory-backend-memfd',
     'memory-backend-ram',
+    'pr-manager-helper',
     'rng-builtin',
     'rng-egd',
     'rng-random',
@@ -697,6 +710,7 @@
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       'MemoryBackendMemfdProperties',
       'memory-backend-ram':         'MemoryBackendProperties',
+      'pr-manager-helper':          'PrManagerHelperProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 'RngRandomProperties',
-- 
2.29.2


