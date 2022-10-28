Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F5361085D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 04:44:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooFM3-0001h3-46; Thu, 27 Oct 2022 22:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooFM2-0001gi-6b
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooFM0-0000Ls-No
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666925056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NR+ZMv3M1yPzcR/x55dSUJMH1mIZto/JrG5/WQ/p1AQ=;
 b=IGEMNg4AqICc7ng+8wmIqHd1Av+zLZL8ItZCjn2G1qIHOcIn7gsDOFjUaQ4PlinpMe1oDV
 CoWWbmw6KSVF1idyalOx54JapDqv2RIE2GiHekjRxn/Sh22dobI8rXiEKqdqncFweydpIO
 HJ9p0/Fh8H/B3yKQicRgbRaqpRWfRv8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-M9YTMKEOPLCuX6u8VGYIyQ-1; Thu, 27 Oct 2022 22:44:14 -0400
X-MC-Unique: M9YTMKEOPLCuX6u8VGYIyQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 h2-20020a170902f54200b0018553a8b797so2383209plf.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 19:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NR+ZMv3M1yPzcR/x55dSUJMH1mIZto/JrG5/WQ/p1AQ=;
 b=oEQzbwgSiGmwqqUzh/nn+XxtVDmlArR3k2FrbQi26LisuZWOWntioqB9oN4nK4U9MZ
 21VhDeaYkeLYuyrHakwmUe9rzolQ67G/2mxGewGrDaRogvyRPoJ5roAz3yuOacF7gHvM
 Ge5VtFgKep/2XSRgR+fX7akxrQ+JPy0a73Tj780c0+QmqrgycVboAWR3mm7VG5Z+yZyB
 hGBCWJKvuZBmkMDm3wJUP9Y8TMUh8SJiIwGIORzLw1EtvYGdF6VRoYRFJIdEP/oXC/me
 seS1VXd0vehZoq2mtI1HQ7gJziDp1aVc6T9s7XmWh/sFxSt7lNthMj4RShTDI2pzja8P
 RzXw==
X-Gm-Message-State: ACrzQf3phNxbguicb090ES2TVSish2oq9f2XU6PqrEFcn3rlxZ3KIrFe
 3WbwamIp+QYXcGUs5g3BCuNjoxTKVHy4E3Sl03sGwjAY2TxjCPavcBBjLJc4y0RQt5/BDTTY/8f
 8ONimCp7sOvuSXi8=
X-Received: by 2002:a63:4506:0:b0:44b:5e43:beb6 with SMTP id
 s6-20020a634506000000b0044b5e43beb6mr46310057pga.576.1666925053723; 
 Thu, 27 Oct 2022 19:44:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YPAskmeM/YdMgaMigvkiRBVzSC6y/GqLwoTUB/8JZ4QYmpXRXaRnlMLZPOtcxSsKjdtENmQ==
X-Received: by 2002:a63:4506:0:b0:44b:5e43:beb6 with SMTP id
 s6-20020a634506000000b0044b5e43beb6mr46310029pga.576.1666925053472; 
 Thu, 27 Oct 2022 19:44:13 -0700 (PDT)
Received: from [10.72.13.50] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79424000000b00565cbad9616sm1833462pfo.6.2022.10.27.19.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 19:44:12 -0700 (PDT)
Message-ID: <986d8ba9-2634-3224-d548-cf5563639c49@redhat.com>
Date: Fri, 28 Oct 2022 10:44:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 0/4] Shadow VirtQueue event index support
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>,
 Parav Pandit <parav@mellanox.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221026165830-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221026165830-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/10/27 04:58, Michael S. Tsirkin 写道:
> On Thu, Oct 20, 2022 at 05:52:47PM +0200, Eugenio Pérez wrote:
>> Event idx helps to reduce the number of notifications between the device
>> and the driver. It allows them to specify an index on the circular
>> descriptors rings where to issue the notification, instead of a single
>> binary indicator.
>>
>> Adding support for SVQ.
>
> Jason seems to be taking this through net
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


Ok, I've queued this.

Eugenio, please post the fix for endian on top.

Thanks


>
>> These patches are sent on top of [1] series, so trivial conflicts could arise
>> if it is applied directly on master. Future versions can be not based on
>> it is more convenient.
>>
>> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03280.html
>>
>> Eugenio Pérez (4):
>>    vhost: allocate event_idx fields on vring
>>    vhost: toggle device callbacks using used event idx
>>    vhost: use avail event idx on vhost_svq_kick
>>    vhost: Accept event idx flag
>>
>>   hw/virtio/vhost-shadow-virtqueue.c | 39 ++++++++++++++++++++++++------
>>   1 file changed, 31 insertions(+), 8 deletions(-)
>>
>> -- 
>> 2.31.1
>>


