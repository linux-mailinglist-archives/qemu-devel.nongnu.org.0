Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0344F95D5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 14:32:24 +0200 (CEST)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncnmn-00044e-VA
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 08:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncnj6-0001mf-HV
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncnj1-0008Vv-Bw
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649420906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3c7FxJxiS1SvJJ8iCEzFEJXlV1pVaPOUGzMgzGYcfYk=;
 b=cBUuaCMERxksfPXc/8tvOqWvUUCNFYHBhqJKna6UsygJbN7ovR1mopSN0Oey66gTzEyg63
 hhwExtHAjYZwTMmdDiEhHXL8XmIam7XSjXiKTI5keeC8+sTceybu09GlJfz2r3DJefjlVO
 AitmhwTS1SA+g8b2CqnjztOCvfhXGn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-0Y8LdFdlPMagTLKdSIKaIQ-1; Fri, 08 Apr 2022 08:28:25 -0400
X-MC-Unique: 0Y8LdFdlPMagTLKdSIKaIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 611D0803524;
 Fri,  8 Apr 2022 12:28:25 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FDA8145BA41;
 Fri,  8 Apr 2022 12:28:23 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 andrew@daynix.com, yuri.benditovich@daynix.com, dgilbert@redhat.com,
 quintela@redhat.com
Subject: [PATCH 4/5] docs: introduce RSS support in Vhost-user specification
Date: Fri,  8 Apr 2022 14:28:12 +0200
Message-Id: <20220408122813.1357045-5-maxime.coquelin@redhat.com>
In-Reply-To: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
References: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=maxime.coquelin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: chenbo.xia@intel.com, Maxime Coquelin <maxime.coquelin@redhat.com>,
 dmarchan@redhat.com, ktraynor@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch documents RSS feature in Vhost-user specification.
Two new requests are introduced backed by a dedicated
protocol feature.

First one is to query the Vhost-user slave RSS capabilities
such as supported hash types, maximum key length and
indirection table size.

The second one is to provide the slave with driver's RSS
configuration.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 docs/interop/vhost-user.rst | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 4dbc84fd00..9de6297568 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -258,6 +258,42 @@ Inflight description
 
 :queue size: a 16-bit size of virtqueues
 
+RSS capabilities description
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
++----------------------+-------------+---------------+
+| supported hash types | max key len | max indir len |
++----------------------+-------------+---------------+
+
+:supported hash types: a 32-bit bitfield of supported hash types as defined
+                       in the Virtio specification
+
+:max key len: a 8-bit maximum size of the RSS key
+
+:max indir len: a 16-bits maximum size of the RSS indirection table
+
+RSS data description
+^^^^^^^^^^^^^^^^^^^^
+
++------------+---------+-----+-----------+-------------+---------------+
+| hash types | key len | key | indir len | indir table | default queue |
++------------+---------+-----+-----------+-------------+---------------+
+
+:hash types: a 32-bit bitfield of supported hash types as defined in the
+             Virtio specification
+
+:key len: 8-bit size of the RSS key
+
+:key: a 8-bit array of 52 elements containing the RSS key
+
+:indir len: a 16-bit size of the RSS indirection table
+
+:indir table: a 16-bit array of 512 elements containing the hash indirection
+              table
+
+:default queue: the default queue index for flows not matching requested hash
+                types
+
 C structure
 -----------
 
@@ -858,6 +894,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_NET_RSS              17
 
 Master message types
 --------------------
@@ -1371,6 +1408,26 @@ Master message types
   query the backend for its device status as defined in the Virtio
   specification.
 
+``VHOST_USER_NET_GET_RSS``
+  :id: 41
+  :equivalent ioctl: N/A
+  :slave payload: RSS capabilities description
+  :master payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_NET_RSS`` protocol has been successfully
+  negotiated, this message is submitted by the master to get the RSS
+  capabilities of the slave.
+
+``VHOST_USER_NET_SET_RSS``
+  :id: 42
+  :equivalent ioctl: N/A
+  :slave payload: N/A
+  :master payload: RSS data description
+
+  When the ``VHOST_USER_PROTOCOL_F_NET_RSS`` protocol has been successfully
+  negotiated, this message is submitted by the master to set the RSS
+  configuration defined by the Virtio driver.
+
 
 Slave message types
 -------------------
-- 
2.35.1


