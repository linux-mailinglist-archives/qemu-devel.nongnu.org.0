Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8624E2C6F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:37:44 +0100 (CET)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWK6J-0008Qv-AP
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:37:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzh-0005F3-8N
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:01 -0400
Received: from [2a00:1450:4864:20::531] (port=45760
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzd-0004vH-By
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:52 -0400
Received: by mail-ed1-x531.google.com with SMTP id u26so2727106eda.12
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Dju3PES7Ffn9tOGqHQoUuq336dyvh7tFnS2WWD5Lic=;
 b=CkaJPJl4iZ8EQTEMv5cl53Ih68HMMacj5e6J+Z9qXhj/8vBiWiNoykoZGMKHPCxax/
 9En2YAlRZy/kVM3+QxxR0Wvbz4YbQFBedRdrUbUDXHGjIAwL1AAnh7h1vBLya7BchUtF
 asHarWDyy2gXZ4YgtVt/Yk1gu+cuOY3GQUWRBIs2OZsS+kxlPiDXWNlb30CDcxZ0YbvZ
 seuQBdhkRls6LqJhbdKyPvsa+xMgReomRIDeEwMhsTA9X0Ly/mHXC5tUwUpJuB7mv1dJ
 aGluwxDMqnFLKX8ZuhSfRAvM7/lYGbfaAIkceAtwaa7i54Cko12NdYiPrM9aON0SNvQV
 TC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Dju3PES7Ffn9tOGqHQoUuq336dyvh7tFnS2WWD5Lic=;
 b=n4IrX0WVWxxxssquPzyUvMy1iRRKugxg4gI/+90Y3thY1pCACDssNqbeBJtkvG1Je8
 4rnmVYtNKmpLd3I7wmnCOxpjm/LCCOpgBggTJJORFMiaTu1tKtUjDP7SAOjxWL+XVzC3
 dTR3hp9mHul1JmVbczpOMK4uktLs3w7re3k+q0CmpJJsueA9P4AJeSrqxsJSSWMh1ktR
 WyWq4NLPBRMIcEkcFrjVbIrtj0dwUmF1cvBb2DQvD0/yL4MZ4nWsjY+OP3/W+a6QlGJf
 v9shsicREZ416zdOzQBP06PoSCB/jJngsK3TnAK4Q//mUqTGnvSIbMd7livnnrRk7LDq
 rlWA==
X-Gm-Message-State: AOAM530JI8kpi4M2B5bKNftU29o5fMgqRTW/j5EBw5Uu+V2R6EZJrPz8
 GkDKVSmm0JvSl5LVTgH/cLFicw==
X-Google-Smtp-Source: ABdhPJwPHxhUwI0VoeFs+JUVyXpPIs0RBK570Qx0j2q7VOI1yDWA76qEpT97VX+lifNR/2C631/mcQ==
X-Received: by 2002:aa7:c759:0:b0:419:896:271b with SMTP id
 c25-20020aa7c759000000b004190896271bmr18028959eds.98.1647876645622; 
 Mon, 21 Mar 2022 08:30:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a1709067ad300b006da92735c32sm7070891ejo.16.2022.03.21.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 098461FFBC;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/13] docs: vhost-user: clean up request/reply description
Date: Mon, 21 Mar 2022 15:30:28 +0000
Message-Id: <20220321153037.3622127-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com
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
---
 docs/interop/vhost-user.rst | 163 +++++++++++++++++++++---------------
 1 file changed, 95 insertions(+), 68 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 4dbc84fd00..bb588c66fc 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -865,8 +865,8 @@ Master message types
 ``VHOST_USER_GET_FEATURES``
   :id: 1
   :equivalent ioctl: ``VHOST_GET_FEATURES``
-  :master payload: N/A
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Get from the underlying vhost implementation the features bitmask.
   Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals slave support
@@ -876,7 +876,8 @@ Master message types
 ``VHOST_USER_SET_FEATURES``
   :id: 2
   :equivalent ioctl: ``VHOST_SET_FEATURES``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Enable features in the underlying vhost implementation using a
   bitmask.  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals
@@ -886,8 +887,8 @@ Master message types
 ``VHOST_USER_GET_PROTOCOL_FEATURES``
   :id: 15
   :equivalent ioctl: ``VHOST_GET_FEATURES``
-  :master payload: N/A
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Get the protocol feature bitmask from the underlying vhost
   implementation.  Only legal if feature bit
@@ -902,7 +903,8 @@ Master message types
 ``VHOST_USER_SET_PROTOCOL_FEATURES``
   :id: 16
   :equivalent ioctl: ``VHOST_SET_FEATURES``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Enable protocol features in the underlying vhost implementation.
 
@@ -916,7 +918,8 @@ Master message types
 ``VHOST_USER_SET_OWNER``
   :id: 3
   :equivalent ioctl: ``VHOST_SET_OWNER``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Issued when a new connection is established. It sets the current
   *master* as an owner of the session. This can be used on the *slave*
@@ -924,7 +927,8 @@ Master message types
 
 ``VHOST_USER_RESET_OWNER``
   :id: 4
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
 .. admonition:: Deprecated
 
@@ -937,8 +941,8 @@ Master message types
 ``VHOST_USER_SET_MEM_TABLE``
   :id: 5
   :equivalent ioctl: ``VHOST_SET_MEM_TABLE``
-  :master payload: memory regions description
-  :slave payload: (postcopy only) memory regions description
+  :request payload: memory regions description
+  :reply payload: (postcopy only) memory regions description
 
   Sets the memory map regions on the slave so it can translate the
   vring addresses. In the ancillary data there is an array of file
@@ -961,8 +965,8 @@ Master message types
 ``VHOST_USER_SET_LOG_BASE``
   :id: 6
   :equivalent ioctl: ``VHOST_SET_LOG_BASE``
-  :master payload: u64
-  :slave payload: N/A
+  :request payload: u64
+  :reply payload: N/A
 
   Sets logging shared memory space.
 
@@ -974,44 +978,48 @@ Master message types
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
@@ -1029,7 +1037,8 @@ Master message types
 ``VHOST_USER_SET_VRING_CALL``
   :id: 13
   :equivalent ioctl: ``VHOST_SET_VRING_CALL``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor to signal when buffers are used. It is
   passed in the ancillary data.
@@ -1047,7 +1056,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ERR``
   :id: 14
   :equivalent ioctl: ``VHOST_SET_VRING_ERR``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor to signal when error occurs. It is
   passed in the ancillary data.
@@ -1064,8 +1074,8 @@ Master message types
 ``VHOST_USER_GET_QUEUE_NUM``
   :id: 17
   :equivalent ioctl: N/A
-  :master payload: N/A
-  :slave payload: u64
+  :request payload: N/A
+  :reply payload: u64
 
   Query how many queues the backend supports.
 
@@ -1076,7 +1086,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ENABLE``
   :id: 18
   :equivalent ioctl: N/A
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Signal slave to enable or disable corresponding vring.
 
@@ -1086,7 +1097,8 @@ Master message types
 ``VHOST_USER_SEND_RARP``
   :id: 19
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Ask vhost user backend to broadcast a fake RARP to notify the migration
   is terminated for guest that does not support GUEST_ANNOUNCE.
@@ -1101,7 +1113,8 @@ Master message types
 ``VHOST_USER_NET_SET_MTU``
   :id: 20
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set host MTU value exposed to the guest.
 
@@ -1118,7 +1131,8 @@ Master message types
 ``VHOST_USER_SET_SLAVE_REQ_FD``
   :id: 21
   :equivalent ioctl: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Set the socket file descriptor for slave initiated requests. It is passed
   in the ancillary data.
@@ -1133,8 +1147,8 @@ Master message types
 ``VHOST_USER_IOTLB_MSG``
   :id: 22
   :equivalent ioctl: N/A (equivalent to ``VHOST_IOTLB_MSG`` message type)
-  :master payload: ``struct vhost_iotlb_msg``
-  :slave payload: ``u64``
+  :request payload: ``struct vhost_iotlb_msg``
+  :reply payload: ``u64``
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
 
@@ -1148,7 +1162,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ENDIAN``
   :id: 23
   :equivalent ioctl: ``VHOST_SET_VRING_ENDIAN``
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Set the endianness of a VQ for legacy devices. Little-endian is
   indicated with state.num set to 0 and big-endian is indicated with
@@ -1163,8 +1178,8 @@ Master message types
 ``VHOST_USER_GET_CONFIG``
   :id: 24
   :equivalent ioctl: N/A
-  :master payload: virtio device config space
-  :slave payload: virtio device config space
+  :request payload: virtio device config space
+  :reply payload: virtio device config space
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
   submitted by the vhost-user master to fetch the contents of the
@@ -1177,8 +1192,8 @@ Master message types
 ``VHOST_USER_SET_CONFIG``
   :id: 25
   :equivalent ioctl: N/A
-  :master payload: virtio device config space
-  :slave payload: N/A
+  :request payload: virtio device config space
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
   submitted by the vhost-user master when the Guest changes the virtio
@@ -1190,8 +1205,8 @@ Master message types
 ``VHOST_USER_CREATE_CRYPTO_SESSION``
   :id: 26
   :equivalent ioctl: N/A
-  :master payload: crypto session description
-  :slave payload: crypto session description
+  :request payload: crypto session description
+  :reply payload: crypto session description
 
   Create a session for crypto operation. The server side must return
   the session id, 0 or positive for success, negative for failure.
@@ -1203,7 +1218,8 @@ Master message types
 ``VHOST_USER_CLOSE_CRYPTO_SESSION``
   :id: 27
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Close a session for crypto operation which was previously
   created by ``VHOST_USER_CREATE_CRYPTO_SESSION``.
@@ -1215,8 +1231,8 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_ADVISE``
   :id: 28
-  :master payload: N/A
-  :slave payload: userfault fd
+  :request payload: N/A
+  :reply payload: userfault fd
 
   When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, the master
   advises slave that a migration with postcopy enabled is underway,
@@ -1225,7 +1241,8 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_LISTEN``
   :id: 29
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Master advises slave that a transition to postcopy mode has
   happened.  The slave must ensure that shared memory is registered
@@ -1236,10 +1253,11 @@ Master message types
 
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
@@ -1251,7 +1269,8 @@ Master message types
 ``VHOST_USER_GET_INFLIGHT_FD``
   :id: 31
   :equivalent ioctl: N/A
-  :master payload: inflight description
+  :request payload: inflight description
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
   been successfully negotiated, this message is submitted by master to
@@ -1262,7 +1281,8 @@ Master message types
 ``VHOST_USER_SET_INFLIGHT_FD``
   :id: 32
   :equivalent ioctl: N/A
-  :master payload: inflight description
+  :request payload: inflight description
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
   been successfully negotiated, this message is submitted by master to
@@ -1272,7 +1292,8 @@ Master message types
 ``VHOST_USER_GPU_SET_SOCKET``
   :id: 33
   :equivalent ioctl: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Sets the GPU protocol socket file descriptor, which is passed as
   ancillary data. The GPU protocol is used to inform the master of
@@ -1281,8 +1302,8 @@ Master message types
 ``VHOST_USER_RESET_DEVICE``
   :id: 34
   :equivalent ioctl: N/A
-  :master payload: N/A
-  :slave payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Ask the vhost user backend to disable all rings and reset all
   internal device state to the initial state, ready to be
@@ -1295,8 +1316,8 @@ Master message types
 ``VHOST_USER_VRING_KICK``
   :id: 35
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1309,7 +1330,8 @@ Master message types
 ``VHOST_USER_GET_MAX_MEM_SLOTS``
   :id: 36
   :equivalent ioctl: N/A
-  :slave payload: u64
+  :request payload: N/A
+  :reply payload: u64
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1322,7 +1344,8 @@ Master message types
 ``VHOST_USER_ADD_MEM_REG``
   :id: 37
   :equivalent ioctl: N/A
-  :slave payload: single memory region description
+  :request payload: N/A
+  :reply payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1337,7 +1360,8 @@ Master message types
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
-  :slave payload: single memory region description
+  :request payload: N/A
+  :reply payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1352,8 +1376,8 @@ Master message types
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-  :slave payload: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
   successfully negotiated, this message is submitted by the master to
@@ -1363,8 +1387,8 @@ Master message types
 ``VHOST_USER_GET_STATUS``
   :id: 40
   :equivalent ioctl: VHOST_VDPA_GET_STATUS
-  :slave payload: ``u64``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: ``u64``
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
   successfully negotiated, this message is submitted by the master to
@@ -1375,11 +1399,14 @@ Master message types
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
@@ -1393,8 +1420,8 @@ Slave message types
 ``VHOST_USER_SLAVE_CONFIG_CHANGE_MSG``
   :id: 2
   :equivalent ioctl: N/A
-  :slave payload: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, vhost-user
   slave sends such messages to notify that the virtio device's
@@ -1408,8 +1435,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``
   :id: 3
   :equivalent ioctl: N/A
-  :slave payload: vring area description
-  :master payload: N/A
+  :request payload: vring area description
+  :reply payload: N/A
 
   Sets host notifier for a specified queue. The queue index is
   contained in the ``u64`` field of the vring area description. The
@@ -1431,8 +1458,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_CALL``
   :id: 4
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1445,8 +1472,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_ERR``
   :id: 5
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1472,7 +1499,7 @@ client MUST respond with a Payload ``VhostUserMsg`` indicating success
 or failure. The payload should be set to zero on success or non-zero
 on failure, unless the message already has an explicit reply body.
 
-The response payload gives QEMU a deterministic indication of the result
+The reply payload gives QEMU a deterministic indication of the result
 of the command. Today, QEMU is expected to terminate the main vhost-user
 loop upon receiving such errors. In future, qemu could be taught to be more
 resilient for selective requests.
-- 
2.30.2


