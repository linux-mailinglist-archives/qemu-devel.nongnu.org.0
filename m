Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A85E444750
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:37:32 +0100 (CET)
Received: from localhost ([::1]:53900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKCZ-0006YZ-9P
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK6F-0001Q2-Hw
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK6D-0001Yc-I4
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56cyg3ToiN4nDVVcf4tmfjZ7QvgUZfiqwwHpGqX5a2o=;
 b=aiIqGbs91x/g5dpneUscRV5NrRmXvSkxulYeZsLo9S2A4Jqy3gbsIhnbn+aNO4Ldathp1/
 k8N8zllqhq6mrqQHjN+Ij+pSign9D9vrbjK3woQ3dIkneFPlHr1UtN6WbSHYOSZGlMc64C
 xl31W+M3NiuA6SPv9EdRHfFeX8AYBkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-WHRPcP-INq6tQlTx8V__YA-1; Wed, 03 Nov 2021 13:30:55 -0400
X-MC-Unique: WHRPcP-INq6tQlTx8V__YA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 062B78AF873
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:33 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 930E65C1C5;
 Wed,  3 Nov 2021 17:30:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/12] qapi/qom: Add class definition for rng-builtin
Date: Wed,  3 Nov 2021 18:30:01 +0100
Message-Id: <20211103173002.209906-12-kwolf@redhat.com>
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This doesn't add any configuration options compared to its parent class,
so this just makes the schema a little more descriptive with no other
code changes.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index a167e91f67..864c6a658b 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -731,6 +731,16 @@
 { 'class': 'rng-backend',
   'config': 'RngProperties' }
 
+##
+# @rng-builtin:
+#
+# Built-in random number generator backend
+#
+# Since: 1.3
+##
+{ 'class': 'rng-builtin',
+  'parent': 'rng-backend' }
+
 ##
 # @RngEgdProperties:
 #
@@ -897,7 +907,7 @@
       'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
                                       'if': 'CONFIG_LINUX' },
       'qtest':                      'QtestProperties',
-      'rng-builtin':                'RngProperties',
+      'rng-builtin':                'qom-config:rng-builtin',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 { 'type': 'qom-config:rng-random',
                                       'if': 'CONFIG_POSIX' },
-- 
2.31.1


