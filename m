Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EE60EAA5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 23:03:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onnUI-0002zp-Vd; Wed, 26 Oct 2022 16:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnUF-0002ic-IT
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnUD-0003kb-2d
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666817932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHemR/YHTWVoK2K4/8yhYWmaedmwrRQIAD0F6b7xDGg=;
 b=AqGl83QAx2U6WHh7kWqGRqxdszQk5KxEhqiN8bE7bmRP5mByACsJ7aZlK1IBmyepvpGxvs
 aBRzZxeMwCINahwQFmiev+jco1AO5agg6hqh+oiG7HVM3Q0IZrdiCP+LrbYqAj+W9+nWYm
 /b8RAhYTtxVC98ChFftpwNwEI0gBYbM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-8gSD9SCxPqG4SvgdTfpnZQ-1; Wed, 26 Oct 2022 16:58:50 -0400
X-MC-Unique: 8gSD9SCxPqG4SvgdTfpnZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 x12-20020a05600c21cc00b003c8340cb973so825832wmj.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHemR/YHTWVoK2K4/8yhYWmaedmwrRQIAD0F6b7xDGg=;
 b=N/xqE87ejMQirMGjftbH+Fl8WX2iJkYi3feej07XvJ8kr5cYHYBCwbAEle4yJYeuBp
 0tsBKOrGhCdvwX5NojRdSuUwF9cM3tGUd/M2FCNH9PYy3AHwTclMwBJOJU64OO4A7Nqf
 aYI3dPal8HzTBX2p8jMqEx5m/Kk7IF47dDNyZbLetEGiI5ek+gp0UkQsGslkEjuwZ1Wh
 ZJ+27YierrCSk7+TimV55plpcAHXDYkxcvH41g3IxiLzSZGhsciiX5gdonufq+DKIb+T
 l9wGdbfRxX97qyA/Hd+9GQ56HFLwnTM/kZIJyCWRdeCQbI1CZlo1juynFh+DPyBtbj9o
 m+CQ==
X-Gm-Message-State: ACrzQf03KY98wu7gNGJe+A5pWff+0sH9DS5iCa8CYVkK/nsmgJX1DE9X
 uAs+o8rKxAhrAkVJSfqx7NuljRZQX/eESuC6Sd/KDoIALnfO61/QxMSa+Z56xdRTWPsiva7oVxg
 4Xg9NxlB6gSO8iMs=
X-Received: by 2002:a05:6000:2c1:b0:22e:7507:a182 with SMTP id
 o1-20020a05600002c100b0022e7507a182mr29841023wry.550.1666817929685; 
 Wed, 26 Oct 2022 13:58:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BkO3Et1huaCFvqKdkqK+V0I0G/MeWAkmEw80z2XNuG/O5jqBgQAuIEyC3nm/YBuOnoy6j1Q==
X-Received: by 2002:a05:6000:2c1:b0:22e:7507:a182 with SMTP id
 o1-20020a05600002c100b0022e7507a182mr29841011wry.550.1666817929476; 
 Wed, 26 Oct 2022 13:58:49 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 b15-20020adfde0f000000b0022ac38fb20asm6128763wrm.111.2022.10.26.13.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:58:48 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:58:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>,
 Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH 0/4] Shadow VirtQueue event index support
Message-ID: <20221026165830-mutt-send-email-mst@kernel.org>
References: <20221020155251.398735-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020155251.398735-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Oct 20, 2022 at 05:52:47PM +0200, Eugenio Pérez wrote:
> Event idx helps to reduce the number of notifications between the device
> and the driver. It allows them to specify an index on the circular
> descriptors rings where to issue the notification, instead of a single
> binary indicator.
> 
> Adding support for SVQ.


Jason seems to be taking this through net

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> These patches are sent on top of [1] series, so trivial conflicts could arise
> if it is applied directly on master. Future versions can be not based on
> it is more convenient.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03280.html
> 
> Eugenio Pérez (4):
>   vhost: allocate event_idx fields on vring
>   vhost: toggle device callbacks using used event idx
>   vhost: use avail event idx on vhost_svq_kick
>   vhost: Accept event idx flag
> 
>  hw/virtio/vhost-shadow-virtqueue.c | 39 ++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 8 deletions(-)
> 
> -- 
> 2.31.1
> 


