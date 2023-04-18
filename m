Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582336E6ACF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 19:21:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pop0C-0007Uv-PT; Tue, 18 Apr 2023 13:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1pop09-0007U1-O1; Tue, 18 Apr 2023 13:20:22 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1pop06-00045y-P6; Tue, 18 Apr 2023 13:20:21 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id C1EF85FDBE;
 Tue, 18 Apr 2023 20:20:05 +0300 (MSK)
Received: from [IPV6:2a02:6b8:83:11:14df:f716:b8ed:439d] (unknown
 [2a02:6b8:83:11:14df:f716:b8ed:439d])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 2Kgp5W05Va60-o9I1Yg2W; Tue, 18 Apr 2023 20:20:04 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1681838404; bh=wz3jdE7XiQuCT48p0rrIuZ1Zx09IBvmm39HwLLMRzLc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Qw3fQxCPEf2bSCn7uMaBKlZNI1aBLMBnlgr2/PvZzeuFIWdDxaKeFyEmicg8MIgvm
 H14S5dIBbkX2Lj5kUHc3xHHQhl6BVyanfr/vva4nqkoWl/yTA9d8428yxq75GNrCgE
 a44AOBHxRDH7tGJHj77uJ3YeL3S6B1g4vOpE45TI=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Message-ID: <017e139d-211f-7917-0461-71ab57eefbbe@yandex-team.com>
Date: Tue, 18 Apr 2023 19:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd guests
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Yongji Xie <xieyongji@baidu.com>, Chai Wen <chaiwen@baidu.com>,
 Ni Xun <nixun@baidu.com>,
 "d-tatianin@yandex-team.com" <d-tatianin@yandex-team.com>,
 "yc-core@yandex-team.com" <yc-core@yandex-team.com>,
 "vsementsov@yandex-team.com" <vsementsov@yandex-team.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>
References: <20230410083509.3311-1-arbn@yandex-team.com>
 <fcc6073f-280b-580e-b6f7-bc176a64e810@yandex-team.com>
 <A73B3DE0-41D0-4EDC-B589-2647158AD2D4@nutanix.com>
 <20230418020505-mutt-send-email-mst@kernel.org>
From: Andrey Ryabinin <arbn@yandex-team.com>
In-Reply-To: <20230418020505-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/18/23 08:17, Michael S. Tsirkin wrote:
> On Tue, Apr 18, 2023 at 05:13:11AM +0000, Raphael Norwitz wrote:
>> Hey Andrey - apologies for the late reply here.
>>
>> It sounds like you are dealing with a buggy guest, rather than a QEMU issue.
>>
>>> On Apr 10, 2023, at 11:39 AM, Andrey Ryabinin <arbn@yandex-team.com> wrote:
>>>
>>>
>>>
>>> On 4/10/23 10:35, Andrey Ryabinin wrote:
>>>> Some guests hang on boot when using the vhost-user-blk-pci device,
>>>> but boot normally when using the virtio-blk device. The problem occurs
>>>> because the guest advertises VIRTIO_F_VERSION_1 but kicks the virtqueue
>>>> before setting VIRTIO_CONFIG_S_DRIVER_OK, causing vdev->start_on_kick to
>>
>> Virtio 1.1 Section 3.1.1, says during setup “[t]he driver MUST NOT notify the device before setting DRIVER_OK.”
>>
>> Therefore what you are describing is buggy guest behavior. Sounds like the driver should be made to either
>> - not advertise VIRTIO_F_VERSION_1
>> - not kick before setting VIRTIO_CONFIG_S_DRIVER_OK
>>
>> If anything, the virtio-blk virtio_blk_handle_output() function should probably check start_on_kick?
> 
> Question is, how easy is this guest to fix.
> 

I wouldn't count on that.

In this case the guest is Foritgate firewall, apparently from this guys https://www.fortinet.com/
It seems that the kernel they use claims itself as 3.2.16 Linux kernel, however it looks like
it's not vanilla kernel, but modified with some backports. I'm guessing that they backported
the patches introducing VIRTIO_F_VERSTION_1, but they didn't add this patch https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a11370e5e6c26566904bb7f08281093a3002ff2

I've tried to look the sources of the kernel they use but failed to find any.
Found only some news about gpl voilation from 2005 )


