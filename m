Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D869260409C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:06:31 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol5xt-0003AX-4b
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5jx-0003F8-3n
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5ju-0005b9-Ks
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666173113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTnq0uD7UO065xxrYP1qsBMtDYtjBVeUnn1Hp8O2PuI=;
 b=DBaPfE7SwnfaBZBi7xImMVmQpn10Xl6YneqPu/zAtwHSJiFsU9qpAvGuVqZpY4P629hxWg
 c+51JDdk7tskCJszYRI8d1qtmKvPcTiQYcNuH9fm2eZAQzY+Fe/daTJo6bhF6W3L9jUQ3s
 lNBgENdObbVUUNreR2an88YvSnQaR64=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-ZkTsDE09NyKOzk_aHFGQHg-1; Wed, 19 Oct 2022 05:51:49 -0400
X-MC-Unique: ZkTsDE09NyKOzk_aHFGQHg-1
Received: by mail-qk1-f198.google.com with SMTP id
 w13-20020a05620a424d00b006e833c4fb0dso14249781qko.2
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTnq0uD7UO065xxrYP1qsBMtDYtjBVeUnn1Hp8O2PuI=;
 b=tHwRykNVBzH3iBZRImb/hzL64INGKJn0Z9gpuTCZ98fE+YuDjEQMNT3emFPAHAaboE
 uXfEZ06vIBXSoQdCi9bDdhgg1iPjUb8fSiB3S+fAhdQ+H4Yk2vTOZq0G4rwz559Z5RLh
 4vMnToa9CT0u0h2xEPi+EQTC6L7lsOTqPIPYaTWN7hK3fvijfGJZ1qaIGhttYNibpRnx
 wD+f+MF3CCUtyloLzh8eTyGzPUWZoJWLLiGKl+GLoB0ig52d51M0uOzkzvmotjESBN4C
 gW3aW4iFhYhcWVBLp8wKu3EPBSdM4EflkWnFsIB0LF0ILbbOBIiNrKo8AwaXwqRHlpZx
 jU8Q==
X-Gm-Message-State: ACrzQf1GlPP1KamSSsO7mgeRxWhn1PnRz8qsnHx0GMHtlZkTEFRH4BlC
 p4WEYJywVHy6LzIUGI49gAwgMh7zO4OXnkFCTFVfsdaDDWsdUCaGT6cGJi3MWHpae0WRkwCZxGt
 OKUT/smBx5JpfUNM=
X-Received: by 2002:a37:aace:0:b0:6ee:90c1:ea60 with SMTP id
 t197-20020a37aace000000b006ee90c1ea60mr4576625qke.215.1666173109515; 
 Wed, 19 Oct 2022 02:51:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BZ31K3WYrdGwMqx/NN9sAbAr5WELDPXjMaXtt2rv1apmqhCKg8d7cWvCoI0w2E1hs1SB7mw==
X-Received: by 2002:a37:aace:0:b0:6ee:90c1:ea60 with SMTP id
 t197-20020a37aace000000b006ee90c1ea60mr4576597qke.215.1666173109282; 
 Wed, 19 Oct 2022 02:51:49 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.190.19])
 by smtp.gmail.com with ESMTPSA id
 g22-20020ac84696000000b0039d03f69cf5sm177672qto.72.2022.10.19.02.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 02:51:48 -0700 (PDT)
Date: Wed, 19 Oct 2022 11:51:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 afaria@redhat.com, Jeff Cody <codyprime@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 integration@gluster.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v7 13/13] virtio-blk: use BDRV_REQ_REGISTERED_BUF
 optimization hint
Message-ID: <20221019095140.3kxzhzya7a7tirqb@sgarzare-redhat>
References: <20221013185908.1297568-1-stefanha@redhat.com>
 <20221013185908.1297568-14-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221013185908.1297568-14-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 02:59:08PM -0400, Stefan Hajnoczi wrote:
>Register guest RAM using BlockRAMRegistrar and set the
>BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
>accesses in I/O requests.
>
>This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
>on DMA mapping/unmapping.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> include/hw/virtio/virtio-blk.h |  2 ++
> hw/block/virtio-blk.c          | 39 ++++++++++++++++++++++------------
> 2 files changed, 27 insertions(+), 14 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


