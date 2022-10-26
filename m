Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F360EA9B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:53:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onnOs-0005tz-4H; Wed, 26 Oct 2022 16:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnOq-0005o6-0Y
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnOo-0002aq-D9
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666817597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcpdwZmhUPHHOwP9fR5teW7F3/H5043QbF0MS06uuqo=;
 b=RWt4FrNTyr3GoaZCbAjUH/KNLpX9k5Z/99MkAAa4kgCnYcZ+BrIeZHjuLyPZFlxjv4Dw0t
 /B/hBviu/NiwGp8QcoUa9HP4fJtGwk8WWkooplSYSWiqfJngqm6GwqYhQHfRxQSMotvLGv
 yObl8LlDV3kqY4l58i/FUpPHNCZkLtA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-JBZiGporNgOwKF9veX5MiQ-1; Wed, 26 Oct 2022 16:53:13 -0400
X-MC-Unique: JBZiGporNgOwKF9veX5MiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so5351281wra.22
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YcpdwZmhUPHHOwP9fR5teW7F3/H5043QbF0MS06uuqo=;
 b=tZJmfgcVUNcIHzIKu2igGodsWQujuLHd7u7FYyOnGJkc2aT4Q0/6Sn18nVN/xrnfhy
 15ifAqzJPfl6ByhaJ+Q1nASWP7aVERWAlJTTVAuHyuHgYr3YnA4xnUFNpXdV+b0u9nhn
 BUq+wqhlz9+GYjw3Nm6XtmrsaqA2a2bLQnWiFwSRCGiK7QuyA7BfqkK8fnADeYh4F4xa
 /xAY9WdKyiFPh+RsAQUqttehDHMc0WvYMOACBhDmAFU4uO0wFCTO+bEkE49ixgeMMylY
 EyPCfWig5BGVSIDGXO/TxIxaqAq7lTV9MiGwiJ2cmSjOqhsBd/sqJcmMSONBzf13Z3H5
 eCcw==
X-Gm-Message-State: ACrzQf3ToEy/vWdqa13gtwBen0ztyD8YFswFIk2Bm75FfUoL9tdn9qqi
 nmgq+3okuYV8BunP4705WwOBMLg49zKhM2pn6IvLhDW9ViYXGXDWR7ZuTI8yfurL83lOmVuJizI
 eP4gRy3/zUqkcr6A=
X-Received: by 2002:a5d:6d89:0:b0:236:6e52:4fa with SMTP id
 l9-20020a5d6d89000000b002366e5204famr13221802wrs.395.1666817592246; 
 Wed, 26 Oct 2022 13:53:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BCfCkKhJhuYGmilSNxA1xQ1r6MO9xKnW0TgmizFft1XCY7VRmZ1lDQkg2weuON2EVEJZ6Ng==
X-Received: by 2002:a5d:6d89:0:b0:236:6e52:4fa with SMTP id
 l9-20020a5d6d89000000b002366e5204famr13221789wrs.395.1666817592020; 
 Wed, 26 Oct 2022 13:53:12 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 t2-20020a1c7702000000b003c6bd12ac27sm2751586wmi.37.2022.10.26.13.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:53:11 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:53:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH 0/3] Emulate status feature in vhost-vdpa net
Message-ID: <20221026165241-mutt-send-email-mst@kernel.org>
References: <20221026095303.37907-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221026095303.37907-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Oct 26, 2022 at 11:53:00AM +0200, Eugenio Pérez wrote:
> The net config space is already copied from the device so it can me modified
> by qemu. In particular, this is already done to fix cases where the NIC does
> not expose the right fields.
> 
> It's trivial to emulate _F_STATE with qemu if not supported by the device,
> sice a valid approach is to always show the link as up. If the feature is
> already supported by the device, no config space modification is needed.
> 
> This is a pre requisite to use other features like _F_GUEST_ANNOUNCE, since
> _F_STATUS is needed for the guest to access the status.
> 
> These patches are sent on top of [1] series, so trivial conflicts could arise
> if it is applied directly on master. Future versions can be not based on
> it is more convenient.

Jason seems to be taking all this work through net tree.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



> Eugenio Pérez (3):
>   virtio_net: Modify virtio_net_get_config to early return
>   virtio_net: Handle _F_STATUS emulation in virtio_net_get_config
>   vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
> 
>  include/net/vhost-vdpa.h |  1 +
>  hw/net/vhost_net.c       | 16 ++++++++++++++--
>  hw/net/virtio-net.c      | 39 ++++++++++++++++++++++++---------------
>  net/vhost-vdpa.c         |  3 +++
>  4 files changed, 42 insertions(+), 17 deletions(-)
> 
> -- 
> 2.31.1
> 


