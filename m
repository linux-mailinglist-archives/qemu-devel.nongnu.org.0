Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB9E6E69B2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:38:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooKh-0001K6-0g; Tue, 18 Apr 2023 12:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1pooKe-0001Jp-4p; Tue, 18 Apr 2023 12:37:28 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1pooKa-0004Su-Ta; Tue, 18 Apr 2023 12:37:27 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:3612:0:640:a8a8:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 549445F985;
 Tue, 18 Apr 2023 19:37:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:83:11:14df:f716:b8ed:439d] (unknown
 [2a02:6b8:83:11:14df:f716:b8ed:439d])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id bafCiI0OmiE0-cxYJvI1o; Tue, 18 Apr 2023 19:37:12 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1681835832; bh=GSOqkT6yyamij50SeyyurD1NVhC0V+HzVQ+uJp4xsxw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=pwADrmUx+vLwEgBceEgZYE30EkThYocmnzI4BsBho/YY/skMYUDzKbWPybMKwR90t
 O7BBUsqccew9Vj/z1hYnQEfQrV5NP2Q/kGhJwxhFVBbGqpldsLAPwqPeb8r8JyIshF
 7owWV+ODQvDjCPUlUW6OB8Vj7K8CETBPbR6euhaA=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Message-ID: <03b8f48d-b4a0-ca8f-064b-5fd937e376cc@yandex-team.com>
Date: Tue, 18 Apr 2023 18:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd guests
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
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
Content-Language: en-US
From: Andrey Ryabinin <arbn@yandex-team.com>
In-Reply-To: <A73B3DE0-41D0-4EDC-B589-2647158AD2D4@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/18/23 07:13, Raphael Norwitz wrote:
> Hey Andrey - apologies for the late reply here.
> 
> It sounds like you are dealing with a buggy guest, rather than a QEMU issue.

No arguing here, the guest is buggy.
However, the issue with QEMU is that virtio-blk tolerate such buggy guest
while vhost-user-blk is not.
We've been using virtio-blk in our cloud for a while and recently started switching to vhost-user-blk
which led us to discover this problem.

>> On Apr 10, 2023, at 11:39 AM, Andrey Ryabinin <arbn@yandex-team.com> wrote:
>>
>>
>>
>> On 4/10/23 10:35, Andrey Ryabinin wrote:
>>> Some guests hang on boot when using the vhost-user-blk-pci device,
>>> but boot normally when using the virtio-blk device. The problem occurs
>>> because the guest advertises VIRTIO_F_VERSION_1 but kicks the virtqueue
>>> before setting VIRTIO_CONFIG_S_DRIVER_OK, causing vdev->start_on_kick to
> 
> Virtio 1.1 Section 3.1.1, says during setup “[t]he driver MUST NOT notify the device before setting DRIVER_OK.”
> 
> Therefore what you are describing is buggy guest behavior. Sounds like the driver should be made to either
> - not advertise VIRTIO_F_VERSION_1
> - not kick before setting VIRTIO_CONFIG_S_DRIVER_OK
> 
> If anything, the virtio-blk virtio_blk_handle_output() function should probably check start_on_kick?
> 

Ideally this should have been done from the start. But if we do it now we'll just break these guests.


