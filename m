Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA97667808D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 16:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJz7a-0000G9-Sq; Mon, 23 Jan 2023 10:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pJz7Y-0000E2-JB
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:52:32 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pJz7V-0006SQ-VW
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:52:32 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 9B8C75EADE;
 Mon, 23 Jan 2023 18:52:21 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b48c::1:22] (unknown
 [2a02:6b8:b081:b48c::1:22])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HqPE3N0XCeA1-y2LejSqb; Mon, 23 Jan 2023 18:52:20 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674489140; bh=g1jyNYpEiYsIM9NNsDP5Y/b851M9ESaSlBx3lpVyL6I=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=EwuSmOAkG5O1xgDg5rHop2elFH8BAB3W0zCXfeCWkA3+O8HES6q0JZOcYar+YPvpj
 FrcNJVoebEZ8PzZSHeBzp/0m/82zXNCxaniSc/CLYYEL43nP4wGCGHTJo+HEgMK2oV
 3H1jA1YK4m7IlG85cN48LFXehEIOeyjdqpEzfs0E=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <21b87a0d-99b1-2755-00de-d1201d85a63e@yandex-team.ru>
Date: Mon, 23 Jan 2023 17:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Content-Language: en-US, ru-RU
To: Stefan Hajnoczi <stefanha@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 yc-core@yandex-team.ru
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
 <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
 <20230122093903-mutt-send-email-mst@kernel.org>
 <70c0f00a-7828-3ccf-c2ea-49aeef8693e9@yandex-team.ru>
 <20230122111618-mutt-send-email-mst@kernel.org>
 <CAJSP0QXnKGrX3WuSJxe7pLctcueW1AkEc_KUsHGucaDq=VJZkg@mail.gmail.com>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <CAJSP0QXnKGrX3WuSJxe7pLctcueW1AkEc_KUsHGucaDq=VJZkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 23/01/2023 16:09, Stefan Hajnoczi wrote:
> On Sun, 22 Jan 2023 at 11:18, Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Sun, Jan 22, 2023 at 06:09:40PM +0200, Anton Kuchin wrote:
>>> On 22/01/2023 16:46, Michael S. Tsirkin wrote:
>>>> On Sun, Jan 22, 2023 at 02:36:04PM +0200, Anton Kuchin wrote:
>>>>>>> This flag should be set when qemu don't need to worry about any
>>>>>>> external state stored in vhost-user daemons during migration:
>>>>>>> don't fail migration, just pack generic virtio device states to
>>>>>>> migration stream and orchestrator guarantees that the rest of the
>>>>>>> state will be present at the destination to restore full context and
>>>>>>> continue running.
>>>>>> Sorry  I still do not get it.  So fundamentally, why do we need this property?
>>>>>> vhost-user-fs is not created by default that we'd then need opt-in to
>>>>>> the special "migrateable" case.
>>>>>> That's why I said it might make some sense as a device property as qemu
>>>>>> tracks whether device is unplugged for us.
>>>>>>
>>>>>> But as written, if you are going to teach the orchestrator about
>>>>>> vhost-user-fs and its special needs, just teach it when to migrate and
>>>>>> where not to migrate.
>>>>>>
>>>>>> Either we describe the special situation to qemu and let qemu
>>>>>> make an intelligent decision whether to allow migration,
>>>>>> or we trust the orchestrator. And if it's the latter, then 'migrate'
>>>>>> already says orchestrator decided to migrate.
>>>>> The problem I'm trying to solve is that most of vhost-user devices
>>>>> now block migration in qemu. And this makes sense since qemu can't
>>>>> extract and transfer backend daemon state. But this prevents us from
>>>>> updating qemu executable via local migration. So this flag is
>>>>> intended more as a safety check that says "I know what I'm doing".
>>>>>
>>>>> I agree that it is not really necessary if we trust the orchestrator
>>>>> to request migration only when the migration can be performed in a
>>>>> safe way. But changing the current behavior of vhost-user-fs from
>>>>> "always blocks migration" to "migrates partial state whenever
>>>>> orchestrator requests it" seems a little  dangerous and can be
>>>>> misinterpreted as full support for migration in all cases.
>>>> It's not really different from block is it? orchestrator has to arrange
>>>> for backend migration. I think we just assumed there's no use-case where
>>>> this is practical for vhost-user-fs so we blocked it.
>>>> But in any case it's orchestrator's responsibility.
>>> Yes, you are right. So do you think we should just drop the blocker
>>> without adding a new flag?
>> I'd be inclined to. I am curious what do dgilbert and stefanha think though.
> If the migration blocker is removed, what happens when a user attempts
> to migrate with a management tool and/or vhost-user-fs server
> implementation that don't support migration?

There will be no matching fuse-session in destination endpoint so all
requests to this fs will fail until it is remounted from guest to
send new FUSE_INIT message that does session setup.

>
> Anton: Can you explain how stateless migration will work on the
> vhost-user-fs back-end side? Is it reusing vhost-user reconnect
> functionality or introducing a new mode for stateless migration? I
> guess the vhost-user-fs back-end implementation is required to
> implement VHOST_F_LOG_ALL so dirty memory can be tracked and drain all
> in-flight requests when vrings are stopped?

It reuses existing vhost-user reconnect code to resubmit inflight
requests.
Sure, backend needs to support this feature - presence of required
features is checked by generic vhost and vhost-user code during init
and if something is missing migration blocker is assigned to the
device (not a static one in vmstate that I remove in this patch, but
other per-device kind of blocker).

>
> Stefan

