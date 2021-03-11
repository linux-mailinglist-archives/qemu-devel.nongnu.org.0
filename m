Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3E337020
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:37:37 +0100 (CET)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIhE-0000oe-Ol
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcx-0002cB-Jl
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcs-0005ec-S4
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLcFNkqOkaJ8qyUL1RxviiUPLzvjpxNQr4n6RcWbZH4=;
 b=ZXVfx9fo7yet1iIGktxsZUkkHRpsfVEDV5dx/b15PFLFu6vLkjATP9oDt3tpfoQaOMEeUW
 jWPPFS7sOIPwkHv1ZuO0amMvwHFlMYFz4TD+CoSuHhgT3e6TLE2yPUyi4hEwvfmDR/jyb9
 jZw11QNcHVujdYI777wghGHECb/nUMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-YtDVkFNIMgyGVLwj1zH2WQ-1; Thu, 11 Mar 2021 05:33:04 -0500
X-MC-Unique: YtDVkFNIMgyGVLwj1zH2WQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D52610866A3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB1B529400;
 Thu, 11 Mar 2021 10:33:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] docs: vhost-user: replace master/slave with
 frontend/backend
Date: Thu, 11 Mar 2021 05:32:46 -0500
Message-Id: <20210311103250.532191-4-pbonzini@redhat.com>
In-Reply-To: <20210311103250.532191-1-pbonzini@redhat.com>
References: <20210311103250.532191-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This matches the nomenclature that is generally used.  Also commonly used
is client/server, but it is not as clear because sometimes the frontend
exposes a passive (server) socket that the backend connects to.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	v1->v2: use frontend/backend instead of the version with hyphen

 docs/interop/vhost-user-gpu.rst |  10 +-
 docs/interop/vhost-user.rst     | 302 ++++++++++++++++----------------
 2 files changed, 156 insertions(+), 156 deletions(-)

diff --git a/docs/interop/vhost-user-gpu.rst b/docs/interop/vhost-user-gpu.rst
index 3268bf405c..1926149c07 100644
--- a/docs/interop/vhost-user-gpu.rst
+++ b/docs/interop/vhost-user-gpu.rst
@@ -12,10 +12,10 @@ Introduction
 ============
 
 The vhost-user-gpu protocol is aiming at sharing the rendering result
-of a virtio-gpu, done from a vhost-user slave process to a vhost-user
-master process (such as QEMU). It bears a resemblance to a display
+of a virtio-gpu, done from a vhost-user backend process to a vhost-user
+frontend process (such as QEMU). It bears a resemblance to a display
 server protocol, if you consider QEMU as the display server and the
-slave as the client, but in a very limited way. Typically, it will
+backend as the client, but in a very limited way. Typically, it will
 work by setting a scanout/display configuration, before sending flush
 events for the display updates. It will also update the cursor shape
 and position.
@@ -25,8 +25,8 @@ socket ancillary data to share opened file descriptors (DMABUF fds or
 shared memory). The socket is usually obtained via
 ``VHOST_USER_GPU_SET_SOCKET``.
 
-Requests are sent by the *slave*, and the optional replies by the
-*master*.
+Requests are sent by the *backend*, and the optional replies by the
+*frontend*.
 
 Wire format
 ===========
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index f98896fbd0..96be549127 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -19,19 +19,19 @@ space process on the same host. It uses communication over a Unix
 domain socket to share file descriptors in the ancillary data of the
 message.
 
-The protocol defines 2 sides of the communication, *master* and
-*slave*. *Master* is the application that shares its virtqueues, in
-our case QEMU. *Slave* is the consumer of the virtqueues.
+The protocol defines 2 sides of the communication, *frontend* and
+*backend*. The *frontend* is the application that shares its virtqueues, in
+our case QEMU. The *backend* is the consumer of the virtqueues.
 
-In the current implementation QEMU is the *master*, and the *slave* is
-the external process consuming the virtio queues, for example a
+In the current implementation QEMU is the *frontend*, and the *backend*
+is the external process consuming the virtio queues, for example a
 software Ethernet switch running in user space, such as Snabbswitch,
 or a block device backend processing read & write to a virtual
 disk. In order to facilitate interoperability between various backend
 implementations, it is recommended to follow the :ref:`Backend program
 conventions <backend_conventions>`.
 
-*Master* and *slave* can be either a client (i.e. connecting) or
+The *frontend* and *backend* can be either a client (i.e. connecting) or
 server (listening) in the socket communication.
 
 Message Specification
@@ -53,7 +53,7 @@ Header
 :flags: 32-bit bit field
 
 - Lower 2 bits are the version (currently 0x01)
-- Bit 2 is the reply flag - needs to be sent on each reply from the slave
+- Bit 2 is the reply flag - needs to be sent on each reply from the backend
 - Bit 3 is the need_reply flag - see :ref:`REPLY_ACK <reply_ack>` for
   details.
 
@@ -198,8 +198,8 @@ Virtio device config space
 :size: a 32-bit configuration space access size in bytes
 
 :flags: a 32-bit value:
-  - 0: Vhost master messages used for writeable fields
-  - 1: Vhost master messages used for live migration
+  - 0: Vhost frontend messages used for writeable fields
+  - 1: Vhost frontend messages used for live migration
 
 :payload: Size bytes array holding the contents of the virtio
           device's configuration space
@@ -266,8 +266,8 @@ vhost for the Linux Kernel. Most messages that can be sent via the
 Unix domain socket implementing vhost-user have an equivalent ioctl to
 the kernel implementation.
 
-The communication consists of *master* sending message requests and
-*slave* sending message replies. Most of the requests don't require
+The communication consists of the *frontend* sending message requests and
+the *backend* sending message replies. Most of the requests don't require
 replies. Here is a list of the ones that do:
 
 * ``VHOST_USER_GET_FEATURES``
@@ -281,7 +281,7 @@ replies. Here is a list of the ones that do:
    :ref:`REPLY_ACK <reply_ack>`
        The section on ``REPLY_ACK`` protocol extension.
 
-There are several messages that the master sends with file descriptors passed
+There are several messages that the frontend sends with file descriptors passed
 in the ancillary data:
 
 * ``VHOST_USER_SET_MEM_TABLE``
@@ -293,16 +293,16 @@ in the ancillary data:
 * ``VHOST_USER_SET_SLAVE_REQ_FD``
 * ``VHOST_USER_SET_INFLIGHT_FD`` (if ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD``)
 
-If *master* is unable to send the full message or receives a wrong
+If *frontend* is unable to send the full message or receives a wrong
 reply it will close the connection. An optional reconnection mechanism
 can be implemented.
 
-If *slave* detects some error such as incompatible features, it may also
+If *backend* detects some error such as incompatible features, it may also
 close the connection. This should only happen in exceptional circumstances.
 
 Any protocol extensions are gated by protocol feature bits, which
-allows full backwards compatibility on both master and slave.  As
-older slaves don't support negotiating protocol features, a feature
+allows full backwards compatibility on both frontend and backend.  As
+older backends don't support negotiating protocol features, a feature
 bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
@@ -312,20 +312,20 @@ Ring states
 
 Rings can be in one of three states:
 
-* stopped: the slave must not process the ring at all.
+* stopped: the backend must not process the ring at all.
 
-* started but disabled: the slave must process the ring without
+* started but disabled: the backend must process the ring without
   causing any side effects.  For example, for a networking device,
-  in the disabled state the slave must not supply any new RX packets,
+  in the disabled state the backend must not supply any new RX packets,
   but must process and discard any TX packets.
 
 * started and enabled.
 
-Each ring is initialized in a stopped state.  The slave must start the
+Each ring is initialized in a stopped state.  The backend must start the
 ring upon receiving a kick (that is, detecting that file descriptor is
 readable) on the descriptor specified by ``VHOST_USER_SET_VRING_KICK``,
 or receiving the in-band message ``VHOST_USER_VRING_KICK`` if negotiated.
-The slave must stop the ring upon receiving ``VHOST_USER_GET_VRING_BASE``.
+The backend must stop the ring upon receiving ``VHOST_USER_GET_VRING_BASE``.
 
 Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.
 
@@ -336,53 +336,53 @@ If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
 initialized in a disabled state and is enabled by
 ``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
 
-While processing the rings (whether they are enabled or not), the slave
+While processing the rings (whether they are enabled or not), the backend
 must support changing some configuration aspects on the fly.
 
 Multiple queue support
 ----------------------
 
-Many devices have a fixed number of virtqueues.  In this case the master
+Many devices have a fixed number of virtqueues.  In this case the frontend
 already knows the number of available virtqueues without communicating with the
-slave.
+backend.
 
 Some devices do not have a fixed number of virtqueues.  Instead the maximum
-number of virtqueues is chosen by the slave.  The number can depend on host
-resource availability or slave implementation details.  Such devices are called
+number of virtqueues is chosen by the backend.  The number can depend on host
+resource availability or backend implementation details.  Such devices are called
 multiple queue devices.
 
-Multiple queue support allows the slave to advertise the maximum number of
-queues.  This is treated as a protocol extension, hence the slave has to
+Multiple queue support allows the backend to advertise the maximum number of
+queues.  This is treated as a protocol extension, hence the backend has to
 implement protocol features first. The multiple queues feature is supported
 only when the protocol feature ``VHOST_USER_PROTOCOL_F_MQ`` (bit 0) is set.
 
-The max number of queues the slave supports can be queried with message
-``VHOST_USER_GET_QUEUE_NUM``. Master should stop when the number of requested
+The max number of queues the backend supports can be queried with message
+``VHOST_USER_GET_QUEUE_NUM``. Frontend should stop when the number of requested
 queues is bigger than that.
 
-As all queues share one connection, the master uses a unique index for each
+As all queues share one connection, the frontend uses a unique index for each
 queue in the sent message to identify a specified queue.
 
-The master enables queues by sending message ``VHOST_USER_SET_VRING_ENABLE``.
+The frontend enables queues by sending message ``VHOST_USER_SET_VRING_ENABLE``.
 vhost-user-net has historically automatically enabled the first queue pair.
 
-Slaves should always implement the ``VHOST_USER_PROTOCOL_F_MQ`` protocol
+Back-ends should always implement the ``VHOST_USER_PROTOCOL_F_MQ`` protocol
 feature, even for devices with a fixed number of virtqueues, since it is simple
 to implement and offers a degree of introspection.
 
-Masters must not rely on the ``VHOST_USER_PROTOCOL_F_MQ`` protocol feature for
+Frontends must not rely on the ``VHOST_USER_PROTOCOL_F_MQ`` protocol feature for
 devices with a fixed number of virtqueues.  Only true multiqueue devices
 require this protocol feature.
 
 Migration
 ---------
 
-During live migration, the master may need to track the modifications
-the slave makes to the memory mapped regions. The client should mark
+During live migration, the frontend may need to track the modifications
+the backend makes to the memory mapped regions. The frontend should mark
 the dirty pages in a log. Once it complies to this logging, it may
 declare the ``VHOST_F_LOG_ALL`` vhost feature.
 
-To start/stop logging of data/used ring writes, server may send
+To start/stop logging of data/used ring writes, the frontend may send
 messages ``VHOST_USER_SET_FEATURES`` with ``VHOST_F_LOG_ALL`` and
 ``VHOST_USER_SET_VRING_ADDR`` with ``VHOST_VRING_F_LOG`` in ring's
 flags set to 1/0, respectively.
@@ -396,7 +396,7 @@ Dirty pages are of size::
   #define VHOST_LOG_PAGE 0x1000
 
 The log memory fd is provided in the ancillary data of
-``VHOST_USER_SET_LOG_BASE`` message when the slave has
+``VHOST_USER_SET_LOG_BASE`` message when the backend has
 ``VHOST_USER_PROTOCOL_F_LOG_SHMFD`` protocol feature.
 
 The size of the log is supplied as part of ``VhostUserMsg`` which
@@ -422,26 +422,26 @@ the bit offset of the last byte of the ring must fall within the size
 supplied by ``VhostUserLog``.
 
 ``VHOST_USER_SET_LOG_FD`` is an optional message with an eventfd in
-ancillary data, it may be used to inform the master that the log has
+ancillary data, it may be used to inform the frontend that the log has
 been modified.
 
 Once the source has finished migration, rings will be stopped by the
 source. No further update must be done before rings are restarted.
 
-In postcopy migration the slave is started before all the memory has
+In postcopy migration the backend is started before all the memory has
 been received from the source host, and care must be taken to avoid
-accessing pages that have yet to be received.  The slave opens a
+accessing pages that have yet to be received.  The backend opens a
 'userfault'-fd and registers the memory with it; this fd is then
-passed back over to the master.  The master services requests on the
+passed back over to the frontend.  The frontend services requests on the
 userfaultfd for pages that are accessed and when the page is available
 it performs WAKE ioctl's on the userfaultfd to wake the stalled
-slave.  The client indicates support for this via the
+backend.  The frontend indicates support for this via the
 ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` feature.
 
 Memory access
 -------------
 
-The master sends a list of vhost memory regions to the slave using the
+The frontend sends a list of vhost memory regions to the backend using the
 ``VHOST_USER_SET_MEM_TABLE`` message.  Each region has two base
 addresses: a guest address and a user address.
 
@@ -466,60 +466,60 @@ IOMMU support
 -------------
 
 When the ``VIRTIO_F_IOMMU_PLATFORM`` feature has been negotiated, the
-master sends IOTLB entries update & invalidation by sending
-``VHOST_USER_IOTLB_MSG`` requests to the slave with a ``struct
+frontend sends IOTLB entries update & invalidation by sending
+``VHOST_USER_IOTLB_MSG`` requests to the backend with a ``struct
 vhost_iotlb_msg`` as payload. For update events, the ``iotlb`` payload
 has to be filled with the update message type (2), the I/O virtual
 address, the size, the user virtual address, and the permissions
 flags. Addresses and size must be within vhost memory regions set via
 the ``VHOST_USER_SET_MEM_TABLE`` request. For invalidation events, the
 ``iotlb`` payload has to be filled with the invalidation message type
-(3), the I/O virtual address and the size. On success, the slave is
+(3), the I/O virtual address and the size. On success, the backend is
 expected to reply with a zero payload, non-zero otherwise.
 
-The slave relies on the slave communication channel (see :ref:`Slave
-communication <slave_communication>` section below) to send IOTLB miss
+The backend relies on the backend communication channel (see :ref:`Back-end
+communication <backend_communication>` section below) to send IOTLB miss
 and access failure events, by sending ``VHOST_USER_SLAVE_IOTLB_MSG``
-requests to the master with a ``struct vhost_iotlb_msg`` as
+requests to the frontend with a ``struct vhost_iotlb_msg`` as
 payload. For miss events, the iotlb payload has to be filled with the
 miss message type (1), the I/O virtual address and the permissions
 flags. For access failure event, the iotlb payload has to be filled
 with the access failure message type (4), the I/O virtual address and
-the permissions flags.  For synchronization purpose, the slave may
-rely on the reply-ack feature, so the master may send a reply when
+the permissions flags.  For synchronization purpose, the backend may
+rely on the reply-ack feature, so the frontend may send a reply when
 operation is completed if the reply-ack feature is negotiated and
-slaves requests a reply. For miss events, completed operation means
-either master sent an update message containing the IOTLB entry
-containing requested address and permission, or master sent nothing if
+backends requests a reply. For miss events, completed operation means
+either frontend sent an update message containing the IOTLB entry
+containing requested address and permission, or frontend sent nothing if
 the IOTLB miss message is invalid (invalid IOVA or permission).
 
-The master isn't expected to take the initiative to send IOTLB update
-messages, as the slave sends IOTLB miss messages for the guest virtual
+The frontend isn't expected to take the initiative to send IOTLB update
+messages, as the backend sends IOTLB miss messages for the guest virtual
 memory areas it needs to access.
 
-.. _slave_communication:
+.. _backend_communication:
 
-Slave communication
--------------------
+Back-end communication
+----------------------
 
-An optional communication channel is provided if the slave declares
+An optional communication channel is provided if the backend declares
 ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` protocol feature, to allow the
-slave to make requests to the master.
+backend to make requests to the frontend.
 
 The fd is provided via ``VHOST_USER_SET_SLAVE_REQ_FD`` ancillary data.
 
-A slave may then send ``VHOST_USER_SLAVE_*`` messages to the master
+A backend may then send ``VHOST_USER_SLAVE_*`` messages to the frontend
 using this fd communication channel.
 
 If ``VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD`` protocol feature is
-negotiated, slave can send file descriptors (at most 8 descriptors in
-each message) to master via ancillary data using this fd communication
+negotiated, backend can send file descriptors (at most 8 descriptors in
+each message) to frontend via ancillary data using this fd communication
 channel.
 
 Inflight I/O tracking
 ---------------------
 
-To support reconnecting after restart or crash, slave may need to
+To support reconnecting after restart or crash, backend may need to
 resubmit inflight I/Os. If virtqueue is processed in order, we can
 easily achieve that by getting the inflight descriptors from
 descriptor table (split virtqueue) or descriptor ring (packed
@@ -527,18 +527,18 @@ virtqueue). However, it can't work when we process descriptors
 out-of-order because some entries which store the information of
 inflight descriptors in available ring (split virtqueue) or descriptor
 ring (packed virtqueue) might be overridden by new entries. To solve
-this problem, slave need to allocate an extra buffer to store this
-information of inflight descriptors and share it with master for
+this problem, the backend need to allocate an extra buffer to store this
+information of inflight descriptors and share it with frontend for
 persistent. ``VHOST_USER_GET_INFLIGHT_FD`` and
 ``VHOST_USER_SET_INFLIGHT_FD`` are used to transfer this buffer
-between master and slave. And the format of this buffer is described
+between frontend and backend. And the format of this buffer is described
 below:
 
 +---------------+---------------+-----+---------------+
 | queue0 region | queue1 region | ... | queueN region |
 +---------------+---------------+-----+---------------+
 
-N is the number of available virtqueues. Slave could get it from num
+N is the number of available virtqueues. The backend could get it from num
 queues field of ``VhostUserInflight``.
 
 For split virtqueue, queue region can be implemented as:
@@ -570,8 +570,8 @@ For split virtqueue, queue region can be implemented as:
        * Zero value indicates an uninitialized buffer */
       uint16_t version;
 
-      /* The size of DescStateSplit array. It's equal to the virtqueue
-       * size. Slave could get it from queue size field of VhostUserInflight. */
+      /* The size of DescStateSplit array. It's equal to the virtqueue size.
+       * The backend could get it from queue size field of VhostUserInflight. */
       uint16_t desc_num;
 
       /* The head of list that track the last batch of used descriptors. */
@@ -677,8 +677,8 @@ For packed virtqueue, queue region can be implemented as:
        * Zero value indicates an uninitialized buffer */
       uint16_t version;
 
-      /* The size of DescStatePacked array. It's equal to the virtqueue
-       * size. Slave could get it from queue size field of VhostUserInflight. */
+      /* The size of DescStatePacked array. It's equal to the virtqueue size.
+       * The backend could get it from queue size field of VhostUserInflight. */
       uint16_t desc_num;
 
       /* The head of free DescStatePacked entry list */
@@ -770,7 +770,7 @@ When reconnecting:
    #. Use ``old_used_wrap_counter`` to calculate the available flags
 
    #. If ``d.flags`` is not equal to the calculated flags value (means
-      slave has submitted the buffer to guest driver before crash, so
+      backend has submitted the buffer to guest driver before crash, so
       it has to commit the in-progres update), set ``old_free_head``,
       ``old_used_idx``, ``old_used_wrap_counter`` to ``free_head``,
       ``used_idx``, ``used_wrap_counter``
@@ -799,11 +799,11 @@ cause the sending application(s) to block, it is not advised to use
 this feature unless absolutely necessary. It is also considered an
 error to negotiate this feature without also negotiating
 ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` and ``VHOST_USER_PROTOCOL_F_REPLY_ACK``,
-the former is necessary for getting a message channel from the slave
-to the master, while the latter needs to be used with the in-band
+the former is necessary for getting a message channel from the backend
+to the frontend, while the latter needs to be used with the in-band
 notification messages to block until they are processed, both to avoid
 blocking later and for proper processing (at least in the simulation
-use case.) As it has no other way of signalling this error, the slave
+use case.) As it has no other way of signalling this error, the backend
 should close the connection as a response to a
 ``VHOST_USER_SET_PROTOCOL_FEATURES`` message that sets the in-band
 notifications feature flag without the other two.
@@ -831,11 +831,11 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
 
-Master message types
---------------------
+Frontend message types
+-----------------------
 
-For this type of message, the request is sent by the master and the
-reply is sent by the slave.
+For this type of message, the request is sent by the frontend and the
+reply is sent by the backend.
 
 ``VHOST_USER_GET_FEATURES``
   :id: 1
@@ -844,7 +844,7 @@ reply is sent by the slave.
   :reply payload: ``u64``
 
   Get from the underlying vhost implementation the features bitmask.
-  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals slave support
+  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals backend support
   for ``VHOST_USER_GET_PROTOCOL_FEATURES`` and
   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
 
@@ -856,7 +856,7 @@ reply is sent by the slave.
 
   Enable features in the underlying vhost implementation using a
   bitmask.  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals
-  slave support for ``VHOST_USER_GET_PROTOCOL_FEATURES`` and
+  backend support for ``VHOST_USER_GET_PROTOCOL_FEATURES`` and
   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
 
 ``VHOST_USER_GET_PROTOCOL_FEATURES``
@@ -871,7 +871,7 @@ reply is sent by the slave.
   ``VHOST_USER_GET_FEATURES``.
 
 .. Note::
-   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must
+   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
    support this message even before ``VHOST_USER_SET_FEATURES`` was
    called.
 
@@ -887,7 +887,7 @@ reply is sent by the slave.
   ``VHOST_USER_GET_FEATURES``.
 
 .. Note::
-   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
+   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
    this message even before ``VHOST_USER_SET_FEATURES`` was called.
 
 ``VHOST_USER_SET_OWNER``
@@ -896,8 +896,8 @@ reply is sent by the slave.
   :request payload: N/A
   :reply payload: N/A
 
-  Issued when a new connection is established. It sets the current
-  *master* as an owner of the session. This can be used on the *slave*
+  Issued when a new connection is established. It marks the sender
+  as the frontend that owns of the session. This can be used on the *backend*
   as a "session start" flag.
 
 ``VHOST_USER_RESET_OWNER``
@@ -908,9 +908,9 @@ reply is sent by the slave.
 .. admonition:: Deprecated
 
    This is no longer used. Used to be sent to request disabling all
-   rings, but some clients interpreted it to also discard connection
+   rings, but some backends interpreted it to also discard connection
    state (this interpretation would lead to bugs).  It is recommended
-   that clients either ignore this message, or use it to disable all
+   that backends either ignore this message, or use it to disable all
    rings.
 
 ``VHOST_USER_SET_MEM_TABLE``
@@ -919,14 +919,14 @@ reply is sent by the slave.
   :request payload: memory regions description
   :reply payload: (postcopy only) memory regions description
 
-  Sets the memory map regions on the slave so it can translate the
+  Sets the memory map regions on the backend so it can translate the
   vring addresses. In the ancillary data there is an array of file
   descriptors for each memory mapped region. The size and ordering of
   the fds matches the number and ordering of memory regions.
 
   When ``VHOST_USER_POSTCOPY_LISTEN`` has been received,
   ``SET_MEM_TABLE`` replies with the bases of the memory mapped
-  regions to the master.  The slave must have mmap'd the regions but
+  regions to the frontend.  The backend must have mmap'd the regions but
   not yet accessed them and should not yet generate a userfault
   event.
 
@@ -945,7 +945,7 @@ reply is sent by the slave.
 
   Sets logging shared memory space.
 
-  When slave has ``VHOST_USER_PROTOCOL_F_LOG_SHMFD`` protocol feature,
+  When the backend has ``VHOST_USER_PROTOCOL_F_LOG_SHMFD`` protocol feature,
   the log memory fd is provided in the ancillary data of
   ``VHOST_USER_SET_LOG_BASE`` message, the size and offset of shared
   memory area provided in the message.
@@ -1064,7 +1064,7 @@ reply is sent by the slave.
   :request payload: vring state description
   :reply payload: N/A
 
-  Signal slave to enable or disable corresponding vring.
+  Signal the backend to enable or disable corresponding vring.
 
   This request should be sent only when
   ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated.
@@ -1099,7 +1099,7 @@ reply is sent by the slave.
   ``VHOST_USER_PROTOCOL_F_NET_MTU`` is present in
   ``VHOST_USER_GET_PROTOCOL_FEATURES``.
 
-  If ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, slave must
+  If ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, the backend must
   respond with zero in case the specified MTU is valid, or non-zero
   otherwise.
 
@@ -1109,14 +1109,14 @@ reply is sent by the slave.
   :request payload: N/A
   :reply payload: N/A
 
-  Set the socket file descriptor for slave initiated requests. It is passed
+  Set the socket file descriptor for backend initiated requests. It is passed
   in the ancillary data.
 
   This request should be sent only when
   ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, and protocol
   feature bit ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` bit is present in
   ``VHOST_USER_GET_PROTOCOL_FEATURES``.  If
-  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, slave must
+  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, the backend must
   respond with zero for success, non-zero otherwise.
 
 ``VHOST_USER_IOTLB_MSG``
@@ -1127,8 +1127,8 @@ reply is sent by the slave.
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
 
-  Master sends such requests to update and invalidate entries in the
-  device IOTLB. The slave has to acknowledge the request with sending
+  The frontend sends such requests to update and invalidate entries in the
+  device IOTLB. The backend has to acknowledge the request with sending
   zero as ``u64`` payload for success, non-zero otherwise.
 
   This request should be send only when ``VIRTIO_F_IOMMU_PLATFORM``
@@ -1148,7 +1148,7 @@ reply is sent by the slave.
   ``VHOST_USER_PROTOCOL_F_CROSS_ENDIAN`` has been negotiated.
   Backends that negotiated this feature should handle both
   endiannesses and expect this message once (per VQ) during device
-  configuration (ie. before the master starts the VQ).
+  configuration (ie. before the frontend starts the VQ).
 
 ``VHOST_USER_GET_CONFIG``
   :id: 24
@@ -1157,11 +1157,11 @@ reply is sent by the slave.
   :reply payload: virtio device config space
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
-  submitted by the vhost-user master to fetch the contents of the
-  virtio device configuration space, vhost-user slave's payload size
-  MUST match master's request, vhost-user slave uses zero length of
-  payload to indicate an error to vhost-user master. The vhost-user
-  master may cache the contents to avoid repeated
+  submitted by the vhost-user frontend to fetch the contents of the
+  virtio device configuration space, vhost-user backend's payload size
+  MUST match the frontend's request, vhost-user backend uses zero length of
+  payload to indicate an error to the vhost-user frontend. The vhost-user
+  frontend may cache the contents to avoid repeated
   ``VHOST_USER_GET_CONFIG`` calls.
 
 ``VHOST_USER_SET_CONFIG``
@@ -1171,10 +1171,10 @@ reply is sent by the slave.
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
-  submitted by the vhost-user master when the Guest changes the virtio
+  submitted by the vhost-user frontend when the Guest changes the virtio
   device configuration space and also can be used for live migration
-  on the destination host. The vhost-user slave must check the flags
-  field, and slaves MUST NOT accept SET_CONFIG for read-only
+  on the destination host. The vhost-user backend must check the flags
+  field, and backends MUST NOT accept SET_CONFIG for read-only
   configuration space fields unless the live migration bit is set.
 
 ``VHOST_USER_CREATE_CRYPTO_SESSION``
@@ -1183,7 +1183,7 @@ reply is sent by the slave.
   :request payload: crypto session description
   :reply payload: crypto session description
 
-  Create a session for crypto operation. The server side must return
+  Create a session for crypto operation. The backend must return
   the session id, 0 or positive for success, negative for failure.
   This request should be sent only when
   ``VHOST_USER_PROTOCOL_F_CRYPTO_SESSION`` feature has been
@@ -1209,9 +1209,9 @@ reply is sent by the slave.
   :request payload: N/A
   :reply payload: userfault fd
 
-  When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, the master
-  advises slave that a migration with postcopy enabled is underway,
-  the slave must open a userfaultfd for later use.  Note that at this
+  When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, the frontend
+  advises backend that a migration with postcopy enabled is underway,
+  the backend must open a userfaultfd for later use.  Note that at this
   stage the migration is still in precopy mode.
 
 ``VHOST_USER_POSTCOPY_LISTEN``
@@ -1219,8 +1219,8 @@ reply is sent by the slave.
   :request payload: N/A
   :reply payload: N/A
 
-  Master advises slave that a transition to postcopy mode has
-  happened.  The slave must ensure that shared memory is registered
+  The frontend advises backend that a transition to postcopy mode has
+  happened.  The backend must ensure that shared memory is registered
   with userfaultfd to cause faulting of non-present pages.
 
   This is always sent sometime after a ``VHOST_USER_POSTCOPY_ADVISE``,
@@ -1231,7 +1231,7 @@ reply is sent by the slave.
   :request payload: N/A
   :reply payload: ``u64``
 
-  Master advises that postcopy migration has now completed.  The slave
+  The frontend advises that postcopy migration has now completed.  The backend
   must disable the userfaultfd. The reply is an acknowledgement
   only.
 
@@ -1248,9 +1248,9 @@ reply is sent by the slave.
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
-  been successfully negotiated, this message is submitted by master to
-  get a shared buffer from slave. The shared buffer will be used to
-  track inflight I/O by slave. QEMU should retrieve a new one when vm
+  been successfully negotiated, this message is submitted by the frontend to
+  get a shared buffer from backend. The shared buffer will be used to
+  track inflight I/O by backend. QEMU should retrieve a new one when vm
   reset.
 
 ``VHOST_USER_SET_INFLIGHT_FD``
@@ -1260,9 +1260,9 @@ reply is sent by the slave.
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
-  been successfully negotiated, this message is submitted by master to
-  send the shared inflight buffer back to slave so that slave could
-  get inflight I/O after a crash or restart.
+  been successfully negotiated, this message is submitted by the frontend to
+  send the shared inflight buffer back to the backend so that the backend
+  could get inflight I/O after a crash or restart.
 
 ``VHOST_USER_GPU_SET_SOCKET``
   :id: 33
@@ -1271,7 +1271,7 @@ reply is sent by the slave.
   :reply payload: N/A
 
   Sets the GPU protocol socket file descriptor, which is passed as
-  ancillary data. The GPU protocol is used to inform the master of
+  ancillary data. The GPU protocol is used to inform the frontend of
   rendering state and updates. See vhost-user-gpu.rst for details.
 
 ``VHOST_USER_RESET_DEVICE``
@@ -1296,9 +1296,9 @@ reply is sent by the slave.
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
-  submitted by the master to indicate that a buffer was added to
+  submitted by the frontend to indicate that a buffer was added to
   the vring instead of signalling it using the vring's kick file
-  descriptor or having the slave rely on polling.
+  descriptor or having the backend rely on polling.
 
   The state.num field is currently reserved and must be set to 0.
 
@@ -1310,7 +1310,7 @@ reply is sent by the slave.
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
-  by master to the slave. The slave should return the message with a
+  by the frontend to the backend. The backend should return the message with a
   u64 payload containing the maximum number of memory slots for
   QEMU to expose to the guest. The value returned by the backend
   will be capped at the maximum number of ram slots which can be
@@ -1324,13 +1324,13 @@ reply is sent by the slave.
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
-  by the master to the slave. The message payload contains a memory
+  by the frontend to the backend. The message payload contains a memory
   region descriptor struct, describing a region of guest memory which
-  the slave device must map in. When the
+  the backend device must map in. When the
   ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol feature has
   been successfully negotiated, along with the
   ``VHOST_USER_REM_MEM_REG`` message, this message is used to set and
-  update the memory tables of the slave device.
+  update the memory tables of the backend device.
 
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
@@ -1340,13 +1340,13 @@ reply is sent by the slave.
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
-  by the master to the slave. The message payload contains a memory
+  by the frontend to the backend. The message payload contains a memory
   region descriptor struct, describing a region of guest memory which
-  the slave device must unmap. When the
+  the backend device must unmap. When the
   ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol feature has
   been successfully negotiated, along with the
   ``VHOST_USER_ADD_MEM_REG`` message, this message is used to set and
-  update the memory tables of the slave device.
+  update the memory tables of the backend device.
 
 ``VHOST_USER_SET_STATUS``
   :id: 39
@@ -1355,7 +1355,7 @@ reply is sent by the slave.
   :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
-  successfully negotiated, this message is submitted by the master to
+  successfully negotiated, this message is submitted by the frontend to
   notify the backend with updated device status as defined in the Virtio
   specification.
 
@@ -1366,16 +1366,16 @@ reply is sent by the slave.
   :reply payload: ``u64``
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
-  successfully negotiated, this message is submitted by the master to
+  successfully negotiated, this message is submitted by the frontend to
   query the backend for its device status as defined in the Virtio
   specification.
 
 
-Slave message types
--------------------
+Back-end message types
+----------------------
 
-For this type of message, the request is sent by the slave and the reply
-is sent by the master.
+For this type of message, the request is sent by the backend and the reply
+is sent by the frontend.
 
 ``VHOST_USER_SLAVE_IOTLB_MSG``
   :id: 1
@@ -1384,9 +1384,9 @@ is sent by the master.
   :reply payload: N/A
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
-  Slave sends such requests to notify of an IOTLB miss, or an IOTLB
+  The backend sends such requests to notify of an IOTLB miss, or an IOTLB
   access failure. If ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is
-  negotiated, and slave set the ``VHOST_USER_NEED_REPLY`` flag, master
+  negotiated, and backend set the ``VHOST_USER_NEED_REPLY`` flag, the frontend
   must respond with zero when operation is successfully completed, or
   non-zero otherwise.  This request should be send only when
   ``VIRTIO_F_IOMMU_PLATFORM`` feature has been successfully
@@ -1399,12 +1399,12 @@ is sent by the master.
   :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, vhost-user
-  slave sends such messages to notify that the virtio device's
+  backend sends such messages to notify that the virtio device's
   configuration space has changed, for those host devices which can
   support such feature, host driver can send ``VHOST_USER_GET_CONFIG``
-  message to slave to get the latest content. If
-  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, and slave set the
-  ``VHOST_USER_NEED_REPLY`` flag, master must respond with zero when
+  message to the backend to get the latest content. If
+  ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, and the backend sets the
+  ``VHOST_USER_NEED_REPLY`` flag, the frontend must respond with zero when
   operation is successfully completed, or non-zero otherwise.
 
 ``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``
@@ -1422,7 +1422,7 @@ is sent by the master.
   description. QEMU can mmap the file descriptor based on the size and
   offset to get a memory range. Registering a host notifier means
   mapping this memory range to the VM as the specified queue's notify
-  MMIO region. Slave sends this request to tell QEMU to de-register
+  MMIO region. The backend sends this request to tell QEMU to de-register
   the existing notifier if any and register the new notifier if the
   request is sent with a file descriptor.
 
@@ -1438,9 +1438,9 @@ is sent by the master.
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
-  submitted by the slave to indicate that a buffer was used from
+  submitted by the backend to indicate that a buffer was used from
   the vring instead of signalling this using the vring's call file
-  descriptor or having the master relying on polling.
+  descriptor or having the frontend relying on polling.
 
   The state.num field is currently reserved and must be set to 0.
 
@@ -1452,9 +1452,9 @@ is sent by the master.
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
-  submitted by the slave to indicate that an error occurred on the
+  submitted by the backend to indicate that an error occurred on the
   specific vring, instead of signalling the error file descriptor
-  set by the master via ``VHOST_USER_SET_VRING_ERR``.
+  set by the frontend via ``VHOST_USER_SET_VRING_ERR``.
 
   The state.num field is currently reserved and must be set to 0.
 
@@ -1465,12 +1465,12 @@ VHOST_USER_PROTOCOL_F_REPLY_ACK
 
 The original vhost-user specification only demands replies for certain
 commands. This differs from the vhost protocol implementation where
-commands are sent over an ``ioctl()`` call and block until the client
+commands are sent over an ``ioctl()`` call and block until the backend
 has completed.
 
 With this protocol extension negotiated, the sender (QEMU) can set the
 ``need_reply`` [Bit 3] flag to any command. This indicates that the
-client MUST respond with a Payload ``VhostUserMsg`` indicating success
+backend MUST respond with a Payload ``VhostUserMsg`` indicating success
 or failure. The payload should be set to zero on success or non-zero
 on failure, unless the message already has an explicit reply body.
 
@@ -1479,7 +1479,7 @@ of the command. Today, QEMU is expected to terminate the main vhost-user
 loop upon receiving such errors. In future, qemu could be taught to be more
 resilient for selective requests.
 
-For the message types that already solicit a reply from the client,
+For the message types that already solicit a reply from the backend,
 the presence of ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` or need_reply bit
 being set brings no behavioural change. (See the Communication_
 section for details.)
-- 
2.26.2



