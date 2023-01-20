Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614367580B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:04:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsvb-0005Zo-G2; Fri, 20 Jan 2023 10:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pIsvU-0005Ua-Kp
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pIsvS-0004vx-Vx
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674227010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDDW+rsIVioqs86pyMt+i+K8wZSjbOhQVruxGKbTgdk=;
 b=UqdI1qsIb7ArZ0R79idNW1ScgMTmU/1Ov0Ulm7hpnXBOmO0PA4ctCU6beJ4TNf7NFHkP8L
 +0jLDvuFYfZazqgYUiuNXXv2GdI2is2vIsXIpT7QBokDIlbXl6iC7H3MTIw3FYxHjKpaqs
 W2sYZpZUEKn74Xhns5Ju//zdZv2nwzQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-eLvTaIVvOGy3CgKzCsN3kw-1; Fri, 20 Jan 2023 10:03:26 -0500
X-MC-Unique: eLvTaIVvOGy3CgKzCsN3kw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AF5185CBE5;
 Fri, 20 Jan 2023 15:03:26 +0000 (UTC)
Received: from [10.39.208.26] (unknown [10.39.208.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03EA6492C3E;
 Fri, 20 Jan 2023 15:03:23 +0000 (UTC)
Message-ID: <e0724813-3402-69fe-25b0-6d3b0b6ca63c@redhat.com>
Date: Fri, 20 Jan 2023 16:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] Revert "vhost-user: Monitor slave channel in
 vhost_user_read()"
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>, Peter Maydell <peter.maydell@linaro.org>,
 Parav Pandit <parav@nvidia.com>, qemu-stable@nongnu.org,
 Yanghang Liu <yanghliu@redhat.com>
References: <20230119172424.478268-1-groug@kaod.org>
 <20230119172424.478268-2-groug@kaod.org>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
In-Reply-To: <20230119172424.478268-2-groug@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/19/23 18:24, Greg Kurz wrote:
> This reverts commit db8a3772e300c1a656331a92da0785d81667dc81.
> 
> Motivation : this is breaking vhost-user with DPDK as reported in [0].
> 
> Received unexpected msg type. Expected 22 received 40
> Fail to update device iotlb
> Received unexpected msg type. Expected 40 received 22
> Received unexpected msg type. Expected 22 received 11
> Fail to update device iotlb
> Received unexpected msg type. Expected 11 received 22
> vhost VQ 1 ring restore failed: -71: Protocol error (71)
> Received unexpected msg type. Expected 22 received 11
> Fail to update device iotlb
> Received unexpected msg type. Expected 11 received 22
> vhost VQ 0 ring restore failed: -71: Protocol error (71)
> unable to start vhost net: 71: falling back on userspace virtio
> 
> The failing sequence that leads to the first error is :
> - QEMU sends a VHOST_USER_GET_STATUS (40) request to DPDK on the master
>    socket
> - QEMU starts a nested event loop in order to wait for the
>    VHOST_USER_GET_STATUS response and to be able to process messages from
>    the slave channel
> - DPDK sends a couple of legitimate IOTLB miss messages on the slave
>    channel
> - QEMU processes each IOTLB request and sends VHOST_USER_IOTLB_MSG (22)
>    updates on the master socket
> - QEMU assumes to receive a response for the latest VHOST_USER_IOTLB_MSG
>    but it gets the response for the VHOST_USER_GET_STATUS instead
> 
> The subsequent errors have the same root cause : the nested event loop
> breaks the order by design. It lures QEMU to expect responses to the
> latest message sent on the master socket to arrive first.
> 
> Since this was only needed for DAX enablement which is still not merged
> upstream, just drop the code for now. A working solution will have to
> be merged later on. Likely protect the master socket with a mutex
> and service the slave channel with a separate thread, as discussed with
> Maxime in the mail thread below.
> 
> [0] https://lore.kernel.org/qemu-devel/43145ede-89dc-280e-b953-6a2b436de395@redhat.com/
> 
> Reported-by: Yanghang Liu <yanghliu@redhat.com>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2155173
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   hw/virtio/vhost-user.c | 35 +++--------------------------------
>   1 file changed, 3 insertions(+), 32 deletions(-)
> 

Acked-by: Maxime Coquelin <maxime.coquelin@redhat.com>

Thanks,
Maxime


