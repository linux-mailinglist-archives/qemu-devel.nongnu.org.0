Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08443C13D8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:07:15 +0200 (CEST)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TkI-0001oC-RJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m1TgJ-0002rF-3W
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:03:08 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:39488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m1TgC-0007Mq-1S
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:03:04 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id E6EAB2E1AFA;
 Thu,  8 Jul 2021 16:02:53 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 uELtJp9eQc-2rxqroUw; Thu, 08 Jul 2021 16:02:53 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1625749373; bh=yD+2cJDD55kl4nwxOcoxnmBAhOtHQ2f7PW6hkRLvFME=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=aU4epeEM+SDy8BPnN0/+mGXE6p7Mh24Hl8pfn+TKKyTQkKDA1JTLP1cFh4syHE2r/
 /eN3NPtS+kZ3q0xxpTpU+hQwaNCfcjxVQ6oxviDeEl2c58KFp0wGGNKfZF8xh+Natd
 G1IOS0ucqDqhDLkUt7KBDuFTPSETm5BBKV2hDJuE=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:12::1:3a])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 p0lAaOXVpS-2r2OTacq; Thu, 08 Jul 2021 16:02:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v1] vhost: make SET_VRING_ADDR, SET_FEATURES send replies
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210708082840.12428-1-den-plotnikov@yandex-team.ru>
 <20210708080209-mutt-send-email-mst@kernel.org>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <fb1319a9-b677-1cb9-0cb5-c26484524089@yandex-team.ru>
Date: Thu, 8 Jul 2021 16:02:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708080209-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 08.07.2021 15:04, Michael S. Tsirkin wrote:
> On Thu, Jul 08, 2021 at 11:28:40AM +0300, Denis Plotnikov wrote:
>> On vhost-user-blk migration, qemu normally sends a number of commands
>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
>> VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
>> data logging.
>> The issue is that qemu doesn't wait for reply from the vhost daemon
>> for these commands which may result in races between qemu expectation
>> of logging starting and actual login starting in vhost daemon.
>>
>> The race can appear as follows: on migration setup, qemu enables dirty page
>> logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
>> vhost-user-blk daemon immediately and the daemon needs some time to turn the
>> logging on internally. If qemu doesn't wait for reply, after sending the
>> command, qemu may start migrate memory pages to a destination. At this time,
>> the logging may not be actually turned on in the daemon but some guest pages,
>> which the daemon is about to write to, may have already been transferred
>> without logging to the destination. Since the logging wasn't turned on,
>> those pages won't be transferred again as dirty. So we may end up with
>> corrupted data on the destination.
>> The same scenario is applicable for "used ring" data logging, which is
>> turned on with VHOST_USER_SET_VRING_ADDR command.
>>
>> To resolve this issue, this patch makes qemu wait for the commands result
>> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
>>
>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
>> ---
>>   hw/virtio/vhost-user.c | 31 ++++++++++++++++++++++++++++---
>>   1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index ee57abe04526..15b5fac67cf3 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>>           .hdr.size = sizeof(msg.payload.addr),
>>       };
>>   
>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +    if (reply_supported) {
>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +    }
>> +
>>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   
>> +    if (reply_supported) {
>> +        return process_message_reply(dev, &msg);
>> +    }
>> +
>>       return 0;
>>   }
>>   
> Same - can we limit this to when logging is being enabled?

I think it's possible but do we really need some additional complexity?

Do you bother about delays on device initialization?  Would the reply 
for the command introduce significant device initialization time delay? 
In my understanding, this is done rarely on vhost-user device 
initialization. So, may be we can afford it to be a little bit longer?

According to the migration case, in my understanding, major time the 
migration of vhost-user should be done with logging enabled. Otherwise 
it's hard to tell how to make sure that the memory migrates with 
consistent data. So here we shouldn't care too much about setup speed 
and should care more about data consistency. What do you think?

Thanks!

Denis

>
>> @@ -1288,7 +1298,8 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
>>       return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
>>   }
>>   
>> -static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
>> +                              bool need_reply)
>>   {
>>       VhostUserMsg msg = {
>>           .hdr.request = request,
>> @@ -1297,23 +1308,37 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>>           .hdr.size = sizeof(msg.payload.u64),
>>       };
>>   
>> +    if (need_reply) {
>> +        bool reply_supported = virtio_has_feature(dev->protocol_features,
>> +                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +        if (reply_supported) {
>> +            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +        }
>> +    }
>> +
>>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   
>> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
>> +        return process_message_reply(dev, &msg);
>> +    }
>> +
>>       return 0;
>>   }
>>   
>>   static int vhost_user_set_features(struct vhost_dev *dev,
>>                                      uint64_t features)
>>   {
>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
>> +                              true);
>>   }
>>   
> Same here. In fact,
>
>>   static int vhost_user_set_protocol_features(struct vhost_dev *dev,
>>                                               uint64_t features)
>>   {
>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
>> +                              false);
>>   }
>>   
>>   static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
>> -- 
>> 2.25.1

