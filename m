Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9ED3456F6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:47:35 +0100 (CET)
Received: from localhost ([::1]:51276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYx3-0000Pz-PQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOYwA-0008Lp-P3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOYw6-00025a-2q
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616474791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BOYxao++kVPEAkmsO4AUX+fjffPDt0TN7d83znN2U8=;
 b=A8l5cjAuMvzWkiC6VgdbL4jy0AEW0W5RYh7unMGcqhXS3Ld8zzgUGSvcNQLSMK5lmU3kDp
 OqficeapvsAr1m0HqxE7BNly/s+c2TceC1uE71h396zKhf7Z4C5NjyFaGwbu5++8xyccin
 ZQswlsR63Cp4xgkuJvZlPnh9bM4GkbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-qVVSkLqWOpWcC46YYLCNvQ-1; Tue, 23 Mar 2021 00:46:29 -0400
X-MC-Unique: qVVSkLqWOpWcC46YYLCNvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2315881276;
 Tue, 23 Mar 2021 04:46:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 016181B400;
 Tue, 23 Mar 2021 04:46:25 +0000 (UTC)
To: Lukas Straub <lukasstraub2@web.de>
References: <cover.1616368879.git.lukasstraub2@web.de>
 <950007e82e19e75831b29fac07ab990c213d2352.1616368879.git.lukasstraub2@web.de>
 <1fc6eff2-a8e5-4ae2-96a5-1b30325dff81@redhat.com>
 <20210322083545.2c36b5a0@gecko.fritz.box>
 <52d508d6-284c-6b36-62ed-f25081e63cfd@redhat.com>
 <20210322184800.5ead0f3c@gecko.fritz.box>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/5] tests: Use the normal yank code instead of stubs in
 relevant tests
Message-ID: <5c37e536-14bb-37fc-8dfb-2d776f763c63@redhat.com>
Date: Tue, 23 Mar 2021 05:46:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322184800.5ead0f3c@gecko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2021 18.48, Lukas Straub wrote:
> On Mon, 22 Mar 2021 17:00:23 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 22/03/2021 08.35, Lukas Straub wrote:
>>> On Mon, 22 Mar 2021 06:20:50 +0100
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>    
>>>> On 22/03/2021 00.31, Lukas Straub wrote:
>>>>> Use the normal yank code instead of stubs in relevant tests to
>>>>> increase coverage and to ensure that registering and unregistering
>>>>> of yank instances and functions is done correctly.
>>>>>
>>>>> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>>>>> ---
>>>>>     tests/qtest/meson.build | 6 +++---
>>>>>     tests/unit/meson.build  | 4 ++--
>>>>>     2 files changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>>>>> index 66ee9fbf45..40e1f495f7 100644
>>>>> --- a/tests/qtest/meson.build
>>>>> +++ b/tests/qtest/meson.build
>>>>> @@ -234,9 +234,9 @@ tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
>>>>>     qtests = {
>>>>>       'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
>>>>>       'cdrom-test': files('boot-sector.c'),
>>>>> -  'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
>>>>> +  'dbus-vmstate-test': ['migration-helpers.c', dbus_vmstate1, '../../monitor/yank.c'],
>>>>>       'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
>>>>> -  'migration-test': files('migration-helpers.c'),
>>>>> +  'migration-test': ['migration-helpers.c', io, '../../monitor/yank.c'],
>>>>>       'pxe-test': files('boot-sector.c'),
>>>>>       'qos-test': [chardev, io, qos_test_ss.apply(config_host, strict: false).sources()],
>>>>>       'tpm-crb-swtpm-test': [io, tpmemu_files],
>>>>
>>>> Is this really necessary for the qtests? I can understand the change for the
>>>> unit tests, but the qtests are separate programs where I could not imagine
>>>> that they use the yank functions in any way?
>>>
>>> Yes, it is necessary. While the yank functions are not called in these tests,
>>> it still checks that registering and unregistering of yank instances and
>>> functions is done correctly. I.e. That no yank functions are registered before
>>> the instance, that the yank instance is only unregistered after all functions
>>> where unregistered, that the same instance is not registered twice and that
>>> the yank instance actually exists before it is unregistered.
>>
>> Now you even confused me more. Could you elaborate a little bit? If none of
>> the functions are called by the test, which part of yank.c is excercised
>> here at all? Could you give a more detailed example? The only thing I could
>> imagine is yank_init(), but that does not look like something we need to
>> check in a qtest ?
> 
> Oh, sorry. I meant yank's concept of a yank function here. It works this way:
> The different subsystems first register a yank instance. So in this case
> when starting migration in the test, the migration code first registers a
> yank instance. Then, it registers _yank functions_ with this instance, for
> for example to shutdown a socket.

But these are the qtest, separate stand-alone programs. The migration code 
of QEMU (i.e. the code in the main "migration" folder) is not linked into 
these binaries. Doing something like:

  grep -r yank tests/qtest/migration-test

should give you zero results. Thus it IMHO does not make sense to add the 
yank.c to these tests here.

Having said that, it seems like the qos-test is linking against the chardev 
code and thus might use indirectly the yank code there. So you maybe might 
want to add it to the qos-test instead?

  Thomas


