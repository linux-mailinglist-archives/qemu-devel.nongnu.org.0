Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE468D73A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:51:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNR1-0007u5-BY; Tue, 07 Feb 2023 07:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPNQu-0007tn-TY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:50:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPNQt-0005OU-27
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675774246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tH8WPS/n3BXgTHw6+LtNpoOgFfaWkrmYxldjCMTc/1w=;
 b=PRZcz0cac9eUHxFGUIxk9shlt8l4sg9R/s8AJp2lOOq8CMyNiVIS7nw473n3Ufxm++c8bL
 /9wFL2x1asD5krQd+pONGlvmSCSB9j3fYd3deuz6MyXBKRil7ilx1Kp9SmjJ9HwWejd9JY
 flt78nm1TaDp+5h5+CAyNreHggSa/vE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-VBLCPaghP8CmKj1nvKPVaA-1; Tue, 07 Feb 2023 07:50:43 -0500
X-MC-Unique: VBLCPaghP8CmKj1nvKPVaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 456111871DA1;
 Tue,  7 Feb 2023 12:50:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DF5B215CDC8;
 Tue,  7 Feb 2023 12:50:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 169CD21E6A1F; Tue,  7 Feb 2023 13:50:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  jiri@resnulli.us,
 jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,  pbonzini@redhat.com,
 zhanghailiang@xfusion.com,  quintela@redhat.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 09/12] replay: Simplify setting replay blockers
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-10-armbru@redhat.com>
 <31d00642-3682-a054-c71f-848e0c4e0daa@linaro.org>
Date: Tue, 07 Feb 2023 13:50:40 +0100
In-Reply-To: <31d00642-3682-a054-c71f-848e0c4e0daa@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 7 Feb 2023 09:38:54
 +0100")
Message-ID: <87k00ttza7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

> On 7/2/23 08:51, Markus Armbruster wrote:
>> replay_add_blocker() takes an Error *.  All callers pass one created
>> like this:
>>=20
>>      error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "some feature");
>>=20
>> Folding this into replay_add_blocker() simplifies the callers, losing
>> a bit of generality we haven't needed in more than six years.
>>=20
>> Since there are no other uses of macro QERR_REPLAY_NOT_SUPPORTED,
>> replace the remaining one by its expansion, and drop the macro.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   include/qapi/qmp/qerror.h |  3 ---
>>   include/sysemu/replay.h   |  2 +-
>>   replay/replay.c           |  6 +++++-
>>   replay/stubs-system.c     |  2 +-
>>   softmmu/rtc.c             |  5 +----
>>   softmmu/vl.c              | 13 +++----------
>>   6 files changed, 11 insertions(+), 20 deletions(-)
>
>
>> diff --git a/replay/replay.c b/replay/replay.c
>> index 9a0dc1cf44..c39156c522 100644
>> --- a/replay/replay.c
>> +++ b/replay/replay.c
>> @@ -376,8 +376,12 @@ void replay_finish(void)
>>       replay_mode =3D REPLAY_MODE_NONE;
>>   }
>>=20=20=20
>> -void replay_add_blocker(Error *reason)
>> +void replay_add_blocker(const char *feature)
>>   {
>> +    Error *reason =3D NULL;
>> +
>> +    error_setg(&reason, "Record/replay feature is not supported for '%s=
'",
>> +               feature);
>
> Either name 'feature' as 'cli_option' and use '-%s' in format,
>
>>       replay_blockers =3D g_slist_prepend(replay_blockers, reason);
>>   }
>>=20=20=20
>> diff --git a/replay/stubs-system.c b/replay/stubs-system.c
>> index 5c262b08f1..50cefdb2d6 100644
>> --- a/replay/stubs-system.c
>> +++ b/replay/stubs-system.c
>> @@ -12,7 +12,7 @@ void replay_input_sync_event(void)
>>       qemu_input_event_sync_impl();
>>   }
>>=20=20=20
>> -void replay_add_blocker(Error *reason)
>> +void replay_add_blocker(const char *feature)
>>   {
>>   }
>>   void replay_audio_in(size_t *recorded, void *samples, size_t *wpos, si=
ze_t size)
>> diff --git a/softmmu/rtc.c b/softmmu/rtc.c
>> index f7114bed7d..4b2bf75dd6 100644
>> --- a/softmmu/rtc.c
>> +++ b/softmmu/rtc.c
>> @@ -152,11 +152,8 @@ void configure_rtc(QemuOpts *opts)
>>           if (!strcmp(value, "utc")) {
>>               rtc_base_type =3D RTC_BASE_UTC;
>>           } else if (!strcmp(value, "localtime")) {
>> -            Error *blocker =3D NULL;
>>               rtc_base_type =3D RTC_BASE_LOCALTIME;
>> -            error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED,
>> -                      "-rtc base=3Dlocaltime");
>> -            replay_add_blocker(blocker);
>> +            replay_add_blocker("-rtc base=3Dlocaltime");
>>           } else {
>>               rtc_base_type =3D RTC_BASE_DATETIME;
>>               configure_rtc_base_datetime(value);
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 9177d95d4e..9d324fc6cd 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -1855,9 +1855,7 @@ static void qemu_apply_machine_options(QDict *qdic=
t)
>>       }
>>=20=20=20
>>       if (current_machine->smp.cpus > 1) {
>> -        Error *blocker =3D NULL;
>> -        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
>> -        replay_add_blocker(blocker);
>> +        replay_add_blocker("smp");
>
> ... or use "-smp" here (yes, pre-existing).
>
>>       }
>>   }

This patch doesn't change error messages.  If we want to improve some,
we should do so in a separate patch.

Let's review the error messages that pass through replay_add_blocker().

0. General format

    qemu-system-x86_64: Record/replay: Record/replay feature is not support=
ed for '%s'

   Pretty bad.  Better:

    qemu-system-x86_64: record/replay is not supported %s

   Still neglects to identify the erroneous bit of configuration like we
   do elsewhere, e.g.

    $ qemu-system-x86_64 -device e100
    qemu-system-x86_64: -device e100: 'e100' is not a valid device model na=
me

   Let's not worry about that now.

1. SMP

    $ qemu-system-x86_64 -icount shift=3Dauto,rr=3Drecord,rrfile=3D/dev/nul=
l -smp 2
    qemu-system-x86_64: Record/replay: Record/replay feature is not support=
ed for 'smp'

   First attempt at improvement:

    qemu-system-x86_64: record/replay is not supported with -smp

   But that's a lie, it works just fine with -smp 1.  So:

    qemu-system-x86_64: record/replay is not supported with multiple CPUs

2. RTC

    $ qemu-system-x86_64 -icount shift=3Dauto,rr=3Drecord,rrfile=3D/dev/nul=
l -rtc base=3Dlocaltime
    qemu-system-x86_64: Record/replay: Record/replay feature is not support=
ed for '-rtc base=3Dlocaltime'

   Obvious improvement:

    qemu-system-x86_64: record/replay is not supported with -rtc base=3Dloc=
altime

   Fine, except for the part where we assume where the configuration
   comes from.  Watch this:

    $ cat rtc.cfg
    [rtc]
        base =3D "localtime"
    $ qemu-system-x86_64 -icount shift=3Dauto,rr=3Drecord,rrfile=3D/dev/nul=
l -readconfig rtc.cfg
    qemu-system-x86_64: Record/replay: Record/replay feature is not support=
ed for '-rtc base=3Dlocaltime'

   To make sense of this, user needs to make the connection from "-rtc
   base=3Dlocaltime" to what he actually wrote in the configuration file.
   Let's not worry about that now, either.

3. Snapshot

    $ qemu-system-x86_64 -icount shift=3Dauto,rr=3Drecord,rrfile=3D/dev/nul=
l -snapshot
    qemu-system-x86_64: Record/replay: Record/replay feature is not support=
ed for '-snapshot'

   Obvious improvement:

    qemu-system-x86_64: record/replay is not supported with -snapshot


