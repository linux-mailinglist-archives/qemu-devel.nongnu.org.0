Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30755FAD99
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 09:36:29 +0200 (CEST)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi9oR-0004f8-Cx
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 03:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oi9fB-0007gt-Q2; Tue, 11 Oct 2022 03:26:57 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200]:51662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oi9f4-0002EN-KX; Tue, 11 Oct 2022 03:26:53 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 06A055FF24;
 Tue, 11 Oct 2022 10:21:52 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:a424::1:1b] (unknown
 [2a02:6b8:b081:a424::1:1b])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dAQAA47q3c-LoOODGSt; Tue, 11 Oct 2022 10:21:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665472911; bh=gE8K34QJuLAoxKhbgnXka6uzSnAwil9iVEKrFWpD2cM=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=CQekmCn9057VfeRG63OdqEutEeQRJ2vW/gqGsif89VyIoBvGe5fGZTK1QDncQckAh
 UHWHf1y5dVxEf4x0+67kFJVbComRfofGmCRX48KwvQAPrCtLHKpUstGVuS7W6K0Ds0
 nGXFxuo8fGM4A3bGPgZjBiUHYumQ+psvOgg4xdBY=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d3867613-0031-a816-40ba-b62f2828c2f4@yandex-team.ru>
Date: Tue, 11 Oct 2022 10:21:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/5] vhost-user-blk: dynamically resize config space
 based on features
Content-Language: en-US
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com
References: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
 <5f1c19e6-3bca-fbd4-f332-fafa36638522@yandex-team.ru>
In-Reply-To: <5f1c19e6-3bca-fbd4-f332-fafa36638522@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/11/22 10:20 AM, Daniil Tatianin wrote:
> Ping :)
Oops, didn't see the pull request. Disregard this.

> On 9/6/22 10:31 AM, Daniil Tatianin wrote:
>> This patch set attempts to align vhost-user-blk with virtio-blk in
>> terms of backward compatibility and flexibility. It also improves
>> the virtio core by introducing new common code that can be used by
>> a virtio device to calculate its config space size.
>>
>> In particular it adds the following things:
>> - Common virtio code for deducing the required device config size based
>>    on provided host features.
>> - Ability to disable modern virtio-blk features like
>>    discard/write-zeroes for vhost-user-blk.
>> - Dynamic configuration space resizing based on enabled features,
>>    by reusing the common code introduced in the earlier commits.
>> - Cleans up the VHostUserBlk structure by reusing parent fields.
>>
>> Changes since v1 (mostly addresses Stefan's feedback):
>> - Introduce VirtIOConfigSizeParams & virtio_get_config_size
>> - Remove virtio_blk_set_config_size altogether, make virtio-blk-common.c
>>    only hold the virtio-blk config size parameters.
>> - Reuse parent fields in vhost-user-blk instead of introducing new ones.
>>
>> Changes since v2:
>> - Squash the first four commits into one
>> - Set .min_size for virtio-net as well
>> - Move maintainer/meson user-blk bits to the last commit
>>
>> Daniil Tatianin (5):
>>    virtio: introduce VirtIOConfigSizeParams & virtio_get_config_size
>>    virtio-blk: move config size params to virtio-blk-common
>>    vhost-user-blk: make it possible to disable write-zeroes/discard
>>    vhost-user-blk: make 'config_wce' part of 'host_features'
>>    vhost-user-blk: dynamically resize config space based on features
>>
>>   MAINTAINERS                           |  4 +++
>>   hw/block/meson.build                  |  4 +--
>>   hw/block/vhost-user-blk.c             | 29 +++++++++++---------
>>   hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
>>   hw/block/virtio-blk.c                 | 28 +++----------------
>>   hw/net/virtio-net.c                   |  9 +++++--
>>   hw/virtio/virtio.c                    | 10 ++++---
>>   include/hw/virtio/vhost-user-blk.h    |  1 -
>>   include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
>>   include/hw/virtio/virtio.h            | 10 +++++--
>>   10 files changed, 105 insertions(+), 49 deletions(-)
>>   create mode 100644 hw/block/virtio-blk-common.c
>>   create mode 100644 include/hw/virtio/virtio-blk-common.h
>>

