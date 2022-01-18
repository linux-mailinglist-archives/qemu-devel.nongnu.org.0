Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9457492968
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:10:25 +0100 (CET)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9q7s-0008Dt-CZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:10:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9pNY-00082m-OK
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 09:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9pNW-0006S3-9S
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 09:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642515749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0pg5nWgW0sYfHDqPOg5zn5a1+kUy8vkXRxcjs3Tg71w=;
 b=M659nmnHiA4iC317n2vT93Dv+AKRGBSbFp5lgPbE/P01Xh2S6xcPb/rBaT0f7wAqy1H6ik
 9zAWFEOzc3VoQ+oXvJrwf5oxb5PQzZ7wEbao0NGrHccWeLpBto51pmMMaD1upAQYWc8KA+
 CCA/GdGR1UDv5hT2fDJMLLhGMj6Xu+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-pHCsqVRxNfaZPX-9Zvwvcw-1; Tue, 18 Jan 2022 09:22:26 -0500
X-MC-Unique: pHCsqVRxNfaZPX-9Zvwvcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7460E10247A6;
 Tue, 18 Jan 2022 14:22:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF667E2E8;
 Tue, 18 Jan 2022 14:22:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 96A01113865F; Tue, 18 Jan 2022 15:22:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 2/3] scripts/qapi-gen.py: add --add-trace-events option
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-3-vsementsov@virtuozzo.com>
 <877daxpcdz.fsf@dusky.pond.sub.org>
 <69e04ac6-8bfb-5d66-fa99-fcdf8340935a@virtuozzo.com>
Date: Tue, 18 Jan 2022 15:22:23 +0100
In-Reply-To: <69e04ac6-8bfb-5d66-fa99-fcdf8340935a@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 18 Jan 2022 14:58:01 +0300")
Message-ID: <87zgnt86ow.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 18.01.2022 13:27, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> Add and option to generate trace events. We should generate both trace
>>> events and trace-events files for further trace events code generation.
>> 
>> Can you explain why we want trace generation to be optional?
>
> Because I failed make it work for tests and qga.. And seems there no good reason for it: there now trace events for now neither in tests nor in qga.
>
> I've now tried again.
>
> It doesn't work, as I understand, the problem is qga subdir goes after trace subdir, so when we generate trace headers, we didn't yet processed qga subdir.
>
> And I can't just move qga above trace: qga depends on qemutil variable so it should go after it. And if I put 'trace' subdir under qemuutil declaration it doesn't work too (seems because qemuutil depends on trace_ss)..
>
> So, supporting auto-generated trace points for qga qmp commands requires some deeper refactoring.

Similar trouble with tests?

The normal case seems to be "generate trace code", with an exception for
cases where our build system defeats that.  Agree?

If yes, I'd prefer to default to "generate trace code", and have an
option to suppress it, with suitable TODO comment(s) explaining why.

[...]

>>> @@ -122,10 +167,17 @@ def gen_marshal_decl(name: str) -> str:
>>>                    proto=build_marshal_proto(name))
>>>   
>>>   
>>> +def gen_trace(name: str) -> str:
>>> +    name = c_name(name)
>>> +    return f"""\
>>> +qmp_enter_{name}(const char *json) "%s"\n
>>> +qmp_exit_{name}(const char *result, bool succeeded) "%s %d"\n"""
>> 
>> Why not mcgen()?
>
> Hmm.. Here we don't need any indentation for sure. Do you think we still want mcgen for consistancy and not use f-string?

Let's stick to mcgen() for generating code.

>> The generated FOO.trace-events look like this:
>> 
>>      $ cat bld-clang/qapi/qapi-commands-control.trace-events
>>      qmp_enter_qmp_capabilities(const char *json) "%s"
>> 
>>      qmp_exit_qmp_capabilities(const char *result, bool succeeded) "%s %d"
>>      qmp_enter_query_version(const char *json) "%s"
>> 
>>      qmp_exit_query_version(const char *result, bool succeeded) "%s %d"
>>      qmp_enter_query_commands(const char *json) "%s"
>> 
>>      qmp_exit_query_commands(const char *result, bool succeeded) "%s %d"
>>      qmp_enter_quit(const char *json) "%s"
>> 
>>      qmp_exit_quit(const char *result, bool succeeded) "%s %d"
>> 
>> Either drop the blank lines, or put them between the pairs instead of
>> within.  I'd do the former.
>> 
>> We generate lots of empty FOO.trace-events.  I guess that's okay.
>> 
>>> +
>> 
>> scripts/qapi/commands.py:176:1: E302 expected 2 blank lines, found 1
>> 
>>>   def gen_marshal(name: str,
>>>                   arg_type: Optional[QAPISchemaObjectType],
>>>                   boxed: bool,
>>> -                ret_type: Optional[QAPISchemaType]) -> str:
>>> +                ret_type: Optional[QAPISchemaType],
>>> +                add_trace_events: bool) -> str:
>>>       have_args = boxed or (arg_type and not arg_type.is_empty())
>>>       if have_args:
>>>           assert arg_type is not None
>>> @@ -180,7 +232,7 @@ def gen_marshal(name: str,
>>>       }
>>>   ''')
>>>   
>>> -    ret += gen_call(name, arg_type, boxed, ret_type)
>>> +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_events)
>>>   
>>>       ret += mcgen('''
>>>   
>>> @@ -238,11 +290,12 @@ def gen_register_command(name: str,
>>>   
>>>   
>>>   class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
>>> -    def __init__(self, prefix: str):
>>> +    def __init__(self, prefix: str, add_trace_events: bool):
>>>           super().__init__(
>>>               prefix, 'qapi-commands',
>>>               ' * Schema-defined QAPI/QMP commands', None, __doc__)
>>>           self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
>>> +        self.add_trace_events = add_trace_events
>>>   
>>>       def _begin_user_module(self, name: str) -> None:
>>>           self._visited_ret_types[self._genc] = set()
>>> @@ -261,6 +314,15 @@ def _begin_user_module(self, name: str) -> None:
>>>   
>>>   ''',
>>>                                commands=commands, visit=visit))
>>> +
>>> +        if self.add_trace_events and c_name(commands) != 'qapi_commands':
>>> +            self._genc.add(mcgen('''
>>> +#include "trace/trace-qapi.h"
>>> +#include "qapi/qmp/qjson.h"
>>> +#include "trace/trace-%(nm)s_trace_events.h"
>>> +''',
>>> +                                 nm=c_name(commands)))
>> 
>> Why c_name(commands), and not just commands?
>
> Because generated files has underscores instead of '-'. Looking at code, I think it's because underscorify() in trace/meson.build when we create group_name variable.

I see.  We first generate output modules like

    qapi/qapi-commands-machine-target.c
    qapi/qapi-commands-machine-target.h
    qapi/qapi-commands-machine-target.trace-events

and then from the latter their trace code like

    trace/trace-qapi_commands_machine_target_trace_events.h
    trace/trace-qapi_commands_machine_target_trace_events.c

These file names is ugly, but not this patch's fault.

Normally, the foo/bar/*.c include "trace.h" (handwritten one-liner),
which includes "trace/trace-foo_bar.h" generated from
foo/bar/trace-events.

Here, we include them directly, because we generate per file, not per
directory.

To actually match .underscorify(), you have to use c_name(commands,
protect=False).

Also add a comment that points to the .underscorify().

[...]


