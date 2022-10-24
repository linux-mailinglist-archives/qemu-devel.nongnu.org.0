Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4660A74C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:49:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omwZm-0006y0-Ct; Mon, 24 Oct 2022 08:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omwZf-0006x6-5v
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omwZd-0007vB-3g
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666614534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N1BFPJjmHz2Pg9VkcsyWL7M72jhBy9Tlg68zfF5Y9Ek=;
 b=ZPzgxkz4jwzAFDZN7b/k5FZAGGS7iDwJdF9NChg3OH02Fiaazm1u9ZYS0V9JfMofhddTAv
 vxj1XqZSurpHdIRQxXJ+SWAm5tQ50o0G9S4e2XSHPjFcc+0b0FwyNQ8xe7zh9Dj9mWFQLe
 07tAWZgo2VtVC/TnDdgbHlE3j9Mr4Lw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-lUv6wrGpNPGjrneNr42RIg-1; Mon, 24 Oct 2022 08:28:51 -0400
X-MC-Unique: lUv6wrGpNPGjrneNr42RIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6452800186;
 Mon, 24 Oct 2022 12:28:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 220A640C6E16;
 Mon, 24 Oct 2022 12:28:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E169121E6936; Mon, 24 Oct 2022 14:28:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  pbonzini@redhat.com,
 qemu-devel@nongnu.org,  richard.henderson@linaro.org
Subject: Re: [PATCH v3 1/8] reset: allow registering handlers that aren't
 called by snapshot loading
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-2-Jason@zx2c4.com>
 <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
Date: Mon, 24 Oct 2022 14:28:48 +0200
In-Reply-To: <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
 (Peter Maydell's message of "Mon, 24 Oct 2022 12:06:18 +0100")
Message-ID: <87sfjdqubj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> (Cc'ing Markus for a QMP related question.)
>
> On Fri, 14 Oct 2022 at 03:17, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Snapshot loading only expects to call deterministic handlers, not
>> non-deterministic ones. So introduce a way of registering handlers that
>> won't be called when reseting for snapshots.
>>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 48e85c052c..a0cdb714f7 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -3058,7 +3058,7 @@ bool load_snapshot(const char *name, const char *vmstate,
>>          goto err_drain;
>>      }
>>
>> -    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
>> +    qemu_system_reset(SHUTDOWN_CAUSE_SNAPSHOT_LOAD);
>>      mis->from_src_file = f;
>>
>>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
>> diff --git a/qapi/run-state.json b/qapi/run-state.json
>> index 9273ea6516..74ed0ac93c 100644
>> --- a/qapi/run-state.json
>> +++ b/qapi/run-state.json
>> @@ -86,12 +86,14 @@
>>  #                   ignores --no-reboot. This is useful for sanitizing
>>  #                   hypercalls on s390 that are used during kexec/kdump/boot
>>  #
>> +# @snapshot-load: A snapshot is being loaded by the record & replay subsystem.
>> +#
>>  ##
>>  { 'enum': 'ShutdownCause',
>>    # Beware, shutdown_caused_by_guest() depends on enumeration order
>>    'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
>>              'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
>> -            'guest-panic', 'subsystem-reset'] }
>> +            'guest-panic', 'subsystem-reset', 'snapshot-load'] }
>
> Markus: do we need to mark new enum values with some kind of "since n.n"
> version info ?

We do!  Commonly like

    # @snapshot-load: A snapshot is being loaded by the record & replay
    #                 subsystem (since 7.2)

>>  ##
>>  # @StatusInfo:
>> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>> index 1e68680b9d..03e1ee3a8a 100644
>> --- a/softmmu/runstate.c
>> +++ b/softmmu/runstate.c
>> @@ -441,9 +441,9 @@ void qemu_system_reset(ShutdownCause reason)
>>      cpu_synchronize_all_states();
>>
>>      if (mc && mc->reset) {
>> -        mc->reset(current_machine);
>> +        mc->reset(current_machine, reason);
>>      } else {
>> -        qemu_devices_reset();
>> +        qemu_devices_reset(reason);
>>      }
>>      if (reason && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
>>          qapi_event_send_reset(shutdown_caused_by_guest(reason), reason);
>
> This change means that resets on snapshot-load, which previously
> did not result in sending a QMP event, will now start to do so
> with this new ShutdownCause type. I don't think we want that
> change in behaviour.
>
> (Also, as per the 'Beware' comment in run-state.json, we will
> claim this to be a 'caused by guest' reset, which doesn't seem
> right. If we suppress the sending the event that is moot, though.)
>
> Markus: if we add a new value to the ShutdownCause enumeration,
> how annoying is it if we decide we don't want it later? I guess
> we can just leave it in the enum unused... (In this case we're
> using it for purely internal purposes and it won't ever actually
> wind up in any QMP events.)

Deleting enumeration values is a compatibility issue only if the value
is usable in QMP input.

"Purely internal" means it cannot occur in QMP output, and any attempt
to use it in input fails.  Aside: feels a bit fragile.

Having an enumeration type where some values are like this is mildly
ugly, because introspection still shows the value.

If we care about fragile or mildly ugly, we can mark such values with a
special feature flag, and have the QAPI generator keep them internal
(input, output, introspection).

Does this answer your question?


