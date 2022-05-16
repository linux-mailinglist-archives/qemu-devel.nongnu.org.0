Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12852930D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:42:44 +0200 (CEST)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiUF-0006Ol-25
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjf-0001eE-6c
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjb-0006ku-TW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVwXFO1hJL47BNFzbCVhsJOhFL0tZuoDDouWV+nNtcc=;
 b=bQ0stS/dQ6LivWtqM91w+2PTlRTJSCSLcvNw8l9ihDC4u0rROwdZUeenB3lDqoEoQB4rFv
 PDgi9Dx9hk0xsN6uV8tlhAEidlbitUc8e7Rqnc6hg6SeJP0N/d9W5WCmV6C/2LV1xCJY17
 +TBCsVJuzAyjXg0CYtYsIcoRjRotAYk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-LTXqzE6WMVyON2jT3p6HWg-1; Mon, 16 May 2022 16:54:26 -0400
X-MC-Unique: LTXqzE6WMVyON2jT3p6HWg-1
Received: by mail-ed1-f70.google.com with SMTP id
 q12-20020a056402040c00b0042a84f9939dso4550787edv.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EVwXFO1hJL47BNFzbCVhsJOhFL0tZuoDDouWV+nNtcc=;
 b=6mEcC7A0qSNflH19Dv9tl7K4DsTwanewWnXwngKZV0JigtIapYX9PnAvh6DKeKwQSE
 ShbWaiUf+cRTnIb12Z6laV3hw6QwOJYBSjcpCRyFbBXhXYe4RN2wfNGqnylQAPYntN8Y
 oFZ2SE9RT36wQ5RC5mPKITeivBnZorhqiMizJUnzu+5wCOzE0aZO//Y2FG4eLV94iqot
 0q6fycJDsCWJCjWHzrYFkGnck6jy+YjQuNf/t5oeRNSTpPAWqBuyfhZKSp0WkIYbxh/3
 y68w96Hp3P/LMxbHEGmEtYT16OWt5onsT7Wkm9UbVklvSiXgOfl9aHmOr2DPN/28e+51
 aVDg==
X-Gm-Message-State: AOAM5304rbStN7sRH6ds4zthZcNcuzuYh9rZ7tTq8HqH5AoWtgXTyRgU
 80PBTObnopFz/seBRZ/ZhcynBpqm1NBol0Q4pyqFz+LOqyfcU6kVJqUn30KOrLTxouZ+UCid4Da
 PdrAEW7UPfH0CSMhA+o6HP1qDAvJMV0L2+1bLZDiqkTiDvnb04DnNglkUwqyr
X-Received: by 2002:aa7:cb55:0:b0:42a:ac67:892f with SMTP id
 w21-20020aa7cb55000000b0042aac67892fmr9285340edt.215.1652734464413; 
 Mon, 16 May 2022 13:54:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSvObN/QIenfzK4fNFoQfzLvjSmRGY63pDn339YJzrB/gRhkhsvh9xqCS+1rIrG65pamHS+Q==
X-Received: by 2002:aa7:cb55:0:b0:42a:ac67:892f with SMTP id
 w21-20020aa7cb55000000b0042aac67892fmr9285313edt.215.1652734463957; 
 Mon, 16 May 2022 13:54:23 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 jl16-20020a17090775d000b006f3ef214dedsm169865ejc.83.2022.05.16.13.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:23 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 61/86] docs: vhost-user: clean up request/reply description
Message-ID: <20220516204913.542894-62-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

It is not necessary to mention which side is sending/receiving
each payload; it is more interesting to say which is the request
and which is the reply.  This also matches what vhost-user-gpu.rst
already does.

While at it, ensure that all messages list both the request and
the reply payload.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210226143413.188046-2-pbonzini@redhat.com>
Message-Id: <20220321153037.3622127-5-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/interop/vhost-user.rst | 163 +++++++++++++++++++++---------------
 1 file changed, 95 insertions(+), 68 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index f9e721ba5f..1039e7a34e 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -866,8 +866,8 @@ Master message types
 ``VHOST_USER_GET_FEATURES``
   :id: 1
   :equivalent ioctl: ``VHOST_GET_FEATURES``
-  :master payload: N/A
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Get from the underlying vhost implementation the features bitmask.
   Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals slave support
@@ -877,7 +877,8 @@ Master message types
 ``VHOST_USER_SET_FEATURES``
   :id: 2
   :equivalent ioctl: ``VHOST_SET_FEATURES``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Enable features in the underlying vhost implementation using a
   bitmask.  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals
@@ -887,8 +888,8 @@ Master message types
 ``VHOST_USER_GET_PROTOCOL_FEATURES``
   :id: 15
   :equivalent ioctl: ``VHOST_GET_FEATURES``
-  :master payload: N/A
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Get the protocol feature bitmask from the underlying vhost
   implementation.  Only legal if feature bit
@@ -903,7 +904,8 @@ Master message types
 ``VHOST_USER_SET_PROTOCOL_FEATURES``
   :id: 16
   :equivalent ioctl: ``VHOST_SET_FEATURES``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Enable protocol features in the underlying vhost implementation.
 
@@ -917,7 +919,8 @@ Master message types
 ``VHOST_USER_SET_OWNER``
   :id: 3
   :equivalent ioctl: ``VHOST_SET_OWNER``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Issued when a new connection is established. It sets the current
   *master* as an owner of the session. This can be used on the *slave*
@@ -925,7 +928,8 @@ Master message types
 
 ``VHOST_USER_RESET_OWNER``
   :id: 4
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
 .. admonition:: Deprecated
 
@@ -938,8 +942,8 @@ Master message types
 ``VHOST_USER_SET_MEM_TABLE``
   :id: 5
   :equivalent ioctl: ``VHOST_SET_MEM_TABLE``
-  :master payload: memory regions description
-  :slave payload: (postcopy only) memory regions description
+  :request payload: memory regions description
+  :reply payload: (postcopy only) memory regions description
 
   Sets the memory map regions on the slave so it can translate the
   vring addresses. In the ancillary data there is an array of file
@@ -962,8 +966,8 @@ Master message types
 ``VHOST_USER_SET_LOG_BASE``
   :id: 6
   :equivalent ioctl: ``VHOST_SET_LOG_BASE``
-  :master payload: u64
-  :slave payload: N/A
+  :request payload: u64
+  :reply payload: N/A
 
   Sets logging shared memory space.
 
@@ -975,44 +979,48 @@ Master message types
 ``VHOST_USER_SET_LOG_FD``
   :id: 7
   :equivalent ioctl: ``VHOST_SET_LOG_FD``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Sets the logging file descriptor, which is passed as ancillary data.
 
 ``VHOST_USER_SET_VRING_NUM``
   :id: 8
   :equivalent ioctl: ``VHOST_SET_VRING_NUM``
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Set the size of the queue.
 
 ``VHOST_USER_SET_VRING_ADDR``
   :id: 9
   :equivalent ioctl: ``VHOST_SET_VRING_ADDR``
-  :master payload: vring address description
-  :slave payload: N/A
+  :request payload: vring address description
+  :reply payload: N/A
 
   Sets the addresses of the different aspects of the vring.
 
 ``VHOST_USER_SET_VRING_BASE``
   :id: 10
   :equivalent ioctl: ``VHOST_SET_VRING_BASE``
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Sets the base offset in the available vring.
 
 ``VHOST_USER_GET_VRING_BASE``
   :id: 11
   :equivalent ioctl: ``VHOST_USER_GET_VRING_BASE``
-  :master payload: vring state description
-  :slave payload: vring state description
+  :request payload: vring state description
+  :reply payload: vring state description
 
   Get the available vring base offset.
 
 ``VHOST_USER_SET_VRING_KICK``
   :id: 12
   :equivalent ioctl: ``VHOST_SET_VRING_KICK``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor for adding buffers to the vring. It is
   passed in the ancillary data.
@@ -1030,7 +1038,8 @@ Master message types
 ``VHOST_USER_SET_VRING_CALL``
   :id: 13
   :equivalent ioctl: ``VHOST_SET_VRING_CALL``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor to signal when buffers are used. It is
   passed in the ancillary data.
@@ -1048,7 +1057,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ERR``
   :id: 14
   :equivalent ioctl: ``VHOST_SET_VRING_ERR``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor to signal when error occurs. It is
   passed in the ancillary data.
@@ -1065,8 +1075,8 @@ Master message types
 ``VHOST_USER_GET_QUEUE_NUM``
   :id: 17
   :equivalent ioctl: N/A
-  :master payload: N/A
-  :slave payload: u64
+  :request payload: N/A
+  :reply payload: u64
 
   Query how many queues the backend supports.
 
@@ -1077,7 +1087,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ENABLE``
   :id: 18
   :equivalent ioctl: N/A
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Signal slave to enable or disable corresponding vring.
 
@@ -1087,7 +1098,8 @@ Master message types
 ``VHOST_USER_SEND_RARP``
   :id: 19
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Ask vhost user backend to broadcast a fake RARP to notify the migration
   is terminated for guest that does not support GUEST_ANNOUNCE.
@@ -1102,7 +1114,8 @@ Master message types
 ``VHOST_USER_NET_SET_MTU``
   :id: 20
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set host MTU value exposed to the guest.
 
@@ -1119,7 +1132,8 @@ Master message types
 ``VHOST_USER_SET_SLAVE_REQ_FD``
   :id: 21
   :equivalent ioctl: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Set the socket file descriptor for slave initiated requests. It is passed
   in the ancillary data.
@@ -1134,8 +1148,8 @@ Master message types
 ``VHOST_USER_IOTLB_MSG``
   :id: 22
   :equivalent ioctl: N/A (equivalent to ``VHOST_IOTLB_MSG`` message type)
-  :master payload: ``struct vhost_iotlb_msg``
-  :slave payload: ``u64``
+  :request payload: ``struct vhost_iotlb_msg``
+  :reply payload: ``u64``
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
 
@@ -1149,7 +1163,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ENDIAN``
   :id: 23
   :equivalent ioctl: ``VHOST_SET_VRING_ENDIAN``
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Set the endianness of a VQ for legacy devices. Little-endian is
   indicated with state.num set to 0 and big-endian is indicated with
@@ -1164,8 +1179,8 @@ Master message types
 ``VHOST_USER_GET_CONFIG``
   :id: 24
   :equivalent ioctl: N/A
-  :master payload: virtio device config space
-  :slave payload: virtio device config space
+  :request payload: virtio device config space
+  :reply payload: virtio device config space
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
   submitted by the vhost-user master to fetch the contents of the
@@ -1178,8 +1193,8 @@ Master message types
 ``VHOST_USER_SET_CONFIG``
   :id: 25
   :equivalent ioctl: N/A
-  :master payload: virtio device config space
-  :slave payload: N/A
+  :request payload: virtio device config space
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
   submitted by the vhost-user master when the Guest changes the virtio
@@ -1191,8 +1206,8 @@ Master message types
 ``VHOST_USER_CREATE_CRYPTO_SESSION``
   :id: 26
   :equivalent ioctl: N/A
-  :master payload: crypto session description
-  :slave payload: crypto session description
+  :request payload: crypto session description
+  :reply payload: crypto session description
 
   Create a session for crypto operation. The server side must return
   the session id, 0 or positive for success, negative for failure.
@@ -1204,7 +1219,8 @@ Master message types
 ``VHOST_USER_CLOSE_CRYPTO_SESSION``
   :id: 27
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Close a session for crypto operation which was previously
   created by ``VHOST_USER_CREATE_CRYPTO_SESSION``.
@@ -1216,8 +1232,8 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_ADVISE``
   :id: 28
-  :master payload: N/A
-  :slave payload: userfault fd
+  :request payload: N/A
+  :reply payload: userfault fd
 
   When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, the master
   advises slave that a migration with postcopy enabled is underway,
@@ -1226,7 +1242,8 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_LISTEN``
   :id: 29
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Master advises slave that a transition to postcopy mode has
   happened.  The slave must ensure that shared memory is registered
@@ -1237,10 +1254,11 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_END``
   :id: 30
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Master advises that postcopy migration has now completed.  The slave
-  must disable the userfaultfd. The response is an acknowledgement
+  must disable the userfaultfd. The reply is an acknowledgement
   only.
 
   When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, this message
@@ -1252,7 +1270,8 @@ Master message types
 ``VHOST_USER_GET_INFLIGHT_FD``
   :id: 31
   :equivalent ioctl: N/A
-  :master payload: inflight description
+  :request payload: inflight description
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
   been successfully negotiated, this message is submitted by master to
@@ -1263,7 +1282,8 @@ Master message types
 ``VHOST_USER_SET_INFLIGHT_FD``
   :id: 32
   :equivalent ioctl: N/A
-  :master payload: inflight description
+  :request payload: inflight description
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
   been successfully negotiated, this message is submitted by master to
@@ -1273,7 +1293,8 @@ Master message types
 ``VHOST_USER_GPU_SET_SOCKET``
   :id: 33
   :equivalent ioctl: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Sets the GPU protocol socket file descriptor, which is passed as
   ancillary data. The GPU protocol is used to inform the master of
@@ -1282,8 +1303,8 @@ Master message types
 ``VHOST_USER_RESET_DEVICE``
   :id: 34
   :equivalent ioctl: N/A
-  :master payload: N/A
-  :slave payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Ask the vhost user backend to disable all rings and reset all
   internal device state to the initial state, ready to be
@@ -1296,8 +1317,8 @@ Master message types
 ``VHOST_USER_VRING_KICK``
   :id: 35
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1310,7 +1331,8 @@ Master message types
 ``VHOST_USER_GET_MAX_MEM_SLOTS``
   :id: 36
   :equivalent ioctl: N/A
-  :slave payload: u64
+  :request payload: N/A
+  :reply payload: u64
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1323,7 +1345,8 @@ Master message types
 ``VHOST_USER_ADD_MEM_REG``
   :id: 37
   :equivalent ioctl: N/A
-  :slave payload: single memory region description
+  :request payload: N/A
+  :reply payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1346,7 +1369,8 @@ Master message types
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
-  :slave payload: single memory region description
+  :request payload: N/A
+  :reply payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1369,8 +1393,8 @@ Master message types
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-  :slave payload: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
   successfully negotiated, this message is submitted by the master to
@@ -1380,8 +1404,8 @@ Master message types
 ``VHOST_USER_GET_STATUS``
   :id: 40
   :equivalent ioctl: VHOST_VDPA_GET_STATUS
-  :slave payload: ``u64``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: ``u64``
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
   successfully negotiated, this message is submitted by the master to
@@ -1392,11 +1416,14 @@ Master message types
 Slave message types
 -------------------
 
+For this type of message, the request is sent by the slave and the reply
+is sent by the master.
+
 ``VHOST_USER_SLAVE_IOTLB_MSG``
   :id: 1
   :equivalent ioctl: N/A (equivalent to ``VHOST_IOTLB_MSG`` message type)
-  :slave payload: ``struct vhost_iotlb_msg``
-  :master payload: N/A
+  :request payload: ``struct vhost_iotlb_msg``
+  :reply payload: N/A
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
   Slave sends such requests to notify of an IOTLB miss, or an IOTLB
@@ -1410,8 +1437,8 @@ Slave message types
 ``VHOST_USER_SLAVE_CONFIG_CHANGE_MSG``
   :id: 2
   :equivalent ioctl: N/A
-  :slave payload: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, vhost-user
   slave sends such messages to notify that the virtio device's
@@ -1425,8 +1452,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``
   :id: 3
   :equivalent ioctl: N/A
-  :slave payload: vring area description
-  :master payload: N/A
+  :request payload: vring area description
+  :reply payload: N/A
 
   Sets host notifier for a specified queue. The queue index is
   contained in the ``u64`` field of the vring area description. The
@@ -1448,8 +1475,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_CALL``
   :id: 4
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1462,8 +1489,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_ERR``
   :id: 5
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1489,7 +1516,7 @@ client MUST respond with a Payload ``VhostUserMsg`` indicating success
 or failure. The payload should be set to zero on success or non-zero
 on failure, unless the message already has an explicit reply body.
 
-The response payload gives QEMU a deterministic indication of the result
+The reply payload gives QEMU a deterministic indication of the result
 of the command. Today, QEMU is expected to terminate the main vhost-user
 loop upon receiving such errors. In future, qemu could be taught to be more
 resilient for selective requests.
-- 
MST


