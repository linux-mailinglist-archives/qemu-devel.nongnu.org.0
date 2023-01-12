Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D88666E16
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:27:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtrd-00014w-NE; Thu, 12 Jan 2023 04:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pFtrX-00014a-8G
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pFtrU-0006Dw-Pm
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673515623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TNn/6lx2P1/hdwHntbiMhzmeDclfGJNNJPAt2KSOoE=;
 b=d9OXHl9gxTB1FmmzGLEF2S3fiMpc5sW2ALtJlPAbEZ+IsSfYzZ1X4ijHszrnxq+yW/oKVt
 6sK+xAq3aKJjgtEbKcTm98RHz0KgFEopRrtnLxSN7rF2xiYzV2QYX8Uu5HJpW4FlUQZob0
 IsGypO6vohi9bQDDMIOYxuS/II4sbYQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-M9YAAoDVNymPZrUDXIlTKw-1; Thu, 12 Jan 2023 04:25:52 -0500
X-MC-Unique: M9YAAoDVNymPZrUDXIlTKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D1793C106A1;
 Thu, 12 Jan 2023 09:25:52 +0000 (UTC)
Received: from [10.39.208.23] (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F8D1121318;
 Thu, 12 Jan 2023 09:25:50 +0000 (UTC)
Message-ID: <31f87c1d-9cce-6507-8e90-4d7942d7dc54@redhat.com>
Date: Thu, 12 Jan 2023 10:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yajun Wu <yajunw@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-77-mst@redhat.com>
 <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
 <20230109054633-mutt-send-email-mst@kernel.org>
 <c0acea1d-7bae-120e-9422-82b0a5c432cf@redhat.com>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
In-Reply-To: <c0acea1d-7bae-120e-9422-82b0a5c432cf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Laurent,

On 1/11/23 10:50, Laurent Vivier wrote:
> On 1/9/23 11:55, Michael S. Tsirkin wrote:
>> On Fri, Jan 06, 2023 at 03:21:43PM +0100, Laurent Vivier wrote:
>>> Hi,
>>>
>>> it seems this patch breaks vhost-user with DPDK.
>>>
>>> See https://bugzilla.redhat.com/show_bug.cgi?id=2155173
>>>
>>> it seems QEMU doesn't receive the expected commands sequence:
>>>
>>> Received unexpected msg type. Expected 22 received 40
>>> Fail to update device iotlb
>>> Received unexpected msg type. Expected 40 received 22
>>> Received unexpected msg type. Expected 22 received 11
>>> Fail to update device iotlb
>>> Received unexpected msg type. Expected 11 received 22
>>> vhost VQ 1 ring restore failed: -71: Protocol error (71)
>>> Received unexpected msg type. Expected 22 received 11
>>> Fail to update device iotlb
>>> Received unexpected msg type. Expected 11 received 22
>>> vhost VQ 0 ring restore failed: -71: Protocol error (71)
>>> unable to start vhost net: 71: falling back on userspace virtio
>>>
>>> It receives VHOST_USER_GET_STATUS (40) when it expects 
>>> VHOST_USER_IOTLB_MSG (22)
>>> and VHOST_USER_IOTLB_MSG when it expects VHOST_USER_GET_STATUS.
>>> and VHOST_USER_GET_VRING_BASE (11) when it expect 
>>> VHOST_USER_GET_STATUS and so on.
>>>
>>> Any idea?

We only have a single thread on DPDK side to handle Vhost-user requests,
it will read a request, handle it and reply to it. Then it reads the
next one, etc... So I don't think it is possible to mix request replies
order on DPDK side.

Maybe there are two threads concurrently sending requests on QEMU side?

Regards,
Maxime

>>> Thanks,
>>> Laurent
>>
>>
>> So I am guessing it's coming from:
>>
>>      if (msg.hdr.request != request) {
>>          error_report("Received unexpected msg type. Expected %d 
>> received %d",
>>                       request, msg.hdr.request);
>>          return -EPROTO;
>>      }
>>
>> in process_message_reply and/or in vhost_user_get_u64.
>>
>>
>>> On 11/7/22 23:53, Michael S. Tsirkin wrote:
>>>> From: Yajun Wu <yajunw@nvidia.com>
>>>>
>>>> The motivation of adding vhost-user vhost_dev_start support is to
>>>> improve backend configuration speed and reduce live migration VM
>>>> downtime.
>>>>
>>>> Today VQ configuration is issued one by one. For virtio net with
>>>> multi-queue support, backend needs to update RSS (Receive side
>>>> scaling) on every rx queue enable. Updating RSS is time-consuming
>>>> (typical time like 7ms).
>>>>
>>>> Implement already defined vhost status and message in the vhost
>>>> specification [1].
>>>> (a) VHOST_USER_PROTOCOL_F_STATUS
>>>> (b) VHOST_USER_SET_STATUS
>>>> (c) VHOST_USER_GET_STATUS
>>>>
>>>> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
>>>> device start and reset(0) for device stop.
>>>>
>>>> On reception of the DRIVER_OK message, backend can apply the needed 
>>>> setting
>>>> only once (instead of incremental) and also utilize parallelism on 
>>>> enabling
>>>> queues.
>>>>
>>>> This improves QEMU's live migration downtime with vhost user backend
>>>> implementation by great margin, specially for the large number of 
>>>> VQs of 64
>>>> from 800 msec to 250 msec.
>>>>
>>>> [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html
>>>>
>>>> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>>>> Acked-by: Parav Pandit <parav@nvidia.com>
>>>> Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> Probably easiest to debug from dpdk side.
>> Does the problem go away if you disable the feature 
>> VHOST_USER_PROTOCOL_F_STATUS in dpdk?
> 
> Maxime could you help to debug this?
> 
> Thanks,
> Laurent
> 


