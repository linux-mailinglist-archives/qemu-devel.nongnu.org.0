Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38203B8EB7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 10:16:49 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyrsO-0003CL-Eh
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 04:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lyrrU-0002Wk-Nl
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lyrrR-0008Hy-SO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625127348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roTYas40WZ4NzIa20aaqGyjEa8NxCtVEc017KR+XNsg=;
 b=bg5guSJb6LBXAK/qjwkJmxd2iJhLTWMQoCtRaNF1kR38Sw+eHkN2QJZc5Uvx1pvQ3bBVKV
 Ay0Tkk6ioSjoTS9fSgc49VOmQQw/gLUIpK1gDPg6OkLXXdQXh7covL2lsvlrUycEsvnzWi
 K9sz9JypAKhIqn9oWsa/PRn3jhotzdU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Yq9rX7YfM1-CTJ0H_iLCBg-1; Thu, 01 Jul 2021 04:15:45 -0400
X-MC-Unique: Yq9rX7YfM1-CTJ0H_iLCBg-1
Received: by mail-pg1-f199.google.com with SMTP id
 o9-20020a6561490000b0290226fc371410so3652676pgv.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 01:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=roTYas40WZ4NzIa20aaqGyjEa8NxCtVEc017KR+XNsg=;
 b=kZ6spp7iGXW7A+SY5DahFO1ogI3VRXJ+TA+ZoHt5fYICqoKJPNkWhHmBcbLoDVYdoj
 rGiaik5N3RG70uUyM0M8W23ayJPNmDXXiM7IBt+/3VXvOJgPFUqov8B7Th4Qwgm6ssYq
 jgMOwPuEVXctzjHW5aT/bREjv2fQkKM19xF9agTJHoVaQkWlGK7fD4iQW1xJ9p25FFLD
 oefSlFx/zCCqpeq2I5ZHL3ZQnlIJsB9jyCbp6jowRqOtyxzQabbz+1Tu1eC4WaHfUjdw
 QZULHeymGyNUSyV7K4zR5uCZeOY6TMUP/K8nc8AK1hyJtvfbjE29M2xWCeWnN1iJkVfL
 musA==
X-Gm-Message-State: AOAM532nkt7Zb7EyjJMT36Lwun2h92Q/qTz+2OHG71rilV3C8ptXgqWJ
 c+iCQfLA8bTvqfCldMTUs2zD5TVlA5enpV+1C16jJSn16BVGxCUoV97FRDmrVry0hKjMi3UFOLQ
 /77MeC/aoCyLMNVY=
X-Received: by 2002:a17:90a:e60b:: with SMTP id
 j11mr21503708pjy.44.1625127344322; 
 Thu, 01 Jul 2021 01:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5Bz3Uwgr7fi1tZrdpHsq/TYLcXQsZ7m76b5nKaUIJJjpSSRivNifEw6El355XznGXVzYs0w==
X-Received: by 2002:a17:90a:e60b:: with SMTP id
 j11mr21503682pjy.44.1625127343950; 
 Thu, 01 Jul 2021 01:15:43 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c18sm24948551pgf.66.2021.07.01.01.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 01:15:43 -0700 (PDT)
Subject: Re: [PATCH 18/18] vhost-vdpa: multiqueue support
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-19-jasowang@redhat.com>
 <CAJaqyWeT+VhXSzu9VA7UrJMFeOCUwNXUoN9-yWZzp9Rg4pBZWQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4a9981c4-be51-d221-0b11-0d41376b2b5b@redhat.com>
Date: Thu, 1 Jul 2021 16:15:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeT+VhXSzu9VA7UrJMFeOCUwNXUoN9-yWZzp9Rg4pBZWQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eli Cohen <elic@nvidia.com>, Cindy Lu <lulu@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, lingshan.zhu@intel.com,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/1 下午2:51, Eugenio Perez Martin 写道:
> On Mon, Jun 21, 2021 at 6:18 AM Jason Wang <jasowang@redhat.com> wrote:
>> This patch implements the multiqueue support for vhost-vdpa. This is
>> done simply by reading the number of queue pairs from the config space
>> and initialize the datapath and control path net client.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/net/virtio-net.c |  3 +-
>>   net/vhost-vdpa.c    | 98 ++++++++++++++++++++++++++++++++++++++++-----
>>   2 files changed, 91 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 5074b521cf..2c2ed98c0b 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -3370,7 +3370,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>>
>>       n->max_ncs = MAX(n->nic_conf.peers.queues, 1);
>>
>> -    /* Figure out the datapath queue pairs since the bakcend could
>> +    /*
>> +     * Figure out the datapath queue pairs since the bakcend could
> If we are going to modify the comment we could s/bakcend/backend/.


Will fix.


>
>>        * provide control queue via peers as well.
>>        */
>>       if (n->nic_conf.peers.queues) {
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index cc11b2ec40..048344b4bc 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -18,6 +18,7 @@
>>   #include "qemu/error-report.h"
>>   #include "qemu/option.h"
>>   #include "qapi/error.h"
>> +#include <linux/vhost.h>
>>   #include <sys/ioctl.h>
>>   #include <err.h>
>>   #include "standard-headers/linux/virtio_net.h"
>> @@ -52,6 +53,8 @@ const int vdpa_feature_bits[] = {
>>       VIRTIO_NET_F_HOST_UFO,
>>       VIRTIO_NET_F_MRG_RXBUF,
>>       VIRTIO_NET_F_MTU,
>> +    VIRTIO_NET_F_MQ,
>> +    VIRTIO_NET_F_CTRL_VQ,
>
> Hi!
>
> I'm not sure if it's qemu the one that must control it, but I cannot
> use vdpa_sim of linux 5.13 (i.e., with no control vq patches) with
> this series applied:
>
> [    3.967421] virtio_net virtio0: device advertises feature
> VIRTIO_NET_F_CTRL_RX but not VIRTIO_NET_F_CTRL_VQ
> [    3.968613] virtio_net: probe of virtio0 failed with error -22


Interesting, looks like a bug somewhere.

We never advertise CTRL_RX in the case of simulator.


>
> Did you mention it somewhere else and I've missed it? or is it
> actually a bug in the device? In this second case, I think we should
> still workaround it in qemu, because old vdpasim_net with no
> VIRTIO_NET_F_CTRL_VQ still works ok without this patch.


Should be a bug, will have a look.

Thanks


>
> Thanks!
>
>>       VIRTIO_F_IOMMU_PLATFORM,
>>       VIRTIO_F_RING_PACKED,
>>       VIRTIO_NET_F_RSS,
>> @@ -82,7 +85,8 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
>>       return ret;
>>   }
>>
>> -static int vhost_vdpa_add(NetClientState *ncs, void *be)
>> +static int vhost_vdpa_add(NetClientState *ncs, void *be, int qp_index,
>> +                          int nvqs)
>>   {
>>       VhostNetOptions options;
>>       struct vhost_net *net = NULL;
>> @@ -95,7 +99,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>>       options.net_backend = ncs;
>>       options.opaque      = be;
>>       options.busyloop_timeout = 0;
>> -    options.nvqs = 2;
>> +    options.nvqs = nvqs;
>>
>>       net = vhost_net_init(&options);
>>       if (!net) {
>> @@ -159,18 +163,28 @@ static NetClientInfo net_vhost_vdpa_info = {
>>   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>                                              const char *device,
>>                                              const char *name,
>> -                                           int vdpa_device_fd)
>> +                                           int vdpa_device_fd,
>> +                                           int qp_index,
>> +                                           int nvqs,
>> +                                           bool is_datapath)
>>   {
>>       NetClientState *nc = NULL;
>>       VhostVDPAState *s;
>>       int ret = 0;
>>       assert(name);
>> -    nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
>> +    if (is_datapath) {
>> +        nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
>> +                                 name);
>> +    } else {
>> +        nc = qemu_new_net_control_client(&net_vhost_vdpa_info, peer,
>> +                                         device, name);
>> +    }
>>       snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
>>       s = DO_UPCAST(VhostVDPAState, nc, nc);
>>
>>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>> -    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
>> +    s->vhost_vdpa.index = qp_index;
>> +    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, qp_index, nvqs);
>>       if (ret) {
>>           qemu_del_net_client(nc);
>>           return NULL;
>> @@ -196,12 +210,52 @@ static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
>>       return 0;
>>   }
>>
>> +static int vhost_vdpa_get_max_qps(int fd, int *has_cvq, Error **errp)
>> +{
>> +    unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>> +    struct vhost_vdpa_config *config;
>> +    __virtio16 *max_qps;
>> +    uint64_t features;
>> +    int ret;
>> +
>> +    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
>> +    if (ret) {
>> +        error_setg(errp, "Fail to query features from vhost-vDPA device");
>> +        return ret;
>> +    }
>> +
>> +    if (features & (1 << VIRTIO_NET_F_CTRL_VQ)) {
>> +        *has_cvq = 1;
>> +    } else {
>> +        *has_cvq = 0;
>> +    }
>> +
>> +    if (features & (1 << VIRTIO_NET_F_MQ)) {
>> +        config = g_malloc0(config_size + sizeof(*max_qps));
>> +        config->off = offsetof(struct virtio_net_config, max_virtqueue_pairs);
>> +        config->len = sizeof(*max_qps);
>> +
>> +        ret = ioctl(fd, VHOST_VDPA_GET_CONFIG, config);
>> +        if (ret) {
>> +            error_setg(errp, "Fail to get config from vhost-vDPA device");
>> +            return -ret;
>> +        }
>> +
>> +        max_qps = (__virtio16 *)&config->buf;
>> +
>> +        return lduw_le_p(max_qps);
>> +    }
>> +
>> +    return 1;
>> +}
>> +
>>   int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>                           NetClientState *peer, Error **errp)
>>   {
>>       const NetdevVhostVDPAOptions *opts;
>>       int vdpa_device_fd;
>> -    NetClientState *nc;
>> +    NetClientState **ncs, *nc;
>> +    int qps, i, has_cvq = 0;
>>
>>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>       opts = &netdev->u.vhost_vdpa;
>> @@ -216,11 +270,37 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>           return -errno;
>>       }
>>
>> -    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
>> -    if (!nc) {
>> +    qps = vhost_vdpa_get_max_qps(vdpa_device_fd, &has_cvq, errp);
>> +    if (qps < 0) {
>>           qemu_close(vdpa_device_fd);
>> -        return -1;
>> +        return qps;
>> +    }
>> +
>> +    ncs = g_malloc0(sizeof(*ncs) * qps);
>> +
>> +    for (i = 0; i < qps; i++) {
>> +        ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>> +                                     vdpa_device_fd, i, 2, true);
>> +        if (!ncs[i])
>> +            goto err;
>>       }
>>
>> +    if (has_cvq) {
>> +        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>> +                                 vdpa_device_fd, i, 1, false);
>> +        if (!nc)
>> +            goto err;
>> +    }
>> +
>> +    g_free(ncs);
>>       return 0;
>> +
>> +err:
>> +    if (i) {
>> +        qemu_del_net_client(ncs[0]);
>> +    }
>> +    qemu_close(vdpa_device_fd);
>> +    g_free(ncs);
>> +
>> +    return -1;
>>   }
>> --
>> 2.25.1
>>


