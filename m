Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A03DA37C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:55:45 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95Zg-0005aO-Fv
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m95Y1-00028f-IW
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:54:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m95Xz-0003YL-B9
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCU/qnNsf5wxAfcrF90xqanGQVINKuKu6181iLYlyfY=;
 b=CpE70Ti5aD1XIZVO8UvycWIv7PB6avodOAtLnWoDEweC9/JRucwurqFyg7r4GPl4+Pjt2y
 2PxGltjW5LiFAKWo40MrGXc7ENypa8n8jVvuWhZf5UZDVg6MTRzvFstrzk5cTInHnApr7n
 SgUbymJytlnx4b21uKkD6Da/CadugDw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-M4VvUUMqNrG29UZJd8jjQg-1; Thu, 29 Jul 2021 08:53:57 -0400
X-MC-Unique: M4VvUUMqNrG29UZJd8jjQg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s16-20020adfdb100000b0290140a25efc6dso2217908wri.5
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aCU/qnNsf5wxAfcrF90xqanGQVINKuKu6181iLYlyfY=;
 b=qAtgZkob++xyXoNKFZ88eFzuqB/xmQKe3A4+OHSpPZ3O9Lmf1mm/lZHLqaDk5HyJKj
 cTmGOPirR3qTXuzT/z9yt2xxtqIefVHMHiMEtv+sthyUQPlt0/ODJiONSXHV7m4DRBWT
 Y9Q80DEbjEA72D5aR8yTlXZKL+SdAxQTYydz82ZFEiVqGiuiGTI/SEftcmxIU6x8Iq7d
 RRUUVzdW81D72yWIVAuJVUy7+Oei2nRT1/Rz9lMT5JggGC5paNm/oon5z48LshIBynlg
 kXn1TZbSYGiRyyOACig0pRx/svFG1lbrDGzMH2ha3YwZBIuM7NVDWUhetXkCFPYw9FS9
 MiPQ==
X-Gm-Message-State: AOAM5327y4/HJoYtc22ZfMW7k2XcV7yAvSeszfg2vFl7Gh7R1mLYa44k
 aSf/1q9fwx1PzcpVw7sXcMB8qR5nTu6gW0QE8cq8YoPjXv4olmkRk3UxMXlLR6EULV8v10mS40s
 Dh8pWSw+MMQMZjXc=
X-Received: by 2002:adf:a287:: with SMTP id s7mr4666206wra.120.1627563235315; 
 Thu, 29 Jul 2021 05:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2cFjh+Nh/+YTtFNrvYqxIt3bYFO/yxRpFxhyrRv9+JPFJE2ASyl+GaLb7pxb/7tasIL1blQ==
X-Received: by 2002:adf:a287:: with SMTP id s7mr4666173wra.120.1627563235019; 
 Thu, 29 Jul 2021 05:53:55 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id l41sm3512226wmp.23.2021.07.29.05.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 05:53:54 -0700 (PDT)
Subject: Re: [PING][PING][PATCH v2] vhost: make SET_VRING_ADDR, SET_FEATURES
 send replies
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210719142138.24543-1-den-plotnikov@yandex-team.ru>
 <8f3959d9-2dd8-3fc0-f350-b4ea98a10f38@yandex-team.ru>
 <f809aa3e-dc2f-4a2f-92d1-e5dc8782c1e5@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <245ed980-92aa-c0c1-e795-70d50b0eb67e@redhat.com>
Date: Thu, 29 Jul 2021 14:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f809aa3e-dc2f-4a2f-92d1-e5dc8782c1e5@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, yc-core@yandex-team.ru, mst@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc more ppl.

On 7/29/21 12:56 PM, Denis Plotnikov wrote:
> 
> On 23.07.2021 12:59, Denis Plotnikov wrote:
>>
>> ping!
>>
>> On 19.07.2021 17:21, Denis Plotnikov wrote:
>>> On vhost-user-blk migration, qemu normally sends a number of commands
>>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
>>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
>>> VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
>>> data logging.
>>> The issue is that qemu doesn't wait for reply from the vhost daemon
>>> for these commands which may result in races between qemu expectation
>>> of logging starting and actual login starting in vhost daemon.
>>>
>>> The race can appear as follows: on migration setup, qemu enables dirty page
>>> logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
>>> vhost-user-blk daemon immediately and the daemon needs some time to turn the
>>> logging on internally. If qemu doesn't wait for reply, after sending the
>>> command, qemu may start migrate memory pages to a destination. At this time,
>>> the logging may not be actually turned on in the daemon but some guest pages,
>>> which the daemon is about to write to, may have already been transferred
>>> without logging to the destination. Since the logging wasn't turned on,
>>> those pages won't be transferred again as dirty. So we may end up with
>>> corrupted data on the destination.
>>> The same scenario is applicable for "used ring" data logging, which is
>>> turned on with VHOST_USER_SET_VRING_ADDR command.
>>>
>>> To resolve this issue, this patch makes qemu wait for the commands result
>>> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and
>>> logging is enabled.
>>>
>>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
>>> ---
>>> v1 -> v2:
>>>   * send reply only when logging is enabled [mst]
>>>
>>> v0 -> v1:
>>>   * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
>>>   
>>>  hw/virtio/vhost-user.c | 37 ++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 34 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>> index ee57abe04526..133588b3961e 100644
>>> --- a/hw/virtio/vhost-user.c
>>> +++ b/hw/virtio/vhost-user.c
>>> @@ -1095,6 +1095,11 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
>>>      return 0;
>>>  }
>>>  
>>> +static bool log_enabled(uint64_t features)
>>> +{
>>> +    return !!(features & (0x1ULL << VHOST_F_LOG_ALL));
>>> +}
>>> +
>>>  static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>>>                                       struct vhost_vring_addr *addr)
>>>  {
>>> @@ -1105,10 +1110,21 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>>>          .hdr.size = sizeof(msg.payload.addr),
>>>      };
>>>  
>>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>>> +
>>> +    if (reply_supported && log_enabled(msg.hdr.flags)) {
>>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>>> +    }
>>> +
>>>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>>          return -1;
>>>      }
>>>  
>>> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
>>> +        return process_message_reply(dev, &msg);
>>> +    }
>>> +
>>>      return 0;
>>>  }
>>>  
>>> @@ -1288,7 +1304,8 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
>>>      return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
>>>  }
>>>  
>>> -static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>>> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
>>> +                              bool need_reply)
>>>  {
>>>      VhostUserMsg msg = {
>>>          .hdr.request = request,
>>> @@ -1297,23 +1314,37 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>>>          .hdr.size = sizeof(msg.payload.u64),
>>>      };
>>>  
>>> +    if (need_reply) {
>>> +        bool reply_supported = virtio_has_feature(dev->protocol_features,
>>> +                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
>>> +        if (reply_supported) {
>>> +            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>>> +        }
>>> +    }
>>> +
>>>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>>          return -1;
>>>      }
>>>  
>>> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
>>> +        return process_message_reply(dev, &msg);
>>> +    }
>>> +
>>>      return 0;
>>>  }
>>>  
>>>  static int vhost_user_set_features(struct vhost_dev *dev,
>>>                                     uint64_t features)
>>>  {
>>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
>>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
>>> +                              log_enabled(features));
>>>  }
>>>  
>>>  static int vhost_user_set_protocol_features(struct vhost_dev *dev,
>>>                                              uint64_t features)
>>>  {
>>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
>>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
>>> +                              false);
>>>  }
>>>  
>>>  static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)


