Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7FF5F7BFB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:02:37 +0200 (CEST)
Received: from localhost ([::1]:35848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqk4-0007n0-1p
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ogqgU-0004EI-H6
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:58:54 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:37044
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ogqgR-0005El-Iy
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:58:49 -0400
HMM_SOURCE_IP: 172.18.0.218:55492.1580007811
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.38 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id ADA142800A5;
 Sat,  8 Oct 2022 00:58:34 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([182.138.181.38])
 by app0025 with ESMTP id 95b8b6fb24f14fcb964f57862b9214ec for mst@redhat.com; 
 Sat, 08 Oct 2022 00:58:36 CST
X-Transaction-ID: 95b8b6fb24f14fcb964f57862b9214ec
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.181.38
X-MEDUSA-Status: 0
Message-ID: <e3707380-cdb7-bf23-1372-eb17aa7257c8@chinatelecom.cn>
Date: Sat, 8 Oct 2022 00:58:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] vhost-user: Refactor vhost acked features saving
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 tugy@chinatelecom.cn, baiyw2@chinatelecom.cn, dengpc12@chinatelecom.cn,
 liuym16@chinatelecom.cn, yangchg@chinatelecom.cn, yuanmh12@chinatelecom.cn,
 zhoupx@chinatelecom.cn, lic121@chinatelecom.cn,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
References: <20220926063641.25038-1-huangy81@chinatelecom.cn>
 <20220926063641.25038-2-huangy81@chinatelecom.cn>
 <20221007095800-mutt-send-email-mst@kernel.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <20221007095800-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.699,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/10/7 22:01, Michael S. Tsirkin 写道:
> On Mon, Sep 26, 2022 at 02:36:40PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Abstract vhost acked features saving into
>> vhost_user_save_acked_features, export it as util function.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>> ---
>>   include/net/vhost-user.h |  2 ++
>>   net/vhost-user.c         | 35 +++++++++++++++++++----------------
>>   2 files changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
>> index 5bcd8a6285..00d46613d3 100644
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
>> index b1a0247b59..c512cc9727 100644
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
> 
> Note it does not set  acked_features if features are 0.
> Which might be the case for legacy ...
> I will need to analyze this more to figure out what's
> the correct behaviour....
> 
Thanks Michael for commentting. :)

Indeed, backing up acked_features in the two functions chr_closed_bh() 
vhost_user_stop() are kind of different as above, it also seems a little 
weried for me.

IMHO, we can always keep the acked_features in NetVhostUserState the 
same as acked_features in vhost_dev no matter what features are, since 
this is the role that acked_features in NetVhostUserState plays and we 
can just focus on the validation of acked_features in vhost_dev if 
something goes wrong.

Thanks,
Yong

> Stefano? Raphael?
> 
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
>>       }
>>   
>>       qmp_set_link(name, false, &err);
>> -- 
>> 2.27.0
> 

-- 
Best regard

Hyman Huang(黄勇)

