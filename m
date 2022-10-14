Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A207B5FEE4E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:01:47 +0200 (CEST)
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKJu-0007Yv-3W
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojKFn-0005MC-19
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 08:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojKFj-00014B-80
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 08:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665752245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktujfBeLPcnkvvHAknJbb4a1P2rO27JZ64brtS48qTY=;
 b=Rtq8hbv28JbjSjuDZSpiTvRm9X7Y1NLUFs4BEEglurGh7L1cfT4vOZKPsVCnKknSDDkz9a
 xJXVjEC9keIOuIxygazlqZ9U6hhwg/5W22o1kaFMltv+38DfoJ1UsG/L9QkC1zY8lqlS4P
 nfvbvwP/WOb1hrV7cgomEsUJ+/CK03I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-a1BF0OWJMTKkxH5ARO328g-1; Fri, 14 Oct 2022 08:57:09 -0400
X-MC-Unique: a1BF0OWJMTKkxH5ARO328g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C920A101A52A;
 Fri, 14 Oct 2022 12:57:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD8E40C955A;
 Fri, 14 Oct 2022 12:57:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 072AC21E691D; Fri, 14 Oct 2022 14:57:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Denis Plotnikov <den-plotnikov@yandex-team.ru>,  qemu-devel@nongnu.org,
 yc-core@yandex-team.ru,  michael.roth@amd.com,
 vsementsov@yandex-team.ru,  marcandre.lureau@gmail.com
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
 <87tu47vkdx.fsf@pond.sub.org> <Y0gxfqMXi3gLH/3H@redhat.com>
 <8735bqu4ym.fsf@pond.sub.org> <Y0lIfTS4/5UMItkk@redhat.com>
Date: Fri, 14 Oct 2022 14:57:06 +0200
In-Reply-To: <Y0lIfTS4/5UMItkk@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 14 Oct 2022 12:31:09 +0100")
Message-ID: <87zgdypnq5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

> On Fri, Oct 14, 2022 at 11:31:13AM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Oct 13, 2022 at 05:00:26PM +0200, Markus Armbruster wrote:
>> >> Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:
>> >>=20
>> >> > Add "start" & "end" time values to qmp command responses.
>> >>=20
>> >> Please spell it QMP.  More of the same below.
>> >>=20
>> >> >
>> >> > These time values are added to let the qemu management layer get th=
e exact
>> >> > command execution time without any other time variance which might =
be brought by
>> >> > other parts of management layer or qemu internals. This is particul=
ary useful
>> >> > for the management layer logging for later problems resolving.
>> >>=20
>> >> I'm still having difficulties seeing the value add over existing
>> >> tracepoints and logging.
>> >>=20
>> >> Can you tell me about a problem you cracked (or could have cracked) w=
ith
>> >> the help of this?
>> >
>> > Consider your QMP client is logging all commands and replies in its
>> > own logfile (libvirt can do this). Having this start/end timestamps
>> > included means the QMP client log is self contained.
>>=20
>> A QMP client can include client-side timestamps in its log.  What value
>> is being added by server-side timestamps?  According to the commit
>> message, it's for getting "the exact command execution time without any
>> other time variance which might be brought by other parts of management
>> layer or qemu internals."  Why is that useful?  In particular, why is
>> excluding network and QEMU queueing delays (inbound and outbound)
>> useful?
>
> Lets, say some commands normally runs in ~100ms, but occasionally
> runs in 2secs, and you want to understand why.
>
> A first step is understanding whether a given command itself is
> slow at executing, or whether its execution has merely been
> delayed because some other aspect of QEMU has delayed its execution.
> If the server timestamps show it was very fast, then that indicates
> delayed processing. Thus instead of debugging the slow command, I
> can think about what scenarios would be responsible for the delay.
> Perhaps a previous QMP command was very slow, or maybe there is
> simply a large volume of QMP commands backlogged, or some part of
> QEMU got blocked.
>
> Another case would be a command that is normally fast, and sometimes
> is slower, but still relatively fast. The network and queueing side
> might be a significant enough proportion of the total time to obscure
> the slowdown. If you can eliminate the non-execution time, you can
> see the performance trends over time to spot the subtle slowdowns
> and detect abnormal behaviour before it becomes too terrible.

This is troubleshooting.  Asking for better troubleshooting tools is
fair.

However, the proposed timestamps provide much more limited insight than
existing tracepoints.  For instance, enabling

    monitor_qmp_*
    handle_qmp_command

results in something like

    2656634@1665750359.529763:handle_qmp_command mon 0x55f93a4375d0 req: {"=
execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
    2656634@1665750359.529789:monitor_qmp_in_band_enqueue 0x7fbaa8003870 mo=
n 0x55f93a4375d0 len 0
    2656629@1665750359.529997:monitor_qmp_in_band_dequeue 0x7fbaa8003870 le=
n 0
    2656629@1665750359.530081:monitor_qmp_cmd_in_band=20
    2656629@1665750359.530166:monitor_qmp_respond mon 0x55f93a4375d0 resp: =
{"return": {}}

This gives me timestamps for

    complete JSON value read from socket and parsed
    value enqueued in-band (with mutex held)
    value dequeued in-band (with mutex held)
    in-band command dispatched
    reply enqueued

The last two are pretty close to the timestamps added by the patch.

The patch's timestamps together with client-side timestamps can tell me
whether the command is delayed somewhere between the client's timestamp
(presumably close to socket send) and QEMU's dispatch.  It could be the
network, QEMU's networking code, QEMU's JSON parser, QEMU's queuing, or
QEMU's coroutine scheduling.

To narrow down the delay to something useful, I still need to resort to
tracepoints.

The value added by having timestamps in QMP is "always on".  But is that
really worthwhile?  What would you *do* with timestamps fished out of
logs?

My gut feeling is that client-side timestamps suffice to signal "there
is a problem", but the additional server-side QMP timestamps are
unlikely to be enough to figure out the problem, so you enable
tracepoints and wait for the problem to return.

That's why I'm asking for concrete experience supporting "yes, it
is worthwhile".


