Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE532326427
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 15:36:45 +0100 (CET)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFeEW-00015F-OF
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 09:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFeCL-0007qo-O9
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFeCJ-0006Zp-Qn
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 09:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614350067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69wESN3LuKalL3jBfBkxQjy769pvXq93ikOmztji/I4=;
 b=I6ZPwKFcc4SgdzAjBT+Yq5dxX9XcnWoldOsbRap18IxOO7oCtQpTIIOfcn7vspVRphUya6
 VRoaAyTputvh7uXBgHb2/iSJyfHQmTSxKSTj2VhA0hCMU6jPc7LPipBqy3CZgpwDIkxA+m
 RWfkWTq6mojW5PlsR/Ddf7XK/k2SxIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-USdUHa0tP2OKiKA3fQDvZQ-1; Fri, 26 Feb 2021 09:34:24 -0500
X-MC-Unique: USdUHa0tP2OKiKA3fQDvZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E740A801975;
 Fri, 26 Feb 2021 14:34:23 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 747F45B4A1;
 Fri, 26 Feb 2021 14:34:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] docs: vhost-user: rewrite section on ring state machine
Date: Fri, 26 Feb 2021 09:34:12 -0500
Message-Id: <20210226143413.188046-3-pbonzini@redhat.com>
In-Reply-To: <20210226143413.188046-1-pbonzini@redhat.com>
References: <20210226143413.188046-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: mst@redhat.com, jag.raman@oracle.com, stefanha@redhat.com,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This section is using the word "back-end" to refer to the
"slave's back-end", and talking about the "client" for
what the rest of the document calls the "slave".

Rework it to free the use of the term "back-end", which in
the next patch will replace "slave".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/interop/vhost-user.rst | 46 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 6bbc092958..028ff98eac 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -307,40 +307,36 @@ bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
-Starting and stopping rings
----------------------------
+Ring states
+-----------
 
-Client must only process each ring when it is started.
+Rings can be in one of three states:
 
-Client must only pass data between the ring and the backend, when the
-ring is enabled.
+* stopped: the slave must not process the ring at all.
 
-If ring is started but disabled, client must process the ring without
-talking to the backend.
+* started but disabled: the slave must process the ring without
+  causing any side effects.  For example, for a networking device,
+  in the disabled state the slave must not supply any new RX packets,
+  but must process and discard any TX packets.
 
-For example, for a networking device, in the disabled state client
-must not supply any new RX packets, but must process and discard any
-TX packets.
+* started and enabled.
 
-If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
-ring is initialized in an enabled state.
+Each ring is initialized in a stopped state.  The slave must start
+ring upon receiving a kick (that is, detecting that file descriptor is
+readable) on the descriptor specified by ``VHOST_USER_SET_VRING_KICK``
+or receiving the in-band message ``VHOST_USER_VRING_KICK`` if negotiated,
+and stop ring upon receiving ``VHOST_USER_GET_VRING_BASE``.
 
-If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
-initialized in a disabled state. Client must not pass data to/from the
-backend until ring is enabled by ``VHOST_USER_SET_VRING_ENABLE`` with
-parameter 1, or after it has been disabled by
-``VHOST_USER_SET_VRING_ENABLE`` with parameter 0.
+Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.
 
-Each ring is initialized in a stopped state, client must not process
-it until ring is started, or after it has been stopped.
+If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
+ring starts directly in the enabled state.
 
-Client must start ring upon receiving a kick (that is, detecting that
-file descriptor is readable) on the descriptor specified by
-``VHOST_USER_SET_VRING_KICK`` or receiving the in-band message
-``VHOST_USER_VRING_KICK`` if negotiated, and stop ring upon receiving
-``VHOST_USER_GET_VRING_BASE``.
+If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
+initialized in a disabled state and is enabled by
+``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
 
-While processing the rings (whether they are enabled or not), client
+While processing the rings (whether they are enabled or not), the slave
 must support changing some configuration aspects on the fly.
 
 Multiple queue support
-- 
2.26.2



