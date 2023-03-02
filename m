Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964F6A7F83
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:03:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfmb-0000W9-4i; Thu, 02 Mar 2023 05:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXfmW-0000R7-VO
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:03:25 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXfmU-0005pS-S3
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:03:24 -0500
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:5708:0:640:5704:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id AAFA85E7EA;
 Thu,  2 Mar 2023 13:03:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7321::1:10] (unknown
 [2a02:6b8:b081:7321::1:10])
 by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id C3TOwD0Oo8c0-dqgY3OH8; Thu, 02 Mar 2023 13:03:12 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net;
 dkim=pass
Message-ID: <6a50292f-df61-a689-47b9-20e0bce95e25@yandex-team.ru>
Date: Thu, 2 Mar 2023 13:03:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 18/18] qapi: introduce DEVICE_ON event
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, den-plotnikov@yandex-team.ru,
 antonkuchin@yandex-team.ru
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-19-vsementsov@yandex-team.ru>
 <20230302034409-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230302034409-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

On 02.03.23 11:44, Michael S. Tsirkin wrote:
> On Thu, Feb 16, 2023 at 09:03:56PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We have DEVICE_DELETED event, that signals that device_del command is
>> actually completed. But we don't have a counter-part for device_add.
>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>> when the device in some intermediate state. Let's add an event that say
>> that the device is finally powered on, power indicator is on and
>> everything is OK for next manipulation on that device.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   qapi/qdev.json | 10 ++++++++++
>>   hw/pci/pcie.c  | 14 ++++++++++++++
>>   hw/pci/shpc.c  | 12 ++++++++++++
>>   3 files changed, 36 insertions(+)
>>
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index 6f2d8d6647..116a8a7de8 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -348,3 +348,13 @@
>>   { 'command': 'query-hotplug',
>>     'data': { 'id': 'str' },
>>     'returns': 'HotplugInfo' }
>> +
>> +##
>> +# @DEVICE_ON:
>> +#
>> +# Emitted whenever the device insertion completion is acknowledged by the guest.
>> +# For now only emitted for SHPC and PCIe-native hotplug.
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }
> 
> Same as any event, this has to be accompanied by a query.
> Which query returns the "ON" status?
> 

Hmm. Seems correct to add "ON" status into "hostplug state", to be returned by query-hotplug. And then, its change should be reported by HOTPLUG_STATE, and separate DEVICE_ON is not needed.

-- 
Best regards,
Vladimir


