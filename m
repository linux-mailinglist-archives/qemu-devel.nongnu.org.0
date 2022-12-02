Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B363A640F86
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 21:58:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1D6Z-0002bR-8t; Fri, 02 Dec 2022 15:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1D6W-0002b3-FN
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 15:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1D6U-0005k6-6T
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 15:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670014669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LtpMlESoP4Fr1xfNDZyiLrfu9iYEZNuX1TIVTyfL4gM=;
 b=gOZSNno7guElbeWGOmTqADMXFXt4UHiQkFn/pnN594cgsjI4xq3rC662XM1IgNwm9R/ZLc
 E/oPYSpK9YTQjdmFgNEaJ2r67bv4O8jpOMIFTxM96gXJ1Zd8OYejwD4z9gdeAQTzwDrkSf
 /ispQeVdbr2X1/e2Bpe2WPv5qf4gzFk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-taP3TTdcPsqbBcHNqA3yig-1; Fri, 02 Dec 2022 15:57:47 -0500
X-MC-Unique: taP3TTdcPsqbBcHNqA3yig-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 687871C07598;
 Fri,  2 Dec 2022 20:57:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05CDE47505E;
 Fri,  2 Dec 2022 20:57:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH] qemu/machine: add asyncio process-management demo
Date: Fri,  2 Dec 2022 15:57:44 -0500
Message-Id: <20221202205744.591462-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

This is just an RFC to show a technique for how to watch terminal input
using asyncio. This is just a *demo* and elides many things for
simplicity; namely I don't create a QMP monitor nor a guest console
socket.

What I really wanted feedback on was an API for consuming information
from an async stream. In this demo, that's QEMU's terminal output
(stdout, stderr -- usually pretty minimal information in most
circumstances except in error cases) but the same techniques may apply
to guest console output, too.

Please see comments and docstrings inline for RFC questions and other
observations.

To test it, navigate to qemu.git/python, and then invoke e.g.;

> python3 -m qemu.machine.demo /usr/bin/qemu-system-x86_64 --help

(Note, this demo requires Python 3.7+; not as a fundamental necessity,
but 3.6 requires some ifdef style tricks to run that I didn't bother to
code in for a quick demo. Sorry.)

or try it with a bad flag on purpose (--frobnozz), no flag at all, or
try with *any* executable of your choice to see how stdout/stderr, return
codes and newline terminations are handled.

Also try:

> python3 -m qemu.machine.demo /usr/bin/echo -n "no newline?"
> python3 -m qemu.machine.demo /usr/bin/yes "I hate the antichrist"

One huge caveat:

I would *really have liked* to offer an interface that's exactly
equivalent to asyncio.StreamReader() that would allow a user to
asynchronously *consume* data using the same API that Python
offers. However, I could not find a way to provide a kind of
"pass-through" that also provided logging, logging-to-file, in-memory
buffering, etc.

I briefly experimented with using an actual pipe via os.pipe() for which
I could asynchronously read and write, but the overhead of asyncio
machinery here felt a bit high and perhaps simultaneously overkill and
porcelain. It's possible I'm missing an easier way to provide this type
of feature, but it seems like the sort of thing we might want for
e.g. asynchronously watching for lines from a guest console.

I'm not sure if it will be possible to add. If there's interest and it
seems worth pursuing, I'll try to push on it. Otherwise, maybe what we
have here is "good enough"?

*shrug*

Anyway, thanks!

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/demo.py | 276 ++++++++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)
 create mode 100644 python/qemu/machine/demo.py

diff --git a/python/qemu/machine/demo.py b/python/qemu/machine/demo.py
new file mode 100644
index 00000000000..329c2fc5532
--- /dev/null
+++ b/python/qemu/machine/demo.py
@@ -0,0 +1,276 @@
+"""
+This module is a quick demonstration to show how to asynchronously
+watch terminal output using Python asyncio, and how it might relate to
+improving QEMUMachine.
+
+This demo does NOT include console output nor a QMP monitor, but the
+techniques being applied here might be applied to guest console
+interactions.
+"""
+
+import asyncio
+import io
+import locale
+import logging
+import os
+from pathlib import Path
+import resource
+import sys
+from typing import (
+    Any,
+    BinaryIO,
+    List,
+    Optional,
+    Union,
+)
+
+
+class StreamWatcher:
+    """
+    StreamWatcher is a bit of a quick hack that consumes data (as
+    bytes) from an asyncio.StreamReader and relays it to several other
+    sources concurrently.
+
+    Conceptually, it's kind of like "tee": data from one pipe is
+    forwarded to several.
+
+    A single instance of this class watches either stdout or
+    stderr. (A user could combine these streams and then a single
+    instance of this class could watch both.)
+
+    The data stream being watched is forwarded to three destinations:
+
+    (1) BytesIO (In-memory buffer)
+        --------------------------
+
+        The data is buffered directly into a BytesIO object. This isn't
+        used to do anything further, but a caller could get the entire
+        stream (so far) at any time. This mimics the "iolog" property of
+        QEMUMachine, which we have used in the past to show the console
+        output on various error conditions or to assert that certain
+        patterns have occurred in iotests.
+
+        This can grow without bound, which might be a bad idea. It seems
+        convenient to have on by default, but for more serious uses, you
+        may want to actually disable this. Maybe it'd be useful to be
+        able to configure which sources you want active by default.
+
+    (2) External logfile
+        ----------------
+
+        Data is written byte-for-byte into an external logfile. In this
+        demo, StreamWatcher does not own the file object so that two
+        StreamWatchers can share the same logfile -- so that a
+        stderr-watcher and a stdout-watcher can log to the same file.
+
+        This destination adds the "logfile" and "flush" parameters to
+        the initializer; flush=True can be used for the stderr-watcher
+        if desired to flush the file to disk without waiting for a
+        newline.
+
+        This might be a bit extraneous since we already have an
+        in-memory log, but I added it here purely because if all else
+        fails -- if we don't ever print out the in-memory buffer and we
+        don't enable logging -- we can likely rely on a good
+        old-fashioned solid bohr-model file.
+
+    (3) Python Logging Interface
+        ------------------------
+
+        Data is manually re-buffered and when a newline is encountered,
+        the buffer is flushed into the Python logging subsystem. This
+        may mean that if terminal output is not terminated with a
+        newline, we may hang onto it in the buffer. When EOF is
+        encountered, any remaining information in the buffer is flushed
+        with a newline marker inserted to indicate that a newline was
+        not actually seen. (This is how FiSH seems to handle it, and I
+        like it.)
+
+        This destination adds two more parameters: logger and level. The
+        logger is the Logger instance to log to, while the level
+        determines which logging level to use for messages in this
+        stream. In this demo, I use "INFO" for stdout and "WARNING" for
+        stderr. If the Python logging subsystem is not configured, the
+        default behavior is to hide "INFO" messages but to show
+        "WARNING" messages. This might be the most useful behavior for
+        helping to surface potential errors, but it's possible it will
+        be a pain for certain kinds of iotesting.
+    """
+    # pylint: disable=too-few-public-methods
+    def __init__(
+            self,
+            pipe: asyncio.StreamReader,
+            logger: logging.Logger,
+            level: int,
+            logfile: BinaryIO,
+            flush: bool = False):
+        self.pipe = pipe
+        self.logfile = logfile
+        self.logger = logger
+        self.level = level
+        self.flush = flush
+
+        self.data = io.BytesIO()
+        self.buffer = bytearray()
+
+        # We need an encoding for whatever we're watching.
+        # For console output, assume it's whatever our locale says.
+        # If this guess is wrong, go ahead and change it, pal.
+        _, encoding = locale.getlocale()
+        self.encoding = encoding or 'UTF-8'
+
+    async def run(self) -> None:
+        """
+        Run forever, waiting for new data.
+
+        When the stream hits EOF, return.
+        """
+        self.logger.debug("StreamWatcher starting")
+        pagesize = resource.getpagesize()
+        while True:
+            data = await self.pipe.read(pagesize)
+            await self._handle_data(data)
+            if not data:
+                break
+        self.logger.debug("StreamWatcher exiting")
+
+    async def _handle_data(self, data: bytes) -> None:
+        # Destination A: Internal line-based buffer
+        await self._buffer_data(data)
+
+        # Destination B: Internal byte-based log
+        self.data.write(data)
+
+        # Destination C: External logfile
+        self.logfile.write(data)
+        if self.flush:
+            self.logfile.flush()
+
+    async def _buffer_data(self, data: bytes) -> None:
+        self.buffer.extend(data)
+        if not self.buffer:
+            return
+
+        lines = self.buffer.split(b'\n')
+        if lines[-1]:  # trailing line was not (yet) terminated
+            self.buffer = lines[-1]
+        else:
+            self.buffer.clear()
+
+        for line in lines[:-1]:
+            await self._handle_line(
+                line.decode(self.encoding, errors='replace'))
+
+        if data == b'' and self.buffer:
+            # EOL; flush the remainder of the buffer.
+            await self._handle_line(
+                self.buffer.decode(self.encoding, errors='replace') + '⏎')
+
+    async def _handle_line(self, line: str) -> None:
+        self.logger.log(self.level, line)
+
+
+class ExecManager:
+    """
+    Simple demo for executing a child process while gathering its output.
+    """
+    logger = logging.getLogger(__name__)
+
+    def __init__(self) -> None:
+        self.process: Optional[asyncio.subprocess.Process] = None
+        self.log: Optional[BinaryIO] = None
+        self.stdout: Optional[StreamWatcher] = None
+        self.stderr: Optional[StreamWatcher] = None
+        self._tasks: List[asyncio.Task[Any]] = []
+
+    async def launch(self, binary: Union[str, Path], *args: str) -> None:
+        """Launch the executable, but don't wait for it."""
+        self.logger.debug("launching '%s'", binary)
+        self.logger.debug("%s", ' '.join((str(binary),) + args))
+        self.process = await asyncio.create_subprocess_exec(
+            str(binary),
+            *args,
+            stdin=asyncio.subprocess.DEVNULL,
+            stdout=asyncio.subprocess.PIPE,
+            stderr=asyncio.subprocess.PIPE,
+        )
+        # Type hints for mypy
+        assert self.process.stdout is not None
+        assert self.process.stderr is not None
+
+        self.log = open("qemu.log", "wb")
+        self.stdout = StreamWatcher(
+            self.process.stdout,
+            self.logger.getChild('stdout'),
+            logging.INFO,
+            self.log)
+        self.stderr = StreamWatcher(
+            self.process.stderr,
+            self.logger.getChild('stderr'),
+            logging.WARNING,
+            self.log,
+            flush=True)
+        self._tasks.append(asyncio.create_task(self.stdout.run()))
+        self._tasks.append(asyncio.create_task(self.stderr.run()))
+
+    async def wait(self) -> None:
+        """Wait for the process and all watchers to finish."""
+        if self.process is None:
+            raise Exception("Nothing's running, pal!")
+        self.logger.debug("bundling reader tasks and process waiter ...")
+        task = asyncio.gather(
+            *self._tasks,
+            self.process.wait(),
+            return_exceptions=True,
+        )
+        # return_exceptions=True means that if any coroutine raises an
+        # exception, all other coroutines will be cancelled and waited on.
+        # Without this, the other coroutines continue to run after first
+        # exception.
+        self.logger.debug("waiting on bundled task ...")
+        await task
+        self.logger.debug("bundled task done.")
+        if self.log is not None:
+            self.logger.debug("closing logfile")
+            self.log.close()
+            if self.process.returncode == 0:
+                self.logger.debug("No errors detected; deleting qemu.log")
+                os.unlink("qemu.log")
+            else:
+                self.logger.debug(
+                    "Process returned non-zero returncode, keeping qemu.log")
+            self.log = None
+
+
+async def main(binary: str, *args: str) -> int:
+    """Run a subprocess, print out some stuff, have a good time."""
+    logging.basicConfig(level=logging.DEBUG)
+    proc = ExecManager()
+    await proc.launch(binary, *args)
+    assert proc.stdout is not None
+    assert proc.stderr is not None
+    logging.debug("process launched; waiting on termination")
+    await proc.wait()
+    logging.debug("process terminated.")
+
+    stdout = proc.stdout.data.getvalue()
+    if stdout:
+        print("========== stdout ==========")
+        print(stdout.decode(proc.stdout.encoding), end='')
+        print("=" * 80)
+
+    stderr = proc.stderr.data.getvalue()
+    if stderr:
+        print("========== stderr ==========")
+        print(stderr.decode(proc.stderr.encoding), end='')
+        print("=" * 80)
+
+    assert proc.process is not None
+    assert proc.process.returncode is not None
+    print(f"process returncode was {proc.process.returncode}")
+    print("OK, seeya!")
+    return proc.process.returncode
+
+
+if __name__ == '__main__':
+    sys.exit(asyncio.run(main(*sys.argv[1:])))
-- 
2.38.1


