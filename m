Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E135FB8B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 21:20:02 +0200 (CEST)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWl3R-0001w9-WF
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 15:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWl1Y-0000nj-Hc
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:18:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWl1S-0002Vf-Jb
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618427877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68yfeuEZroQq4+5ADuKXPuVaINcB2YMvKHDTVvyKWs4=;
 b=E1who8GIpi2c5DcedniJk40nLSJh987tld01HCzcD8PVw6tW0KVymRsruphJBHLYmunQwi
 4xf5nfr6nSIKC/7qfO9fj7S50VEMXWf0miMbaKt4jyZKU61Hmy3OcwP0m//MWT8zC9ZUTf
 VxcZm2gnuF1Q6nWZZUeMro4iw5IgnUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-Zo3Bk_EpPmWygI8vS2y_rQ-1; Wed, 14 Apr 2021 15:17:54 -0400
X-MC-Unique: Zo3Bk_EpPmWygI8vS2y_rQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EEA6195D561
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 19:17:53 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92C306C32D;
 Wed, 14 Apr 2021 19:17:48 +0000 (UTC)
Subject: Re: [PATCH RFC 0/7] RFC: Asynchronous QMP Draft
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <YHaN5JPvjK2Wq6su@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <79eb174a-8e08-aac8-6a0c-e0c7b03eb782@redhat.com>
Date: Wed, 14 Apr 2021 15:17:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHaN5JPvjK2Wq6su@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First and foremost, thank you for reviewing this! It is very helpful to 
me to see what others think of this pet project I've been growing in the 
privacy of my own mind.

On 4/14/21 2:38 AM, Stefan Hajnoczi wrote:
> Below are the API docs that I found helpful for understanding the big
> picture.
> 
> The QMP.execute() API is nice.
> 

Yes. It mimics (sync) qmp.command(), which I believe Eduardo Habkost 
wrote. I think it's the correct idea for a generic (QAPI-schema 
ignorant) QMP client library meant to be "used".

I think raising RPC in-band execution errors as exceptions is a nice 
"pythonic" way to do it.

(And, if desired, it is possible to use the QAPI generator to generate 
wrappers around this interface using type-safe arguments in a low-level 
SDK layer. I think that would be pretty swell. We are not there yet, 
though, and I'll focus on this layer first.)

> Regarding QMP events, I can think of two approaches:
> 1. Callbacks
> 2. An async get_event(name=Optional[str]) -> object API
>     (plus get_event_nowait(name=Optional[str]) -> object)
> 
> (There's probably a third approach using async iterators but it's
> similar to get_event().)
> 
> Both approaches are useful. The first is good in larger asynchronous
> applications that perform many tasks concurrently. The second is good
> when there is just one specific thing to do, like waiting for a block
> job to complete.
> 
(1) On callbacks:

Callbacks are what I meagerly mocked up; discord.py has a "cute" little 
hack that works like this:

bot = commands.bot(...)

@bot.event
async def on_ready():
     print("Logged in as")
     print(bot.user.name)
     ...

(See 
https://github.com/Rapptz/discord.py/blob/master/examples/basic_bot.py )

I find this to be extremely cute: the framework uses the name of the 
callback to determine which event you are registering, and uses the 
decorator to merely register the callback.

This makes a nice, uncomplicated way to plug coroutines into the state 
machine of the client loop in the most basic cases.

I thought it might be nice to try and mimic that design, by perhaps 
using the names of QMP events as their own 'queues', and then 
dispatching user callbacks as desired. (Possibly with one mega-queue 
that exists for ALL callbacks.)

For instance, something like this:

@qmp.event
async def job_status_block_job_ready(qmp, event):
     ...

or more generally,

@qmp.event_handler
async def my_own_event_handler(qmp, event):
     ...

I didn't spend much time on the actual queue or dispatch mechanism in my 
draft, though, but it could be "bolstered" into a more full-fledged API 
if desired.

One nice thing about this design is that events aren't "consumed" by a 
caller, they are just dispatched to anyone waiting on an event of that type.

As I recall, events getting "eaten" at the wrong time was a major burden 
when writing iotests that exercised multiple jobs, transactions, etc.

(A side note: a higher-level VM class that uses QMP may wish to capture 
certain events to record state changes, such that the state can be 
queried at an arbitrary point by any number of callers without needing 
to have witnessed the state change event personally. That's not really 
important here in the protocol library, though, which will pretend not 
to know which events exist -- but it's a consideration for making sure 
the design that IS chosen can be extensible to support that kind of thing.)


(2) On get_event or async iterators:

This is likely a good ad-hoc feature. Should it only work for events 
that are delivered from that moment in time, or should there be a 
"backlog" of events to deliver?

Should waiting on events in this manner "consume" the event from the 
backlog, if we have one?

My concern::

   await qmp.execute('blockdev-backup', {...etc...})
   async for event in qmp.get_events():
       ...


It's possible that an event we'd like to see has already occurred by the 
time we get around to invoking the async iterator. You'd really want to 
start checking for events *before* you issue the job request, but that 
involves tasks, and the code doesn't "flow" well anymore.

I don't have ideas, at-present, for how to make things like iotests 
"flow" well in a linear co-routine sense...

...although, maybe it's worth creating something like an Event Listener 
object that, from its creation, stashes events from that point forward. 
How about::

   async with qmp.event_listener() as events:
       await qmp.execute('blockdev-backup', {...})
       async for event in events:
           ...

Actually, that seems pretty cool. What do you think? I think it's fairly 
elegant for ad-hoc use. We could even extend the constructor to accept 
filtering criteria if we wanted to, later.

Possibly we could also augment the Event Listener object to support a 
few methods to facilitate blocking until a certain event occurs, like::

   async with qmp.event_listener() as events:
       await qmp.execute('blockdev-backup', {...})
       await events.event('JOB_STATUS_CHANGE', status="pending")
       await qmp.execute('job-finalize', {...})
       ...


I think that's pretty workable, actually! And it could co-exist 
perfectly well alongside event callback handlers.


> My general impression is that the public API is nice and usable but the
> implementation is complex and risks discouraging other people from
> hacking on the code. There are too many abstractions and while it's
> highly structured, there is a cost to having all this infrastructure. I
> think simplifying it would make it easier for others to understand and
> contribute to the code.
> 

It's a fair point. I am hoping that the protocol.py layers won't need to 
be touched quite so much. (Famous last words) and that most of the 
interesting work can happen at the qmp_protocol.py level and above, though.

> Ideas: open code or inline simple things instead of defining
> abstractions that only have 1 user, drop the pydantic models, drop
> classes that just wrap things like Message and the exception hierarchy,
> combine protocol and qmp_protocol.
> 

(1) On models:

Pydantic models are definitely optional at this stage, but I am floating 
them here to prepare people for the idea that I might try to get more 
mileage out of them in the future to offer a type-safe, QAPI-aware SDK 
layer.

They're definitely only a mild benefit here, for now, as the strict 
typing they help provide is not floated upwards or exposed to the user.


(2) On the Message class:

I'll try a draft where I try to drop or simplify the Message class. It 
seems like a good candidate, but I think I'm subjectively afraid I won't 
like the inlining. We'll see!


(3) On the Exception hierarchy:

Let's talk about error handling design a little bit more. I want to make 
sure that the errors that can happen and in which circumstances are 
obvious and have good names, but there might be better approaches to 
managing that complexity.


(4) On combining protocol and qmp_protocol:

Maybe. Do you want to look at the qtest implementation? It's somewhat 
ancillary to this project, but felt it would make a nice companion 
library. It doesn't benefit as strongly as QMP (As it does not offer 
anything like OOB), but it does have async messages it can send, so it 
can re-use the same infrastructure.

(Fully admit that the first draft, of course, did feature a combined 
protocol/qmp_protocol class. It was split out later.)

> Things that might be worth adding:
> 1. File descriptor passing support.

Do you have an example workflow that I can use to test this? This is a 
weak spot in my knowledge.

> 2. Introspection support to easily check if a command/feature is
>     available. Users can do this manually by sending QMP commands and
>     interpreting the response, but this may be common enough to warrant a
>     friendly API.
> 

I think this treads into QAPI-specific domain knowledge, and I might 
leave such features to a higher-level object.

The QMP spec itself does not define a mechanism by which the QMP 
protocol itself will reveal the valid commands, and so it might be up to 
a machine.py-based extension/capsulation of qmp_protocol to provide that.

(Though, I do agree; I want this feature somewhere. We do have such a 
thing coded into the existing qmp-shell tool, using the query-commands 
command. Maybe I can offer a subclass that offers some of these 
convenience features using a best-effort guess-and-check style 
introspection. Please forgive me if I focus on shoring up the design of 
the core implementation first.)

> Help on module qmp.qmp_protocol in qmp:
> 
> NAME
>      qmp.qmp_protocol - QMP Client Implementation
> 
> DESCRIPTION
>      This module provides the QMP class, which can be used to connect and
>      send commands to a QMP server such as QEMU. The QMP class can be used to
>      either connect to a listening server, or used to listen and accept an
>      incoming connection from the server.
> 
> CLASSES
>      qmp.error.AQMPError(builtins.Exception)
>          ExecuteError
>      qmp.protocol.AsyncProtocol(typing.Generic)
>          QMP
>      
>      class ExecuteError(qmp.error.AQMPError)
>       |  ExecuteError(sent: qmp.message.Message, received: qmp.message.Message, error: qmp.models.ErrorInfo)
>       |
>       |  Execution statement returned failure.
>       |
>       |  Method resolution order:
>       |      ExecuteError
>       |      qmp.error.AQMPError
>       |      builtins.Exception
>       |      builtins.BaseException
>       |      builtins.object
>       |
>       |  Methods defined here:
>       |
>       |  __init__(self, sent: qmp.message.Message, received: qmp.message.Message, error: qmp.models.ErrorInfo)
>       |      Initialize self.  See help(type(self)) for accurate signature.
>       |
>       |  __str__(self) -> str
>       |      Return str(self).
>       |
>       |  ----------------------------------------------------------------------
>       |  Data descriptors inherited from qmp.error.AQMPError:
>       |
>       |  __weakref__
>       |      list of weak references to the object (if defined)
>       |
>       |  ----------------------------------------------------------------------
>       |  Static methods inherited from builtins.Exception:
>       |
>       |  __new__(*args, **kwargs) from builtins.type
>       |      Create and return a new object.  See help(type) for accurate signature.
>       |
>       |  ----------------------------------------------------------------------
>       |  Methods inherited from builtins.BaseException:
>       |
>       |  __delattr__(self, name, /)
>       |      Implement delattr(self, name).
>       |
>       |  __getattribute__(self, name, /)
>       |      Return getattr(self, name).
>       |
>       |  __reduce__(...)
>       |      Helper for pickle.
>       |
>       |  __repr__(self, /)
>       |      Return repr(self).
>       |
>       |  __setattr__(self, name, value, /)
>       |      Implement setattr(self, name, value).
>       |
>       |  __setstate__(...)
>       |
>       |  with_traceback(...)
>       |      Exception.with_traceback(tb) --
>       |      set self.__traceback__ to tb and return self.
>       |
>       |  ----------------------------------------------------------------------
>       |  Data descriptors inherited from builtins.BaseException:
>       |
>       |  __cause__
>       |      exception cause
>       |
>       |  __context__
>       |      exception context
>       |
>       |  __dict__
>       |
>       |  __suppress_context__
>       |
>       |  __traceback__
>       |
>       |  args
>      
>      class QMP(qmp.protocol.AsyncProtocol)
>       |  QMP(name: Optional[str] = None) -> None
>       |
>       |  Implements a QMP connection to/from the server.
>       |
>       |  Basic usage looks like this::
>       |
>       |    qmp = QMP('my_virtual_machine_name')
>       |    await qmp.connect(('127.0.0.1', 1234))
>       |    ...
>       |    res = await qmp.execute('block-query')
>       |    ...
>       |    await qmp.disconnect()
>       |

This reminds me.

I was briefly considering the idea that the QMP object could be 
converted into something like a QMP session factory instead, and you 
could use a context manager.

e.g.

qmp = QMP(session_factory_settings)
async with qmp.connect(...) as session:
     ...
     ...

with disconnect() being implicitly called upon the destruction of the 
session object when it goes out of scope.

I could also simply mock this up without creating a factory/session 
split, just by having the context manager simply return 'self':

proto = QMP(various_settings)
async with proto.connect(...) as qmp:
     ...
     ...

Though it's a little hacky, as with-expressions are expected to return 
*something*, and we actually already have a handle to that object.

>       |  :param name: Optional nickname for the connection, used for logging.
>       |
>       |  Method resolution order:
>       |      QMP
>       |      qmp.protocol.AsyncProtocol
>       |      typing.Generic
>       |      builtins.object
>       |
>       |  Methods defined here:
>       |
>       |  __init__(self, name: Optional[str] = None) -> None
>       |      Initialize self.  See help(type(self)) for accurate signature.
>       |
>       |  async execute(self, cmd: str, arguments: Optional[Mapping[str, object]] = None, oob: bool = False) -> object
>       |      Execute a QMP command and return the response.
>       |
>       |      :param cmd: QMP command name.
>       |      :param arguments: Arguments (if any). Must be JSON-serializable.
>       |      :param oob: If true, execute "out of band".
>       |
>       |      :raise: ExecuteError if the server returns an error response.
>       |      :raise: DisconnectedError if the connection was terminated early.
>       |
>       |      :return: Execution response from the server. The type of object depends
>       |               on the command that was issued, though most return a dict.
>       |
>       |  async execute_msg(self, msg: qmp.message.Message) -> object
>       |      Execute a QMP message and return the response.
>       |
>       |      :param msg: The QMP `Message` to execute.
>       |      :raises: ValueError if the QMP `Message` does not have either the
>       |               'execute' or 'exec-oob' fields set.
>       |      :raises: ExecuteError if the server returns an error response.
>       |      :raises: DisconnectedError if the connection was terminated early.
>       |
>       |      :return: Execution response from the server. The type of object depends
>       |               on the command that was issued, though most return a dict.
>       |
>       |  on_event(self, func: Callable[[ForwardRef('QMP'), qmp.message.Message], Awaitable[NoneType]]) -> Callable[[ForwardRef('QMP'), qmp.message.Message], Awaitable[NoneType]]
>       |      FIXME: Quick hack: decorator to register event handlers.
>       |
>       |      Use it like this::
>       |
>       |        @qmp.on_event
>       |        async def my_event_handler(qmp, event: Message) -> None:
>       |          print(f"Received event: {event['event']}")
>       |
>       |      RFC: What kind of event handler would be the most useful in
>       |      practical terms? In tests, we are usually waiting for an
>       |      event with some criteria to occur; maybe it would be useful
>       |      to allow "coroutine" style functions where we can block
>       |      until a certain event shows up?
>       |
>       |  ----------------------------------------------------------------------
>       |  Class methods defined here:
>       |
>       |  make_execute_msg(cmd: str, arguments: Optional[Mapping[str, object]] = None, oob: bool = False) -> qmp.message.Message from builtins.type
>       |      Create an executable message to be sent by `execute_msg` later.
>       |
>       |      :param cmd: QMP command name.
>       |      :param arguments: Arguments (if any). Must be JSON-serializable.
>       |      :param oob: If true, execute "out of band".
>       |
>       |      :return: An executable QMP message.
>       |
>       |  ----------------------------------------------------------------------
>       |  Data and other attributes defined here:
>       |
>       |  __orig_bases__ = (qmp.protocol.AsyncProtocol[qmp.message.Message],)
>       |
>       |  __parameters__ = ()
>       |
>       |  logger = <Logger qmp.qmp_protocol (WARNING)>
>       |
>       |  ----------------------------------------------------------------------
>       |  Methods inherited from qmp.protocol.AsyncProtocol:
>       |
>       |  async accept(self, address: Union[str, Tuple[str, int]], ssl: Optional[ssl.SSLContext] = None) -> None
>       |      Accept a connection and begin processing message queues.
>       |
>       |      :param address: Address to connect to;
>       |                      UNIX socket path or TCP address/port.
>       |      :param ssl:     SSL context to use, if any.
>       |
>       |      :raise: `StateError`   (loop is running or disconnecting.)
>       |      :raise: `ConnectError` (Connection was not successful.)
>       |
>       |  async connect(self, address: Union[str, Tuple[str, int]], ssl: Optional[ssl.SSLContext] = None) -> None
>       |      Connect to the server and begin processing message queues.
>       |
>       |      :param address: Address to connect to;
>       |                      UNIX socket path or TCP address/port.
>       |      :param ssl:     SSL context to use, if any.
>       |
>       |      :raise: `StateError`   (loop is running or disconnecting.)
>       |      :raise: `ConnectError` (Connection was not successful.)
>       |
>       |  async disconnect(self) -> None
>       |      Disconnect and wait for all tasks to fully stop.
>       |
>       |      If there were exceptions that caused the bottom half to terminate
>       |      prematurely, they will be raised here.
>       |
>       |      :raise: `Exception`      Arbitrary exceptions re-raised on behalf of
>       |                               the bottom half.
>       |      :raise: `MultiException` Iterable Exception used to multiplex multiple
>       |                               exceptions when multiple tasks failed.
>       |
>       |  ----------------------------------------------------------------------
>       |  Readonly properties inherited from qmp.protocol.AsyncProtocol:
>       |
>       |  disconnecting
>       |      Return True when the loop is disconnecting, or disconnected.
>       |
>       |  running
>       |      Return True when the loop is currently connected and running.
>       |
>       |  unconnected
>       |      Return True when the loop is fully idle and quiesced.
>       |
>       |      Returns True specifically when the loop is neither `running`
>       |      nor `disconnecting`. A call to `disconnect()` is required
>       |      to transition from `disconnecting` to `unconnected`.

Any thoughts on these? I think I accidentally created some landmines 
here, actually.

disconnecting: This one is, I think, consistent with other primitives in 
Python like "is_closing", where it also does include the "fully closed" 
state. It hopefully adheres to the principle of least surprise.


running: This one is maybe bad, though. I mean this to be "fully 
running", i.e. the loop is fully open and nothing is wrong. I believe it 
is not true until sometime "in the middle" of the accept() or connect() 
calls; i.e. after the Reader/Writer tasks are started. I worry that this 
is a confusing point *within* this library.

Maybe it ought to report "true" as soon as we start trying to build a 
session; and I may need other internal helpers for testing more specific 
conditions inside the loop.


unconnected: I think this name is just genuinely bad, but I needed some 
kind of state to represent "fully quisced, not connected, and idle." 
i.e. that we were prepared and able to issue another accept() or 
connect() call.

"quiesced"? (Kind of jargon-y.)

"disconnected"? (Viable, but introduces ambiguity between 
fully-disconnected but waiting for the user to collect loop 
status/exceptions.)

"idle"? (Might be confused with a loop that's open.)


... Maybe it doesn't need to be externally exposed at all, anyway. The 
primary purpose for it is to safe-guard calls to connect() and accept() 
such that if the loop is engaged or not-yet-cleaned up, that these calls 
will bark an error back at the user.

Perhaps an internal property would suffice in that case.

_has_session True/False might suffice for this concept.

Thoughts?

>       |
>       |  ----------------------------------------------------------------------
>       |  Data descriptors inherited from qmp.protocol.AsyncProtocol:
>       |
>       |  __dict__
>       |      dictionary for instance variables (if defined)
>       |
>       |  __weakref__
>       |      list of weak references to the object (if defined)
>       |
>       |  ----------------------------------------------------------------------
>       |  Class methods inherited from typing.Generic:
>       |
>       |  __class_getitem__(params) from builtins.type
>       |
>       |  __init_subclass__(*args, **kwargs) from builtins.type
>       |      This method is called when a class is subclassed.
>       |
>       |      The default implementation does nothing. It may be
>       |      overridden to extend subclasses.
> 

 From here down, ...

> DATA
>      Awaitable = typing.Awaitable
>          A generic version of collections.abc.Awaitable.
>      
>      Callable = typing.Callable
>          Callable type; Callable[[int], str] is a function of (int) -> str.
>          
>          The subscription syntax must always be used with exactly two
>          values: the argument list and the return type.  The argument list
>          must be a list of types or ellipsis; the return type must be a single type.
>          
>          There is no syntax to indicate optional or keyword arguments,
>          such function types are rarely used as callback types.
>      
>      Dict = typing.Dict
>          A generic version of dict.
>      
>      List = typing.List
>          A generic version of list.
>      
>      Mapping = typing.Mapping
>          A generic version of collections.abc.Mapping.
>      
>      Optional = typing.Optional
>          Optional type.
>          
>          Optional[X] is equivalent to Union[X, None].
>      
>      Tuple = typing.Tuple
>          Tuple type; Tuple[X, Y] is the cross-product type of X and Y.
>          
>          Example: Tuple[T1, T2] is a tuple of two elements corresponding
>          to type variables T1 and T2.  Tuple[int, float, str] is a tuple
>          of an int, a float and a string.
>          
>          To specify a variable-length tuple of homogeneous type, use Tuple[T, ...].
> 

... Oops, I need to "hide" some more of those things from help, I think 
by specifying __all__ in that module I can restrict some of these things 
that aren't interesting to see in the help menu.

> FILE
>      /tmp/foo/qmp/qmp_protocol.py
> 
> 

In general, do you feel this design is roughly serviceable and worth 
pursuing cleanups for? I realize it's a bit "much" but as the audience 
extends beyond our castle walls, I wanted to be quite thorough. It's a 
design that's likely overkill for iotests, but hopefully just about 
correct for external users to prototype toy management scripts with.

At some point, I might try to get it checked in to the QEMU tree as an 
"alpha" library so that iterations on the design can be debated on their 
own merit instead of trying to update a giant new-code-blob. I am not 
sure if it's ready for that just yet, but I think it's close to that 
point where it needs to not live primarily in a separate repo anymore.

Thanks again,
-- John


