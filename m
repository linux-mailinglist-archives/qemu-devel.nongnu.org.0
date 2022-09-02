Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E85ABAD1
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 00:27:01 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUF7r-0004Pd-R4
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 18:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oUF6A-0002o9-6P; Fri, 02 Sep 2022 18:25:14 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oUF66-0005GK-1B; Fri, 02 Sep 2022 18:25:12 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 96F582E20D4;
 Sat,  3 Sep 2022 01:24:57 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b51c::1:28] (unknown
 [2a02:6b8:b081:b51c::1:28])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WSpkKEjO0z-OuPKqeFL; Sat, 03 Sep 2022 01:24:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662157496; bh=Rb9K8uj2ztP02crImrTgkVA9uyLN/Shz8h4/pquKTTk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=A9pMvPRg+ocsCu3SrSB0eutEYHIwJsDE3bsH+GCf2CMhi/QKeblNCHNDBekrlHa0C
 42iDwy7P/I6VcwOSYqh+3qzkw75h5fuwm8oCEKHsxzphi5gNPZd6kVO4vThVfk8h0h
 bla3EkaKgpXNl8ZrZA6QoXU04hSYbdraEP7FcHpw=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <385805ac-7ae0-1569-877a-1d3bb1133bc4@yandex-team.ru>
Date: Sat, 3 Sep 2022 01:24:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/8] virtio-net: utilize VirtIOConfigSizeParams &
 virtio_get_config_size
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-4-d-tatianin@yandex-team.ru>
 <20220902175432.GC5363@raphael-debian-dev>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <20220902175432.GC5363@raphael-debian-dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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



On 9/2/22 8:54 PM, Raphael Norwitz wrote:
> On Fri, Aug 26, 2022 at 05:32:43PM +0300, Daniil Tatianin wrote:
>> Use the new common helper. As an added bonus this also makes use of
>> config size sanity checking via the 'max_size' field.
>>
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
>> ---
>>   hw/net/virtio-net.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index dd0d056fde..dfc8dd8562 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -106,6 +106,11 @@ static const VirtIOFeature feature_sizes[] = {
>>       {}
>>   };
>>   
>> +static const VirtIOConfigSizeParams cfg_size_params = {
> 
> Can we have a zero length virtio-net config size? The both the v1.0 and
> v1.1 section 5.1.4 say “The mac address field always exists (though is
> only valid if VIRTIO_NET_F_MAC is set)” so we should probably set
> min_size to offset_of status?

It currently hardcodes VIRTIO_NET_F_MAC as always on, but I guess it
doesn't hurt to be more explicit about it. Will add that in the next
version.
(resending because forgot to reply-all last time)
> Otherwise LGTM.
> 
>> +    .max_size = sizeof(struct virtio_net_config),
>> +    .feature_sizes = feature_sizes
>> +};
>> +
>>   static VirtIONetQueue *virtio_net_get_subqueue(NetClientState *nc)
>>   {
>>       VirtIONet *n = qemu_get_nic_opaque(nc);
>> @@ -3246,8 +3251,7 @@ static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
>>   {
>>       virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
>>   
>> -    n->config_size = virtio_feature_get_config_size(feature_sizes,
>> -                                                    host_features);
>> +    n->config_size = virtio_get_config_size(&cfg_size_params, host_features);
>>   }
>>   
>>   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
>> -- 
>> 2.25.1

