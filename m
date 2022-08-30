Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B265A5BED
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 08:37:01 +0200 (CEST)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSurn-0007Kp-AV
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 02:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSuni-0005bj-6w
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSunb-0002SG-2w
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661841146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vktQvHGDHtZFubbxxi8ReUelTgeuJGsqUJ4jU4Lxhxs=;
 b=EQD66HLBnf81yzu9pcEgVDd2wH+CnZOCQuht47l31r1HulrOR7zsgHmZqoWOVjXAjdTDZb
 p4Caj6eqoROZcDbX9rVz+Mi9yKyDSVa0og9cZTYdnMXGOM41rcX44O0Ycx2l4D6RdqEgGv
 MhxhDkYGWNhVM+elsr039ZD5TynaxRo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-evfkiUQAMdKrx6vfAdYNwg-1; Tue, 30 Aug 2022 02:32:24 -0400
X-MC-Unique: evfkiUQAMdKrx6vfAdYNwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E578D803301;
 Tue, 30 Aug 2022 06:32:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 853999458A;
 Tue, 30 Aug 2022 06:32:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 522C921E6900; Tue, 30 Aug 2022 08:32:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,  pbonzini@redhat.com,
 qemu-devel@nongnu.org,  david@redhat.com,  cohuck@redhat.com,
 thuth@redhat.com,  borntraeger@de.ibm.com,  frankja@linux.ibm.com,
 fiuczy@linux.ibm.com,  pasic@linux.ibm.com,  alex.bennee@linaro.org,
 armbru@redhat.com
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
 <YvT1wC0vi2juO5n3@redhat.com>
Date: Tue, 30 Aug 2022 08:32:22 +0200
In-Reply-To: <YvT1wC0vi2juO5n3@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 11 Aug 2022 13:27:44 +0100")
Message-ID: <87h71ukzrd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please excuse my late reply; I was on vacation.

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Aug 09, 2022 at 08:40:24AM +0200, Claudio Imbrenda wrote:
>> This patch adds support for asynchronously tearing down a VM on Linux.
>>=20
>> When qemu terminates, either naturally or because of a fatal signal,
>> the VM is torn down. If the VM is huge, it can take a considerable
>> amount of time for it to be cleaned up. In case of a protected VM, it
>> might take even longer than a non-protected VM (this is the case on
>> s390x, for example).
>>=20
>> Some users might want to shut down a VM and restart it immediately,
>> without having to wait. This is especially true if management
>> infrastructure like libvirt is used.
>>=20
>> This patch implements a simple trick on Linux to allow qemu to return
>> immediately, with the teardown of the VM being performed
>> asynchronously.
>>=20
>> If the new commandline option -async-teardown is used, a new process is
>> spawned from qemu at startup, using the clone syscall, in such way that
>> it will share its address space with qemu.
>>=20
>> The new process will have the name "cleanup/<QEMU_PID>". It will wait
>> until qemu terminates, and then it will exit itself.
>>=20
>> This allows qemu to terminate quickly, without having to wait for the
>> whole address space to be torn down. The teardown process will exit
>> after qemu, so it will be the last user of the address space, and
>> therefore it will take care of the actual teardown.
>>=20
>> The teardown process will share the same cgroups as qemu, so both
>> memory usage and cpu time will be accounted properly.
>>=20
>> This feature can already be used with libvirt by adding the following
>> to the XML domain definition to pass the parameter to qemu directly:
>>=20
>>   <commandline xmlns=3D"http://libvirt.org/schemas/domain/qemu/1.0">
>>   <arg value=3D'-async-teardown'/>
>>   </commandline>
>>=20
>> More advanced interfaces like pidfd or close_range have intentionally
>> been avoided in order to be more compatible with older kernels.
>>=20
>> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

[...]

>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 3f23a42fa8..d434353159 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4743,6 +4743,23 @@ HXCOMM Internal use
>>  DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
>>  DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>>=20=20
>> +#ifdef __linux__
>> +DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
>> +    "-async-teardown enable asynchronous teardown\n",
>> +    QEMU_ARCH_ALL)
>> +#endif
>> +SRST
>> +``-async-teardown``
>> +    Enable asynchronous teardown. A new teardown process will be
>> +    created at startup, using clone. The teardown process will share
>> +    the address space of the main qemu process, and wait for the main
>> +    process to terminate. At that point, the teardown process will
>> +    also exit. This allows qemu to terminate quickly if the guest was
>> +    huge, leaving the teardown of the address space to the teardown
>> +    process. Since the teardown process shares the same cgroups as the
>> +    main qemu process, accounting is performed correctly.
>> +ERST
>> +
>>  DEF("msg", HAS_ARG, QEMU_OPTION_msg,
>>      "-msg [timestamp[=3Don|off]][,guest-name=3D[on|off]]\n"
>>      "                control error message format\n"
>
> It occurrs to me that we've got a general goal of getting away from
> adding new top level command line arguments. Most of the time there's
> an obvious existing place to put them, but I'm really not sure
> where this particular  option would fit ?
>
> it isn't tied to any aspect of the VM backend configuration nor
> hardware frontends.
>
> The closest match is the lifecycle action option (-no-shutdown)
> which were merged into a -action arg, but even that's a bit of a
> stretch.

If I understand the proposed new option correctly, it modifies how QEMU
terminates, independent of why it terminates.  Could be guest reboot
with -action reboot-shutdown, monitor command quit, SIGTERM, ...

I agree putting it under -action would be a bit of a stretch, as so far
-action is entirely about configuring the reaction to guest certain
actions:

    -action reboot=3Dreset|shutdown
                       action when guest reboots [default=3Dreset]
    -action shutdown=3Dpoweroff|pause
                       action when guest shuts down [default=3Dpoweroff]
    -action panic=3Dpause|shutdown|exit-failure|none
                       action when guest panics [default=3Dshutdown]
    -action watchdog=3Dreset|shutdown|poweroff|inject-nmi|pause|debug|none
                       action when watchdog fires [default=3Dreset]

A different stretch: -daemonize, -runas, -chroot.  These modify how QEMU
starts.  They too are "top-level".

> Markus/Paolo:  do you have suggestions ?

Ramblings^WThoughts, not actionable suggestions, I'm afraid.

[...]


