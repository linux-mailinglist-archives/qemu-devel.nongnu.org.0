Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D9F6131AC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ74-0003Pj-FX; Mon, 31 Oct 2022 04:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opQ72-0003Pa-OZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opQ6x-0002wl-6n
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667204734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWGWZn2gpcSmU0xFQ8d8r+vWR3I3N77l3W6W3fr8iDU=;
 b=Cc5QUGoyYm8M7I2Odn8WgEfa8/naRbKCqF4jeVQfy5t4opCs+NRmVuC0/7PvspQYKdVclB
 azzsro9KpLUmlCCFGh3VTpRXxsSRF1PjeAEQzf1NU6KMmQlYp8LCB4dww2dNbI+fK0KGNp
 qGwYVxlCSNDdoXrd2oUC8D/TpXtcbJI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-LKUeeSOwOXOWM0ERT9xjvA-1; Mon, 31 Oct 2022 04:25:25 -0400
X-MC-Unique: LKUeeSOwOXOWM0ERT9xjvA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s11-20020adfbc0b000000b0023659af24a8so2816406wrg.14
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AWGWZn2gpcSmU0xFQ8d8r+vWR3I3N77l3W6W3fr8iDU=;
 b=XiXVZkNRGoj7ywGpl2Lw53Gis7YEa8IMb9azXH9ROQVgSO509th2aPFm1/oUTIB27C
 /JE6a3//tGq5QoE/2q9rxuylwCClhYDLf8K/pYDnJqMC29yriIt/CGR721GKn47vnV1k
 k50vvkyOE5RmAYogLPkol1PhtYqYUr0zpMtitqPsHpN8fewgFY7e3ydIoQ3q7krHlsr4
 3qfYxTgGEmt6IW/XXEo0hlBtvPXNAB4/VTMs/QKt81/mIIl0WWPTRi9MZLKXZp8goY7J
 yMJDHxhbNeho2qDvuII7/tAiwoLiSxfLO39LcLxYMdCAXVA6xcV2BB7kQFW4IYfFB+i3
 AtzA==
X-Gm-Message-State: ACrzQf0xjXlbRiURqinF6g2CZ3Eonzc2/gw6BpJRhuzOhz93jl3WXHhF
 R7lIdKZCHDDIqyImTRX4niWFc8myCftXyFFohoaqdHqE4/eSwJe5vkdxi2IrIrsBx0OBov6rqo5
 WYzqhihV8WFc5Hug=
X-Received: by 2002:a05:600c:35cb:b0:3c6:e382:62fb with SMTP id
 r11-20020a05600c35cb00b003c6e38262fbmr7027824wmq.22.1667204724338; 
 Mon, 31 Oct 2022 01:25:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CLwK7d8Rah9LKz/kgVU17xRU0I15SQA+E0TQgkEf4yGCwYw1t3vTH/zhu1mAtPMGiXstcJw==
X-Received: by 2002:a05:600c:35cb:b0:3c6:e382:62fb with SMTP id
 r11-20020a05600c35cb00b003c6e38262fbmr7027806wmq.22.1667204724090; 
 Mon, 31 Oct 2022 01:25:24 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003cf57329221sm7420509wmq.14.2022.10.31.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 01:25:23 -0700 (PDT)
Date: Mon, 31 Oct 2022 04:25:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH v5 6/6] vdpa: Always start CVQ in SVQ mode
Message-ID: <20221031042356-mutt-send-email-mst@kernel.org>
References: <20221011104154.1209338-1-eperezma@redhat.com>
 <20221011104154.1209338-7-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221011104154.1209338-7-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 11, 2022 at 12:41:54PM +0200, Eugenio Pérez wrote:
> Isolate control virtqueue in its own group, allowing to intercept control
> commands but letting dataplane run totally passthrough to the guest.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

I guess we need svq for this. Not a reason to allocate it for
all queues. Also if vdpa does not support pasid then I guess
we should not bother with svq.

> ---
> v5:
> * Fixing the not adding cvq buffers when x-svq=on is specified.
> * Move vring state in vhost_vdpa_get_vring_group instead of using a
>   parameter.
> * Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
> 
> v4:
> * Squash vhost_vdpa_cvq_group_is_independent.
> * Rebased on last CVQ start series, that allocated CVQ cmd bufs at load
> * Do not check for cvq index on vhost_vdpa_net_prepare, we only have one
>   that callback registered in that NetClientInfo.
> 
> v3:
> * Make asid related queries print a warning instead of returning an
>   error and stop the start of qemu.
> ---
>  hw/virtio/vhost-vdpa.c |   3 +-
>  net/vhost-vdpa.c       | 118 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 115 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 29d009c02b..fd4de06eab 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -682,7 +682,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>  {
>      uint64_t features;
>      uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
>      int r;
>  
>      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index f7831aeb8d..6f6ef59ea3 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -38,6 +38,9 @@ typedef struct VhostVDPAState {
>      void *cvq_cmd_out_buffer;
>      virtio_net_ctrl_ack *status;
>  
> +    /* Number of address spaces supported by the device */
> +    unsigned address_space_num;
> +
>      /* The device always have SVQ enabled */
>      bool always_svq;
>      bool started;
> @@ -102,6 +105,9 @@ static const uint64_t vdpa_svq_device_features =
>      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>      BIT_ULL(VIRTIO_NET_F_STANDBY);
>  
> +#define VHOST_VDPA_NET_DATA_ASID 0
> +#define VHOST_VDPA_NET_CVQ_ASID 1
> +
>  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>  {
>      VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -226,6 +232,34 @@ static NetClientInfo net_vhost_vdpa_info = {
>          .check_peer_type = vhost_vdpa_check_peer_type,
>  };
>  
> +static uint32_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
> +{
> +    struct vhost_vring_state state = {
> +        .index = vq_index,
> +    };
> +    int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
> +
> +    return r < 0 ? 0 : state.num;
> +}
> +
> +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> +                                           unsigned vq_group,
> +                                           unsigned asid_num)
> +{
> +    struct vhost_vring_state asid = {
> +        .index = vq_group,
> +        .num = asid_num,
> +    };
> +    int ret;
> +
> +    ret = ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> +    if (unlikely(ret < 0)) {
> +        warn_report("Can't set vq group %u asid %u, errno=%d (%s)",
> +            asid.index, asid.num, errno, g_strerror(errno));
> +    }
> +    return ret;
> +}
> +
>  static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
>  {
>      VhostIOVATree *tree = v->iova_tree;
> @@ -300,11 +334,50 @@ dma_map_err:
>  static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>  {
>      VhostVDPAState *s;
> -    int r;
> +    struct vhost_vdpa *v;
> +    uint32_t cvq_group;
> +    int cvq_index, r;
>  
>      assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>  
>      s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    v = &s->vhost_vdpa;
> +
> +    v->listener_shadow_vq = s->always_svq;
> +    v->shadow_vqs_enabled = s->always_svq;
> +    s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_DATA_ASID;
> +
> +    if (s->always_svq) {
> +        goto out;
> +    }
> +
> +    if (s->address_space_num < 2) {
> +        return 0;
> +    }
> +
> +    /**
> +     * Check if all the virtqueues of the virtio device are in a different vq
> +     * than the last vq. VQ group of last group passed in cvq_group.
> +     */
> +    cvq_index = v->dev->vq_index_end - 1;
> +    cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
> +    for (int i = 0; i < cvq_index; ++i) {
> +        uint32_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
> +
> +        if (unlikely(group == cvq_group)) {
> +            warn_report("CVQ %u group is the same as VQ %u one (%u)", cvq_group,
> +                        i, group);
> +            return 0;
> +        }
> +    }
> +
> +    r = vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_CVQ_ASID);
> +    if (r == 0) {
> +        v->shadow_vqs_enabled = true;
> +        s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
> +    }
> +
> +out:
>      if (!s->vhost_vdpa.shadow_vqs_enabled) {
>          return 0;
>      }
> @@ -576,12 +649,38 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
>      .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
>  };
>  
> +static uint32_t vhost_vdpa_get_as_num(int vdpa_device_fd)
> +{
> +    uint64_t features;
> +    unsigned num_as;
> +    int r;
> +
> +    r = ioctl(vdpa_device_fd, VHOST_GET_BACKEND_FEATURES, &features);
> +    if (unlikely(r < 0)) {
> +        warn_report("Cannot get backend features");
> +        return 1;
> +    }
> +
> +    if (!(features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> +        return 1;
> +    }
> +
> +    r = ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, &num_as);
> +    if (unlikely(r < 0)) {
> +        warn_report("Cannot retrieve number of supported ASs");
> +        return 1;
> +    }
> +
> +    return num_as;
> +}
> +
>  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                             const char *device,
>                                             const char *name,
>                                             int vdpa_device_fd,
>                                             int queue_pair_index,
>                                             int nvqs,
> +                                           unsigned nas,
>                                             bool is_datapath,
>                                             bool svq,
>                                             VhostIOVATree *iova_tree)
> @@ -600,6 +699,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>      snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
>      s = DO_UPCAST(VhostVDPAState, nc, nc);
>  
> +    s->address_space_num = nas;
>      s->vhost_vdpa.device_fd = vdpa_device_fd;
>      s->vhost_vdpa.index = queue_pair_index;
>      s->always_svq = svq;
> @@ -686,6 +786,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>      g_autoptr(VhostIOVATree) iova_tree = NULL;
>      NetClientState *nc;
>      int queue_pairs, r, i = 0, has_cvq = 0;
> +    unsigned num_as = 1;
> +    bool svq_cvq;
>  
>      assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts = &netdev->u.vhost_vdpa;
> @@ -711,7 +813,13 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>          return queue_pairs;
>      }
>  
> -    if (opts->x_svq) {
> +    svq_cvq = opts->x_svq;
> +    if (has_cvq && !opts->x_svq) {
> +        num_as = vhost_vdpa_get_as_num(vdpa_device_fd);
> +        svq_cvq = num_as > 1;
> +    }
> +
> +    if (opts->x_svq || svq_cvq) {
>          struct vhost_vdpa_iova_range iova_range;
>  
>          uint64_t invalid_dev_features =
> @@ -734,15 +842,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>  
>      for (i = 0; i < queue_pairs; i++) {
>          ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                     vdpa_device_fd, i, 2, true, opts->x_svq,
> -                                     iova_tree);
> +                                     vdpa_device_fd, i, 2, num_as, true,
> +                                     opts->x_svq, iova_tree);
>          if (!ncs[i])
>              goto err;
>      }
>  
>      if (has_cvq) {
>          nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                 vdpa_device_fd, i, 1, false,
> +                                 vdpa_device_fd, i, 1, num_as, false,
>                                   opts->x_svq, iova_tree);
>          if (!nc)
>              goto err;
> -- 
> 2.31.1


