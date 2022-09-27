Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F290F5EBA60
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:10:04 +0200 (CEST)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od3n9-0000u7-H7
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od3hf-0006On-4S
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od3hb-00069D-HZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664258658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwoXHxJZNgHrNTvjab6l3nOrXAoXnnpLQBNySLKYWTg=;
 b=ReopjtxVdlyBAb+UMrBz/CKORAXA6mBLqMpCLTWEw2JKIYiYmJ98N5xtYWNyjuvvOZJBww
 SushcDq+ye2biAbylBqCsMTrZkn/wKqkS4pY7HHmTIpg43FyyeodFglfLjfch0o6zhGC6/
 hxWX9vkkQ1FfMcj11DfbI8MP5cYOgMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-RrlaBxgsOAaVcYhxrZvTOg-1; Tue, 27 Sep 2022 02:04:14 -0400
X-MC-Unique: RrlaBxgsOAaVcYhxrZvTOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAF3D8027F5;
 Tue, 27 Sep 2022 06:04:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C6B17583;
 Tue, 27 Sep 2022 06:04:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF3AC21E691D; Tue, 27 Sep 2022 08:04:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Denis Plotnikov <den-plotnikov@yandex-team.ru>,  qemu-devel@nongnu.org,
 yc-core@yandex-team.ru,  michael.roth@amd.com
Subject: Re: [patch v0] qapi/qmp: Add timestamps to qmp command responses.
References: <20220926095940.283094-1-den-plotnikov@yandex-team.ru>
 <YzGmoWQPhR27VWX7@redhat.com>
Date: Tue, 27 Sep 2022 08:04:11 +0200
In-Reply-To: <YzGmoWQPhR27VWX7@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 26 Sep 2022 14:18:25 +0100")
Message-ID: <871qrxnyjo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Sep 26, 2022 at 12:59:40PM +0300, Denis Plotnikov wrote:
>> Add "start" & "end" timestamps to qmp command responses.
>> It's disabled by default, but can be enabled with 'timestamp=3Don'
>> monitor's parameter, e.g.:
>>     -chardev  socket,id=3Dmon1,path=3D/tmp/qmp.socket,server=3Don,wait=
=3Doff
>>     -mon chardev=3Dmon1,mode=3Dcontrol,timestamp=3Don
>
> I'm not convinced a cmdline flag is the right approach here.
>
> I think it ought be something defined by the QMP spec.

The QMP spec is docs/interop/qmp-spec.txt.  The feature needs to be
defined there regardless of how we control it.

> The "QMP" greeting should report "timestamp" capabilities.
>
> The 'qmp_capabilities' command can be used to turn on this
> capability for all commands henceforth.

Yes, this is how optional QMP protocol features should be controlled.

Bonus: control is per connection, not just globally.

> As an option extra, the 'execute' command could gain a
> parameter to allow this to be requested for only an
> individual command.

Needs a use case.

> Alternatively we could say the overhead of adding the timestmaps
> is small enough that we just add this unconditionally for
> everything hence, with no opt-in/opt-out.

Yes, because the extension is backwards compatible.

Aside: qmp-spec.txt could be clearer on what that means.

>> Example of result:
>>=20
>>     ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
>>=20
>>     (QEMU) query-status
>>     {"end": {"seconds": 1650367305, "microseconds": 831032},
>>      "start": {"seconds": 1650367305, "microseconds": 831012},
>>      "return": {"status": "running", "singlestep": false, "running": tru=
e}}
>>=20
>> The responce of the qmp command contains the start & end time of
>> the qmp command processing.

Seconds and microseconds since when?  The update to qmp-spec.txt should
tell.

Why split the time into seconds and microseconds?  If you use
microseconds since the Unix epoch (1970-01-01 UTC), 64 bit unsigned will
result in a year 586524 problem:

    $ date --date "@`echo '2^64/1000000' | bc`"
    Wed Jan 19 09:01:49 CET 586524

Even a mere 53 bits will last until 2255.

>> These times may be helpful for the management layer in understanding of
>> the actual timeline of a qmp command processing.
>
> Can you explain the problem scenario in more detail.

Yes, please, because:

> The mgmt app already knows when it send the QMP command and knows
> when it gets the QMP reply.  This covers the time the QMP was
> queued before processing (might be large if QMP is blocked on
> another slow command) , the processing time, and the time any
> reply was queued before sending (ought to be small).
>
> So IIUC, the value these fields add is that they let the mgmt
> app extract only the command processing time, eliminating
> any variance do to queue before/after.
>
>> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>


