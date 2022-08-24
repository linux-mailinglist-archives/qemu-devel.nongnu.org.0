Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE959F16B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:36:17 +0200 (CEST)
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgFb-0000Qo-W7
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgCf-0005Ed-8g
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgCb-0004Q9-KY
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661308388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/g0TDqjhNYoAU8Vb9E2eAi1hRFu1jnyJUvR3UPvAsJE=;
 b=jM9tdK666sWjiE0tS43OdEWd6E+fpmPlheJnxLdgEDnxLjihbj9M9xKlcwfyRnhPEZrbpr
 j9Hdtw4WLHGyHS+BBXuyKpmXfiOYVeXcbXuPI/8WIYm1BSwhpwMS7yZ3Yk7hgZ6pc2GtU2
 TzQMqSKNsNGcBh/oxzaMlmyYxd6gpVM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-VVaR1j-KMwWs308k18kmiQ-1; Tue, 23 Aug 2022 22:33:06 -0400
X-MC-Unique: VVaR1j-KMwWs308k18kmiQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 a12-20020a65604c000000b0042a8c1cc701so3932561pgp.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/g0TDqjhNYoAU8Vb9E2eAi1hRFu1jnyJUvR3UPvAsJE=;
 b=jtEJd2K1MI4ViD9DLy3ciQaGWr6ito5Nqjk9Bc2hceqLKlqG8+2gka2yd+UbgF5kYV
 JTTyLTTAAPeXdJZVR9yeCZLZOpgH2h5KmjEoVMwYdMAte9VGrpHmxi5IiQcoO8ndIbgR
 8tVeeApR2Hb5w4dSHCAiNL4Rbvl2mWj+iENRhYUgVIuaQGGx3KVMWPgX4T6hQkbub6UR
 WjIOMMRTmdN1B70aJpcev6muAaSAtJheL3fp04Py48nNMd2ny+5jukhzLPUCmFHeJvZJ
 GPaDgj5AphCY5KR+k9VD/8ZZ747MbX7cjdx3RaYQX0XotxfxSk8uckpiZFWZOtCcz4it
 8Pbw==
X-Gm-Message-State: ACgBeo1NZtsbnEFaP11+gBs4OcFZfYz/UqulLC7GryeHFOMgVXqW9cLC
 esB141pboBVwXFtSg8QkCYrEkx8c2EWzBAZcQxYXHKe5eKaAtSpNouwG9mYOsCr3BcjTZvQZlN4
 h6dfuI9on+BaMgtQ=
X-Received: by 2002:a17:902:da82:b0:172:be4a:c586 with SMTP id
 j2-20020a170902da8200b00172be4ac586mr23698325plx.13.1661308384735; 
 Tue, 23 Aug 2022 19:33:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR44ITDq/Da4T6/EvFdrGNUkBDoRtt1VlPUPWnltzd/dAy0EpRNHKwARDqvo4ROwEkTyfpGoeQ==
X-Received: by 2002:a17:902:da82:b0:172:be4a:c586 with SMTP id
 j2-20020a170902da8200b00172be4ac586mr23698300plx.13.1661308384451; 
 Tue, 23 Aug 2022 19:33:04 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 n126-20020a622784000000b0053291ddd8e5sm9120882pfn.40.2022.08.23.19.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:33:03 -0700 (PDT)
Message-ID: <be74af04-6054-f5e5-28c0-4b0952bbbd78@redhat.com>
Date: Wed, 24 Aug 2022 10:32:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v10 00/12] NIC vhost-vdpa state restore via Shadow CVQ
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Cindy Lu <lulu@redhat.com>
References: <20220823183037.98470-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220823183037.98470-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/8/24 02:30, Eugenio Pérez 写道:
> CVQ of net vhost-vdpa devices can be intercepted since the addition of x-svq.
> The virtio-net device model is updated. The migration was blocked because
> although the state can be megrated between VMM it was not possible to restore
> on the destination NIC.
>
> This series add support for SVQ to inject external messages without the guest's
> knowledge, so before the guest is resumed all the guest visible state is
> restored. It is done using standard CVQ messages, so the vhost-vdpa device does
> not need to learn how to restore it: As long as they have the feature, they
> know how to handle it.
>
> Depending on the device, this series may need fixes with message id [1] to
> achieve full live migration.
>
> [1] <20220823182008.97141-1-eperezma@redhat.com>


I've queued the two series in net-next branch:

https://github.com/jasowang/qemu/commits/net-next

Thanks


>
> v10:
> - Rebase on latest fixes of [1].
>
> v9:
> - Use guest acked features instead of device's.
> - Minors: fix typos and patch messages, constify vhost_vdpa and VirtIONet vars,
>    delete unneeded increment of cursor.
>
> v8:
> - Rename NetClientInfo load to start, so is symmetrical with stop()
> - Delete copy of device's in buffer at vhost_vdpa_net_load
>
> v7:
> - Remove accidental double free.
>
> v6:
> - Move map and unmap of the buffers to the start and stop of the device. This
>    implies more callbacks on NetClientInfo, but simplifies the SVQ CVQ code.
> - Not assume that in buffer is sizeof(virtio_net_ctrl_ack) in
>    vhost_vdpa_net_cvq_add
> - Reduce the number of changes from previous versions
> - Delete unused memory barrier
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
> Eugenio Pérez (12):
>    vhost: stop transfer elem ownership in vhost_handle_guest_kick
>    vhost: use SVQ element ndescs instead of opaque data for desc
>      validation
>    vhost: Delete useless read memory barrier
>    vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush
>    vhost_net: Add NetClientInfo start callback
>    vhost_net: Add NetClientInfo stop callback
>    vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
>    vdpa: Move command buffers map to start of net device
>    vdpa: extract vhost_vdpa_net_cvq_add from
>      vhost_vdpa_net_handle_ctrl_avail
>    vhost_net: add NetClientState->load() callback
>    vdpa: Add virtio-net mac address via CVQ at start
>    vdpa: Delete CVQ migration blocker
>
>   include/hw/virtio/vhost-vdpa.h     |   1 -
>   include/net/net.h                  |   6 +
>   hw/net/vhost_net.c                 |  17 +++
>   hw/virtio/vhost-shadow-virtqueue.c |  27 ++--
>   hw/virtio/vhost-vdpa.c             |  15 --
>   net/vhost-vdpa.c                   | 224 ++++++++++++++++++-----------
>   6 files changed, 177 insertions(+), 113 deletions(-)
>


