Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDA695FCE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrzP-0006iL-RS; Tue, 14 Feb 2023 04:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRrzL-0006gl-Bs
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:52:41 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRrzI-0001dH-Cg
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:52:37 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 619585E600;
 Tue, 14 Feb 2023 12:52:28 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 RqfJk10QY8c1-4U3TkFIL; Tue, 14 Feb 2023 12:52:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676368347; bh=YoyuZnqQxR6gUepGcf8j7FcEKsw+Ay0Zv3VTKpqUIZI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=JQIlo/ONdgcLGDRJSrNeD/4Ss8Md0SFhi2F3AhdEnwA9e2Yc3ztO0I/7TgCLnqZnN
 YqtXyqiLsADT2Wf5lv9icmXUz0GOGf7IKIBYEu6HMydoOv1Ac5e/v0fs6Zii9i60co
 IUSp4OORjBnuuJsZFTCPsDaIF7Em9NN9oFmLm2N0=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <cb951705-d81b-70b2-e91a-39132f073f09@yandex-team.ru>
Date: Tue, 14 Feb 2023 12:52:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 15/16] qapi: add HOTPLUG_STATE event
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-16-vsementsov@yandex-team.ru>
 <7fc9712a-136a-d296-4a7b-194195f3b699@linaro.org>
 <877cwkoca5.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <877cwkoca5.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14.02.23 11:56, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 13/2/23 15:01, Vladimir Sementsov-Ogievskiy wrote:
>>> For PCIe and SHPC hotplug it's important to track led indicators,
>>> especially the power led. Add an event that helps.
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---
>>>    qapi/qdev.json                  | 175 ++++++++++++++++++++++++++++++++
>>>    include/hw/hotplug.h            |  12 +++
>>>    include/hw/pci/pci.h            |   3 +
>>>    include/hw/pci/pci_bridge.h     |   2 +
>>>    include/hw/pci/pcie.h           |   2 +
>>>    include/hw/pci/shpc.h           |   2 +
>>>    include/monitor/qdev.h          |   5 +
>>>    hw/core/hotplug.c               |  13 +++
>>>    hw/pci-bridge/pci_bridge_dev.c  |  14 +++
>>>    hw/pci-bridge/pcie_pci_bridge.c |   1 +
>>>    hw/pci/pcie.c                   |  79 ++++++++++++++
>>>    hw/pci/pcie_port.c              |   1 +
>>>    hw/pci/shpc.c                   | 102 ++++++++++++++++++-
>>>    softmmu/qdev-monitor.c          |  39 +++++++
>>>    14 files changed, 445 insertions(+), 5 deletions(-)
>>
>> -ETOOBIG
> 
> Can't see how this could be split sensibly: it's a single query/event
> pair.  If you can, let us know.
> 

I can split necessary handlers in device code to a separate preparation patch.

-- 
Best regards,
Vladimir


