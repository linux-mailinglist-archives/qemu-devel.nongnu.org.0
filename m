Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF842B9705
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 16:54:57 +0100 (CET)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmGu-0000KV-Jb
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 10:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kfmBy-0003o6-Jm
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:49:50 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:58332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kfmBv-0004vb-Rx
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:49:49 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJFOUt7042684;
 Thu, 19 Nov 2020 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=DW/CAaNbdJtbzR7qpanjCbN9/cagyJutkwMM+TqrZWo=;
 b=cujHLwiP/NU45L8NOqYcaRC4TAT1X6Y8wuEIPK5bKDowvUuiDTFW4VDMUaLFCeJxEkcf
 rSJigk13cts+R9ikPZZW2iWiXzUxF+jL/0v9DaVg7CH5gcGpjqwjhs36fR8xuGWTEB0n
 RVQqOu0zU1bOhUTTQdxNzUEI9w/nP4goe3Bh+HYNmhgINj9yzd8KEtCpdY8ZP/jPjWkJ
 zG7/K+O+kc51Xhf1gNz7rSj0kt5OcRDkbCD/JnLacHXmMtXGZ6qWHrzkFz/ne5BDeZE8
 0Oo8L30/n3+jeVm+CqYl6lt39miwKfZGC1FfJMQ9rhY1AZxgxkBQUqBeRtNyXBBdg3wA wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34t76m63wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 15:49:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJFkrbF037338;
 Thu, 19 Nov 2020 15:49:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 34ts604nur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 15:49:31 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AJFnTgn010818;
 Thu, 19 Nov 2020 15:49:29 GMT
Received: from [20.15.0.5] (/73.88.28.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Nov 2020 07:49:29 -0800
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
To: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <bba47572-bec9-794f-5a70-d7f016267022@redhat.com>
 <8318de9f-c585-39f8-d931-1ff5e0341d75@oracle.com>
 <e3f8f065-ca17-e4a0-06e5-990bbe8fe947@redhat.com>
 <d6ffcf17-ab12-4830-cc3c-0f0402fb8a0f@oracle.com>
 <e91e9eee-7ff4-3ef6-955a-706276065d9b@redhat.com>
From: Mike Christie <michael.christie@oracle.com>
Message-ID: <0ba1bd55-6772-2d75-4b63-72445830a446@oracle.com>
Date: Thu, 19 Nov 2020 09:49:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <e91e9eee-7ff4-3ef6-955a-706276065d9b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9809
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9809
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190116
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=michael.christie@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 10:49:46
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 10:35 PM, Jason Wang wrote:
>> its just extra code. This patch:
>> https://urldefense.com/v3/__https://www.spinics.net/lists/linux-scsi/msg150151.html__;!!GqivPVa7Brio!MJS-iYeBuOljoz2xerETyn4c1N9i0XnOE8oNhz4ebbzCMNeQIP_Iie8zH18L7cY7_hur$ 
>> would work without the ENABLE ioctl I mean.
> 
> 
> That seems to pre-allocate all workers. If we don't care the resources 
> (127 workers) consumption it could be fine.

It only makes what the user requested via num_queues.

That patch will:
1. For the default case of num_queues=1 we use the single worker created 
from the SET_OWNER ioctl.
2. If num_queues > 1, then it creates a worker thread per num_queue > 1.


> 
> 
>>
>>
>> And if you guys want to do the completely new interface, then none of 
>> this matters I guess :)
>>
>> For disable see below.
>>
>>>
>>>
>>>>
>>>> My issue/convern is that in general these calls seems useful, but we 
>>>> don't really
>>>> need them for scsi because vhost scsi is already stuck creating vqs 
>>>> like how it does
>>>> due to existing users. If we do the ifcvf_vdpa_set_vq_ready type of 
>>>> design where
>>>> we just set some bit, then the new ioctl does not give us a lot. 
>>>> It's just an extra
>>>> check and extra code.
>>>>
>>>> And for the mlx5_vdpa_set_vq_ready type of design, it doesn't seem 
>>>> like it's going
>>>> to happen a lot where the admin is going to want to remove vqs from 
>>>> a running device.
>>>
>>>
>>> In this case, qemu may just disable the queues of vhost-scsi via 
>>> SET_VRING_ENABLE and then we can free resources?
>>
>>
>> Some SCSI background in case it doesn't work like net:
>> -------
>> When the user sets up mq for vhost-scsi/virtio-scsi, for max perf and 
>> no cares about mem use they would normally set num_queues based on the 
>> number of vCPUs and MSI-x vectors. I think the default in qemu now is 
>> to try and detect that value.
>>
>> When the virtio_scsi driver is loaded into the guest kernel, it takes 
>> the num_queues value and tells the scsi/block mq layer to create 
>> num_queues multiqueue hw queues.
> 
> 
> If I read the code correctly, for modern device, guest will set 
> queue_enable for the queues that it wants to use. So in this ideal case, 
> qemu can forward them to VRING_ENABLE and reset VRING_ENABLE during 
> device reset.

I was thinking more you want an event like when a device/LUN is 
added/removed to a host. Instead of kicking off a device scan, you could 
call the block helper to remap queues. It would then not be too invasive 
to running IO. I'll look into reset some more.


> 
> But it would be complicated to support legacy device and qemu.
> 
> 
>>
>> ------
>>
>> I was trying to say in the previous email that is if all we do is set 
>> some bits to indicate the queue is disabled, free its resources, stop 
>> polling/queueing in the scsi/target layer, flush etc, it does not seem 
>> useful. I was trying to ask when would a user only want this behavior?
> 
> 
> I think it's device reset, the semantic is that unless the queue is 
> enabled, we should treat it as disabled.
> 

Ah ok. I I'll look into that some more. A funny thing is that I was 
trying to test that a while ago, but it wasn't helpful. I'm guessing it 
didn't work because it didn't implement what you wanted for disable 
right now :)

