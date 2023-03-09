Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF996B2FF4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 22:56:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paOEU-0007Yu-MG; Thu, 09 Mar 2023 16:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1paOES-0007Yk-UK
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:55:28 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1paOEQ-0003Lr-EM
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:55:28 -0500
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:5da4:0:640:ef2d:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 5298960F04;
 Fri, 10 Mar 2023 00:55:18 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4b7::1:3b] (unknown
 [2a02:6b8:b081:b4b7::1:3b])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id Etl7090Oo4Y0-r9ipACnE; Fri, 10 Mar 2023 00:55:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1678398917; bh=VTUjxT/wozogaakl0VtdcTLX5mD0+9CUvWPhlp1P/8Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=A2dMqnRG7BxillNAbI8Ma7Tsqq/h1NkR8kmy2ZCZ4cXcTnAuhLhqG9dTC5P7/dP4B
 c8pZMoRBrsOxI3bP4VdH2UoG9gcMXY+RBr3mo72d4tVIC2Ef7Tx8Br3/uo3WZtwvcm
 flaOEaliOOfo+w74EW2tXIeIc5vHJaJEmqHrQNAA=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <bb0f7eb0-1fde-56c6-8cf1-02fd3bb4edb1@yandex-team.ru>
Date: Fri, 10 Mar 2023 00:55:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 2/4] qapi: add DEVICE_ON and query-hotplug
 infrastructure
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, den-plotnikov@yandex-team.ru,
 antonkuchin@yandex-team.ru, philmd@linaro.org
References: <20230307160537.2261803-1-vsementsov@yandex-team.ru>
 <20230307160537.2261803-3-vsementsov@yandex-team.ru>
 <20230307122821-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230307122821-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 07.03.23 20:31, Michael S. Tsirkin wrote:
> On Tue, Mar 07, 2023 at 07:05:35PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We have DEVICE_DELETED event, that signals that device_del command is
>> actually completed. But we don't have a counter-part for device_add.
>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>> when the device in some intermediate state. Let's add an event that say
>> that the device is finally powered on, power indicator is on and
>> everything is OK for next manipulation on that device.
>>
>> Motivations:
>> 1. To be sure that device is "accepted" by guest. Guest may ignore
>> hotplugged device for some reason (for example during OS booting).
>> Management wants to catch this and handle the problem, instead of
>> silent assume that everything is OK. So, if we don't get the event by
>> some timeout, we can report an error, try to unplug/plug the disk again
>> or do some other things to handle the problem.
>>
>> 2. The device can't be removed (by blockdev-del) while power indicator
>> of hotplug controller is blinking (QEMU reports "guest is busy (power
>> indicator blinking)"). So, management should avoid removing the device
>> until it gets the DEVICE_ON event.
>> (Probably, better solution for this point is to automatically postpone
>> deletion until power indicator stops blinking)
>>
>> 3. Also, management tool may make a GUI visualization of power
>> indicator with help of this event.
>>
>> As a counter-part add query-hotplug command, that shows "device-on"
>> state as well as some addtional information.

I wanted to say s/as/and/ :)

>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>  From commit log it sounds you are just adding one new event.
> In fact there's more new stuff in qdev.json
> 
> Pls document in commit log too.
> 
> 

But yes "some additional information" is not enough. Maybe, something like:

"""
New query-hotplug command in additon to "device-on" state also provides
SHPC/PCIe-native specific hotplug controller properties (like leds) that
may help to determine real state of hotplug controller. That may help to
get additional information for further debugging when DEVICE_ON / DEVICE_DELETED
not come in time as expected.
"""



-- 
Best regards,
Vladimir


