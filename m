Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B745FADAD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 09:46:43 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi9yL-0001R0-Bb
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 03:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oi9jT-0002JJ-8v; Tue, 11 Oct 2022 03:31:19 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:51338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oi9jP-0003E2-JA; Tue, 11 Oct 2022 03:31:18 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 649AE60C21;
 Tue, 11 Oct 2022 10:20:17 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:a424::1:1b] (unknown
 [2a02:6b8:b081:a424::1:1b])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 MAhYHwkhy1-KFP8IcLf; Tue, 11 Oct 2022 10:20:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665472816; bh=OgckGtEDSQgKBbE2wP4L3f59o0m2zAAqgvs7o7T1JLs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Q6xDWIU3/qx95k1S8EzEiAg5BIpHbyA77pXeEFSIVJX1jJR9Mk2hamq+MWYazpnGg
 sN2MIkK5bs4/Njm3a5vBJ1ZAEInPjtEwyu+AfjsjZC0hDzJvrP7lzLZ5Rak+DWx82U
 7dqI3R3Tip46A/fHOQJ8PE6ZCIMZjo1lhHbloCAQ=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5f1c19e6-3bca-fbd4-f332-fafa36638522@yandex-team.ru>
Date: Tue, 11 Oct 2022 10:20:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/5] vhost-user-blk: dynamically resize config space
 based on features
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com
References: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

Ping :)

On 9/6/22 10:31 AM, Daniil Tatianin wrote:
> This patch set attempts to align vhost-user-blk with virtio-blk in
> terms of backward compatibility and flexibility. It also improves
> the virtio core by introducing new common code that can be used by
> a virtio device to calculate its config space size.
> 
> In particular it adds the following things:
> - Common virtio code for deducing the required device config size based
>    on provided host features.
> - Ability to disable modern virtio-blk features like
>    discard/write-zeroes for vhost-user-blk.
> - Dynamic configuration space resizing based on enabled features,
>    by reusing the common code introduced in the earlier commits.
> - Cleans up the VHostUserBlk structure by reusing parent fields.
> 
> Changes since v1 (mostly addresses Stefan's feedback):
> - Introduce VirtIOConfigSizeParams & virtio_get_config_size
> - Remove virtio_blk_set_config_size altogether, make virtio-blk-common.c
>    only hold the virtio-blk config size parameters.
> - Reuse parent fields in vhost-user-blk instead of introducing new ones.
> 
> Changes since v2:
> - Squash the first four commits into one
> - Set .min_size for virtio-net as well
> - Move maintainer/meson user-blk bits to the last commit
> 
> Daniil Tatianin (5):
>    virtio: introduce VirtIOConfigSizeParams & virtio_get_config_size
>    virtio-blk: move config size params to virtio-blk-common
>    vhost-user-blk: make it possible to disable write-zeroes/discard
>    vhost-user-blk: make 'config_wce' part of 'host_features'
>    vhost-user-blk: dynamically resize config space based on features
> 
>   MAINTAINERS                           |  4 +++
>   hw/block/meson.build                  |  4 +--
>   hw/block/vhost-user-blk.c             | 29 +++++++++++---------
>   hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
>   hw/block/virtio-blk.c                 | 28 +++----------------
>   hw/net/virtio-net.c                   |  9 +++++--
>   hw/virtio/virtio.c                    | 10 ++++---
>   include/hw/virtio/vhost-user-blk.h    |  1 -
>   include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
>   include/hw/virtio/virtio.h            | 10 +++++--
>   10 files changed, 105 insertions(+), 49 deletions(-)
>   create mode 100644 hw/block/virtio-blk-common.c
>   create mode 100644 include/hw/virtio/virtio-blk-common.h
> 

