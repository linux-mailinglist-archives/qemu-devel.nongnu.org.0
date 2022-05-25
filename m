Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C753417C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:26:59 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttqb-0006M0-Tz
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nttWj-00038A-PT
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nttWh-0004vN-RW
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653494782;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Wyhm/KGC2RAMrqvIiiQ64+ch2w9U567i5fnUSYXpFrc=;
 b=BPh4nzfBKvY/FW2YrKE89rhmWr0VeztvtDDovtQzpvXOdbz7GKmyzaLqnaRiicCgxGCrU6
 9aahhErDkd6u2h+n1NnPU+VKRS82sQgqOC32QmLH6c/ywsAZxDW9ZBxkehc2iLT5GCo9EP
 H/3RHeMG+WApWkAAJ4OoGMijD4RiKJU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-Cz32udo0MVmfwyjsbJXBQg-1; Wed, 25 May 2022 12:06:21 -0400
X-MC-Unique: Cz32udo0MVmfwyjsbJXBQg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D53703C1618E;
 Wed, 25 May 2022 16:06:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98088401E63;
 Wed, 25 May 2022 16:06:19 +0000 (UTC)
Date: Wed, 25 May 2022 17:06:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp
 commands to qemu
Message-ID: <Yo5T+O+lBqnhlrNL@redhat.com>
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316095455.6473-1-damien.hedde@greensocs.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 10:54:55AM +0100, Damien Hedde wrote:


> +def raw_load(file: TextIO) -> List[QMPMessage]:
> +    """parse a raw qmp command file.
> +
> +    JSON formatted commands can expand on several lines but must
> +    be separated by an end-of-line (two commands can not share the
> +    same line).
> +    File must not end with empty lines.
> +    """
> +    cmds: List[QMPMessage] = []
> +    linecnt = 0
> +    while True:
> +        buf = file.readline()
> +        if not buf:
> +            return cmds

If you change this to 'break'...

> +        prev_err_pos = None
> +        buf_linecnt = 1
> +        while True:
> +            try:
> +                cmds.append(json.loads(buf))

...and this to

  yield json.loads(buf)

then....

> +                break
> +            except json.JSONDecodeError as err:
> +                if prev_err_pos == err.pos:
> +                    # adding a line made no progress so
> +                    #  + either we're at EOF and json data is truncated
> +                    #  + or the parsing error is before
> +                    raise QmpRawDecodeError(err.msg, linecnt + err.lineno,
> +                                            err.colno) from err
> +                prev_err_pos = err.pos
> +            buf += file.readline()
> +            buf_linecnt += 1
> +        linecnt += buf_linecnt
> +
> +
> +def report_error(msg: str) -> None:
> +    """Write an error to stderr."""
> +    sys.stderr.write('ERROR: %s\n' % msg)
> +
> +
> +def main() -> None:
> +    """
> +    qmp-send entry point: parse command line arguments and start the REPL.
> +    """
> +    parser = argparse.ArgumentParser(
> +            description="""
> +            Send raw qmp commands to qemu as long as they succeed. It either
> +            connects to a remote qmp server using the provided socket or wrap
> +            the qemu process. It stops sending the provided commands when a
> +            command fails (disconnection or error response).
> +            """,
> +            epilog="""
> +            When qemu wrap option is used, this script waits for qemu
> +            to terminate but never send any quit or kill command. This
> +            needs to be done manually.
> +            """)
> +
> +    parser.add_argument('-f', '--file', action='store',
> +                        help='Input file containing the commands')
> +    parser.add_argument('-s', '--socket', action='store',
> +                        help='< UNIX socket path | TCP address:port >')
> +    parser.add_argument('-v', '--verbose', action='store_true',
> +                        help='Verbose (echo commands sent and received)')
> +    parser.add_argument('-p', '--pretty', action='store_true',
> +                        help='Pretty-print JSON')
> +
> +    parser.add_argument('--wrap', nargs=argparse.REMAINDER,
> +                        help='QEMU command line to invoke')
> +
> +    args = parser.parse_args()
> +
> +    socket = args.socket
> +    wrap_qemu = args.wrap is not None
> +
> +    if wrap_qemu:
> +        if len(args.wrap) != 0:
> +            qemu_cmdline = args.wrap
> +        else:
> +            qemu_cmdline = ["qemu-system-x86_64"]
> +        if socket is None:
> +            socket = "qmp-send-wrap-%d" % os.getpid()
> +        qemu_cmdline += ["-qmp", "unix:%s" % socket]
> +
> +    try:
> +        address = QMPSend.parse_address(socket)
> +    except QMPBadPortError:
> +        parser.error(f"Bad port number: {socket}")
> +        return  # pycharm doesn't know error() is noreturn
> +
> +    try:
> +        with open(args.file, mode='rt', encoding='utf8') as file:
> +            qmp_cmds = raw_load(file)
> +    except QmpRawDecodeError as err:
> +        report_error(str(err))
> +        sys.exit(1)

...change this to

    fh = sys.stdin
    if args.file is not None and args.file != '-':
      fh = open(args.file, mode='rt', encoding='utf8')

....

> +
> +    try:
> +        with QMPSend(address, args.pretty, args.verbose,
> +                     server=wrap_qemu) as qmp:
> +            # starting with python 3.7 we could use contextlib.nullcontext
> +            qemu = Popen(qemu_cmdline) if wrap_qemu else contextlib.suppress()
> +            with qemu:
> +                try:
> +                    qmp.setup_connection()
> +                except ConnectError as err:
> +                    if isinstance(err.exc, OSError):
> +                        report_error(f"Couldn't connect to {socket}: {err!s}")
> +                    else:
> +                        report_error(str(err))
> +                    sys.exit(1)
> +                try:
> +                    for cmd in qmp_cmds:

...finally this to

    for cmd in raw_load(fh)


This means we can use qmp-send in a pipeline with commands
sent to QEMU on the fly as they arrive, rather than having
to read all the commands upfront before QEMU is started.

BTW, as an example usage I was trying your impl here in the following
way to extract information about CPUs that are deprecated

   echo -e '{ "execute": "query-cpu-definitions"}\n{"execute": "quit"}' | \
     qmp-send -v -p --wrap ./build/qemu-system-x86_64 -nodefaults  -vnc :1 | \
     jq -r  --slurp '.[1].return[] | [.name, .deprecated] | @csv' 


> +                        qmp.execute_cmd(cmd)
> +                except QMPError as err:
> +                    report_error(str(err))
> +                    sys.exit(1)
> +    finally:
> +        if wrap_qemu:
> +            os.unlink(socket)
> +
> +
> +if __name__ == '__main__':
> +    main()


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


