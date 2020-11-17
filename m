Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA52B6FCF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 21:14:03 +0100 (CET)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf7MY-0006Mt-KD
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 15:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kf7Lj-0005kD-KZ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 15:13:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kf7Lf-0003P2-5J
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 15:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605643985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t21AfTFro+rR1EC0Vyt9TsauYIigU/PJOL6B/ZsFzuM=;
 b=BYds74hQVDltqCnnJ4jlQn+HGcGrcihXDDFRwGbPrwNIWPthC4QSlu1FIEgCfrGoouwguh
 ntmap8rT6DeBafDY2nkg6r9zbU76WMJ59euCpUCLNS+QdfQo8R2LHNUc8xxoJPLG+ZbkQM
 mPCz20IEd7ou6ZU4uxjNxbk97DkqN0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-ybeCATrRPdWaYc6dp88Zog-1; Tue, 17 Nov 2020 15:12:55 -0500
X-MC-Unique: ybeCATrRPdWaYc6dp88Zog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B0080046B;
 Tue, 17 Nov 2020 20:12:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13F5F1759F;
 Tue, 17 Nov 2020 20:12:50 +0000 (UTC)
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: Markus Armbruster <armbru@redhat.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b5c76a27-551f-5b79-a47b-0d4a283a2d37@redhat.com>
Date: Tue, 17 Nov 2020 21:12:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <877dqldyoh.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/2020 18.00, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 16/11/2020 14.25, Philippe Mathieu-Daudé wrote:
>>> Hi Gan,
>>>
>>> On 11/15/20 7:49 PM, Gan Qixin wrote:
>>>> Some peripherals of bcm2835 cprman have no category, put them into the 'misc'
>>>> category.
>>>>
>>>> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
>>>> ---
>>>> Cc: Philippe Mathieu-DaudÃƒÂ© <f4bug@amsat.org>
>>>> ---
>>>>  hw/misc/bcm2835_cprman.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
>>>> index 7e415a017c..c62958a99e 100644
>>>> --- a/hw/misc/bcm2835_cprman.c
>>>> +++ b/hw/misc/bcm2835_cprman.c
>>>> @@ -136,6 +136,7 @@ static void pll_class_init(ObjectClass *klass, void *data)
>>>>  
>>>>      dc->reset = pll_reset;
>>>>      dc->vmsd = &pll_vmstate;
>>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>>
>>> Well, this is not an usable device but a part of a bigger device,
>>> so here we want the opposite: not list this device in any category.
>>>
>>> Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
>>> types so management apps can filter them out? (And so we are sure
>>> all QOM is classified).
>>>
>>> Thomas, you already dealt with categorizing devices in the past,
>>> what do you think about this? Who else could help? Maybe add
>>> someone from libvirt in the thread?
>>
>> My 0.02 € : Mark the device as user_creatable = false if it can not really
>> be used by the user with the -device CLI parameter. Then it also does not
>> need a category. I know Markus will likely have a different opinion, but in
> 
> You're hurting my feelings!  ;-P
> 
>> my eyes it's just ugly if we present devices to the users that they can not use.
> 
> If we believe a device should only ever be used from C, then we should
> keep it away from the UI.
> 
> However, I'm wary of overloading user_creatable.  Even though it has
> shifted shape a number of times (cannot_instantiate_with_device_add_yet,
> no_user, and now user_creatable), its purpose has always been focused:
> distinguishing devices that can be instantiated by generic code from the
> ones that need device-specific code.  See user_creatable's comment in
> qdev-core.h.
> 
> I don't want to lose that distinction.  That's all.

Well, currently we have the user_creatable flag and the hotpluggable flag. I
guess that's simply not enough.

I think in the long run, we should maybe replace the two flags with a
"creatable" type instead that could take the following values:

 CREATABLE_AS_SUBDEVICE  /* Device is part of another device and
                            can only by added by code */
 CREATABLE_BY_QOM        /* Some fancy new QOM function can be
                            used to e.g. create this as part of
                            a machine */
 CREATABLE_BY_COLDPLUG   /* For cold-plugging via -device */
 CREATABLE_BY_HOTPLUG    /* For hot-plugging via device_add */

... but that's likely something for the distant future...

>> (By the way, this device here seems to be a decendant of TYPE_SYS_BUS_DEVICE
>> ... shouldn't these show up as user_creatable = false automatically?)
> 
> Yes, unless it is a dynamic sysbus device (which I consider a flawed
> concept).
> 
> But TYPE_CPRMAN_PLL is *not* a descendant of TYPE_SYS_BUS_DEVICE, it's a
> bus-less device:

Oops, I obviously looked at the wrong device in that file
(TYPE_BCM2835_CPRMAN instead of TYPE_CPRMAN_PLL) - thanks for the clarification!

 Thomas


