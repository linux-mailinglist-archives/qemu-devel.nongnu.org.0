Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8666A7DCB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfMF-0002WF-7c; Thu, 02 Mar 2023 04:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXfM7-0002UF-8W
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:36:08 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXfM3-0000jP-8b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:36:06 -0500
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:57a5:0:640:1f49:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 4F0E0601FD;
 Thu,  2 Mar 2023 12:35:55 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7321::1:10] (unknown
 [2a02:6b8:b081:7321::1:10])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id sZSDcB0OiKo0-dHUkFUXQ; Thu, 02 Mar 2023 12:35:54 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <7458129e-3c23-be27-dcfa-41dca6c731a4@yandex-team.ru>
Date: Thu, 2 Mar 2023 12:35:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 13/18] pci: introduce pci_find_the_only_child()
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, den-plotnikov@yandex-team.ru,
 antonkuchin@yandex-team.ru
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-14-vsementsov@yandex-team.ru>
 <20230301160855-mutt-send-email-mst@kernel.org>
 <ab95ffbd-98c4-70f0-c547-55436118f7a2@yandex-team.ru>
 <20230302033437-mutt-send-email-mst@kernel.org>
 <9ca5a8be-5add-ce57-d613-e09dee08ab6a@yandex-team.ru>
 <20230302035048-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230302035048-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

On 02.03.23 11:53, Michael S. Tsirkin wrote:
> On Thu, Mar 02, 2023 at 11:45:00AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On 02.03.23 11:37, Michael S. Tsirkin wrote:
>>> On Thu, Mar 02, 2023 at 11:28:44AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> On 02.03.23 00:09, Michael S. Tsirkin wrote:
>>>>> On Thu, Feb 16, 2023 at 09:03:51PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> To be used in further patch to identify the device hot-plugged into
>>>>>> pcie-root-port.
>>>>>>
>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>>>>>> Reviewed-by: Anton Kuchin<antonkuchin@yandex-team.ru>
>>>>> Wait a second does this work for multifunction devices correctly?
>>>>>
>>>>
>>>> I thought about that and I'm just lost:)
>>>>
>>>> Could several (multifunction?) devices be plugged into one pcie-root-port device?
>>>
>>> One device per port but one multifunction device is represented as multiple PCIDevice structures.
>>
>> So, it should be OK to send _one_ event for that multifunction device, and the code is shpc_reset() is OK, but reporting "Several child devices found" is bad idea?
> 
> I don't know about your new event, we are discussing it separately.
> yes all functions are removed together normally on real hardware.
> 
>> So, if I change the logic from pci_find_the_only_child() to pci_find_first_child() is it OK?
> 
> Yes though I don't like this name either - need to make it clear that
> multifunction is ok, multiple unrelated devices aren't.

Could we check it somehow that all plugged devices represent the one multifunction device?

> 
> 
>>>
>>>> Same question for SHPC slots. For example, shpc_free_devices_in_slot() looks like we can have several devices in one slot..
>>>> On the other hand, in shpc_reset() we have construction shpc->sec_bus->devices[PCI_DEVFN(SHPC_IDX_TO_PCI(i), 0)] to access the device in slot. The only one device.
>>>>
>>>> -- 
>>>> Best regards,
>>>> Vladimir
>>>
>>> Same thing.
>>>
>>> ... and let's not get started about sriov and ari ...
>>>
>>
>> -- 
>> Best regards,
>> Vladimir
> 

-- 
Best regards,
Vladimir


