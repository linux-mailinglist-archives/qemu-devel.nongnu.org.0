Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB16986C2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:01:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOte-0004EG-Kj; Wed, 15 Feb 2023 16:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSOtc-0004Dp-5g
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:00:56 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSOtY-00016Z-Tv
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:00:55 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A1F0160421;
 Thu, 16 Feb 2023 00:00:45 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58a::1:31] (unknown
 [2a02:6b8:b081:b58a::1:31])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 i0srkA0QlqM1-ILOf2Bzt; Thu, 16 Feb 2023 00:00:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676494844; bh=fgJvXuAkvWgWj/TNMF5Eub6zvUEMBmrW4A8F2iUPLgI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=B27T3ms9VxJqA/2nYOkI99HHaoe1+9uoOMESVKXWVZ6Asguvk2vj3phP+BxHG5AeB
 uOI+ZQEZVr+PVFBWeP+KOxIH/mSua0pqI0e2nXQE6edc0JdxoMVq+4lPLEVoZtCGj7
 vedE1kcE4HB9gDiw4Qfpg8y/hv+bqM6ig6iuG+tY=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d9306845-6cf8-1c40-35a0-19b2bef90ac8@yandex-team.ru>
Date: Thu, 16 Feb 2023 00:00:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 philmd@linaro.org, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+ts1vBvI+IEH//K@redhat.com> <87fsb8jw7r.fsf@pond.sub.org>
 <Y+uTz2QfWGo2HUZ1@redhat.com> <87wn4kfbz2.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87wn4kfbz2.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 14.02.23 19:28, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Tue, Feb 14, 2023 at 12:57:28PM +0100, Markus Armbruster wrote:
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>
>>>> On Tue, Feb 14, 2023 at 09:54:22AM +0100, Markus Armbruster wrote:
>>>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>>>
>>>>>> On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> The device field is redundant, because QOM path always include device
>>>>>>> ID when this ID exist.
>>>>>>
>>>>>> The flipside to that view is that applications configuring QEMU are
>>>>>> specifying the device ID for -device (CLI) / device_add (QMP) and
>>>>>> not the QOM path. IOW, the device ID is the more interesting field
>>>>>> than QOM path, so feels like the wrong one to be dropping.
>>>>>
>>>>> QOM path is a reliable way to identify a device.  Device ID isn't:
>>>>> devices need not have one.  Therefore, dropping the QOM path would be
>>>>> wrong.
>>>>>
>>>>>> Is there any real benefit to dropping this ?
>>>>>
>>>>> The device ID is a trap for the unwary: relying on it is fine until you
>>>>> run into a scenario where you have to deal with devices lacking IDs.
>>>>
>>>> When a mgmt app is configuring QEMU though, it does it exclusively
>>>> with device ID values. If I add a device "-device foo,id=dev0",
>>>> and then later hot-unplug it "device_del dev0", it is pretty
>>>> reasonable to then expect that the DEVICE_DELETED even will then
>>>> include the ID value the app has been using elsewhere.
>>>
>>> The management application would be well advised to use QOM paths with
>>> device_del, because only that works even for devices created by default
>>> (which have no ID), and devices the user created behind the management
>>> application's back.
>>
>> If an application is using -nodefaults, then the only devices which
>> exist will be those which are hardwired into the machine, and they
>> can't be used with device_del anyway as they're hardwired.
> 
> Your trust in the sanity of our board code is touching ;)
> 
>> So the only reason is to cope with devices created secretly by
>> the users, and that's a hairy enough problem that most apps won't
>> even try to cope with it.
> 
> Fair enough.
> 
>> At least in terms of the device hotplug area, it feels like we're
>> adding an extra hurdle for apps to solve a problem that they don't
>> actually face in practice.
>>
>> QOM paths are needed in some other QMP commands though, where
>> there is definite need to refer to devices that are hardwired,
>> most obviously qom-set/qom-get.
> 
> Also query-cpus-fast, query-hotpluggable-cpus, and possibly more I
> missed.
> 


So, finally, we don't have consensus on deprecating ids?

For me the most strong argument is that if user specify id in device_add, user should get exactly that id in DEVICE_DELETED and other events.

So if deprecate something, we'd better deprecate ids altogether, making users specify full QOM path even in device_add. But that seems quite painful for existing users with no visible benefit.

So, if no objections, I plan to resend with old "optional id & qom_path" designation for devices. We still can do a deprecation in future.

-- 
Best regards,
Vladimir


