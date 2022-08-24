Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4415A02B1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 22:27:42 +0200 (CEST)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwyT-0004vr-22
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 16:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQwwl-0002FW-EA; Wed, 24 Aug 2022 16:25:55 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQwwh-000658-CF; Wed, 24 Aug 2022 16:25:54 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 6C82A2E11C7;
 Wed, 24 Aug 2022 23:25:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b512::1:2d] (unknown
 [2a02:6b8:b081:b512::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 aAxBOzfF1u-PBOuKCDa; Wed, 24 Aug 2022 23:25:12 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661372712; bh=Un+dKIjJqWxtZjStEE7AVb8sH7NdsugVk6Xc1uNUFNw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=CpVsmIj7vo6/AdGFwAcJ9OMFTU08+bPV6MyUQURaCticv5t9/TA2LjQVK6RF0O6Kq
 fZcATbm9qWZuB7wVlfJFCckUiis6Kr8+ngD8kLppDDr7kttiXiH6Ct4GwZgFQMVyZU
 Cvu7f9oLnd4rpSzwo5KoJ+AgBr0xryldDJmxqHbI=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fd2a2694-8149-d0fe-3cd2-914eb146efd0@yandex-team.ru>
Date: Wed, 24 Aug 2022 23:24:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/5] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-4-d-tatianin@yandex-team.ru> <YwZnLjzWUTjiPY+i@fedora>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <YwZnLjzWUTjiPY+i@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On 8/24/22 9:00 PM, Stefan Hajnoczi wrote:
> On Wed, Aug 24, 2022 at 12:18:35PM +0300, Daniil Tatianin wrote:
>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>> index 9117222456..e89164c358 100644
>> --- a/hw/block/vhost-user-blk.c
>> +++ b/hw/block/vhost-user-blk.c
>> @@ -251,6 +251,8 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
>>   {
>>       VHostUserBlk *s = VHOST_USER_BLK(vdev);
>>   
>> +    features |= s->host_features;
> 
> I think you can eliminate this if you use vdev->host_features in the
> qdev properties instead of adding a separate s->host_features field.
> That will simplify the code.
Indeed, thanks for spotting that. I wonder why every virtio device 
implementation I've looked at has chosen to add their own host_features 
field (net/blk)?

