Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A7612775
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 06:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op0ev-00059m-Fu; Sun, 30 Oct 2022 01:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1op0er-00058i-RP
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 01:14:54 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1op0el-00084W-CZ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 01:14:53 -0400
HMM_SOURCE_IP: 172.18.0.218:46602.1016295813
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.35 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id E3F5A2800AE;
 Sun, 30 Oct 2022 13:14:19 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([125.69.42.35])
 by app0025 with ESMTP id 7dfe880397fa43b08ff3dd8a9e0aecff for mst@redhat.com; 
 Sun, 30 Oct 2022 13:14:33 CST
X-Transaction-ID: 7dfe880397fa43b08ff3dd8a9e0aecff
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.42.35
X-MEDUSA-Status: 0
Message-ID: <c3180574-4de8-0ceb-4346-0ac504cd1a86@chinatelecom.cn>
Date: Sun, 30 Oct 2022 13:14:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] vhost-user: Refactor vhost acked features saving
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>
References: <cover.1666977755.git.huangy81@chinatelecom.cn>
 <8f537f6a484cfdac236fd6307f796660ae562226.1666977755.git.huangy81@chinatelecom.cn>
 <20221029042532-mutt-send-email-mst@kernel.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <20221029042532-mutt-send-email-mst@kernel.org>
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



在 2022/10/29 16:28, Michael S. Tsirkin 写道:
> On Sat, Oct 29, 2022 at 01:25:44AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Abstract vhost acked features saving into
>> vhost_user_save_acked_features, export it as util function.
>>
> 
> Thanks for the patch!
> 
> This commit log makes it sound like it's just a refactoring
> while it's actually a behaviour change.
> This log needs to include analysis of why is saving only if features != 0
> safe.
> 
> Could you include that pls?
> 
> Thanks!
>   
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>> ---
>>   include/net/vhost-user.h |  2 ++
>>   net/vhost-user.c         | 35 +++++++++++++++++++----------------
>>   2 files changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
>> index 5bcd8a6..00d4661 100644
>> --- a/include/net/vhost-user.h
>> +++ b/include/net/vhost-user.h
>> @@ -14,5 +14,7 @@
>>   struct vhost_net;
>>   struct vhost_net *vhost_user_get_vhost_net(NetClientState *nc);
>>   uint64_t vhost_user_get_acked_features(NetClientState *nc);
>> +void vhost_user_save_acked_features(NetClientState *nc,
>> +                                    bool cleanup);
>>   
>>   #endif /* VHOST_USER_H */
>> diff --git a/net/vhost-user.c b/net/vhost-user.c
>> index b1a0247..c512cc9 100644
>> --- a/net/vhost-user.c
>> +++ b/net/vhost-user.c
>> @@ -45,24 +45,31 @@ uint64_t vhost_user_get_acked_features(NetClientState *nc)
>>       return s->acked_features;
>>   }
>>   
>> -static void vhost_user_stop(int queues, NetClientState *ncs[])
>> +void vhost_user_save_acked_features(NetClientState *nc, bool cleanup)
>>   {
>>       NetVhostUserState *s;
>> +
>> +    s = DO_UPCAST(NetVhostUserState, nc, nc);
>> +    if (s->vhost_net) {
>> +        uint64_t features = vhost_net_get_acked_features(s->vhost_net);
>> +        if (features) {
>> +            s->acked_features = features;
>> +        }
>> +
>> +        if (cleanup) {
>> +            vhost_net_cleanup(s->vhost_net);
>> +        }
>> +    }
>> +}
>> +
>> +static void vhost_user_stop(int queues, NetClientState *ncs[])
>> +{
>>       int i;
>>   
>>       for (i = 0; i < queues; i++) {
>>           assert(ncs[i]->info->type == NET_CLIENT_DRIVER_VHOST_USER);
>>   
>> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
>> -
>> -        if (s->vhost_net) {
>> -            /* save acked features */
>> -            uint64_t features = vhost_net_get_acked_features(s->vhost_net);
>> -            if (features) {
>> -                s->acked_features = features;
>> -            }
>> -            vhost_net_cleanup(s->vhost_net);
>> -        }
>> +        vhost_user_save_acked_features(ncs[i], true);
>>       }
>>   }
>>   
>> @@ -251,11 +258,7 @@ static void chr_closed_bh(void *opaque)
>>       s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
>>   
>>       for (i = queues -1; i >= 0; i--) {
>> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
>> -
>> -        if (s->vhost_net) {
>> -            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
>> -        }
>> +        vhost_user_save_acked_features(ncs[i], false);
> 
> 
> So this won't do anything if acked features is 0.
> When does this have any effect? How about if guest
> acked some features, and then reset the device.
> Don't we want to reset the features in this case too?
> 
Sorry about that i just notice that Stefano has replied the question 
about "why saving features only if the features aren't 0" 3 weeks ago, 
it seems that the answer is not clear.

IMHO, as i metioned in the link:
https://patchew.org/QEMU/20220926063641.25038-1-huangy81@chinatelecom.cn/20220926063641.25038-2-huangy81@chinatelecom.cn/

"Indeed, backing up acked_features in the two functions chr_closed_bh()
vhost_user_stop() are kind of different as above, it also seems a little
weried for me.

IMHO, we can always keep the acked_features in NetVhostUserState the
same as acked_features in vhost_dev no matter what features are, since
this is the role that acked_features in NetVhostUserState plays and we
can just focus on the validation of acked_features in vhost_dev if
something goes wrong"

Maybe we could adopt above strategy and saving acked_features no matter 
whether the featuress are 0 or not.

The next version will modify the logic and skip checking features before 
saving, meanwhile, i'll post another series for vhost-user-test case to 
assert if the acked_features in NetVhostUserState is exactly the same in 
vhost slave device, which can check if features is set correctly by 
vhost user protocol.

Thanks

Yong

> 
>>       }
>>   
>>       qmp_set_link(name, false, &err);
>> -- 
>> 1.8.3.1
> 

-- 
Best regard

Hyman Huang(黄勇)

