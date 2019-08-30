Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDAFA3963
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 16:40:20 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3i4Y-0000qV-Pk
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 10:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i3hlz-0005wX-Qh
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 10:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i3hlu-0000BC-NI
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 10:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37072)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i3hlt-00008W-Cb
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 10:21:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E56B7189D902;
 Fri, 30 Aug 2019 11:52:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 408A360C05;
 Fri, 30 Aug 2019 11:52:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBE8E1165361; Fri, 30 Aug 2019 13:52:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
References: <f307829a5e64121b5cb8ad1aefff09f41cac9699.1567070002.git.mprivozn@redhat.com>
 <87v9ugrx2k.fsf@dusky.pond.sub.org>
 <f6ae646f-620d-964a-dd36-e6f636fc08da@redhat.com>
 <a519150a-bf44-1144-e738-9d8c6cdf5dda@redhat.com>
 <fb78b4ad-9cd5-4a25-8d55-c398bb508587@redhat.com>
Date: Fri, 30 Aug 2019 13:52:39 +0200
In-Reply-To: <fb78b4ad-9cd5-4a25-8d55-c398bb508587@redhat.com> (Michal
 Privoznik's message of "Thu, 29 Aug 2019 15:24:42 +0200")
Message-ID: <8736hiq394.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 30 Aug 2019 11:52:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qapi: Reintroduce CommandDisabled error
 class
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
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, lcapitulino@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michal Privoznik <mprivozn@redhat.com> writes:

> On 8/29/19 3:12 PM, Eric Blake wrote:
>> On 8/29/19 8:04 AM, Michal Privoznik wrote:
>>
>>>>> A bit of background: up until very recently libvirt used qemu-ga
>>>>> in all or nothing way. It didn't care why a qemu-ga command
>>>>> failed. But very recently a new API was introduced which
>>>>> implements 'best effort' approach (in some cases) and thus
>>>>> libvirt must differentiate between: {CommandNotFound,
>>>>> CommandDisabled} and some generic error. While the former classes
>>>>> mean the API can issue some other commands the latter raises a
>>>>> red flag causing the API to fail.
>>>>
>>>> Why do you need to distinguish CommandNotFound from CommandDisabled?
>>>
>>> I don't. That's why I've put them both in curly braces. Perhaps this
>>> says its better:
>>>
>>> switch (klass) {
>>>    case CommandNotFound:
>>>    case CommandDisabled:
>>>          /* okay */
>>>          break;
>>>
>>
>> So the obvious counter-question - why not use class CommandNotFound for
>> a command that was disabled, rather than readding another class that has
>> no distinctive purpose?
>>
>>
>
> Because disabling a command is not the same as nonexistent
> command. While a command can be disabled by user/sysadmin, they are
> disabled at runtime by qemu-ga itself for a short period of time
> (e.g. on FS freeze some commands are disabled - typically those which
> require write disk access). And I guess reporting CommandNotFound for
> a command that does exist only is disabled temporarily doesn't reflect
> the reality, does it?
>
> On the other hand, CommandNotFound would fix the issue for libvirt, so
> if you don't want to invent a new error class, then that's the way to
> go.

I'm fine with changing the error to CommandNotFound.

I'm reluctant to add back CommandDisabled.  I doubt it's necessary.

To arrive at an informed opinion, I had to figure out how this command
disablement stuff works.  I can just as well send it out, so here goes.

Let's review our command disable feature.

Commands are enabled on registration, see qmp_register_command().

To disable, call qmp_disable_command().  Only qga/main.c does, in two
places:

* ga_disable_non_whitelisted(): disable all commands except for
  ga_freeze_whitelist[], which is documented as /* commands that are
  safe to issue while filesystems are frozen */

* initialize_agent(): disable blacklisted commands.  I figure these are
  the ones blacklisted with -b, plus commands blacklisted due to build
  configuration.  The latter feels inappropriate; we should use QAPI
  schema conditionals to compile them out instead (QAPI conditionals
  didn't exist when the blacklisting code was written).

Disabled commands can be re-enabled with qmp_enable_command().  Only
qga/main.c does, in ga_enable_non_blacklisted().  I figure it re-enables
the commands ga_disable_non_whitelisted() disables.  Gets called when
guest-fsfreeze-freeze freezes nothing[1], and when guest-fsfreeze-thaw
succeeds[2].

Command dispatch fails when the command is disabled, in
do_qmp_dispatch().  The proposed patch changes the error reply.

QGA's guest-info shows whether a command is disabled
(GuestAgentCommandInfo member @enabled, set in qmp_command_info()).

QMP's query-commands skips disabled commands, in query_commands_cb().
Dead, as nothing ever disables QMP commands.  Skipping feels like a bad
idea anyway.

Analysis:

There are three kinds of disabled commands: compile-time (should be
compiled out instead), permanently blacklisted with -b, temporarily
disabled while filesystems are frozen.

There are two states: thawed (first two kinds disabled) and frozen (all
three kinds disabled).

Command guest-fsfreeze-freeze[3] goes to state frozen or else fails.

Command guest-fsfreeze-thaw goes to state thawed or else fails.

guest-fsfreeze-status reports the state.

Note that the transition to frozen (and thus the temporary command
disablement) is under the control of the QGA client.  There is no
TOCTTOU between guest-info telling you which commands are disabled and
executing the next command.  My point is: the client can figure out
whether a command is disabled before executing it.

Of course, that doesn't mean we should make it figure it out.


[1] POSIX only, WTF?

[2] Except for execute_fsfreeze_hook(), which can still fail the command
    on POSIX, WTF?

[3] guest-fsfreeze-freeze's doc comment notes "The frozen state is
    limited for up to 10 seconds by VSS."  Sounds like some spontaneous
    transition back to thawed.  If this is actually true, GAState member
    @frozen is not updated to reflect the spontaneous thaw.  WTF?

