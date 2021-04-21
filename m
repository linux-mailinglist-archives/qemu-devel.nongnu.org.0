Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542843671FD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 19:52:02 +0200 (CEST)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZH17-0001V5-5E
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 13:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZGyW-0000bx-S0
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZGyU-0003M6-J6
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619027357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IuHS9HzVvTsa4/LdrQLXQEu+FLB2T2qhXpTn8E9IgGE=;
 b=MELoLZuXmDdQy4yl5+H2nGp84BXGl1Lvu7RJrtT0R9QzgTijZitdpmDQA41lHRvs28ezbP
 nIC2bHbP8TFjaKV7HW7EoNHzPyadsJsw3OA1nz7gak51+ALP6eAifjnPQT2HTrynUD2wa5
 7NZ3FREsYrm/Vn2WcyhN49sfZhcjCjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-1GIvimHPMiyU1rijn4RZ_A-1; Wed, 21 Apr 2021 13:49:15 -0400
X-MC-Unique: 1GIvimHPMiyU1rijn4RZ_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D74371009608;
 Wed, 21 Apr 2021 17:49:14 +0000 (UTC)
Received: from work-vm (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5D815C241;
 Wed, 21 Apr 2021 17:49:06 +0000 (UTC)
Date: Wed, 21 Apr 2021 18:49:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH v2 08/25] DAX: virtio-fs: Add vhost-user
 slave commands for mapping
Message-ID: <YIBlkMlCayNbTj9+@work-vm>
References: <20210414155137.46522-1-dgilbert@redhat.com>
 <20210414155137.46522-9-dgilbert@redhat.com>
 <20210414183507.4bffd57d@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210414183507.4bffd57d@bahia.lan>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Wed, 14 Apr 2021 16:51:20 +0100
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> 
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The daemon may request that fd's be mapped into the virtio-fs cache
> > visible to the guest.
> > These mappings are triggered by commands sent over the slave fd
> > from the daemon.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  docs/interop/vhost-user.rst               | 21 ++++++++
> >  hw/virtio/vhost-user-fs.c                 | 66 +++++++++++++++++++++++
> >  hw/virtio/vhost-user.c                    | 25 +++++++++
> >  include/hw/virtio/vhost-user-fs.h         | 33 ++++++++++++
> >  subprojects/libvhost-user/libvhost-user.h |  2 +
> >  5 files changed, 147 insertions(+)
> > 
> > diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> > index d6085f7045..09aee3565d 100644
> > --- a/docs/interop/vhost-user.rst
> > +++ b/docs/interop/vhost-user.rst
> > @@ -1432,6 +1432,27 @@ Slave message types
> >  
> >    The state.num field is currently reserved and must be set to 0.
> >  
> > +``VHOST_USER_SLAVE_FS_MAP``
> > +  :id: 6
> > +  :equivalent ioctl: N/A
> > +  :slave payload: ``struct VhostUserFSSlaveMsg``
> > +  :master payload: N/A
> > +
> > +  Requests that an fd, provided in the ancillary data, be mmapped
> > +  into the virtio-fs cache; multiple chunks can be mapped in one
> > +  command.
> > +  A reply is generated indicating whether mapping succeeded.
> > +
> > +``VHOST_USER_SLAVE_FS_UNMAP``
> > +  :id: 7
> > +  :equivalent ioctl: N/A
> > +  :slave payload: ``struct VhostUserFSSlaveMsg``
> > +  :master payload: N/A
> > +
> > +  Requests that the range in the virtio-fs cache is unmapped;
> > +  multiple chunks can be unmapped in one command.
> > +  A reply is generated indicating whether unmapping succeeded.
> > +
> >  .. _reply_ack:
> >  
> >  VHOST_USER_PROTOCOL_F_REPLY_ACK
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index dd0a02aa99..169a146e72 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -45,6 +45,72 @@ static const int user_feature_bits[] = {
> >  #define DAX_WINDOW_PROT PROT_NONE
> >  #endif
> >  
> > +/*
> > + * The message apparently had 'received_size' bytes, check this
> > + * matches the count in the message.
> > + *
> > + * Returns true if the size matches.
> > + */
> > +static bool check_slave_message_entries(const VhostUserFSSlaveMsg *sm,
> > +                                        int received_size)
> > +{
> > +    int tmp;
> > +
> > +    /*
> > +     * VhostUserFSSlaveMsg consists of a body followed by 'n' entries,
> > +     * (each VhostUserFSSlaveMsgEntry).  There's a maximum of
> > +     * VHOST_USER_FS_SLAVE_MAX_ENTRIES of these.
> > +     */
> > +    if (received_size <= sizeof(VhostUserFSSlaveMsg)) {
> > +        error_report("%s: Short VhostUserFSSlaveMsg size, %d", __func__,
> > +                     received_size);
> > +        return false;
> > +    }
> > +
> > +    tmp = received_size - sizeof(VhostUserFSSlaveMsg);
> > +    if (tmp % sizeof(VhostUserFSSlaveMsgEntry)) {
> > +        error_report("%s: Non-multiple VhostUserFSSlaveMsg size, %d", __func__,
> > +                     received_size);
> > +        return false;
> > +    }
> > +
> > +    tmp /= sizeof(VhostUserFSSlaveMsgEntry);
> > +    if (tmp != sm->count) {
> > +        error_report("%s: VhostUserFSSlaveMsg count mismatch, %d count: %d",
> > +                     __func__, tmp, sm->count);
> > +        return false;
> > +    }
> > +
> > +    if (sm->count > VHOST_USER_FS_SLAVE_MAX_ENTRIES) {
> > +        error_report("%s: VhostUserFSSlaveMsg too many entries: %d",
> > +                     __func__, sm->count);
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +
> > +uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, int message_size,
> > +                                 VhostUserFSSlaveMsg *sm, int fd)
> > +{
> > +    if (!check_slave_message_entries(sm, message_size)) {
> > +        return (uint64_t)-1;
> > +    }
> > +
> > +    /* TODO */
> > +    return (uint64_t)-1;
> > +}
> > +
> > +uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
> > +                                   VhostUserFSSlaveMsg *sm)
> > +{
> > +    if (!check_slave_message_entries(sm, message_size)) {
> > +        return (uint64_t)-1;
> > +    }
> > +
> > +    /* TODO */
> > +    return (uint64_t)-1;
> > +}
> > +
> >  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
> >  {
> >      VHostUserFS *fs = VHOST_USER_FS(vdev);
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index 3e4a25e108..ad9170f8dc 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -12,6 +12,7 @@
> >  #include "qapi/error.h"
> >  #include "hw/virtio/vhost.h"
> >  #include "hw/virtio/vhost-user.h"
> > +#include "hw/virtio/vhost-user-fs.h"
> >  #include "hw/virtio/vhost-backend.h"
> >  #include "hw/virtio/virtio.h"
> >  #include "hw/virtio/virtio-net.h"
> > @@ -133,6 +134,10 @@ typedef enum VhostUserSlaveRequest {
> >      VHOST_USER_SLAVE_IOTLB_MSG = 1,
> >      VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
> >      VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
> > +    VHOST_USER_SLAVE_VRING_CALL = 4,
> > +    VHOST_USER_SLAVE_VRING_ERR = 5,
> > +    VHOST_USER_SLAVE_FS_MAP = 6,
> > +    VHOST_USER_SLAVE_FS_UNMAP = 7,
> >      VHOST_USER_SLAVE_MAX
> >  }  VhostUserSlaveRequest;
> >  
> > @@ -205,6 +210,16 @@ typedef struct {
> >      uint32_t size; /* the following payload size */
> >  } QEMU_PACKED VhostUserHeader;
> >  
> > +/*
> > + * VhostUserFSSlaveMsg is special since it has a variable entry count,
> > + * but it does have a maximum, so make a type for that to fit in our union
> > + * for max size.
> > + */
> > +typedef struct {
> > +    VhostUserFSSlaveMsg fs;
> > +    VhostUserFSSlaveMsgEntry entries[VHOST_USER_FS_SLAVE_MAX_ENTRIES];
> > +} QEMU_PACKED VhostUserFSSlaveMsgMax;
> > +
> >  typedef union {
> >  #define VHOST_USER_VRING_IDX_MASK   (0xff)
> >  #define VHOST_USER_VRING_NOFD_MASK  (0x1<<8)
> > @@ -219,6 +234,8 @@ typedef union {
> >          VhostUserCryptoSession session;
> >          VhostUserVringArea area;
> >          VhostUserInflight inflight;
> > +        VhostUserFSSlaveMsg fs;
> > +        VhostUserFSSlaveMsg fs_max; /* Never actually used */
> >  } VhostUserPayload;
> >  
> >  typedef struct VhostUserMsg {
> > @@ -1538,6 +1555,14 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
> >          ret = vhost_user_slave_handle_vring_host_notifier(dev, &payload.area,
> >                                                            fd ? fd[0] : -1);
> >          break;
> > +#ifdef CONFIG_VHOST_USER_FS
> > +    case VHOST_USER_SLAVE_FS_MAP:
> > +        ret = vhost_user_fs_slave_map(dev, hdr.size, &payload.fs, fd[0]);
> 
> Since the QIOChannel conversion, the array of fds is dynamically allocated
> by qio_channel_readv_full_all() when needed. You should do "fd ? fd[0] : -1"
> like for vhost_user_slave_handle_vring_host_notifier() just above.
> 
> Same goes for patch 17 "DAX/unmap: virtiofsd: Add  VHOST_USER_SLAVE_FS_IO".

Thanks; fixed!

Dave

> > +        break;
> > +    case VHOST_USER_SLAVE_FS_UNMAP:
> > +        ret = vhost_user_fs_slave_unmap(dev, hdr.size, &payload.fs);
> > +        break;
> > +#endif
> >      default:
> >          error_report("Received unexpected msg type: %d.", hdr.request);
> >          ret = true;
> > diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
> > index 04596799e3..0766f17548 100644
> > --- a/include/hw/virtio/vhost-user-fs.h
> > +++ b/include/hw/virtio/vhost-user-fs.h
> > @@ -23,6 +23,33 @@
> >  #define TYPE_VHOST_USER_FS "vhost-user-fs-device"
> >  OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFS, VHOST_USER_FS)
> >  
> > +/* Structures carried over the slave channel back to QEMU */
> > +#define VHOST_USER_FS_SLAVE_MAX_ENTRIES 32
> > +
> > +/* For the flags field of VhostUserFSSlaveMsg */
> > +#define VHOST_USER_FS_FLAG_MAP_R (1u << 0)
> > +#define VHOST_USER_FS_FLAG_MAP_W (1u << 1)
> > +
> > +typedef struct {
> > +    /* Offsets within the file being mapped */
> > +    uint64_t fd_offset;
> > +    /* Offsets within the cache */
> > +    uint64_t c_offset;
> > +    /* Lengths of sections */
> > +    uint64_t len;
> > +    /* Flags, from VHOST_USER_FS_FLAG_* */
> > +    uint64_t flags;
> > +} VhostUserFSSlaveMsgEntry;
> > +
> > +typedef struct {
> > +    /* Number of entries */
> > +    uint16_t count;
> > +    /* Spare */
> > +    uint16_t align;
> > +
> > +    VhostUserFSSlaveMsgEntry entries[];
> > +} VhostUserFSSlaveMsg;
> > +
> >  typedef struct {
> >      CharBackend chardev;
> >      char *tag;
> > @@ -46,4 +73,10 @@ struct VHostUserFS {
> >      MemoryRegion cache;
> >  };
> >  
> > +/* Callbacks from the vhost-user code for slave commands */
> > +uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, int message_size,
> > +                                 VhostUserFSSlaveMsg *sm, int fd);
> > +uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
> > +                                   VhostUserFSSlaveMsg *sm);
> > +
> >  #endif /* _QEMU_VHOST_USER_FS_H */
> > diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
> > index 70fc61171f..a98c5f5c11 100644
> > --- a/subprojects/libvhost-user/libvhost-user.h
> > +++ b/subprojects/libvhost-user/libvhost-user.h
> > @@ -119,6 +119,8 @@ typedef enum VhostUserSlaveRequest {
> >      VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
> >      VHOST_USER_SLAVE_VRING_CALL = 4,
> >      VHOST_USER_SLAVE_VRING_ERR = 5,
> > +    VHOST_USER_SLAVE_FS_MAP = 6,
> > +    VHOST_USER_SLAVE_FS_UNMAP = 7,
> >      VHOST_USER_SLAVE_MAX
> >  }  VhostUserSlaveRequest;
> >  
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


