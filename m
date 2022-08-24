Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049595A0329
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 23:12:43 +0200 (CEST)
Received: from localhost ([::1]:48020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQxg0-000853-Qe
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 17:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQxeq-0006Xk-69; Wed, 24 Aug 2022 17:11:28 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:51564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQxel-00055R-K9; Wed, 24 Aug 2022 17:11:26 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9AE682E1C40;
 Thu, 25 Aug 2022 00:11:12 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b512::1:2d] (unknown
 [2a02:6b8:b081:b512::1:2d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Gb5iV0pkaY-BBO0LSp6; Thu, 25 Aug 2022 00:11:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661375471; bh=GefdRBcLsKIjS/E8p+8LwNUmpVnqWAF3mYycZr94qxc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ItetOUcHkgR0Ba5pbY3NF589slpIZ70/lDD+spCffddYRh1ZGue6gTPiYWAM+wm/d
 swTGqKw3aL50LOVw8vEmtkWhYYLaH3MHLPJ8iEeI7bkDr+2kB5XUd/DdEsu8MeAdND
 QHznfHNfWxGjGZuGUDgyRV7Bj6bUG/bDrDz0HD1o=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e39fda2b-4660-2ecd-31f3-c0aa6d5374d7@yandex-team.ru>
Date: Thu, 25 Aug 2022 00:11:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 2/5] virtio-blk: move config space sizing code to
 virtio-blk-common
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-3-d-tatianin@yandex-team.ru> <YwZqVbnbIthrW5ov@fedora>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <YwZqVbnbIthrW5ov@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/24/22 9:13 PM, Stefan Hajnoczi wrote:
> On Wed, Aug 24, 2022 at 12:18:34PM +0300, Daniil Tatianin wrote:
>> +size_t virtio_blk_common_get_config_size(uint64_t host_features)
>> +{
>> +    size_t config_size = MAX(VIRTIO_BLK_CFG_SIZE,
>> +        virtio_feature_get_config_size(feature_sizes, host_features));
>> +
>> +    assert(config_size <= sizeof(struct virtio_blk_config));
>> +    return config_size;
>> +}
> 
> This logic is common to all VIRTIO devices and I think it can be moved
> to virtio_feature_get_config_size(). Then
> virtio_blk_common_get_config_size() is no longer necessary and the
> generic virtio_feature_get_config_size() can be called directly.
> 
> The only virtio-blk common part would be the
> virtio_feature_get_config_size() parameter struct that describes the
> minimum and maximum config space size, as well as how the feature bits
> affect the size:
> 
>    size = virtio_feature_get_config_size(virtio_blk_config_size_params, host_features)
> 
> where virtio_blk_config_size_params is:
> 
>    const VirtIOConfigSizeParams virtio_blk_config_size_params = {
>        .min_size = offsetof(struct virtio_blk_config, max_discard_sectors),
>        .max_size = sizeof(struct virtio_blk_config),
>        .features = {
>            {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
>             .end = endof(struct virtio_blk_config, discard_sector_alignment)},
>            ...,
>        },
>    };
> 
> Then virtio-blk-common.h just needs to define:
> 
>    extern const VirtIOConfigSizeParams virtio_blk_config_size_params;
> 
> Taking it one step further, maybe VirtioDeviceClass should include a
> const VirtIOConfigSizeParams *config_size_params field so
> vdev->config_size can be computed by common VIRTIO code and the devices
> only need to describe the parameters.

I think that's a great idea! Do you think it should be done 
automatically in 'virtio_init' if this field is not NULL? One problem I 
see with that is that you would have to make all virtio devices use 
'parent_obj.host_features' for feature properties, which is currently 
far from true, but then again this is very much opt-in. Another thing 
you could do is add a separate helper for that, which maybe defeats the 
purpose a little bit?

> 
> Stefan

