Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D4232DB0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 10:14:22 +0200 (CEST)
Received: from localhost ([::1]:34550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k13hl-0001DX-5N
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 04:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k13gy-0000m0-AE
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 04:13:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38914
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k13gv-0004BH-17
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 04:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596096807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZiuFkyE6vjsk+2cXYtijfGx19A6vtth6pe3kGVvYTDM=;
 b=asVglKOQGtKddWlpYZKm+TJ914sVgo5Jsn8CQaWEDqDs9G5iztiKPsHiaM/ghruwtQKXim
 +4VA/enH8KMSlYG3Tv0hhwLiC1eKN2EHGH/RhT2TJXBUG8iqqgwZ2Exb9iNGAPd8/h2T11
 ta3gj09fTVTRYvkZeIvYYnYVLI5eW7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-GKsBXlrRMsmvF5BwH6AJMg-1; Thu, 30 Jul 2020 04:13:25 -0400
X-MC-Unique: GKsBXlrRMsmvF5BwH6AJMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18D4B8BF063;
 Thu, 30 Jul 2020 08:13:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C52625F1E4;
 Thu, 30 Jul 2020 08:13:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 406A21132FD2; Thu, 30 Jul 2020 10:13:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH v2 2/3] trace: Add support for recorder back-end
References: <20200626162706.3304357-1-dinechin@redhat.com>
 <20200626162706.3304357-3-dinechin@redhat.com>
 <20200630130257.GP1370404@redhat.com>
 <7ha6zq2zxr.fsf@turbo.dinechin.lan>
 <87mu3qgwbx.fsf@dusky.pond.sub.org>
 <7ha6zq2ooj.fsf@turbo.dinechin.lan>
 <87pn8h5puj.fsf@dusky.pond.sub.org> <lya6zjhnag.fsf@redhat.com>
 <87a6zi8rl6.fsf@dusky.pond.sub.org> <ly4kpqfhdq.fsf@redhat.com>
Date: Thu, 30 Jul 2020 10:13:15 +0200
In-Reply-To: <ly4kpqfhdq.fsf@redhat.com> (Christophe de Dinechin's message of
 "Wed, 29 Jul 2020 17:52:33 +0200")
Message-ID: <8736594e04.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 23:51:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christophe de Dinechin <dinechin@redhat.com> writes:

> On 2020-07-29 at 13:53 CEST, Markus Armbruster wrote...
>> Christophe de Dinechin <dinechin@redhat.com> writes:
>>
>>> On 2020-07-27 at 10:23 CEST, Markus Armbruster wrote...
>>>> Christophe de Dinechin <dinechin@redhat.com> writes:
>>>>
>>>>> On 2020-07-23 at 16:06 CEST, Markus Armbruster wrote...
>>>>>> Christophe de Dinechin <dinechin@redhat.com> writes:
>> [...]
>>>>>>> I'm certainly not against adding a command-line option to activate recorder
>>>>>>> options specifically, but as I understand, the option -trace already exists,
>>>>>>> and its semantics is sufficiently different from the one in recorder
>>>>>>> patterns that I decided to not connect the two for now. For example, to
>>>>>>> disable trace foo, you'd pass "-foo" to the -trace option, but "foo=0" to
>>>>>>> RECORDER_TRACES. The parsing of graphing options and other related
>>>>>>> recorder-specific stuff is a bit difficult to integrate with -trace too.
>>>>>>
>>>>>> We need proper integration with the existing trace UI.
>>>>>
>>>>> I agree, but I don't think this belongs to this particular patch series.
>>>>> See below why.
>>>>>
>>>>>>
>>>>>> In particular, the ability to enable and disable trace events
>>>>>> dynamically provided by QMP commands trace-event-get-state,
>>>>>> trace-event-set-state, and HMP command trace-event is really useful.
>>>>>
>>>>> That ability exists, but given the many differences between the
>>>>> recorder and other tracing mechanisms, I found it useful to add a specific
>>>>> "recorder" command.
>>>>
>>>> Precedence for commands specific to a trace backend: trace-file.
>>>>
>>>> Name yours trace-recorder?
>>>
>>> But then "recorder dump" does not fit with any "trace" concept.
>>
>> Once you make the recorder a trace backend, whatever the recorder does
>> becomes a trace concept :)
>
> I understand your point, but I want to make a distinction between recorder
> tracing and other recorder features. Does that make sense?

Maybe :)  My thoughts haven't settled, yet.

>>>>> For example, assuming I built with both recorder and log trace backends,
>>>>> from the monitor, I can type:
>>>>>
>>>>>   trace-event kvm_run_exit on
>>>>>
>>>>> What I get then is something like that:
>>>>>
>>>>>   2091091@1595518935.441273:kvm_run_exit cpu_index 0, reason 2
>>>>>   2091091@1595518935.441292:kvm_run_exit cpu_index 0, reason 2
>>>>>   2091091@1595518935.441301:kvm_run_exit cpu_index 0, reason 2
>>>>>   2091091@1595518935.441309:kvm_run_exit cpu_index 0, reason 2
>>>>>   2091091@1595518935.441254:kvm_run_exit cpu_index 0, reason 2
>>>>>
>>>>> It would not be very useful to activate recorder traces as well when that
>>>>> happens, which would have the undesired side effect of purging any
>>>>>> corresponding entry from a following recorder dump.
>>>>
>>>> I'm afraid I don't understand, because the gaps in my understanding of
>>>> what the recorder can do are just too big.
>>>
>>> There is a video at the top of https://github.com/c3d/recorder, or direct
>>> link https://www.youtube.com/watch?v=kEnQY1zFa0Y. Hope this helps.
>>>
>>>
>>>>
>>>> From your cover letter:
>>>>
>>>>     1. Flight recorder: Dump information on recent events in case of crash
>>>>
>>>> Define "recent events", please.  Is it all trace events (except for the
>>>> ones disabled at build time, of course)?
>>>
>>> For event categories only known through qemu trace definitions, by default,
>>
>> Right now, there are no others, aren't there?
>
> There is one in the second patch, the example. That was actually the whole
> point of that second patch, which is not otherwise particularly exciting.
>
>>
>>> it's the last 8 events. If you manually declare a recorder, then you can
>>> specify any size.
>>>
>>> (The difference between this manual recorder usage and the recorder backend
>>> generated code is similar to the difference between the log backend and
>>> "DPRINTF")
>>
>> I'm not sure I get the parenthesis.
>
> I took that example because it's mentioned in docs/devel/tracing.txt:
>
>     === Log ===
>
>     The "log" backend sends trace events directly to standard error.  This
>     effectively turns trace events into debug printfs.
>
>     This is the simplest backend and can be used together with existing code that
>     uses DPRINTF().
>
> Just the same way, the recorder back-end can both use existing trace points,
> using the recorder back-end, but you can also add explicit record()
> statements much like you can add DPRINTF() statements.

Got it.

> Whether this is a good idea or not is debatable. I would argue that in some
> cases, it's a good idea, or at least, probably a better idea than DPRINTF ;-)

No need to convince me a low-overhead flight recorder can be useful.
I've improvised special-purpose flight recorders many times when
printf-like tracing interfered enough with the timing to make the
interesting behavior go away.

I doubt having both trace points and record() makes sense in QEMU except
for ad hoc debugging.

>>>> "Flight recorder" hints at recording in some ring buffer.  True?
>>>
>>> Yes.
>>>
>>>>
>>>> Can you explain the difference to trace backend "ftrace"?
>>>
>>> - It's not recording function calls nor stack traces.
>>> - It's faster (no fd write, no % parameter expansion)
>>
>> I guess "simple" doesn't format either, but it still writes to disk.
>>
>>> - It works on non-Linux platforms
>>> - It's always on
>>
>> The combination of "always on" and "minimal overhead" is obviously
>> useful.
>>
>>>>
>>>>     2. Tracing: Individual traces can be enabled using environment variables
>>>>
>>>> I guess "individual traces" means "individual trace events".
>>>
>>> Maybe I'm unwittingly opposing some well-established qemu habits here, as
>>> indicated by the "trace-event" command, but to me, a "trace" reports multiple
>>> "events" of the same class (distinguished e.g. by their timestamps). So I
>>> would say that I am indeed enabling a trace in order to be shown all the
>>> events associated to this trace.
>>>
>>> Does that make sense?
>>>
>>> But then I understand that the existing command is called "trace-event".
>>> So there's that. I don't mind changing the text that much.
>>
>> I'm hardly an expert on tracing in QEMU, I merely use it from time to
>> time.  I am the QMP maintainer, though.  Adding new commands for every
>> new thing is easy.  Proper integration takes thought.  And that's what
>> we're doing.
>>
>> As far as I can tell, QEMU has no concept of a "trace" in the sense of
>> your definition.  There are only individual trace events.  Enabled trace
>> events emit via the enabled trace backends.  Simple & stupid.
>
> I understand this terminology, and I was pointing out that it sounds really
> a strange use of the words. To me, an event is definitely a single point in
> time. However, I don't mind aligning the patch terminology where necessary
> for consistency.

I think we use "trace event" (one trace record) and "trace point" (the
point in code where a certain kind of event gets emitted) the same way,
and the terminology isn't strange at all.

You additionally use "trace".  Also not strange, once you defined it.

>>>> What does it mean to enable a trace event?  How does this affect the
>>>> recorder's behavior?
>>>
>>> For a given recorder instrumentation point, three things can happen:
>>> - It is recorded in a circular buffer (always)
>>> - If tracing is active, then a trace message is displayed
>>> - If sharing is active, then it is copied in shared memory for use by some
>>>   external program, e.g. recorder_scope.
>>
>> Enabled trace events get emitted to the configured backends, which can
>> do whatever they want with the events.
>>
>> Current trace backends emit to a single destination (log: stderr,
>> simple: a file, ftrace: the kernel, nop: the bit bucket, you get the
>> idea), but that's detail.
>>
>> My (possibly naive) expecation for a recorder backend: as always, only
>> the enabled trace events get emitted to the recorder backend.  All of
>> "circular buffer (always), display if tracing is active, copy if sharing
>> is active" happens within the backend.  In particular, enabling a trace
>> event cannot control the "tracing is active" bit.  It effectively
>> controls the "is recorded in a circular buffer" bit.  Correct?
>
> Actually, not in the patches as sent, no. IMO, this would defeat the whole
> purpose of always-on instrumentation. It's possible to disable recording,
> but by default, it's on.

I misread the tracing infrastructure.  Honoring the enabled bit is
actually up to the backend.  Some backends open-code it in the generated
_nocheck__trace_FOO() for speed.

>> I guess much of the confusion comes from the fact that trace backends
>> are just that, but the recorder is more.
>>
>> Trace backends emit trace events.
>>
>> The recorder can *also* emit trace events.  But it primarily records.  I
>> figure users commonly record more events than they trace.
>
> Yes. The normal state for a trace point is to be off, the normal state for a
> record point is to be recording but not tracing.
>
>>
>> If you do the recorder as a trace backend, then the existing UI to
>> control what's being traced becomes UI to control what's being recorded
>> by the recorder and traced by everything else.  Confusing, and we're
>> short one UI to control what's being traced by the recorder.
>>
>> Perhaps doing the recorder as a trace backend is simply a bad idea.
>> Perhaps it should be integrated in the trace subsystem differently, so
>> that trace-enable continues to control what's being traced for all
>> backends.
>
> That means you don't benefit from any of the existing trace points.
>
> As an aside, the existing tracing system has the trace points in a different
> file than the actual code. In other words, we have something like:
>
>     # ioport.c
>     cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>     cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>
> and in ioport.c we have:
>
>     trace_cpu_in(addr, 'b', val);
>
> The recorder native approach would be something like:
>
>     trace(cpu_in, "addr 0x%x(%c) value %u", addr, 'b', val);
>
> Is the current syntax an artifact of how tracetool works, or is it intentional?

I'm not sure.  A bit of both?

The separate trace-events file makes generating code for events simple
and easy.

Some backends heavily rely on code generation.  The recorder backend
seems not to.  Code generation includes the .dtrace generated with
backend dtrace.

>> Perhaps the recorder should emit the events it traces to a trace
>> backend.
>
> Ah, interesting. The recorder has a configurable output, so it is somewhat
> trivial to connect to some generated function that calls the various trace
> backends.
>
>>
>>>>     3. Real-time graphing / control, using the recorder_scope application
>>>>
>>>> I'm ignoring this one for now.
>>>>
>>>>> There are, however, new monitor commands, so now I can do:
>>>>>
>>>>>   recorder trace kvm_run_exit
>>>>>
>>>>> I now get an output where each trace shows up twice.
>>>>>
>>>>>   [120139718 137.127269] kvm_run_exit: cpu_index 0, reason 2
>>>>>   2091091@1595518954.209803:kvm_run_exit cpu_index 0, reason 2
>>>>>   [120139734 137.127281] kvm_run_exit: cpu_index 0, reason 2
>>>>>   2091091@1595518954.209814:kvm_run_exit cpu_index 0, reason 2
>>>>>   [120139751 137.127293] kvm_run_exit: cpu_index 0, reason 2
>>>>>
>>>>>  I don't find particularly useful, so I don't think having that as the
>>>>> normal behaviour would qualify as what you called proper integration.
>>>>
>>>> Well, I asked for it by configuring two trace backends, didn't I?
>>>
>>> Not really IMO. By configuring two trace backends, what you requested was to
>>> have two different kinds of instrumentation active at the same time. It does
>>> not imply (at least to me) that these two kinds of instrumentation have to
>>> react to *run-time* configuration identically, in particular if that means
>>> in a way that happens to not be helpful.
>>>
>>> If you configure log and ftrace, you are not requesting them to behave
>>> identically at run time.
>>
>> No, but by configuring two trace backends, you ask each one to do its
>> thing.  If "its thing" includes printing to stderr for both, then
>> getting events printed twice is exactly what you asked for.
>
> I think that you are arguing that since trace-event currently activates or
> disables all trace back-ends at once, then that's necessarily what I asked
> for.
>
> There is a nice ambiguity about the word "asked for" here, but that's
> definitely not what I would like. I described this behavior as unhelpful.
>
> However, addressing that correctly may indeed belong to the common code
> rather than to individual backends, I'll certainly grant you that.
>
>
>>
>>>> If I configured just the recorder backend, would I get a useful trace?
>>>
>>> Yes, but not the full functionality that "recorder" gives you.
>>> Notably, there is nothing in the existing trace-event command that would
>>> allow me to configure recorder sharing or trace output format, whereas the
>>> proposed patch allows me to do that.
>>
>> Christophe, leave that windmill alone!  I'm over here!  ;)
>
> ;-)
>
>
>> I'm not trying to shoot down commands specific to trace backends.  I'm
>> trying to understand how the proposed recorder backend interacts with
>> the existing tracing UI and infrastructure, so I can figure out how to
>> best fit it with the existing UI and infrastructure.
>>
>> QEMU's tracing subsystem consists of a common, backend-independent part
>> and backends.
>>
>> Command trace-event controls one aspect of the common part: whether to
>> hand the trace event to the backend or not.  The backend has no say in
>> that.

I was confused.  Honoring the enabled bit is actually up to the backend.

> This is the part I changed in the patch, because there is already a
> mechanism to activate / deactivate tracing in the recorder, so having two
> 'if(condition)' testing essentially the same condition using two different
> flags seems useless.
>
>>
>> Command trace-file controls one aspect of the backend: writing output to
>> a file.  Only the simple backend makes use of it, but that's detail.
>>
>> You tell me the recorder backend needs to expose more configuration to
>> really make sense.  The question isn't whether that's true (I trust you
>> on that), it's how to best integrate it with what we have.
>
> You gave me a number of interesting ideas. Let me get back to you with a new
> spin. You can tell me which one you prefer. I also made a couple of changes
> to the recorder itself to make future qemu integration easier.
>
>>
>>>> If yes, what's wrong with letting me control what's being traced with
>>>> the common trace-event command in addition to a backend-specific
>>>> command?
>>>
>>> This would force that code to a lower common denominator that would remove a
>>> lot of useful functionality specific to the recorder, even assuming we keep
>>> both the "recorder" and "trace-event" commands to configure the recorder.
>>>
>>> There is a problem with the semantics of the underlying API. For example,
>>> disabling trace foo is "-foo" in qemu, "foo=0" in the recorder API. I don't
>>> really like the idea of adding some string manipulation code to transform
>>> "-foo" into "foo=0". I would prefer to extend the recorder API to accept
>>> -foo, but that's not the case today.
>>
>> You're talking about the configuration file specified with trace
>> events=...
>>
>> The existing UI for the recorder library is different.  Hardly a
>> surprise.
>>
>> Consistency between the existing UI for the common part and the new UI
>> for the recorder backend is quite desirable.  I'm not making it a hard
>> requirement.  I would like to see concrete ideas on how to get it,
>> though.
>
> Here what can be done, but it's a larger undertaking:
>
> - Convert named trace entry points to anonymous trace(...) calls following a
>   syntax similar to record(...), so that traces are readable in one place.
>
> - Have a mechanism for trace activation / deactivation that delegates to the
>   trace back-end. That way, any ugly recorder-specific string manipulation
>   converting regexps and such will be in the back-end, not in common code.
>
> - When multiple trace back-ends are configured, make it possible to
>   configure them independently, ideally using back-end specific options
>
> - Add some notion of back-end specific option, to implement back-end
>   specific configurations like trace-file or recorder_dump_on_signal.
>
> - Split the notion of "trace" and "record", and add some "record"
>   semantics. Some existing backends already are closer to record semantics,
>   e.g. ftrace.
>
> - Convert the existing DPRINTF stuff to trace().

Plenty of ideas.  I'd recommend to wait for Stefan's opinion before you
run with them.


