Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA66411ED
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 01:22:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1GGf-00052P-M5; Fri, 02 Dec 2022 19:20:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1GGc-00051t-Os
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1GGZ-0006vG-Ml
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670026826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQI3vTAc/zVrbt53aUWHjfzW0kazdDMPRjXmc39UMhw=;
 b=RucijQHoRON1g/PF6egxAVMGuptnUwG/+YfMbxQJpic75iAIV6BiRqRUPHmjXy64tBweX8
 u8oGhoMaM9CtuZc5F6vOtbONWbTC+gRsMyUeWrp0VIafP0nJkTErxKiteAogMTkO/XRD64
 R433AjMLu6eX6v1cILsutBsUNFTxnYc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-UzP-dzm_NNmrFT1_cTE_zA-1; Fri, 02 Dec 2022 19:20:24 -0500
X-MC-Unique: UzP-dzm_NNmrFT1_cTE_zA-1
Received: by mail-lf1-f70.google.com with SMTP id
 l6-20020ac25546000000b004b55de13741so225138lfk.6
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 16:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQI3vTAc/zVrbt53aUWHjfzW0kazdDMPRjXmc39UMhw=;
 b=NCfBsOg0lruDmCsmVLyXjhDU4CQ+YV1hV7ad4AlSfxVBUsLISD0Nh1vDLwDh2F6IyG
 zaU4oo9svV0c2qvXvslIUZcfQGgStl/2wfWgIgrgLqW/vF+mL8YbvShU+vKoloIEnnoy
 +bHL2aB5OykPKjRx5y1VlFuJ/dUJEo4i798MirXKtAP+KHyBYdrGBS7z7VLpZ0m3wG+n
 2L/gf8K6PUZXdElV0WvgJrMS6GVojo3TTSyJmeF0HPAQHo3Y/MgwiuQv8GIOv5zRAj8D
 WPOKzRdSng/VZ7bAndWxmsJkfFaDUJhNAM4hQxJoq+6ijlM/qEXDmoaXSYezH0GHm7Qj
 8ZIA==
X-Gm-Message-State: ANoB5pnvirO8S9IU89ndtGM5oYrPsE+6vun0YAA/07dF5XYAE3cXsTus
 mkvrFw3GqR1qxmBQPSr+R85+qSsfAid0UKo0csFu4pHFFZTyyfhK1DUf280KsE+JOhNFfwtZgbw
 4t4gmOx2809UPD4hDbHzi5JB0mgV1c2k=
X-Received: by 2002:a05:6512:3c8e:b0:4ab:714b:7d1b with SMTP id
 h14-20020a0565123c8e00b004ab714b7d1bmr23685737lfv.621.1670026821859; 
 Fri, 02 Dec 2022 16:20:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5zFMAWYPIPqDUE7rWC1S+emzG5f4iga+0y9V0yi2315JM4pAQCId6nAyQtDaogBoB2b7MIczg+gwHFavOIdoA=
X-Received: by 2002:a05:6512:3c8e:b0:4ab:714b:7d1b with SMTP id
 h14-20020a0565123c8e00b004ab714b7d1bmr23685729lfv.621.1670026821454; Fri, 02
 Dec 2022 16:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20221202205744.591462-1-jsnow@redhat.com>
In-Reply-To: <20221202205744.591462-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 2 Dec 2022 19:20:09 -0500
Message-ID: <CAFn=p-Y5a9UTZOzJWG-=vM-WFtnRMPJvXLp5P1Pme0Voemmqow@mail.gmail.com>
Subject: Re: [PATCH] qemu/machine: add asyncio process-management demo
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Dec 2, 2022 at 3:57 PM John Snow <jsnow@redhat.com> wrote:
>
> This is just an RFC to show a technique for how to watch terminal input
> using asyncio. This is just a *demo* and elides many things for
> simplicity; namely I don't create a QMP monitor nor a guest console
> socket.
>
> What I really wanted feedback on was an API for consuming information
> from an async stream. In this demo, that's QEMU's terminal output
> (stdout, stderr -- usually pretty minimal information in most
> circumstances except in error cases) but the same techniques may apply
> to guest console output, too.
>
> Please see comments and docstrings inline for RFC questions and other
> observations.
>
> To test it, navigate to qemu.git/python, and then invoke e.g.;
>
> > python3 -m qemu.machine.demo /usr/bin/qemu-system-x86_64 --help
>
> (Note, this demo requires Python 3.7+; not as a fundamental necessity,
> but 3.6 requires some ifdef style tricks to run that I didn't bother to
> code in for a quick demo. Sorry.)
>
> or try it with a bad flag on purpose (--frobnozz), no flag at all, or
> try with *any* executable of your choice to see how stdout/stderr, return
> codes and newline terminations are handled.
>
> Also try:
>
> > python3 -m qemu.machine.demo /usr/bin/echo -n "no newline?"
> > python3 -m qemu.machine.demo /usr/bin/yes "I hate the antichrist"

*cough* this is a bit of an inside joke that I forgot to edit out of my dra=
ft.
Context is https://i.kym-cdn.com/photos/images/original/002/368/100/427
(Does that help? No? Oh well.)

>
> One huge caveat:
>
> I would *really have liked* to offer an interface that's exactly
> equivalent to asyncio.StreamReader() that would allow a user to
> asynchronously *consume* data using the same API that Python
> offers. However, I could not find a way to provide a kind of
> "pass-through" that also provided logging, logging-to-file, in-memory
> buffering, etc.
>
> I briefly experimented with using an actual pipe via os.pipe() for which
> I could asynchronously read and write, but the overhead of asyncio
> machinery here felt a bit high and perhaps simultaneously overkill and
> porcelain. It's possible I'm missing an easier way to provide this type
> of feature, but it seems like the sort of thing we might want for
> e.g. asynchronously watching for lines from a guest console.
>
> I'm not sure if it will be possible to add. If there's interest and it
> seems worth pursuing, I'll try to push on it. Otherwise, maybe what we
> have here is "good enough"?
>
> *shrug*
>
> Anyway, thanks!
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/demo.py | 276 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 276 insertions(+)
>  create mode 100644 python/qemu/machine/demo.py
>
> diff --git a/python/qemu/machine/demo.py b/python/qemu/machine/demo.py
> new file mode 100644
> index 00000000000..329c2fc5532
> --- /dev/null
> +++ b/python/qemu/machine/demo.py
> @@ -0,0 +1,276 @@
> +"""
> +This module is a quick demonstration to show how to asynchronously
> +watch terminal output using Python asyncio, and how it might relate to
> +improving QEMUMachine.
> +
> +This demo does NOT include console output nor a QMP monitor, but the
> +techniques being applied here might be applied to guest console
> +interactions.
> +"""
> +
> +import asyncio
> +import io
> +import locale
> +import logging
> +import os
> +from pathlib import Path
> +import resource
> +import sys
> +from typing import (
> +    Any,
> +    BinaryIO,
> +    List,
> +    Optional,
> +    Union,
> +)
> +
> +
> +class StreamWatcher:
> +    """
> +    StreamWatcher is a bit of a quick hack that consumes data (as
> +    bytes) from an asyncio.StreamReader and relays it to several other
> +    sources concurrently.
> +
> +    Conceptually, it's kind of like "tee": data from one pipe is
> +    forwarded to several.
> +
> +    A single instance of this class watches either stdout or
> +    stderr. (A user could combine these streams and then a single
> +    instance of this class could watch both.)
> +
> +    The data stream being watched is forwarded to three destinations:
> +
> +    (1) BytesIO (In-memory buffer)
> +        --------------------------
> +
> +        The data is buffered directly into a BytesIO object. This isn't
> +        used to do anything further, but a caller could get the entire
> +        stream (so far) at any time. This mimics the "iolog" property of
> +        QEMUMachine, which we have used in the past to show the console
> +        output on various error conditions or to assert that certain
> +        patterns have occurred in iotests.
> +
> +        This can grow without bound, which might be a bad idea. It seems
> +        convenient to have on by default, but for more serious uses, you
> +        may want to actually disable this. Maybe it'd be useful to be
> +        able to configure which sources you want active by default.
> +
> +    (2) External logfile
> +        ----------------
> +
> +        Data is written byte-for-byte into an external logfile. In this
> +        demo, StreamWatcher does not own the file object so that two
> +        StreamWatchers can share the same logfile -- so that a
> +        stderr-watcher and a stdout-watcher can log to the same file.
> +
> +        This destination adds the "logfile" and "flush" parameters to
> +        the initializer; flush=3DTrue can be used for the stderr-watcher
> +        if desired to flush the file to disk without waiting for a
> +        newline.
> +
> +        This might be a bit extraneous since we already have an
> +        in-memory log, but I added it here purely because if all else
> +        fails -- if we don't ever print out the in-memory buffer and we
> +        don't enable logging -- we can likely rely on a good
> +        old-fashioned solid bohr-model file.
> +
> +    (3) Python Logging Interface
> +        ------------------------
> +
> +        Data is manually re-buffered and when a newline is encountered,
> +        the buffer is flushed into the Python logging subsystem. This
> +        may mean that if terminal output is not terminated with a
> +        newline, we may hang onto it in the buffer. When EOF is
> +        encountered, any remaining information in the buffer is flushed
> +        with a newline marker inserted to indicate that a newline was
> +        not actually seen. (This is how FiSH seems to handle it, and I
> +        like it.)
> +
> +        This destination adds two more parameters: logger and level. The
> +        logger is the Logger instance to log to, while the level
> +        determines which logging level to use for messages in this
> +        stream. In this demo, I use "INFO" for stdout and "WARNING" for
> +        stderr. If the Python logging subsystem is not configured, the
> +        default behavior is to hide "INFO" messages but to show
> +        "WARNING" messages. This might be the most useful behavior for
> +        helping to surface potential errors, but it's possible it will
> +        be a pain for certain kinds of iotesting.
> +    """
> +    # pylint: disable=3Dtoo-few-public-methods
> +    def __init__(
> +            self,
> +            pipe: asyncio.StreamReader,
> +            logger: logging.Logger,
> +            level: int,
> +            logfile: BinaryIO,
> +            flush: bool =3D False):
> +        self.pipe =3D pipe
> +        self.logfile =3D logfile
> +        self.logger =3D logger
> +        self.level =3D level
> +        self.flush =3D flush
> +
> +        self.data =3D io.BytesIO()
> +        self.buffer =3D bytearray()
> +
> +        # We need an encoding for whatever we're watching.
> +        # For console output, assume it's whatever our locale says.
> +        # If this guess is wrong, go ahead and change it, pal.
> +        _, encoding =3D locale.getlocale()
> +        self.encoding =3D encoding or 'UTF-8'
> +
> +    async def run(self) -> None:
> +        """
> +        Run forever, waiting for new data.
> +
> +        When the stream hits EOF, return.
> +        """
> +        self.logger.debug("StreamWatcher starting")
> +        pagesize =3D resource.getpagesize()
> +        while True:
> +            data =3D await self.pipe.read(pagesize)
> +            await self._handle_data(data)
> +            if not data:
> +                break
> +        self.logger.debug("StreamWatcher exiting")
> +
> +    async def _handle_data(self, data: bytes) -> None:
> +        # Destination A: Internal line-based buffer
> +        await self._buffer_data(data)
> +
> +        # Destination B: Internal byte-based log
> +        self.data.write(data)
> +
> +        # Destination C: External logfile
> +        self.logfile.write(data)
> +        if self.flush:
> +            self.logfile.flush()
> +
> +    async def _buffer_data(self, data: bytes) -> None:
> +        self.buffer.extend(data)
> +        if not self.buffer:
> +            return
> +
> +        lines =3D self.buffer.split(b'\n')
> +        if lines[-1]:  # trailing line was not (yet) terminated
> +            self.buffer =3D lines[-1]
> +        else:
> +            self.buffer.clear()
> +
> +        for line in lines[:-1]:
> +            await self._handle_line(
> +                line.decode(self.encoding, errors=3D'replace'))
> +
> +        if data =3D=3D b'' and self.buffer:
> +            # EOL; flush the remainder of the buffer.
> +            await self._handle_line(
> +                self.buffer.decode(self.encoding, errors=3D'replace') + =
'=E2=8F=8E')
> +
> +    async def _handle_line(self, line: str) -> None:
> +        self.logger.log(self.level, line)
> +
> +
> +class ExecManager:
> +    """
> +    Simple demo for executing a child process while gathering its output=
.
> +    """
> +    logger =3D logging.getLogger(__name__)
> +
> +    def __init__(self) -> None:
> +        self.process: Optional[asyncio.subprocess.Process] =3D None
> +        self.log: Optional[BinaryIO] =3D None
> +        self.stdout: Optional[StreamWatcher] =3D None
> +        self.stderr: Optional[StreamWatcher] =3D None
> +        self._tasks: List[asyncio.Task[Any]] =3D []
> +
> +    async def launch(self, binary: Union[str, Path], *args: str) -> None=
:
> +        """Launch the executable, but don't wait for it."""
> +        self.logger.debug("launching '%s'", binary)
> +        self.logger.debug("%s", ' '.join((str(binary),) + args))
> +        self.process =3D await asyncio.create_subprocess_exec(
> +            str(binary),
> +            *args,
> +            stdin=3Dasyncio.subprocess.DEVNULL,
> +            stdout=3Dasyncio.subprocess.PIPE,
> +            stderr=3Dasyncio.subprocess.PIPE,
> +        )
> +        # Type hints for mypy
> +        assert self.process.stdout is not None
> +        assert self.process.stderr is not None
> +
> +        self.log =3D open("qemu.log", "wb")
> +        self.stdout =3D StreamWatcher(
> +            self.process.stdout,
> +            self.logger.getChild('stdout'),
> +            logging.INFO,
> +            self.log)
> +        self.stderr =3D StreamWatcher(
> +            self.process.stderr,
> +            self.logger.getChild('stderr'),
> +            logging.WARNING,
> +            self.log,
> +            flush=3DTrue)
> +        self._tasks.append(asyncio.create_task(self.stdout.run()))
> +        self._tasks.append(asyncio.create_task(self.stderr.run()))
> +
> +    async def wait(self) -> None:
> +        """Wait for the process and all watchers to finish."""
> +        if self.process is None:
> +            raise Exception("Nothing's running, pal!")
> +        self.logger.debug("bundling reader tasks and process waiter ..."=
)
> +        task =3D asyncio.gather(
> +            *self._tasks,
> +            self.process.wait(),
> +            return_exceptions=3DTrue,
> +        )
> +        # return_exceptions=3DTrue means that if any coroutine raises an
> +        # exception, all other coroutines will be cancelled and waited o=
n.
> +        # Without this, the other coroutines continue to run after first
> +        # exception.
> +        self.logger.debug("waiting on bundled task ...")
> +        await task
> +        self.logger.debug("bundled task done.")
> +        if self.log is not None:
> +            self.logger.debug("closing logfile")
> +            self.log.close()
> +            if self.process.returncode =3D=3D 0:
> +                self.logger.debug("No errors detected; deleting qemu.log=
")
> +                os.unlink("qemu.log")
> +            else:
> +                self.logger.debug(
> +                    "Process returned non-zero returncode, keeping qemu.=
log")
> +            self.log =3D None
> +
> +
> +async def main(binary: str, *args: str) -> int:
> +    """Run a subprocess, print out some stuff, have a good time."""
> +    logging.basicConfig(level=3Dlogging.DEBUG)
> +    proc =3D ExecManager()
> +    await proc.launch(binary, *args)
> +    assert proc.stdout is not None
> +    assert proc.stderr is not None
> +    logging.debug("process launched; waiting on termination")
> +    await proc.wait()
> +    logging.debug("process terminated.")
> +
> +    stdout =3D proc.stdout.data.getvalue()
> +    if stdout:
> +        print("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D stdout =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D")
> +        print(stdout.decode(proc.stdout.encoding), end=3D'')
> +        print("=3D" * 80)
> +
> +    stderr =3D proc.stderr.data.getvalue()
> +    if stderr:
> +        print("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D stderr =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D")
> +        print(stderr.decode(proc.stderr.encoding), end=3D'')
> +        print("=3D" * 80)
> +
> +    assert proc.process is not None
> +    assert proc.process.returncode is not None
> +    print(f"process returncode was {proc.process.returncode}")
> +    print("OK, seeya!")
> +    return proc.process.returncode
> +
> +
> +if __name__ =3D=3D '__main__':
> +    sys.exit(asyncio.run(main(*sys.argv[1:])))
> --
> 2.38.1
>


