Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F8C616650
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 16:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqFoE-000602-HW; Wed, 02 Nov 2022 11:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oqFo3-0005un-Ri
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 11:37:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oqFo0-0004nN-Pr
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 11:37:30 -0400
HMM_SOURCE_IP: 172.18.0.218:56744.881847599
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.180.88 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C095B280097;
 Wed,  2 Nov 2022 23:37:23 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([182.138.180.88])
 by app0025 with ESMTP id 07c7c8bd6c2c48cda3af914e53c827ea for thuth@redhat.com;
 Wed, 02 Nov 2022 23:37:26 CST
X-Transaction-ID: 07c7c8bd6c2c48cda3af914e53c827ea
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.180.88
X-MEDUSA-Status: 0
Message-ID: <6f96809e-6cef-271a-47e6-9f61d5ce313a@chinatelecom.cn>
Date: Wed, 2 Nov 2022 23:37:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH RFC 1/4] net: Introduce qmp cmd "query-netdev"
To: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
 <d254324983817fb380411995155c9e927edaeb92.1667232396.git.huangy81@chinatelecom.cn>
 <CACGkMEvvoVwtr8aSqTpAVxYN7q7mxMmLbusfgKDf3zwfmk2itg@mail.gmail.com>
 <6203a6be-7b48-3ee2-2bfa-48fff291c14b@redhat.com>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <6203a6be-7b48-3ee2-2bfa-48fff291c14b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



在 2022/11/2 15:10, Thomas Huth 写道:
> On 02/11/2022 06.42, Jason Wang wrote:
>> On Tue, Nov 1, 2022 at 12:19 AM <huangy81@chinatelecom.cn> wrote:
>>>
>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>
>>> For netdev device that can offload virtio-net dataplane to slave,
>>> such as vhost-net, vhost-user and vhost-vdpa, exporting it's
>>> capability information and acked features would be more friendly for
>>> developers. These infomation can be analyzed and compare to slave
>>> capability provided by, eg dpdk or other slaves directly, helping to
>>> draw conclusions about if vm network interface works normally, if
>>> it vm can be migrated to another feature-compatible destination or
>>> whatever else.
>>>
>>> For developers who devote to offload virtio-net dataplane to DPU
>>> and make efforts to migrate vm lively from software-based source
>>> host to DPU-offload destination host smoothly, virtio-net feature
>>> compatibility is an serious issue, exporting the key capability
>>> and acked_features of netdev could also help to debug greatly.
>>>
>>> So we export out the key capabilities of netdev, which may affect
>>> the final negotiated virtio-net features, meanwhile, backed-up
>>> acked_features also exported, which is used to initialize or
>>> restore features negotiated between qemu and vhost slave when
>>> starting vhost_dev device.
>>>
>>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>> ---
>>>   net/net.c     | 44 +++++++++++++++++++++++++++++++++++++++
>>>   qapi/net.json | 66 
>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 110 insertions(+)
>>>
>>> diff --git a/net/net.c b/net/net.c
>>> index 2db160e..5d11674 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -53,6 +53,7 @@
>>>   #include "sysemu/runstate.h"
>>>   #include "net/colo-compare.h"
>>>   #include "net/filter.h"
>>> +#include "net/vhost-user.h"
>>>   #include "qapi/string-output-visitor.h"
>>>
>>>   /* Net bridge is currently not supported for W32. */
>>> @@ -1224,6 +1225,49 @@ void qmp_netdev_del(const char *id, Error **errp)
>>>       }
>>>   }
>>>
>>> +static NetDevInfo *query_netdev(NetClientState *nc)
>>> +{
>>> +    NetDevInfo *info = NULL;
>>> +
>>> +    if (!nc || !nc->is_netdev) {
>>> +        return NULL;
>>> +    }
>>> +
>>> +    info = g_malloc0(sizeof(*info));
>>> +    info->name = g_strdup(nc->name);
>>> +    info->type = nc->info->type;
>>> +    info->ufo = nc->info->has_ufo;
>>> +    info->vnet_hdr = nc->info->has_vnet_hdr;
>>> +    info->vnet_hdr_len = nc->info->has_vnet_hdr_len;
>>
>> So all the fields are virtio specific, I wonder if it's better to
>> rename the command as query-vhost or query-virtio?
> 
> And add a "x-" prefix (and a "-netdev" suffix) as long as we don't feel 
> confident about this yet? "x-query-virtio-netdev" ?

Agree with that, thanks for the comment.

Yong.
> 
>   Thomas
> 

