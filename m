Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF0337830
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:42:28 +0100 (CET)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNSF-0008G4-7s
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMch-0005cT-7C
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcT-00037v-Kd
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaTvfMumD6FDBer+77G0FBPU/mSnRWUtOOv+2Cd2Eww=;
 b=HKZWQbciNEuBRBzz9Q6V4xZYFcDpdHx5G1jgA6EEARGt720QGtKk2BuhB6REWHjD9snb+D
 LV/NXbg/e9Sfi9pxHs57fCI515NPWHtpjSomkTCs43tehSrnjMlWzF1/Vw09RMydfxS5ed
 SOggXiJ5iT8PLTgRXlLhxJs3sAp3lDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-xg85oNiuPS2IczEHzeAR5g-1; Thu, 11 Mar 2021 09:48:54 -0500
X-MC-Unique: xg85oNiuPS2IczEHzeAR5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAEB800D55;
 Thu, 11 Mar 2021 14:48:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BBDD5D9F2;
 Thu, 11 Mar 2021 14:48:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/38] qapi/qom: Add ObjectOptions for pr-manager-helper
Date: Thu, 11 Mar 2021 15:47:57 +0100
Message-Id: <20210311144811.313451-25-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the pr-manager-helper
object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 587b05c0cf..d77e13cf53 100644
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
@@ -653,6 +665,7 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
+    'pr-manager-helper',
     'rng-builtin',
     'rng-egd',
     'rng-random',
@@ -703,6 +716,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'pr-manager-helper':          'PrManagerHelperProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 'RngRandomProperties',
-- 
2.29.2


