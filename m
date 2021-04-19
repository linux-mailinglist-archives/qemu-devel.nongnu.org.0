Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEEE364761
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:47:27 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYW7S-0005RP-1k
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYW5o-0004qD-0c
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYW5k-0007yl-2f
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618847139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYhFrufnGcxntRt6JOjNrex1wURkHbnRF21AC3VnYik=;
 b=M38N/kRhDVFt0NwnY+nYgl289XTeE1j3e4omGb89OdX0MBme+m6KmJpaHmBL6InkatzzB7
 2RhlH7b9l+eBnLEO4AQY0En9ZRFVRRfagnQq+aHluN4XJnsAEJtvAp4D0RqpoMksy0Mcsd
 FEXn01RavRGiPJnDrWNlSyXUhPh0o08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326--tHuSRFvO8GaHVOTJlCQZA-1; Mon, 19 Apr 2021 11:45:37 -0400
X-MC-Unique: -tHuSRFvO8GaHVOTJlCQZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3D868030BB;
 Mon, 19 Apr 2021 15:45:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABE8160843;
 Mon, 19 Apr 2021 15:45:31 +0000 (UTC)
Subject: Re: [PATCH 1/2] qdev: Separate implementations of qdev_get_machine()
 for user and system
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
 <25ab34ad-0950-65f0-6cb2-d3f7a4a86744@redhat.com>
 <20210415153056.04f981a8@bahia.lan>
 <d21045c1-3df2-1569-3bf9-8a7ea27866f4@redhat.com>
 <20210415185639.12300368@bahia.lan>
 <1a68b426-47da-9fba-a34a-d024ac9ed148@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bccca420-77d6-c3c6-fd7a-aaa97dd8399c@redhat.com>
Date: Mon, 19 Apr 2021 17:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1a68b426-47da-9fba-a34a-d024ac9ed148@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/04/2021 21.07, Philippe Mathieu-Daudé wrote:
> On 4/15/21 6:56 PM, Greg Kurz wrote:
>> On Thu, 15 Apr 2021 18:45:45 +0200
>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>>> On 4/15/21 3:30 PM, Greg Kurz wrote:
>>>> On Thu, 15 Apr 2021 14:39:55 +0200
>>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>>> On 4/9/21 6:03 PM, Greg Kurz wrote:
>>>>>> Despite its simple name and common usage of "getting a pointer to
>>>>>> the machine" in system-mode emulation, qdev_get_machine() has some
>>>>>> subtilities.
>>>>>>
>>>>>> First, it can be called when running user-mode emulation : this is
>>>>>> because user-mode partly relies on qdev to instantiate its CPU
>>>>>> model.
>>>>>>
>>>>>> Second, but not least, it has a side-effect : if it cannot find an
>>>>>> object at "/machine" in the QOM tree, it creates a dummy "container"
>>>>>> object and put it there. A simple check on the type returned by
>>>>>> qdev_get_machine() allows user-mode to run the common qdev code,
>>>>>> skipping the parts that only make sense for system-mode.
>>>>>>
>>>>>> This side-effect turns out to complicate the use of qdev_get_machine()
>>>>>> for the system-mode case though. Most notably, qdev_get_machine() must
>>>>>> not be called before the machine object is added to the QOM tree by
>>>>>> qemu_create_machine(), otherwise the existing dummy "container" object
>>>>>> would cause qemu_create_machine() to fail with something like :
>>>>>>
>>>>>> Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
>>>>>> qemu-system-ppc64: attempt to add duplicate property 'machine' to
>>>>>>   object (type 'container')
>>>>>> Aborted (core dumped)
>>>>>>
>>>>>> This situation doesn't exist in the current code base, mostly because
>>>>>> of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
>>>>>> and e2fb3fbbf9c for details).
>>>>>>
>>>>>> A new kind of breakage was spotted very recently though :
>>>>>>
>>>>>> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
>>>>>> /home/thuth/devel/qemu/include/hw/boards.h:24:
>>>>>>   MACHINE: Object 0x5635bd53af10 is not an instance of type machine
>>>>>> Aborted (core dumped)
>>>>>>
>>>>>> This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
>>>>>> added a new condition for qdev_get_machine() to be called too early,
>>>>>> breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
>>>>>> time.
>>>>>>
>>>>>> In order to avoid further subtle breakages like this, change the
>>>>>> implentation of qdev_get_machine() to:
>>>>>> - keep the existing behaviour of creating the dummy "container"
>>>>>>    object for the user-mode case only ;
>>>>>> - abort() if the machine doesn't exist yet in the QOM tree for
>>>>>>    the system-mode case. This gives a precise hint to developpers
>>>>>>    that calling qdev_get_machine() too early is a programming bug.
>>>>>>
>>>>>> This is achieved with a new do_qdev_get_machine() function called
>>>>>> from qdev_get_machine(), with different implementations for system
>>>>>> and user mode.
>>>>>>
>>>>>> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
>>>>>> qemu-system-ppc64: ../../hw/core/machine.c:1290:
>>>>>>   qdev_get_machine: Assertion `machine != NULL' failed.
>>>>>> Aborted (core dumped)
>>>>>>
>>>>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>>>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>>>>> ---
>>>>>>   hw/core/machine.c        | 14 ++++++++++++++
>>>>>>   hw/core/qdev.c           |  2 +-
>>>>>>   include/hw/qdev-core.h   |  1 +
>>>>>>   stubs/meson.build        |  1 +
>>>>>>   stubs/qdev-get-machine.c | 11 +++++++++++
>>>>>>   5 files changed, 28 insertions(+), 1 deletion(-)
>>>>>>   create mode 100644 stubs/qdev-get-machine.c
>>>>> ...
>>>>>
>>>>>> diff --git a/stubs/meson.build b/stubs/meson.build
>>>>>> index be6f6d609e58..b99ee2b33e94 100644
>>>>>> --- a/stubs/meson.build
>>>>>> +++ b/stubs/meson.build
>>>>>> @@ -54,3 +54,4 @@ if have_system
>>>>>>   else
>>>>>>     stub_ss.add(files('qdev.c'))
>>>>>>   endif
>>>>>> +stub_ss.add(files('qdev-get-machine.c'))
>>>>>
>>>>> Adding this as a stub looks suspicious...
>>>>> Why not add it in to user_ss in hw/core/meson.build?
>>>>> Maybe name the new file hw/core/qdev-user.c?
>>>>>
>>>>
>>>> It turns out that this isn't specific to user-mode but rather
>>>> to any non-qemu-system-FOO binary built with qdev, e.g.
>>>> test-qdev-global-props :
>>>>
>>>> #0  do_qdev_get_machine () at ../../stubs/qdev-get-machine.c:10
>>>> #1  0x0000000100017938 in qdev_get_machine () at ../../hw/core/qdev.c:1134
>>>> #2  0x000000010001855c in device_set_realized (obj=0x100128b60, value=<optimized out>, errp=0x7fffffffd4e0) at ../../hw/core/qdev.c:745
>>>> #3  0x000000010001cc5c in property_set_bool (obj=0x100128b60, v=<optimized out>, name=<optimized out>, opaque=0x1000f33f0, errp=0x7fffffffd4e0) at ../../qom/object.c:2257
>>>> #4  0x0000000100020a9c in object_property_set (obj=0x100128b60, name=0x100093f78 "realized", v=0x100136d30, errp=0x1000e3af8 <error_fatal>) at ../../qom/object.c:1402
>>>> #5  0x000000010001c38c in object_property_set_qobject (obj=0x100128b60, name=0x100093f78 "realized", value=<optimized out>, errp=0x1000e3af8 <error_fatal>) at ../../qom/qom-qobject.c:28
>>>> #6  0x0000000100020e20 in object_property_set_bool (obj=0x100128b60, name=0x100093f78 "realized", value=<optimized out>, errp=0x1000e3af8 <error_fatal>) at ../../qom/object.c:1472
>>>> #7  0x000000010001612c in qdev_realize (dev=0x100128b60, bus=<optimized out>, errp=0x1000e3af8 <error_fatal>) at ../../hw/core/qdev.c:389
>>>> #8  0x000000010000fb10 in test_static_prop_subprocess () at /home/greg/Work/qemu/qemu-master/include/hw/qdev-core.h:17
>>>> #9  0x00007ffff7e95654 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>> #10 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>> #11 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>> #12 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>> #13 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>>> #14 0x00007ffff7e959cc in g_test_run_suite () from /lib64/libglib-2.0.so.0
>>>> #15 0x00007ffff7e95a80 in g_test_run () from /lib64/libglib-2.0.so.0
>>>> #16 0x000000010000ecec in main (argc=<optimized out>, argv=<optimized out>) at ../../tests/unit/test-qdev-global-props.c:316
>>>>
>>>> Is there a meson thingy to handle this dependency ?
>>>
>>>    if not have_system
>>>      common_ss.add(files('qdev-machine-stubs.c'))
>>>    endif
>>>
>>> This is not pretty, but better than a generic stubs/qdev-get-machine.c
>>> IMO...
>>>
>>
>> Yeah it isn't that much different,
> 
> I'd expect symbols in stubs/ to be declared weak, while not with this
> approach, so we'd catch clash for incorrect configs. Maybe I'm wrong...

See https://gitlab.com/qemu-project/qemu/-/commit/3bc2f570ec9fc93 for the 
reason why symbols in stubs are *not* declared as weak anymore.

  Thomas


