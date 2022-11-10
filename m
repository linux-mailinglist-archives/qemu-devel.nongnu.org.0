Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6B623B79
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:49:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0RH-0007fE-DW; Thu, 10 Nov 2022 00:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot0RF-0007co-HS
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot0RD-0000iQ-1q
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668059357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eyu3qAyscRJ9HLcDUSiYOfGJ3hRRiKbI5lQ/nKzbM6s=;
 b=Dhoiv7j4lFqE8BJrCVecPx974zFI+an1iq/KyRF/LL0jYy/98NzvqHDDlOr4dP+iREy5GC
 VUWQvlcJk5RHRQmBHRPqltx/K28IFvUwdfYuv14u7X1HQqE7vKNKNF58SaWCUpVr7WGqMR
 pHKC33K4sPsmLPMG3r7V1qjdUEZF4iQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-JkaqUcWsMoaYV_ASIUngEg-1; Thu, 10 Nov 2022 00:49:14 -0500
X-MC-Unique: JkaqUcWsMoaYV_ASIUngEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 151101C0879D;
 Thu, 10 Nov 2022 05:49:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3BF340C83D9;
 Thu, 10 Nov 2022 05:49:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5E15021E6921; Thu, 10 Nov 2022 06:49:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,  Konstantin
 Kostiuk <kkostiuk@redhat.com>,  qemu-trivial@nongnu.org,  Michael Roth
 <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
Date: Thu, 10 Nov 2022 06:49:11 +0100
In-Reply-To: <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 9 Nov 2022 22:56:56
 +0100")
Message-ID: <87wn83jr54.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 9/11/22 18:37, Thomas Huth wrote:
>> If configuring with "--disable-system --disable-user --enable-guest-agen=
t"
>> the linking currently fails with:
>>=20
>> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
>> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference=
 to `qmp_command_name'
>> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference=
 to `qmp_command_is_enabled'
>> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference=
 to `qmp_has_success_response'
>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
>> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference=
 to `qmp_for_each_command'
>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
>> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined referenc=
e to `qbase64_decode'
>> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined ref=
erence to `unix_listen'
>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined ref=
erence to `socket_parse'
>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined ref=
erence to `socket_listen'
>> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
>> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined re=
ference to `qbase64_decode'
>>=20
>> Let's make sure that we also compile and link the required files if
>> the system emulators have not been enabled.
>>=20
>> Signed-off-by: Thomas Huth <thuth@redhat.com>

I wonder for how long this has been broken.

Should we add such a configuration to CI?

>> ---
>>   qapi/meson.build  | 2 +-
>>   stubs/meson.build | 2 +-
>>   util/meson.build  | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>
>> diff --git a/util/meson.build b/util/meson.build
>> index 59c1f467bb..b260539bd5 100644
>> --- a/util/meson.build
>> +++ b/util/meson.build
>> @@ -68,7 +68,7 @@ if have_system
>>     util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>>   endif
>>=20=20=20
>> -if have_block
>> +if have_block or have_ga
>>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>>     util_ss.add(files('base64.c'))
>>     util_ss.add(files('buffer.c'))
>
> This can be eventually reduced for 'have_ga':
>
> -- 8< --
> diff --git a/util/meson.build b/util/meson.build
> index 59c1f467bbe..690e8be903e 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -68,28 +68,30 @@
>    util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>  endif
>
> -if have_block
> +if have_block or have_ga
>    util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>    util_ss.add(files('base64.c'))
> +=20
> util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_=
BACKEND'])))
> +  util_ss.add(files('lockcnt.c'))
> +  util_ss.add(files('main-loop.c'))
> +  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c',=20
> 'qemu-coroutine-io.c'))
> +  util_ss.add(files('qemu-coroutine-sleep.c'))
> +  util_ss.add(files('qemu-co-shared-resource.c'))
> +  util_ss.add(files('qemu-co-timeout.c'))
> +  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
> +  util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
> +endif
> +if have_block
>    util_ss.add(files('buffer.c'))
>    util_ss.add(files('bufferiszero.c'))
> -=20
> util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_=
BACKEND'])))
>    util_ss.add(files('hbitmap.c'))
>    util_ss.add(files('hexdump.c'))
>    util_ss.add(files('iova-tree.c'))
> -  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
> -  util_ss.add(files('lockcnt.c'))
> -  util_ss.add(files('main-loop.c'))
>    util_ss.add(files('nvdimm-utils.c'))
> -  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c',=20
> 'qemu-coroutine-io.c'))
>    util_ss.add(when: 'CONFIG_LINUX', if_true: [
>      files('vhost-user-server.c'), vhost_user
>    ])
>    util_ss.add(files('block-helpers.c'))
> -  util_ss.add(files('qemu-coroutine-sleep.c'))
> -  util_ss.add(files('qemu-co-shared-resource.c'))
> -  util_ss.add(files('qemu-co-timeout.c'))
> -  util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
>    util_ss.add(files('readline.c'))
>    util_ss.add(files('throttle.c'))
>    util_ss.add(files('timed-average.c'))

Better!

> ---
>
> Regardless:
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>


