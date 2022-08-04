Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA565896DC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 06:22:38 +0200 (CEST)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJSNZ-0000av-IV
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 00:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSMW-0007eh-Lq
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSMT-0002Gw-MX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659586888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ysMh4ZYopGVOeYCR25QDDdPYOZT3gF71utFILRV/1j4=;
 b=enaounz4ngAr45z+3H7/c65FjuPLLCSG0A+Mek6yNASqG85brGVM6QvT04F8whMvW+YvBb
 t6QWOYO0GORYzDNjenxIZYa7nEO3gIMppmsdjacBhDPTYJOn6r/xnrxmiwG2CkCUY3UVAK
 AXPn/G1S3uVwHcBQ3kTBQtXUMTZ7FHY=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-85pqikZcNHqwnsBA_LS2jw-1; Thu, 04 Aug 2022 00:21:27 -0400
X-MC-Unique: 85pqikZcNHqwnsBA_LS2jw-1
Received: by mail-pf1-f199.google.com with SMTP id
 x38-20020a056a0018a600b0052e48f9b194so1275647pfh.12
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 21:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ysMh4ZYopGVOeYCR25QDDdPYOZT3gF71utFILRV/1j4=;
 b=CUspnwL7dS6fVeOaSYHqVWPigJ4GzBk/MQrWq7DvBT6eUtfnOi2BxKIMSyW6X3Ofoe
 DlXVOQD8V3rn96iuhqudJr/sLI5CWPbLQ79pQsXv1PxufVFTAnBbqTnC9cHyMGaVQ74x
 uo29UiQpYRcnMxokqDZUOm48rWitS6HniIUmyUaAhtcdeWgniNJrslpoSS16LdgvsU4T
 zxPZhd1W/WLV5b0iYPKScusj6sU77yYJ6sislNN7O8cVtZE1ZPpq5oIQCQlFm0ycTFxU
 TzkO5r3sj8l0adY8iGdwmavASFaMR8Zt2C4WctifXi1mgJpdQGBIZ59T0K5LNO5cgdqc
 a0sg==
X-Gm-Message-State: ACgBeo0q+udQ4nTsTWYLj/IHxRcIPiqmICsmnF9TmCDQvpOY8Xrq1fOC
 /tq4MhoisYrAmucIevAmx2rP0NQ++7II8B8DMcokId2sICAqnpxpVD4064MUglcQuCu9CzdJraw
 cKDTLGC7mwpuPd78=
X-Received: by 2002:a17:90b:3144:b0:1f5:2c6d:7dea with SMTP id
 ip4-20020a17090b314400b001f52c6d7deamr3685pjb.220.1659586885981; 
 Wed, 03 Aug 2022 21:21:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7s8ccjJ5tSPNmc/vj6PBpUBrWjnqLYMHqab7Ri5Jpw/QzCaAUqzX0MO1u417MPtTIh7WFHAw==
X-Received: by 2002:a17:90b:3144:b0:1f5:2c6d:7dea with SMTP id
 ip4-20020a17090b314400b001f52c6d7deamr3658pjb.220.1659586885697; 
 Wed, 03 Aug 2022 21:21:25 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b0016f154c8910sm2654732pli.204.2022.08.03.21.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:21:25 -0700 (PDT)
Message-ID: <c665ec60-fea6-8b10-4d4a-615ff20af1a6@redhat.com>
Date: Thu, 4 Aug 2022 12:21:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 00/10] NIC vhost-vdpa state restore via Shadow CVQ
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220802175731.312115-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/3 01:57, Eugenio Pérez 写道:
> CVQ of net vhost-vdpa devices can be intercepted since the work of [1]. The
> virtio-net device model is updated. The migration was blocked because although
> the state can be megrated between VMM it was not possible to restore on the
> destination NIC.
>
> This series add support for SVQ to inject external messages without the guest's
> knowledge, so before the guest is resumed all the guest visible state is
> restored. It is done using standard CVQ messages, so the vhost-vdpa device does
> not need to learn how to restore it: As long as they have the feature, they
> know how to handle it.
>
> This series needs fixes [1], [2] and [3] to be applied to achieve full live
> migration.
>
> Thanks!
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02984.html
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03993.html


Note that the above has been merged into master.

And the series looks good overall, just some comments to make the code 
easier to be read and maintained in the future.

Thanks


> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg00325.html
>
> v5:
> - Rename s/start/load/
> - Use independent NetClientInfo to only add load callback on cvq.
> - Accept out sg instead of dev_buffers[] at vhost_vdpa_net_cvq_map_elem
> - Use only out size instead of iovec dev_buffers to know if the descriptor is
>    effectively available, allowing to delete artificial !NULL VirtQueueElement
>    on vhost_svq_add call.
>
> v4:
> - Actually use NetClientInfo callback.
>
> v3:
> - Route vhost-vdpa start code through NetClientInfo callback.
> - Delete extra vhost_net_stop_one() call.
>
> v2:
> - Fix SIGSEGV dereferencing SVQ when not in svq mode
>
> v1 from RFC:
> - Do not reorder DRIVER_OK & enable patches.
> - Delete leftovers
>
> Eugenio Pérez (10):
>    vhost: stop transfer elem ownership in vhost_handle_guest_kick
>    vhost: use SVQ element ndescs instead of opaque data for desc
>      validation
>    vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush
>    vdpa: Get buffers from VhostVDPAState on vhost_vdpa_net_cvq_map_elem
>    vdpa: Extract vhost_vdpa_net_cvq_add from
>      vhost_vdpa_net_handle_ctrl_avail
>    vdpa: Make vhost_vdpa_net_cvq_map_elem accept any out sg
>    vdpa: add NetClientState->load() callback
>    vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
>    vdpa: Add virtio-net mac address via CVQ at start
>    vdpa: Delete CVQ migration blocker
>
>   include/hw/virtio/vhost-vdpa.h     |   1 -
>   include/net/net.h                  |   2 +
>   hw/net/vhost_net.c                 |   7 ++
>   hw/virtio/vhost-shadow-virtqueue.c |  31 +++---
>   hw/virtio/vhost-vdpa.c             |  14 ---
>   net/vhost-vdpa.c                   | 163 +++++++++++++++++++++--------
>   6 files changed, 145 insertions(+), 73 deletions(-)
>


