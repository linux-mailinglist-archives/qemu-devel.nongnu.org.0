Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6838696002
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:57:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRs3N-0001a9-3B; Tue, 14 Feb 2023 04:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRs3K-0001YP-Qp
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:56:46 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRs3I-0002LN-Sf
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:56:46 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id EDF8E610A2;
 Tue, 14 Feb 2023 12:56:37 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 aufMm10Qb0U1-jyyt3Txy; Tue, 14 Feb 2023 12:56:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676368597; bh=IaAWryfAwZI8LrWzvk1J6obFS+duq+lIT3MWwNnnieo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=o+6bkvQhM4wm1va/GRVmo4ja7XtZzWk2LuKYdBXUxyncZez/thgs0DJnJON9yXdw6
 q3ElL2nX1aUn+zvE3HXbmBgK5V9b6s46BrN5ET4/aS/xJq7yn1KTCAsNVZTwAmRnso
 m5GtD/+XCFM3TmDyyJfD2JNGt3BVgEuvSD2qCegg=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <81bd097f-1e6d-bd44-f23f-358aacde0717@yandex-team.ru>
Date: Tue, 14 Feb 2023 12:56:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 16/16] qapi: introduce DEVICE_ON event
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-17-vsementsov@yandex-team.ru>
 <2bd9ad31-39c8-f85b-ae5a-80de8d9ec448@linaro.org>
 <873578oc7t.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <873578oc7t.fsf@pond.sub.org>
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

On 14.02.23 11:58, Markus Armbruster wrote:
> Philippe Mathieu-Daudé<philmd@linaro.org>  writes:
> 
>> On 13/2/23 15:01, Vladimir Sementsov-Ogievskiy wrote:
>>> We have DEVICE_DELETED event, that signals that device_del command is
>>> actually completed. But we don't have a counter-part for device_add.
>>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>>> when the device in some intermediate state. Let's add an event that say
>>> that the device is finally powered on, power indicator is on and
>>> everything is OK for next manipulation on that device.
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>>> ---
>>>    qapi/qdev.json | 13 +++++++++++++
>>>    hw/pci/pcie.c  | 13 +++++++++++++
>>>    hw/pci/shpc.c  | 12 ++++++++++++
>>>    3 files changed, 38 insertions(+)
>>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>>> index b6ad311dd4..2143bb2792 100644
>>> --- a/qapi/qdev.json
>>> +++ b/qapi/qdev.json
>>> @@ -341,3 +341,16 @@
>>>    { 'command': 'query-hotplug',
>>>      'data': { 'id': 'str' },
>>>      'returns': 'HotplugInfo' }
>>> +
>>> +##
>>> +# @DEVICE_ON:
>>> +#
>>> +# Emitted whenever the device insertion completion is acknowledged by the guest.
>>> +# For now only emitted for SHPC and PCIe-native hotplug.
>>> +#
>>> +# @path: the hotplugged device's QOM path
>>> +#
>>> +# Since: 8.0
>>> +##
>>> +{ 'event': 'DEVICE_ON',
>>> +  'data': { 'path': 'str' } }
>> Could 'qom-path' or 'canonical-path' be more meaningful here?
> @qom-path would be clearer, no doubt.  But @path is consistent with the
> closely related DEVICE_DELETED event.
> 

If we agree to depreacte "device", we probably can deprecate "path" too, and add duplicating "qom-path" to other events. So, we'll have a consistent and clear API.

-- 
Best regards,
Vladimir


