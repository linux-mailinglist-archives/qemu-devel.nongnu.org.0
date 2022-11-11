Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E80625B29
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:29:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otT5k-0007CU-BV; Fri, 11 Nov 2022 07:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1otT5Y-00074L-3Q
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:24:52 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1otT5V-00024O-JH
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:24:51 -0500
HMM_SOURCE_IP: 172.18.0.218:54908.1837662507
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8B5112800B4;
 Fri, 11 Nov 2022 20:24:28 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0025 with ESMTP id ac0d8f5007a44dd58aae3adce6e32314 for mst@redhat.com; 
 Fri, 11 Nov 2022 20:24:38 CST
X-Transaction-ID: ac0d8f5007a44dd58aae3adce6e32314
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
Message-ID: <51a568c7-3200-9f37-dfa9-5562415d0167@chinatelecom.cn>
Date: Fri, 11 Nov 2022 20:24:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 1/2] vhost-user: Refactor vhost acked features saving
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
 <2c9618e155b29b6fb811de112fc03d9585c85070.1667136717.git.huangy81@chinatelecom.cn>
 <20221110135334-mutt-send-email-mst@kernel.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <20221110135334-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/11/11 2:56, Michael S. Tsirkin 写道:
> On Sun, Oct 30, 2022 at 09:52:38PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Abstract vhost acked features saving into
>> vhost_user_save_acked_features, export it as util function.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>> ---
>>   include/net/vhost-user.h |  2 ++
>>   net/vhost-user.c         | 29 ++++++++++++++++++-----------
>>   2 files changed, 20 insertions(+), 11 deletions(-)
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
>> index b1a0247..74f349c 100644
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
> 
> I can't figure out what is going on here.  Why is there a cleanup flag?
> What does cleanup have to do with saving acked features?
> I suspect it's better to just leave this part in the caller.
> 
Indeed, i'll adjust the logic next version.
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
>> -- 
>> 1.8.3.1
> 

-- 
Best regard

Hyman Huang(黄勇)

