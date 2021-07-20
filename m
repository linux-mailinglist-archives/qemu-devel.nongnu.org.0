Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9C3D02AE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:36:02 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wTB-0004Fb-9j
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1m5wS7-0003a0-Of
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1m5wS2-000054-QQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626813286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lGBwwuMebft1n7fqwgqXnl/bRl12rJdLeGCfwX1XGtk=;
 b=gvZ74RuiHW1nkGWtXctFY7yPdnyo2gOBHd80Y7MFA67bl0IUAkVqP+LNHFsrVsETsdmMRs
 yGPWx0KWERYg7uHQT113HzQAbT+mb0BXGOBl+kpF7yOUaENlNwykLpm4Bsu3C0luuTmBto
 NuUnUb3/xMSWdMlcAqdhYCwG67B6xqE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-WVGOYkX_NLi48kdpIaDXPg-1; Tue, 20 Jul 2021 16:34:42 -0400
X-MC-Unique: WVGOYkX_NLi48kdpIaDXPg-1
Received: by mail-pj1-f72.google.com with SMTP id
 pf18-20020a17090b1d92b0290176233dff9dso285061pjb.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lGBwwuMebft1n7fqwgqXnl/bRl12rJdLeGCfwX1XGtk=;
 b=ng5VJdMREsasbQtxh7rDAlxLzx5pza+ciRvlAZpvGKAK8h1mtauxymxh+04XZipK6C
 kVLuTvqgcCfS79wNbtPubXtncaoKehXKnwP2020Mx7p+gF8htKyEWLKlsz/uqPUKZRZd
 3BlKb8os2jlPnW81x8VhvT2IcuYcHxQCu9z/dIRpdmAmZTQ8s0jXtT7UpWEYValaDUxp
 R0jKoM5f/1p1kGF/bWGwSgNs8kmu8G8ijNaCChVV7Ou+/byt3KrVZSs9HBLHWYkent4E
 fzH9Cxnm4tl83UxtBs+kxJHivNfUBXZDtCoKjDGViscLa+tT0nSHcIF86IXeHNtygg4C
 9kdw==
X-Gm-Message-State: AOAM530nSmWSLRTPsqz/cjLzBlyo/gVE4KFGTOEXNEtslYGJsApJPHvH
 V3XFCEYM4KbfLx8FwyBTr5TnSaRlJGRKOMkpu20iZDm1KYDTKno98eScQI7DmFxPf6he2Q097Jp
 5Ug9sRsh6VDnyIOk=
X-Received: by 2002:a17:90b:17c8:: with SMTP id
 me8mr12986768pjb.126.1626813281725; 
 Tue, 20 Jul 2021 13:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+XqiBrAtKNjU3rjTRKnip3NuxQdQzQx4LfMDOuO15SAs6gH+fDjkRvgdURIeAQtb6Ask3ew==
X-Received: by 2002:a17:90b:17c8:: with SMTP id
 me8mr12986735pjb.126.1626813281322; 
 Tue, 20 Jul 2021 13:34:41 -0700 (PDT)
Received: from localhost ([181.191.236.153])
 by smtp.gmail.com with ESMTPSA id 202sm25107854pfx.75.2021.07.20.13.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 13:34:40 -0700 (PDT)
Date: Tue, 20 Jul 2021 17:34:37 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 24/24] python/aqmp: add AsyncProtocol unit tests
Message-ID: <20210720203437.pzncze4y56phho3v@laptop.redhat>
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-25-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210717003253.457418-25-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 16, 2021 at 08:32:53PM -0400, John Snow wrote:
> This tests most of protocol.py -- From a hacked up Coverage.py run, it's
> at about 86%. There's a few error cases that aren't very well tested
> yet, they're hard to induce artificially so far. I'm working on it.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/tests/null_proto.py |  67 ++++++
>  python/tests/protocol.py   | 458 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 525 insertions(+)
>  create mode 100644 python/tests/null_proto.py
>  create mode 100644 python/tests/protocol.py
> 
> diff --git a/python/tests/null_proto.py b/python/tests/null_proto.py
> new file mode 100644
> index 00000000000..c697efc0001
> --- /dev/null
> +++ b/python/tests/null_proto.py
> @@ -0,0 +1,67 @@
> +import asyncio
> +
> +from qemu.aqmp.protocol import AsyncProtocol
> +
> +
> +class NullProtocol(AsyncProtocol[None]):
> +    """
> +    NullProtocol is a test mockup of an AsyncProtocol implementation.
> +
> +    It adds a fake_session instance variable that enables a code path
> +    that bypasses the actual connection logic, but still allows the
> +    reader/writers to start.
> +
> +    Because the message type is defined as None, an asyncio.Event named
> +    'trigger_input' is created that prohibits the reader from
> +    incessantly being able to yield None; this input can be poked to
> +    simulate an incoming message.
> +
> +    For testing symmetry with do_recv, an interface is added to "send" a
> +    Null message.
> +
> +    For testing purposes, a "simulate_disconnection" method is also
> +    added which allows us to trigger a bottom half disconnect without
> +    injecting any real errors into the reader/writer loops; in essence
> +    it performs exactly half of what disconnect() normally does.
> +    """
> +    def __init__(self, name=None):
> +        self.fake_session = False
> +        self.trigger_input: asyncio.Event
> +        super().__init__(name)
> +
> +    async def _establish_session(self):
> +        self.trigger_input = asyncio.Event()
> +        await super()._establish_session()
> +
> +    async def _do_accept(self, address, ssl=None):
> +        if not self.fake_session:
> +            await super()._do_accept(address, ssl)
> +
> +    async def _do_connect(self, address, ssl=None):
> +        if not self.fake_session:
> +            await super()._do_connect(address, ssl)
> +
> +    async def _do_recv(self) -> None:
> +        await self.trigger_input.wait()
> +        self.trigger_input.clear()
> +
> +    def _do_send(self, msg: None) -> None:
> +        pass
> +
> +    async def send_msg(self) -> None:
> +        await self._outgoing.put(None)
> +
> +    async def simulate_disconnect(self) -> None:
> +        # Simulates a bottom half disconnect, e.g. schedules a
> +        # disconnection but does not wait for it to complete. This is
> +        # used to put the loop into the DISCONNECTING state without
> +        # fully quiescing it back to IDLE; this is normally something
> +        # you cannot coax AsyncProtocol to do on purpose, but it will be
> +        # similar to what happens with an unhandled Exception in the
> +        # reader/writer.
> +        #
> +        # Under normal circumstances, the library design requires you to
> +        # await on disconnect(), which awaits the disconnect task and
> +        # returns bottom half errors as a pre-condition to allowing the
> +        # loop to return back to IDLE.
> +        self._schedule_disconnect()

Nitpick: Any reason for not using a docstring? I wouldn't mind if it was
a docstring instead. ;)

> diff --git a/python/tests/protocol.py b/python/tests/protocol.py
> new file mode 100644
> index 00000000000..2374d01365e
> --- /dev/null
> +++ b/python/tests/protocol.py
> @@ -0,0 +1,458 @@
> +import asyncio
> +from contextlib import contextmanager
> +import os
> +import socket
> +from tempfile import TemporaryDirectory
> +
> +import avocado
> +
> +from qemu.aqmp import ConnectError, Runstate
> +from qemu.aqmp.protocol import StateError
> +from qemu.aqmp.util import asyncio_run, create_task

Nitpick: Maybe an isort?

> +# An Avocado bug prevents us from defining this testing class in-line here:
> +from null_proto import NullProtocol

Is this what you are looking for?

https://github.com/avocado-framework/avocado/pull/4764

If not, can you point to the right issue, please?

> +@contextmanager
> +def jammed_socket():
> +    # This method opens up a random TCP port on localhost, then jams it.
> +    socks = []
> +
> +    try:
> +        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> +        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> +        sock.bind(('127.0.0.1', 0))
> +        sock.listen(1)
> +        address = sock.getsockname()
> +
> +        socks.append(sock)
> +
> +        # I don't *fully* understand why, but it takes *two* un-accepted
> +        # connections to start jamming the socket.
> +        for _ in range(2):
> +            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> +            sock.connect(address)
> +            socks.append(sock)
> +
> +        yield address
> +
> +    finally:
> +        for sock in socks:
> +            sock.close()
> +
> +
> +class Smoke(avocado.Test):
> +
> +    def setUp(self):
> +        self.proto = NullProtocol()
> +
> +    def test__repr__(self):
> +        self.assertEqual(
> +            repr(self.proto),
> +            "<NullProtocol runstate=IDLE>"
> +        )
> +
> +    def testRunstate(self):
> +        self.assertEqual(
> +            self.proto.runstate,
> +            Runstate.IDLE
> +        )
> +
> +    def testDefaultName(self):
> +        self.assertEqual(
> +            self.proto.name,
> +            None
> +        )
> +
> +    def testLogger(self):
> +        self.assertEqual(
> +            self.proto.logger.name,
> +            'qemu.aqmp.protocol'
> +        )
> +
> +    def testName(self):
> +        self.proto = NullProtocol('Steve')
> +
> +        self.assertEqual(
> +            self.proto.name,
> +            'Steve'
> +        )
> +
> +        self.assertEqual(
> +            self.proto.logger.name,
> +            'qemu.aqmp.protocol.Steve'
> +        )
> +
> +        self.assertEqual(
> +            repr(self.proto),
> +            "<NullProtocol name='Steve' runstate=IDLE>"
> +        )
> +
> +
> +class TestBase(avocado.Test):
> +
> +    def setUp(self):
> +        self.proto = NullProtocol(type(self).__name__)
> +        self.assertEqual(self.proto.runstate, Runstate.IDLE)
> +        self.runstate_watcher = None
> +
> +    def tearDown(self):
> +        self.assertEqual(self.proto.runstate, Runstate.IDLE)
> +
> +    async def _asyncSetUp(self):
> +        pass
> +
> +    async def _asyncTearDown(self):
> +        if self.runstate_watcher:
> +            await self.runstate_watcher
> +
> +    def _asyncRunner(self, test_coroutine):
> +        async def coroutine():
> +            await self._asyncSetUp()
> +            await test_coroutine
> +            await self._asyncTearDown()
> +
> +        asyncio_run(coroutine(), debug=True)
> +
> +    # Definitions
> +
> +    # The states we expect a "bad" connect/accept attempt to transition through
> +    BAD_CONNECTION_STATES = (
> +        Runstate.CONNECTING,
> +        Runstate.DISCONNECTING,
> +        Runstate.IDLE,
> +    )
> +
> +    # The states we expect a "good" session to transition through
> +    GOOD_CONNECTION_STATES = (
> +        Runstate.CONNECTING,
> +        Runstate.RUNNING,
> +        Runstate.DISCONNECTING,
> +        Runstate.IDLE,
> +    )
> +
> +    # Helpers
> +
> +    async def _watch_runstates(self, *states):
> +        # This launches a task alongside most tests below to confirm that the
> +        # sequence of runstate changes is exactly as anticipated.
> +
> +        async def _watcher():
> +            for state in states:
> +                new_state = await self.proto.runstate_changed()
> +                self.assertEqual(
> +                    new_state,
> +                    state,
> +                    msg=f"Expected state '{state.name}'",
> +                )
> +
> +        self.runstate_watcher = create_task(_watcher())
> +        # Kick the loop and force the task to block on the event.
> +        await asyncio.sleep(0)
> +
> +
> +class State(TestBase):
> +
> +    async def testSuperfluousDisconnect_(self):
> +        await self._watch_runstates(
> +            Runstate.DISCONNECTING,
> +            Runstate.IDLE,
> +        )
> +        await self.proto.disconnect()
> +
> +    def testSuperfluousDisconnect(self):
> +        self._asyncRunner(self.testSuperfluousDisconnect_())
> +
> +
> +class Connect(TestBase):
> +
> +    async def _bad_connection(self, family: str):
> +        assert family in ('INET', 'UNIX')
> +
> +        if family == 'INET':
> +            await self.proto.connect(('127.0.0.1', 0))
> +        elif family == 'UNIX':
> +            await self.proto.connect('/dev/null')
> +
> +    async def _hanging_connection(self):
> +        with jammed_socket() as addr:
> +            await self.proto.connect(addr)
> +
> +    async def _bad_connection_test(self, family: str):
> +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> +
> +        with self.assertRaises(ConnectError) as context:
> +            await self._bad_connection(family)
> +
> +        self.assertIsInstance(context.exception.exc, OSError)
> +        self.assertEqual(
> +            context.exception.error_message,
> +            "Failed to establish connection"
> +        )
> +
> +    def testBadINET(self):
> +        self._asyncRunner(self._bad_connection_test('INET'))
> +        # self.assertIsInstance(err.exc, ConnectionRefusedError)
> +
> +    def testBadUNIX(self):
> +        self._asyncRunner(self._bad_connection_test('UNIX'))
> +        # self.assertIsInstance(err.exc, ConnectionRefusedError)
> +
> +    async def testCancellation_(self):
> +        # Note that accept() cannot be cancelled outright, as it isn't a task.
> +        # However, we can wrap it in a task and cancel *that*.
> +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> +        task = run_as_task(self._hanging_connection(), allow_cancellation=True)
> +
> +        state = await self.proto.runstate_changed()
> +        self.assertEqual(state, Runstate.CONNECTING)
> +
> +        # This is insider baseball, but the connection attempt has
> +        # yielded *just* before the actual connection attempt, so kick
> +        # the loop to make sure it's truly wedged.
> +        await asyncio.sleep(0)
> +
> +        task.cancel()
> +        await task
> +
> +    def testCancellation(self):
> +        self._asyncRunner(self.testCancellation_())
> +
> +    async def testTimeout_(self):
> +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> +        task = run_as_task(self._hanging_connection())
> +
> +        # More insider baseball: to improve the speed of this test while
> +        # guaranteeing that the connection even gets a chance to start,
> +        # verify that the connection hangs *first*, then await the
> +        # result of the task with a nearly-zero timeout.
> +
> +        state = await self.proto.runstate_changed()
> +        self.assertEqual(state, Runstate.CONNECTING)
> +        await asyncio.sleep(0)
> +
> +        with self.assertRaises(asyncio.TimeoutError):
> +            await asyncio.wait_for(task, timeout=0)
> +
> +    def testTimeout(self):
> +        self._asyncRunner(self.testTimeout_())
> +
> +    async def testRequire_(self):
> +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> +        task = run_as_task(self._hanging_connection(), allow_cancellation=True)
> +
> +        state = await self.proto.runstate_changed()
> +        self.assertEqual(state, Runstate.CONNECTING)
> +
> +        with self.assertRaises(StateError) as context:
> +            await self._bad_connection('UNIX')
> +
> +        self.assertEqual(
> +            context.exception.error_message,
> +            "NullProtocol is currently connecting."
> +        )
> +        self.assertEqual(context.exception.state, Runstate.CONNECTING)
> +        self.assertEqual(context.exception.required, Runstate.IDLE)
> +
> +        task.cancel()
> +        await task
> +
> +    def testRequire(self):
> +        self._asyncRunner(self.testRequire_())
> +
> +    async def testImplicitRunstateInit_(self):
> +        # This tests what happens if we do not wait on the
> +        # runstate until AFTER we connect, i.e., connect()/accept()
> +        # themselves initialize the runstate event. All of the above
> +        # tests force the initialization by waiting on the runstate
> +        # *first*.
> +        task = run_as_task(self._hanging_connection(), allow_cancellation=True)
> +
> +        # Kick the loop to coerce the state change
> +        await asyncio.sleep(0)
> +        assert self.proto.runstate == Runstate.CONNECTING
> +
> +        # We already missed the transition to CONNECTING
> +        await self._watch_runstates(Runstate.DISCONNECTING, Runstate.IDLE)
> +
> +        task.cancel()
> +        await task
> +
> +    def testImplicitRunstateInit(self):
> +        self._asyncRunner(self.testImplicitRunstateInit_())
> +
> +
> +class Accept(Connect):
> +
> +    async def _bad_connection(self, family: str):
> +        assert family in ('INET', 'UNIX')
> +
> +        if family == 'INET':
> +            await self.proto.accept(('example.com', 1))
> +        elif family == 'UNIX':
> +            await self.proto.accept('/dev/null')
> +
> +    async def _hanging_connection(self):
> +        with TemporaryDirectory(suffix='.aqmp') as tmpdir:
> +            sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
> +            await self.proto.accept(sock)
> +
> +
> +class FakeSession(TestBase):
> +
> +    def setUp(self):
> +        super().setUp()
> +        self.proto.fake_session = True
> +
> +    async def _asyncSetUp(self):
> +        await super()._asyncSetUp()
> +        await self._watch_runstates(*self.GOOD_CONNECTION_STATES)
> +
> +    async def _asyncTearDown(self):
> +        await self.proto.disconnect()
> +        await super()._asyncTearDown()
> +
> +    ####
> +
> +    async def testFakeConnect_(self):
> +        await self.proto.connect('/not/a/real/path')
> +        self.assertEqual(self.proto.runstate, Runstate.RUNNING)
> +
> +    def testFakeConnect(self):
> +        """Test the full state lifecycle (via connect) with a no-op session."""
> +        self._asyncRunner(self.testFakeConnect_())
> +
> +    async def testFakeAccept_(self):
> +        await self.proto.accept('/not/a/real/path')
> +        self.assertEqual(self.proto.runstate, Runstate.RUNNING)
> +
> +    def testFakeAccept(self):
> +        """Test the full state lifecycle (via accept) with a no-op session."""
> +        self._asyncRunner(self.testFakeAccept_())
> +
> +    async def testFakeRecv_(self):
> +        await self.proto.accept('/not/a/real/path')
> +
> +        logname = self.proto.logger.name
> +        with self.assertLogs(logname, level='DEBUG') as context:
> +            self.proto.trigger_input.set()
> +            self.proto.trigger_input.clear()
> +            await asyncio.sleep(0)  # Kick reader.
> +
> +        self.assertEqual(
> +            context.output,
> +            [f"DEBUG:{logname}:<-- None"],
> +        )
> +
> +    def testFakeRecv(self):
> +        """Test receiving a fake/null message."""
> +        self._asyncRunner(self.testFakeRecv_())
> +
> +    async def testFakeSend_(self):
> +        await self.proto.accept('/not/a/real/path')
> +
> +        logname = self.proto.logger.name
> +        with self.assertLogs(logname, level='DEBUG') as context:
> +            # Cheat: Send a Null message to nobody.
> +            await self.proto.send_msg()
> +            # Kick writer; awaiting on a queue.put isn't sufficient to yield.
> +            await asyncio.sleep(0)
> +
> +        self.assertEqual(
> +            context.output,
> +            [f"DEBUG:{logname}:--> None"],
> +        )
> +
> +    def testFakeSend(self):
> +        """Test sending a fake/null message."""
> +        self._asyncRunner(self.testFakeSend_())
> +
> +    async def _prod_session_api(
> +            self,
> +            current_state: Runstate,
> +            error_message: str,
> +            accept: bool = True
> +    ):
> +        with self.assertRaises(StateError) as context:
> +            if accept:
> +                await self.proto.accept('/not/a/real/path')
> +            else:
> +                await self.proto.connect('/not/a/real/path')
> +
> +        self.assertEqual(context.exception.error_message, error_message)
> +        self.assertEqual(context.exception.state, current_state)
> +        self.assertEqual(context.exception.required, Runstate.IDLE)
> +
> +    async def testAcceptRequireRunning_(self):
> +        await self.proto.accept('/not/a/real/path')
> +
> +        await self._prod_session_api(
> +            Runstate.RUNNING,
> +            "NullProtocol is already connected and running.",
> +            accept=True,
> +        )
> +
> +    def testAcceptRequireRunning(self):
> +        """Test that accept() cannot be called when Runstate=RUNNING"""
> +        self._asyncRunner(self.testAcceptRequireRunning_())
> +
> +    async def testConnectRequireRunning_(self):
> +        await self.proto.accept('/not/a/real/path')
> +
> +        await self._prod_session_api(
> +            Runstate.RUNNING,
> +            "NullProtocol is already connected and running.",
> +            accept=False,
> +        )
> +
> +    def testConnectRequireRunning(self):
> +        """Test that connect() cannot be called when Runstate=RUNNING"""
> +        self._asyncRunner(self.testConnectRequireRunning_())
> +
> +    async def testAcceptRequireDisconnecting_(self):
> +        await self.proto.accept('/not/a/real/path')
> +
> +        # Cheat: force a disconnect.
> +        await self.proto.simulate_disconnect()
> +
> +        await self._prod_session_api(
> +            Runstate.DISCONNECTING,
> +            ("NullProtocol is disconnecting."
> +             " Call disconnect() to return to IDLE state."),
> +            accept=True,
> +        )
> +
> +    def testAcceptRequireDisconnecting(self):
> +        """Test that accept() cannot be called when Runstate=DISCONNECTING"""
> +        self._asyncRunner(self.testAcceptRequireDisconnecting_())
> +
> +    async def testConnectRequireDisconnecting_(self):
> +        await self.proto.accept('/not/a/real/path')
> +
> +        # Cheat: force a disconnect.
> +        await self.proto.simulate_disconnect()
> +
> +        await self._prod_session_api(
> +            Runstate.DISCONNECTING,
> +            ("NullProtocol is disconnecting."
> +             " Call disconnect() to return to IDLE state."),
> +            accept=False,
> +        )
> +
> +    def testConnectRequireDisconnecting(self):
> +        """Test that connect() cannot be called when Runstate=DISCONNECTING"""
> +        self._asyncRunner(self.testConnectRequireDisconnecting_())
> -- 
> 2.31.1

Besides that, I just would like to bring to the table that Avocado has
now a basic support for coroutines as tests that might help here. IIUC,
some of the boilerplate code (and duplicated methods) could be removed
with this:

https://github.com/avocado-framework/avocado/pull/4788

In any case, I understand if the latest version is not an option here,
so:

Reviewed-by: Beraldo Leal <bleal@redhat.com>

Thanks,
--
Beraldo


