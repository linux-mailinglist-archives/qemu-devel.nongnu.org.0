Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54CA4E2C7F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:41:15 +0100 (CET)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWK9i-0005lX-Tr
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:41:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzj-0005GP-Ty
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:01 -0400
Received: from [2a00:1450:4864:20::630] (port=41610
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzf-0004w1-LK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:55 -0400
Received: by mail-ej1-x630.google.com with SMTP id a8so30601945ejc.8
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9/FmRl8NPaUTosTYL5E1Uv2nUtVWzIqRDUVfHkXuGQ=;
 b=mRMzIjaxvPMBmT6D7UZDheFblAPvLe/5lWSJ32FOS9C8iR4M+Z2GzROb3magZxyQ8z
 Ov5wKLk2a/ezYJRQVeXwMTx6FXuj0qNO4dOuE1QiPeoFUmcCk2Rj9k7py6OHvN+csIgQ
 tDzw+PHRw3sU9mjMv6OzCu2L0tvyfC4g8OxVUrCOoH0h5eSKTmfrez2MAFUXRO6H4sWY
 f0M4Ysam/sqEIVkzgxeO2Vsi92y8TF0EctLb1YCKNxugQQxHeHjj8z/WB8u7WRHeItil
 8nsi6I76PlFlMLy5bwWYszUI+uxUPSp0+Vs1TBM8erUPTawkScAgDMKdn4kw5ggWIFSk
 LwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9/FmRl8NPaUTosTYL5E1Uv2nUtVWzIqRDUVfHkXuGQ=;
 b=FHsHw9S0h/64rgMB9MiTtcgtGV/OHrbeylpMKR0nk9Z10uyCLFsQeDRAgOaQKJlZsT
 Kp/SXeRqtha/c+7fR5evnXjIv6DDQj3uuXXR8gR5nNYCfg1XWcsp7uFh34rkNwffqmmH
 lDI1M4fb0O1NRpMbP4IsNXZ7522t6XcMldKYjzZPfIYJsu77DMO50vFYSDuVcZ5YM451
 0iUMRypMErCsswQlvVlYdpcf1+ZIG7D89PQZPvnqbw4m2+/iEunStv4uWA2zmCuCcDIp
 QKTF4bUphIyE6d1tu9hoYQFeRY8RzpllhX+ettLO3yVqptsknTwyifGr1YzOSCSjrOMX
 Gw3g==
X-Gm-Message-State: AOAM533zZJNMNXG6kCobA02UOgw0g+DsJ7zHlK2OZ2hx1ZY+58YhiCIF
 dE1VivR+BYhy1cKHdbELxnAl4K4UWA1ZnQ==
X-Google-Smtp-Source: ABdhPJyArz/eBodtdJHTnjP8WhL2OtfEadGBDXGgejQ76CRqk5lK55YTzOQ8StsQ4zbBKAix8ks4BA==
X-Received: by 2002:a17:907:3e0b:b0:6df:cc38:ffeb with SMTP id
 hp11-20020a1709073e0b00b006dfcc38ffebmr9889381ejc.263.1647876648836; 
 Mon, 21 Mar 2022 08:30:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a056402518f00b00416a3194924sm7802909edd.75.2022.03.21.08.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 365561FFBE;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/13] docs: vhost-user: replace master/slave with
 front-end/back-end
Date: Mon, 21 Mar 2022 15:30:30 +0000
Message-Id: <20220321153037.3622127-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
 viresh.kumar@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

This matches the nomenclature that is generally used.  Also commonly used
is client/server, but it is not as clear because sometimes the front-end
exposes a passive (server) socket that the back-end connects to.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210226143413.188046-4-pbonzini@redhat.com>
---
 docs/interop/vhost-user-gpu.rst |  10 +-
 docs/interop/vhost-user.rst     | 342 ++++++++++++++++----------------
 2 files changed, 176 insertions(+), 176 deletions(-)

diff --git a/docs/interop/vhost-user-gpu.rst b/docs/interop/vhost-user-gpu.rst
index 71a2c52b31..1640553729 100644
--- a/docs/interop/vhost-user-gpu.rst
+++ b/docs/interop/vhost-user-gpu.rst
@@ -13,10 +13,10 @@ Introduction
 ============
 
 The vhost-user-gpu protocol is aiming at sharing the rendering result
-of a virtio-gpu, done from a vhost-user slave process to a vhost-user
-master process (such as QEMU). It bears a resemblance to a display
+of a virtio-gpu, done from a vhost-user back-end process to a vhost-user
+front-end process (such as QEMU). It bears a resemblance to a display
 server protocol, if you consider QEMU as the display server and the
-slave as the client, but in a very limited way. Typically, it will
+back-end as the client, but in a very limited way. Typically, it will
 work by setting a scanout/display configuration, before sending flush
 events for the display updates. It will also update the cursor shape
 and position.
@@ -26,8 +26,8 @@ socket ancillary data to share opened file descriptors (DMABUF fds or
 shared memory). The socket is usually obtained via
 ``VHOST_USER_GPU_SET_SOCKET``.
 
-Requests are sent by the *slave*, and the optional replies by the
-*master*.
+Requests are sent by the *back-end*, and the optional replies by the
+*front-end*.
 
 Wire format
 ===========
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 694a113e59..08c4bf2ef7 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -23,19 +23,19 @@ space process on the same host. It uses communication over a Unix
 domain socket to share file descriptors in the ancillary data of the
 message.
 
-The protocol defines 2 sides of the communication, *master* and
-*slave*. *Master* is the application that shares its virtqueues, in
-our case QEMU. *Slave* is the consumer of the virtqueues.
+The protocol defines 2 sides of the communication, *front-end* and
+*back-end*. The *front-end* is the application that shares its virtqueues, in
+our case QEMU. The *back-end* is the consumer of the virtqueues.
 
-In the current implementation QEMU is the *master*, and the *slave* is
-the external process consuming the virtio queues, for example a
+In the current implementation QEMU is the *front-end*, and the *back-end*
+is the external process consuming the virtio queues, for example a
 software Ethernet switch running in user space, such as Snabbswitch,
-or a block device backend processing read & write to a virtual
-disk. In order to facilitate interoperability between various backend
+or a block device back-end processing read & write to a virtual
+disk. In order to facilitate interoperability between various back-end
 implementations, it is recommended to follow the :ref:`Backend program
 conventions <backend_conventions>`.
 
-*Master* and *slave* can be either a client (i.e. connecting) or
+The *front-end* and *back-end* can be either a client (i.e. connecting) or
 server (listening) in the socket communication.
 
 Support for platforms other than Linux
@@ -77,7 +77,7 @@ Header
 :flags: 32-bit bit field
 
 - Lower 2 bits are the version (currently 0x01)
-- Bit 2 is the reply flag - needs to be sent on each reply from the slave
+- Bit 2 is the reply flag - needs to be sent on each reply from the back-end
 - Bit 3 is the need_reply flag - see :ref:`REPLY_ACK <reply_ack>` for
   details.
 
@@ -222,8 +222,8 @@ Virtio device config space
 :size: a 32-bit configuration space access size in bytes
 
 :flags: a 32-bit value:
-  - 0: Vhost master messages used for writeable fields
-  - 1: Vhost master messages used for live migration
+  - 0: Vhost front-end messages used for writeable fields
+  - 1: Vhost front-end messages used for live migration
 
 :payload: Size bytes array holding the contents of the virtio
           device's configuration space
@@ -290,8 +290,8 @@ vhost for the Linux Kernel. Most messages that can be sent via the
 Unix domain socket implementing vhost-user have an equivalent ioctl to
 the kernel implementation.
 
-The communication consists of *master* sending message requests and
-*slave* sending message replies. Most of the requests don't require
+The communication consists of the *front-end* sending message requests and
+the *back-end* sending message replies. Most of the requests don't require
 replies. Here is a list of the ones that do:
 
 * ``VHOST_USER_GET_FEATURES``
@@ -305,7 +305,7 @@ replies. Here is a list of the ones that do:
    :ref:`REPLY_ACK <reply_ack>`
        The section on ``REPLY_ACK`` protocol extension.
 
-There are several messages that the master sends with file descriptors passed
+There are several messages that the front-end sends with file descriptors passed
 in the ancillary data:
 
 * ``VHOST_USER_SET_MEM_TABLE``
@@ -317,16 +317,16 @@ in the ancillary data:
 * ``VHOST_USER_SET_SLAVE_REQ_FD``
 * ``VHOST_USER_SET_INFLIGHT_FD`` (if ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD``)
 
-If *master* is unable to send the full message or receives a wrong
+If *front-end* is unable to send the full message or receives a wrong
 reply it will close the connection. An optional reconnection mechanism
 can be implemented.
 
-If *slave* detects some error such as incompatible features, it may also
+If *back-end* detects some error such as incompatible features, it may also
 close the connection. This should only happen in exceptional circumstances.
 
 Any protocol extensions are gated by protocol feature bits, which
-allows full backwards compatibility on both master and slave.  As
-older slaves don't support negotiating protocol features, a feature
+allows full backwards compatibility on both front-end and back-end.  As
+older back-ends don't support negotiating protocol features, a feature
 bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
@@ -336,16 +336,16 @@ Ring states
 
 Rings can be in one of three states:
 
-* stopped: the slave must not process the ring at all.
+* stopped: the back-end must not process the ring at all.
 
-* started but disabled: the slave must process the ring without
+* started but disabled: the back-end must process the ring without
   causing any side effects.  For example, for a networking device,
-  in the disabled state the slave must not supply any new RX packets,
+  in the disabled state the back-end must not supply any new RX packets,
   but must process and discard any TX packets.
 
 * started and enabled.
 
-Each ring is initialized in a stopped state.  The slave must start
+Each ring is initialized in a stopped state.  The back-end must start
 ring upon receiving a kick (that is, detecting that file descriptor is
 readable) on the descriptor specified by ``VHOST_USER_SET_VRING_KICK``
 or receiving the in-band message ``VHOST_USER_VRING_KICK`` if negotiated,
@@ -360,53 +360,53 @@ If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
 initialized in a disabled state and is enabled by
 ``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
 
-While processing the rings (whether they are enabled or not), the slave
+While processing the rings (whether they are enabled or not), the back-end
 must support changing some configuration aspects on the fly.
 
 Multiple queue support
 ----------------------
 
-Many devices have a fixed number of virtqueues.  In this case the master
+Many devices have a fixed number of virtqueues.  In this case the front-end
 already knows the number of available virtqueues without communicating with the
-slave.
+back-end.
 
 Some devices do not have a fixed number of virtqueues.  Instead the maximum
-number of virtqueues is chosen by the slave.  The number can depend on host
-resource availability or slave implementation details.  Such devices are called
+number of virtqueues is chosen by the back-end.  The number can depend on host
+resource availability or back-end implementation details.  Such devices are called
 multiple queue devices.
 
-Multiple queue support allows the slave to advertise the maximum number of
-queues.  This is treated as a protocol extension, hence the slave has to
+Multiple queue support allows the back-end to advertise the maximum number of
+queues.  This is treated as a protocol extension, hence the back-end has to
 implement protocol features first. The multiple queues feature is supported
 only when the protocol feature ``VHOST_USER_PROTOCOL_F_MQ`` (bit 0) is set.
 
-The max number of queues the slave supports can be queried with message
-``VHOST_USER_GET_QUEUE_NUM``. Master should stop when the number of requested
+The max number of queues the back-end supports can be queried with message
+``VHOST_USER_GET_QUEUE_NUM``. Front-end should stop when the number of requested
 queues is bigger than that.
 
-As all queues share one connection, the master uses a unique index for each
+As all queues share one connection, the front-end uses a unique index for each
 queue in the sent message to identify a specified queue.
 
-The master enables queues by sending message ``VHOST_USER_SET_VRING_ENABLE``.
+The front-end enables queues by sending message ``VHOST_USER_SET_VRING_ENABLE``.
 vhost-user-net has historically automatically enabled the first queue pair.
 
-Slaves should always implement the ``VHOST_USER_PROTOCOL_F_MQ`` protocol
+Back-ends should always implement the ``VHOST_USER_PROTOCOL_F_MQ`` protocol
 feature, even for devices with a fixed number of virtqueues, since it is simple
 to implement and offers a degree of introspection.
 
-Masters must not rely on the ``VHOST_USER_PROTOCOL_F_MQ`` protocol feature for
+Front-ends must not rely on the ``VHOST_USER_PROTOCOL_F_MQ`` protocol feature for
 devices with a fixed number of virtqueues.  Only true multiqueue devices
 require this protocol feature.
 
 Migration
 ---------
 
-During live migration, the master may need to track the modifications
-the slave makes to the memory mapped regions. The client should mark
+During live migration, the front-end may need to track the modifications
+the back-end makes to the memory mapped regions. The front-end should mark
 the dirty pages in a log. Once it complies to this logging, it may
 declare the ``VHOST_F_LOG_ALL`` vhost feature.
 
-To start/stop logging of data/used ring writes, server may send
+To start/stop logging of data/used ring writes, the front-end may send
 messages ``VHOST_USER_SET_FEATURES`` with ``VHOST_F_LOG_ALL`` and
 ``VHOST_USER_SET_VRING_ADDR`` with ``VHOST_VRING_F_LOG`` in ring's
 flags set to 1/0, respectively.
@@ -420,7 +420,7 @@ Dirty pages are of size::
   #define VHOST_LOG_PAGE 0x1000
 
 The log memory fd is provided in the ancillary data of
-``VHOST_USER_SET_LOG_BASE`` message when the slave has
+``VHOST_USER_SET_LOG_BASE`` message when the back-end has
 ``VHOST_USER_PROTOCOL_F_LOG_SHMFD`` protocol feature.
 
 The size of the log is supplied as part of ``VhostUserMsg`` which
@@ -446,26 +446,26 @@ the bit offset of the last byte of the ring must fall within the size
 supplied by ``VhostUserLog``.
 
 ``VHOST_USER_SET_LOG_FD`` is an optional message with an eventfd in
-ancillary data, it may be used to inform the master that the log has
+ancillary data, it may be used to inform the front-end that the log has
 been modified.
 
 Once the source has finished migration, rings will be stopped by the
 source. No further update must be done before rings are restarted.
 
-In postcopy migration the slave is started before all the memory has
+In postcopy migration the back-end is started before all the memory has
 been received from the source host, and care must be taken to avoid
-accessing pages that have yet to be received.  The slave opens a
+accessing pages that have yet to be received.  The back-end opens a
 'userfault'-fd and registers the memory with it; this fd is then
-passed back over to the master.  The master services requests on the
+passed back over to the front-end.  The front-end services requests on the
 userfaultfd for pages that are accessed and when the page is available
 it performs WAKE ioctl's on the userfaultfd to wake the stalled
-slave.  The client indicates support for this via the
+back-end.  The front-end indicates support for this via the
 ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` feature.
 
 Memory access
 -------------
 
-The master sends a list of vhost memory regions to the slave using the
+The front-end sends a list of vhost memory regions to the back-end using the
 ``VHOST_USER_SET_MEM_TABLE`` message.  Each region has two base
 addresses: a guest address and a user address.
 
@@ -490,60 +490,60 @@ IOMMU support
 -------------
 
 When the ``VIRTIO_F_IOMMU_PLATFORM`` feature has been negotiated, the
-master sends IOTLB entries update & invalidation by sending
-``VHOST_USER_IOTLB_MSG`` requests to the slave with a ``struct
+front-end sends IOTLB entries update & invalidation by sending
+``VHOST_USER_IOTLB_MSG`` requests to the back-end with a ``struct
 vhost_iotlb_msg`` as payload. For update events, the ``iotlb`` payload
 has to be filled with the update message type (2), the I/O virtual
 address, the size, the user virtual address, and the permissions
 flags. Addresses and size must be within vhost memory regions set via
 the ``VHOST_USER_SET_MEM_TABLE`` request. For invalidation events, the
 ``iotlb`` payload has to be filled with the invalidation message type
-(3), the I/O virtual address and the size. On success, the slave is
+(3), the I/O virtual address and the size. On success, the back-end is
 expected to reply with a zero payload, non-zero otherwise.
 
-The slave relies on the slave communication channel (see :ref:`Slave
-communication <slave_communication>` section below) to send IOTLB miss
+The back-end relies on the back-end communication channel (see :ref:`Back-end
+communication <backend_communication>` section below) to send IOTLB miss
 and access failure events, by sending ``VHOST_USER_SLAVE_IOTLB_MSG``
-requests to the master with a ``struct vhost_iotlb_msg`` as
+requests to the front-end with a ``struct vhost_iotlb_msg`` as
 payload. For miss events, the iotlb payload has to be filled with the
 miss message type (1), the I/O virtual address and the permissions
 flags. For access failure event, the iotlb payload has to be filled
 with the access failure message type (4), the I/O virtual address and
-the permissions flags.  For synchronization purpose, the slave may
-rely on the reply-ack feature, so the master may send a reply when
+the permissions flags.  For synchronization purpose, the back-end may
+rely on the reply-ack feature, so the front-end may send a reply when
 operation is completed if the reply-ack feature is negotiated and
-slaves requests a reply. For miss events, completed operation means
-either master sent an update message containing the IOTLB entry
-containing requested address and permission, or master sent nothing if
+back-ends requests a reply. For miss events, completed operation means
+either front-end sent an update message containing the IOTLB entry
+containing requested address and permission, or front-end sent nothing if
 the IOTLB miss message is invalid (invalid IOVA or permission).
 
-The master isn't expected to take the initiative to send IOTLB update
-messages, as the slave sends IOTLB miss messages for the guest virtual
+The front-end isn't expected to take the initiative to send IOTLB update
+messages, as the back-end sends IOTLB miss messages for the guest virtual
 memory areas it needs to access.
 
-.. _slave_communication:
+.. _backend_communication:
 
-Slave communication
--------------------
+Back-end communication
+----------------------
 
-An optional communication channel is provided if the slave declares
+An optional communication channel is provided if the back-end declares
 ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` protocol feature, to allow the
-slave to make requests to the master.
+back-end to make requests to the front-end.
 
 The fd is provided via ``VHOST_USER_SET_SLAVE_REQ_FD`` ancillary data.
 
-A slave may then send ``VHOST_USER_SLAVE_*`` messages to the master
+A back-end may then send ``VHOST_USER_SLAVE_*`` messages to the front-end
 using this fd communication channel.
 
 If ``VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD`` protocol feature is
-negotiated, slave can send file descriptors (at most 8 descriptors in
-each message) to master via ancillary data using this fd communication
+negotiated, back-end can send file descriptors (at most 8 descriptors in
+each message) to front-end via ancillary data using this fd communication
 channel.
 
 Inflight I/O tracking
 ---------------------
 
-To support reconnecting after restart or crash, slave may need to
+To support reconnecting after restart or crash, back-end may need to
 resubmit inflight I/Os. If virtqueue is processed in order, we can
 easily achieve that by getting the inflight descriptors from
 descriptor table (split virtqueue) or descriptor ring (packed
@@ -551,18 +551,18 @@ virtqueue). However, it can't work when we process descriptors
 out-of-order because some entries which store the information of
 inflight descriptors in available ring (split virtqueue) or descriptor
 ring (packed virtqueue) might be overridden by new entries. To solve
-this problem, slave need to allocate an extra buffer to store this
-information of inflight descriptors and share it with master for
+this problem, the back-end need to allocate an extra buffer to store this
+information of inflight descriptors and share it with front-end for
 persistent. ``VHOST_USER_GET_INFLIGHT_FD`` and
 ``VHOST_USER_SET_INFLIGHT_FD`` are used to transfer this buffer
-between master and slave. And the format of this buffer is described
+between front-end and back-end. And the format of this buffer is described
 below:
 
 +---------------+---------------+-----+---------------+
 | queue0 region | queue1 region | ... | queueN region |
 +---------------+---------------+-----+---------------+
 
-N is the number of available virtqueues. Slave could get it from num
+N is the number of available virtqueues. The back-end could get it from num
 queues field of ``VhostUserInflight``.
 
 For split virtqueue, queue region can be implemented as:
@@ -594,8 +594,8 @@ For split virtqueue, queue region can be implemented as:
        * Zero value indicates an uninitialized buffer */
       uint16_t version;
 
-      /* The size of DescStateSplit array. It's equal to the virtqueue
-       * size. Slave could get it from queue size field of VhostUserInflight. */
+      /* The size of DescStateSplit array. It's equal to the virtqueue size.
+       * The back-end could get it from queue size field of VhostUserInflight. */
       uint16_t desc_num;
 
       /* The head of list that track the last batch of used descriptors. */
@@ -701,8 +701,8 @@ For packed virtqueue, queue region can be implemented as:
        * Zero value indicates an uninitialized buffer */
       uint16_t version;
 
-      /* The size of DescStatePacked array. It's equal to the virtqueue
-       * size. Slave could get it from queue size field of VhostUserInflight. */
+      /* The size of DescStatePacked array. It's equal to the virtqueue size.
+       * The back-end could get it from queue size field of VhostUserInflight. */
       uint16_t desc_num;
 
       /* The head of free DescStatePacked entry list */
@@ -794,7 +794,7 @@ When reconnecting:
    #. Use ``old_used_wrap_counter`` to calculate the available flags
 
    #. If ``d.flags`` is not equal to the calculated flags value (means
-      slave has submitted the buffer to guest driver before crash, so
+      back-end has submitted the buffer to guest driver before crash, so
       it has to commit the in-progres update), set ``old_free_head``,
       ``old_used_idx``, ``old_used_wrap_counter`` to ``free_head``,
       ``used_idx``, ``used_wrap_counter``
@@ -823,11 +823,11 @@ cause the sending application(s) to block, it is not advised to use
 this feature unless absolutely necessary. It is also considered an
 error to negotiate this feature without also negotiating
 ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` and ``VHOST_USER_PROTOCOL_F_REPLY_ACK``,
-the former is necessary for getting a message channel from the slave
-to the master, while the latter needs to be used with the in-band
+the former is necessary for getting a message channel from the back-end
+to the front-end, while the latter needs to be used with the in-band
 notification messages to block until they are processed, both to avoid
 blocking later and for proper processing (at least in the simulation
-use case.) As it has no other way of signalling this error, the slave
+use case.) As it has no other way of signalling this error, the back-end
 should close the connection as a response to a
 ``VHOST_USER_SET_PROTOCOL_FEATURES`` message that sets the in-band
 notifications feature flag without the other two.
@@ -855,8 +855,8 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
 
-Master message types
---------------------
+Front-end message types
+-----------------------
 
 ``VHOST_USER_GET_FEATURES``
   :id: 1
@@ -865,7 +865,7 @@ Master message types
   :reply payload: ``u64``
 
   Get from the underlying vhost implementation the features bitmask.
-  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals slave support
+  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals back-end support
   for ``VHOST_USER_GET_PROTOCOL_FEATURES`` and
   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
 
@@ -877,7 +877,7 @@ Master message types
 
   Enable features in the underlying vhost implementation using a
   bitmask.  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals
-  slave support for ``VHOST_USER_GET_PROTOCOL_FEATURES`` and
+  back-end support for ``VHOST_USER_GET_PROTOCOL_FEATURES`` and
   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
 
 ``VHOST_USER_GET_PROTOCOL_FEATURES``
@@ -892,7 +892,7 @@ Master message types
   ``VHOST_USER_GET_FEATURES``.
 
 .. Note::
-   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must
+   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
    support this message even before ``VHOST_USER_SET_FEATURES`` was
    called.
 
@@ -908,7 +908,7 @@ Master message types
   ``VHOST_USER_GET_FEATURES``.
 
 .. Note::
-   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
+   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
    this message even before ``VHOST_USER_SET_FEATURES`` was called.
 
 ``VHOST_USER_SET_OWNER``
@@ -917,8 +917,8 @@ Master message types
   :request payload: N/A
   :reply payload: N/A
 
-  Issued when a new connection is established. It sets the current
-  *master* as an owner of the session. This can be used on the *slave*
+  Issued when a new connection is established. It marks the sender
+  as the front-end that owns of the session. This can be used on the *back-end*
   as a "session start" flag.
 
 ``VHOST_USER_RESET_OWNER``
@@ -929,9 +929,9 @@ Master message types
 .. admonition:: Deprecated
 
    This is no longer used. Used to be sent to request disabling all
-   rings, but some clients interpreted it to also discard connection
+   rings, but some back-ends interpreted it to also discard connection
    state (this interpretation would lead to bugs).  It is recommended
-   that clients either ignore this message, or use it to disable all
+   that back-ends either ignore this message, or use it to disable all
    rings.
 
 ``VHOST_USER_SET_MEM_TABLE``
@@ -940,14 +940,14 @@ Master message types
   :request payload: memory regions description
   :reply payload: (postcopy only) memory regions description
 
-  Sets the memory map regions on the slave so it can translate the
+  Sets the memory map regions on the back-end so it can translate the
   vring addresses. In the ancillary data there is an array of file
   descriptors for each memory mapped region. The size and ordering of
   the fds matches the number and ordering of memory regions.
 
   When ``VHOST_USER_POSTCOPY_LISTEN`` has been received,
   ``SET_MEM_TABLE`` replies with the bases of the memory mapped
-  regions to the master.  The slave must have mmap'd the regions but
+  regions to the front-end.  The back-end must have mmap'd the regions but
   not yet accessed them and should not yet generate a userfault
   event.
 
@@ -966,7 +966,7 @@ Master message types
 
   Sets logging shared memory space.
 
-  When slave has ``VHOST_USER_PROTOCOL_F_LOG_SHMFD`` protocol feature,
+  When the back-end has ``VHOST_USER_PROTOCOL_F_LOG_SHMFD`` protocol feature,
   the log memory fd is provided in the ancillary data of
   ``VHOST_USER_SET_LOG_BASE`` message, the size and offset of shared
   memory area provided in the message.
@@ -1073,7 +1073,7 @@ Master message types
   :request payload: N/A
   :reply payload: u64
 
-  Query how many queues the backend supports.
+  Query how many queues the back-end supports.
 
   This request should be sent only when ``VHOST_USER_PROTOCOL_F_MQ``
   is set in queried protocol features by
@@ -1085,7 +1085,7 @@ Master message types
   :request payload: vring state description
   :reply payload: N/A
 
-  Signal slave to enable or disable corresponding vring.
+  Signal the back-end to enable or disable corresponding vring.
 
   This request should be sent only when
   ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated.
@@ -1096,7 +1096,7 @@ Master message types
   :request payload: ``u64``
   :reply payload: N/A
 
-  Ask vhost user backend to broadcast a fake RARP to notify the migration
+  Ask vhost user back-end to broadcast a fake RARP to notify the migration
   is terminated for guest that does not support GUEST_ANNOUNCE.
 
   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is
@@ -1104,7 +1104,7 @@ Master message types
   ``VHOST_USER_PROTOCOL_F_RARP`` is present in
   ``VHOST_USER_GET_PROTOCOL_FEATURES``.  The first 6 bytes of the
   payload contain the mac address of the guest to allow the vhost user
-  backend to construct and broadcast the fake RARP.
+  back-end to construct and broadcast the fake RARP.
 
 ``VHOST_USER_NET_SET_MTU``
   :id: 20
@@ -1120,7 +1120,7 @@ Master message types
   ``VHOST_USER_PROTOCOL_F_NET_MTU`` is present in
   ``VHOST_USER_GET_PROTOCOL_FEATURES``.
 
-  If ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, slave must
+  If ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, the back-end must
   respond with zero in case the specified MTU is valid, or non-zero
   otherwise.
 
@@ -1130,14 +1130,14 @@ Master message types
   :request payload: N/A
   :reply payload: N/A
 
-  Set the socket file descriptor for slave initiated requests. It is passed
+  Set the socket file descriptor for back-end initiated requests. It is passed
   in the ancillary data.
 
   This request should be sent only when
   ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, and protocol
   feature bit ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` bit is present in
   ``VHOST_USER_GET_PROTOCOL_FEATURES``.  If
-  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, slave must
+  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, the back-end must
   respond with zero for success, non-zero otherwise.
 
 ``VHOST_USER_IOTLB_MSG``
@@ -1148,8 +1148,8 @@ Master message types
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
 
-  Master sends such requests to update and invalidate entries in the
-  device IOTLB. The slave has to acknowledge the request with sending
+  The front-end sends such requests to update and invalidate entries in the
+  device IOTLB. The back-end has to acknowledge the request with sending
   zero as ``u64`` payload for success, non-zero otherwise.
 
   This request should be send only when ``VIRTIO_F_IOMMU_PLATFORM``
@@ -1169,7 +1169,7 @@ Master message types
   ``VHOST_USER_PROTOCOL_F_CROSS_ENDIAN`` has been negotiated.
   Backends that negotiated this feature should handle both
   endiannesses and expect this message once (per VQ) during device
-  configuration (ie. before the master starts the VQ).
+  configuration (ie. before the front-end starts the VQ).
 
 ``VHOST_USER_GET_CONFIG``
   :id: 24
@@ -1178,11 +1178,11 @@ Master message types
   :reply payload: virtio device config space
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
-  submitted by the vhost-user master to fetch the contents of the
-  virtio device configuration space, vhost-user slave's payload size
-  MUST match master's request, vhost-user slave uses zero length of
-  payload to indicate an error to vhost-user master. The vhost-user
-  master may cache the contents to avoid repeated
+  submitted by the vhost-user front-end to fetch the contents of the
+  virtio device configuration space, vhost-user back-end's payload size
+  MUST match the front-end's request, vhost-user back-end uses zero length of
+  payload to indicate an error to the vhost-user front-end. The vhost-user
+  front-end may cache the contents to avoid repeated
   ``VHOST_USER_GET_CONFIG`` calls.
 
 ``VHOST_USER_SET_CONFIG``
@@ -1192,10 +1192,10 @@ Master message types
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
-  submitted by the vhost-user master when the Guest changes the virtio
+  submitted by the vhost-user front-end when the Guest changes the virtio
   device configuration space and also can be used for live migration
-  on the destination host. The vhost-user slave must check the flags
-  field, and slaves MUST NOT accept SET_CONFIG for read-only
+  on the destination host. The vhost-user back-end must check the flags
+  field, and back-ends MUST NOT accept SET_CONFIG for read-only
   configuration space fields unless the live migration bit is set.
 
 ``VHOST_USER_CREATE_CRYPTO_SESSION``
@@ -1204,7 +1204,7 @@ Master message types
   :request payload: crypto session description
   :reply payload: crypto session description
 
-  Create a session for crypto operation. The server side must return
+  Create a session for crypto operation. The back-end must return
   the session id, 0 or positive for success, negative for failure.
   This request should be sent only when
   ``VHOST_USER_PROTOCOL_F_CRYPTO_SESSION`` feature has been
@@ -1230,9 +1230,9 @@ Master message types
   :request payload: N/A
   :reply payload: userfault fd
 
-  When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, the master
-  advises slave that a migration with postcopy enabled is underway,
-  the slave must open a userfaultfd for later use.  Note that at this
+  When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, the front-end
+  advises back-end that a migration with postcopy enabled is underway,
+  the back-end must open a userfaultfd for later use.  Note that at this
   stage the migration is still in precopy mode.
 
 ``VHOST_USER_POSTCOPY_LISTEN``
@@ -1240,8 +1240,8 @@ Master message types
   :request payload: N/A
   :reply payload: N/A
 
-  Master advises slave that a transition to postcopy mode has
-  happened.  The slave must ensure that shared memory is registered
+  The front-end advises back-end that a transition to postcopy mode has
+  happened.  The back-end must ensure that shared memory is registered
   with userfaultfd to cause faulting of non-present pages.
 
   This is always sent sometime after a ``VHOST_USER_POSTCOPY_ADVISE``,
@@ -1252,7 +1252,7 @@ Master message types
   :request payload: N/A
   :reply payload: ``u64``
 
-  Master advises that postcopy migration has now completed.  The slave
+  The front-end advises that postcopy migration has now completed.  The back-end
   must disable the userfaultfd. The reply is an acknowledgement
   only.
 
@@ -1269,9 +1269,9 @@ Master message types
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
-  been successfully negotiated, this message is submitted by master to
-  get a shared buffer from slave. The shared buffer will be used to
-  track inflight I/O by slave. QEMU should retrieve a new one when vm
+  been successfully negotiated, this message is submitted by the front-end to
+  get a shared buffer from back-end. The shared buffer will be used to
+  track inflight I/O by back-end. QEMU should retrieve a new one when vm
   reset.
 
 ``VHOST_USER_SET_INFLIGHT_FD``
@@ -1281,9 +1281,9 @@ Master message types
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
-  been successfully negotiated, this message is submitted by master to
-  send the shared inflight buffer back to slave so that slave could
-  get inflight I/O after a crash or restart.
+  been successfully negotiated, this message is submitted by the front-end to
+  send the shared inflight buffer back to the back-end so that the back-end
+  could get inflight I/O after a crash or restart.
 
 ``VHOST_USER_GPU_SET_SOCKET``
   :id: 33
@@ -1292,7 +1292,7 @@ Master message types
   :reply payload: N/A
 
   Sets the GPU protocol socket file descriptor, which is passed as
-  ancillary data. The GPU protocol is used to inform the master of
+  ancillary data. The GPU protocol is used to inform the front-end of
   rendering state and updates. See vhost-user-gpu.rst for details.
 
 ``VHOST_USER_RESET_DEVICE``
@@ -1301,13 +1301,13 @@ Master message types
   :request payload: N/A
   :reply payload: N/A
 
-  Ask the vhost user backend to disable all rings and reset all
+  Ask the vhost user back-end to disable all rings and reset all
   internal device state to the initial state, ready to be
-  reinitialized. The backend retains ownership of the device
+  reinitialized. The back-end retains ownership of the device
   throughout the reset operation.
 
   Only valid if the ``VHOST_USER_PROTOCOL_F_RESET_DEVICE`` protocol
-  feature is set by the backend.
+  feature is set by the back-end.
 
 ``VHOST_USER_VRING_KICK``
   :id: 35
@@ -1317,9 +1317,9 @@ Master message types
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
-  submitted by the master to indicate that a buffer was added to
+  submitted by the front-end to indicate that a buffer was added to
   the vring instead of signalling it using the vring's kick file
-  descriptor or having the slave rely on polling.
+  descriptor or having the back-end rely on polling.
 
   The state.num field is currently reserved and must be set to 0.
 
@@ -1331,9 +1331,9 @@ Master message types
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
-  by master to the slave. The slave should return the message with a
+  by the front-end to the back-end. The back-end should return the message with a
   u64 payload containing the maximum number of memory slots for
-  QEMU to expose to the guest. The value returned by the backend
+  QEMU to expose to the guest. The value returned by the back-end
   will be capped at the maximum number of ram slots which can be
   supported by the target platform.
 
@@ -1345,13 +1345,13 @@ Master message types
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
-  by the master to the slave. The message payload contains a memory
+  by the front-end to the back-end. The message payload contains a memory
   region descriptor struct, describing a region of guest memory which
-  the slave device must map in. When the
+  the back-end device must map in. When the
   ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol feature has
   been successfully negotiated, along with the
   ``VHOST_USER_REM_MEM_REG`` message, this message is used to set and
-  update the memory tables of the slave device.
+  update the memory tables of the back-end device.
 
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
@@ -1361,13 +1361,13 @@ Master message types
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
-  by the master to the slave. The message payload contains a memory
+  by the front-end to the back-end. The message payload contains a memory
   region descriptor struct, describing a region of guest memory which
-  the slave device must unmap. When the
+  the back-end device must unmap. When the
   ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol feature has
   been successfully negotiated, along with the
   ``VHOST_USER_ADD_MEM_REG`` message, this message is used to set and
-  update the memory tables of the slave device.
+  update the memory tables of the back-end device.
 
 ``VHOST_USER_SET_STATUS``
   :id: 39
@@ -1376,8 +1376,8 @@ Master message types
   :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
-  successfully negotiated, this message is submitted by the master to
-  notify the backend with updated device status as defined in the Virtio
+  successfully negotiated, this message is submitted by the front-end to
+  notify the back-end with updated device status as defined in the Virtio
   specification.
 
 ``VHOST_USER_GET_STATUS``
@@ -1387,16 +1387,16 @@ Master message types
   :reply payload: ``u64``
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
-  successfully negotiated, this message is submitted by the master to
-  query the backend for its device status as defined in the Virtio
+  successfully negotiated, this message is submitted by the front-end to
+  query the back-end for its device status as defined in the Virtio
   specification.
 
 
-Slave message types
--------------------
+Back-end message types
+----------------------
 
-For this type of message, the request is sent by the slave and the reply
-is sent by the master.
+For this type of message, the request is sent by the back-end and the reply
+is sent by the front-end.
 
 ``VHOST_USER_SLAVE_IOTLB_MSG``
   :id: 1
@@ -1405,9 +1405,9 @@ is sent by the master.
   :reply payload: N/A
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
-  Slave sends such requests to notify of an IOTLB miss, or an IOTLB
+  The back-end sends such requests to notify of an IOTLB miss, or an IOTLB
   access failure. If ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is
-  negotiated, and slave set the ``VHOST_USER_NEED_REPLY`` flag, master
+  negotiated, and back-end set the ``VHOST_USER_NEED_REPLY`` flag, the front-end
   must respond with zero when operation is successfully completed, or
   non-zero otherwise.  This request should be send only when
   ``VIRTIO_F_IOMMU_PLATFORM`` feature has been successfully
@@ -1420,12 +1420,12 @@ is sent by the master.
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, vhost-user
-  slave sends such messages to notify that the virtio device's
+  back-end sends such messages to notify that the virtio device's
   configuration space has changed, for those host devices which can
   support such feature, host driver can send ``VHOST_USER_GET_CONFIG``
-  message to slave to get the latest content. If
-  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, and slave set the
-  ``VHOST_USER_NEED_REPLY`` flag, master must respond with zero when
+  message to the back-end to get the latest content. If
+  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, and the back-end sets the
+  ``VHOST_USER_NEED_REPLY`` flag, the front-end must respond with zero when
   operation is successfully completed, or non-zero otherwise.
 
 ``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``
@@ -1443,7 +1443,7 @@ is sent by the master.
   description. QEMU can mmap the file descriptor based on the size and
   offset to get a memory range. Registering a host notifier means
   mapping this memory range to the VM as the specified queue's notify
-  MMIO region. Slave sends this request to tell QEMU to de-register
+  MMIO region. The back-end sends this request to tell QEMU to de-register
   the existing notifier if any and register the new notifier if the
   request is sent with a file descriptor.
 
@@ -1459,9 +1459,9 @@ is sent by the master.
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
-  submitted by the slave to indicate that a buffer was used from
+  submitted by the back-end to indicate that a buffer was used from
   the vring instead of signalling this using the vring's call file
-  descriptor or having the master relying on polling.
+  descriptor or having the front-end relying on polling.
 
   The state.num field is currently reserved and must be set to 0.
 
@@ -1473,9 +1473,9 @@ is sent by the master.
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
-  submitted by the slave to indicate that an error occurred on the
+  submitted by the back-end to indicate that an error occurred on the
   specific vring, instead of signalling the error file descriptor
-  set by the master via ``VHOST_USER_SET_VRING_ERR``.
+  set by the front-end via ``VHOST_USER_SET_VRING_ERR``.
 
   The state.num field is currently reserved and must be set to 0.
 
@@ -1486,12 +1486,12 @@ VHOST_USER_PROTOCOL_F_REPLY_ACK
 
 The original vhost-user specification only demands replies for certain
 commands. This differs from the vhost protocol implementation where
-commands are sent over an ``ioctl()`` call and block until the client
+commands are sent over an ``ioctl()`` call and block until the back-end
 has completed.
 
 With this protocol extension negotiated, the sender (QEMU) can set the
 ``need_reply`` [Bit 3] flag to any command. This indicates that the
-client MUST respond with a Payload ``VhostUserMsg`` indicating success
+back-end MUST respond with a Payload ``VhostUserMsg`` indicating success
 or failure. The payload should be set to zero on success or non-zero
 on failure, unless the message already has an explicit reply body.
 
@@ -1500,7 +1500,7 @@ of the command. Today, QEMU is expected to terminate the main vhost-user
 loop upon receiving such errors. In future, qemu could be taught to be more
 resilient for selective requests.
 
-For the message types that already solicit a reply from the client,
+For the message types that already solicit a reply from the back-end,
 the presence of ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` or need_reply bit
 being set brings no behavioural change. (See the Communication_
 section for details.)
@@ -1510,26 +1510,26 @@ section for details.)
 Backend program conventions
 ===========================
 
-vhost-user backends can provide various devices & services and may
+vhost-user back-ends can provide various devices & services and may
 need to be configured manually depending on the use case. However, it
 is a good idea to follow the conventions listed here when
 possible. Users, QEMU or libvirt, can then rely on some common
 behaviour to avoid heterogeneous configuration and management of the
-backend programs and facilitate interoperability.
+back-end programs and facilitate interoperability.
 
-Each backend installed on a host system should come with at least one
+Each back-end installed on a host system should come with at least one
 JSON file that conforms to the vhost-user.json schema. Each file
-informs the management applications about the backend type, and binary
+informs the management applications about the back-end type, and binary
 location. In addition, it defines rules for management apps for
-picking the highest priority backend when multiple match the search
+picking the highest priority back-end when multiple match the search
 criteria (see ``@VhostUserBackend`` documentation in the schema file).
 
-If the backend is not capable of enabling a requested feature on the
+If the back-end is not capable of enabling a requested feature on the
 host (such as 3D acceleration with virgl), or the initialization
-failed, the backend should fail to start early and exit with a status
+failed, the back-end should fail to start early and exit with a status
 != 0. It may also print a message to stderr for further details.
 
-The backend program must not daemonize itself, but it may be
+The back-end program must not daemonize itself, but it may be
 daemonized by the management layer. It may also have a restricted
 access to the system.
 
@@ -1537,7 +1537,7 @@ File descriptors 0, 1 and 2 will exist, and have regular
 stdin/stdout/stderr usage (they may have been redirected to /dev/null
 by the management layer, or to a log handler).
 
-The backend program must end (as quickly and cleanly as possible) when
+The back-end program must end (as quickly and cleanly as possible) when
 the SIGTERM signal is received. Eventually, it may receive SIGKILL by
 the management layer after a few seconds.
 
@@ -1551,15 +1551,15 @@ are mandatory, unless explicitly said differently:
 
 --fd=FDNUM
 
-  When this argument is given, the backend program is started with the
+  When this argument is given, the back-end program is started with the
   vhost-user socket as file descriptor FDNUM. It is incompatible with
   --socket-path.
 
 --print-capabilities
 
-  Output to stdout the backend capabilities in JSON format, and then
+  Output to stdout the back-end capabilities in JSON format, and then
   exit successfully. Other options and arguments should be ignored, and
-  the backend program should not perform its normal function.  The
+  the back-end program should not perform its normal function.  The
   capabilities can be reported dynamically depending on the host
   capabilities.
 
-- 
2.30.2


