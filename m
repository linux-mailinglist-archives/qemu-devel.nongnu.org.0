Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A753748B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:20:30 +0200 (CEST)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvZhU-0007z8-Ql
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nvZZt-0006n5-ER
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:12:37 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:37950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nvZZq-0004zD-Q3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:12:36 -0400
Received: from [192.168.15.104] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 062CA20777;
 Mon, 30 May 2022 07:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653894750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22ir92KaVx4L68udaDq2IYEmVbY3TpnrvSZDpM24L6o=;
 b=GsWsKcJa9U+kvaxSsNrn/s4+I0Tui1Hj1+LP77S53uQTzEdrCTemIEnKpSyWH8kiLgHUE2
 2105TYv7Irf6SSWN9vHroG5R1UPkyl5e40NV9Ow0ZNmBUir84qnhSvDP0/oSo/Dfk2a07D
 Ve96jRZ683y6dLZ90Fcj+2kKOejnNfU=
Message-ID: <48cf2175-d327-2767-bc1d-41592fa61473@greensocs.com>
Date: Mon, 30 May 2022 09:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp commands
 to qemu
Content-Language: en-US-large
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <Yo5T+O+lBqnhlrNL@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <Yo5T+O+lBqnhlrNL@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/25/22 18:06, Daniel P. Berrangé wrote:
> On Wed, Mar 16, 2022 at 10:54:55AM +0100, Damien Hedde wrote:
> 
> 
>> +def raw_load(file: TextIO) -> List[QMPMessage]:
>> +    """parse a raw qmp command file.
>> +
>> +    JSON formatted commands can expand on several lines but must
>> +    be separated by an end-of-line (two commands can not share the
>> +    same line).
>> +    File must not end with empty lines.
>> +    """
>> +    cmds: List[QMPMessage] = []
>> +    linecnt = 0
>> +    while True:
>> +        buf = file.readline()
>> +        if not buf:
>> +            return cmds
> 
> If you change this to 'break'...
> 
>> +        prev_err_pos = None
>> +        buf_linecnt = 1
>> +        while True:
>> +            try:
>> +                cmds.append(json.loads(buf))
> 
> ...and this to
> 
>    yield json.loads(buf)
> 
> then....
> 
>> +                break
>> +            except json.JSONDecodeError as err:
>> +                if prev_err_pos == err.pos:
>> +                    # adding a line made no progress so
>> +                    #  + either we're at EOF and json data is truncated
>> +                    #  + or the parsing error is before
>> +                    raise QmpRawDecodeError(err.msg, linecnt + err.lineno,
>> +                                            err.colno) from err
>> +                prev_err_pos = err.pos
>> +            buf += file.readline()
>> +            buf_linecnt += 1
>> +        linecnt += buf_linecnt
>> +
>> +
>> +def report_error(msg: str) -> None:
>> +    """Write an error to stderr."""
>> +    sys.stderr.write('ERROR: %s\n' % msg)
>> +
>> +
>> +def main() -> None:
>> +    """
>> +    qmp-send entry point: parse command line arguments and start the REPL.
>> +    """
>> +    parser = argparse.ArgumentParser(
>> +            description="""
>> +            Send raw qmp commands to qemu as long as they succeed. It either
>> +            connects to a remote qmp server using the provided socket or wrap
>> +            the qemu process. It stops sending the provided commands when a
>> +            command fails (disconnection or error response).
>> +            """,
>> +            epilog="""
>> +            When qemu wrap option is used, this script waits for qemu
>> +            to terminate but never send any quit or kill command. This
>> +            needs to be done manually.
>> +            """)
>> +
>> +    parser.add_argument('-f', '--file', action='store',
>> +                        help='Input file containing the commands')
>> +    parser.add_argument('-s', '--socket', action='store',
>> +                        help='< UNIX socket path | TCP address:port >')
>> +    parser.add_argument('-v', '--verbose', action='store_true',
>> +                        help='Verbose (echo commands sent and received)')
>> +    parser.add_argument('-p', '--pretty', action='store_true',
>> +                        help='Pretty-print JSON')
>> +
>> +    parser.add_argument('--wrap', nargs=argparse.REMAINDER,
>> +                        help='QEMU command line to invoke')
>> +
>> +    args = parser.parse_args()
>> +
>> +    socket = args.socket
>> +    wrap_qemu = args.wrap is not None
>> +
>> +    if wrap_qemu:
>> +        if len(args.wrap) != 0:
>> +            qemu_cmdline = args.wrap
>> +        else:
>> +            qemu_cmdline = ["qemu-system-x86_64"]
>> +        if socket is None:
>> +            socket = "qmp-send-wrap-%d" % os.getpid()
>> +        qemu_cmdline += ["-qmp", "unix:%s" % socket]
>> +
>> +    try:
>> +        address = QMPSend.parse_address(socket)
>> +    except QMPBadPortError:
>> +        parser.error(f"Bad port number: {socket}")
>> +        return  # pycharm doesn't know error() is noreturn
>> +
>> +    try:
>> +        with open(args.file, mode='rt', encoding='utf8') as file:
>> +            qmp_cmds = raw_load(file)
>> +    except QmpRawDecodeError as err:
>> +        report_error(str(err))
>> +        sys.exit(1)
> 
> ...change this to
> 
>      fh = sys.stdin
>      if args.file is not None and args.file != '-':
>        fh = open(args.file, mode='rt', encoding='utf8')
> 
> ....
> 
>> +
>> +    try:
>> +        with QMPSend(address, args.pretty, args.verbose,
>> +                     server=wrap_qemu) as qmp:
>> +            # starting with python 3.7 we could use contextlib.nullcontext
>> +            qemu = Popen(qemu_cmdline) if wrap_qemu else contextlib.suppress()
>> +            with qemu:
>> +                try:
>> +                    qmp.setup_connection()
>> +                except ConnectError as err:
>> +                    if isinstance(err.exc, OSError):
>> +                        report_error(f"Couldn't connect to {socket}: {err!s}")
>> +                    else:
>> +                        report_error(str(err))
>> +                    sys.exit(1)
>> +                try:
>> +                    for cmd in qmp_cmds:
> 
> ...finally this to
> 
>      for cmd in raw_load(fh)
> 
> 
> This means we can use qmp-send in a pipeline with commands
> sent to QEMU on the fly as they arrive, rather than having
> to read all the commands upfront before QEMU is started.

Yes. I was not sure which way was "better" between reading on the fly or 
buffering everything before. In we want pipelining, we don't have much 
choice.

> 
> BTW, as an example usage I was trying your impl here in the following
> way to extract information about CPUs that are deprecated
> 
>     echo -e '{ "execute": "query-cpu-definitions"}\n{"execute": "quit"}' | \
>       qmp-send -v -p --wrap ./build/qemu-system-x86_64 -nodefaults  -vnc :1 | \
>       jq -r  --slurp '.[1].return[] | [.name, .deprecated] | @csv'
> 
> 
>> +                        qmp.execute_cmd(cmd)
>> +                except QMPError as err:
>> +                    report_error(str(err))
>> +                    sys.exit(1)
>> +    finally:
>> +        if wrap_qemu:
>> +            os.unlink(socket)
>> +
>> +
>> +if __name__ == '__main__':
>> +    main()
> 
> 
> With regards,
> Daniel

