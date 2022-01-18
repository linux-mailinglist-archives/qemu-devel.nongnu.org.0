Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D615492387
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:08:51 +0100 (CET)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9lPs-0006qe-Nz
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:08:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9lOF-000657-ER
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9lOC-0004Vj-Fi
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642500415;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fs96ZDevTCAnKqBQFvD52OJbW3fgNrEQS4XApMAlA4A=;
 b=StSLMVyFl2qoiIJK6eUFAFPkTbAKw+DXcTk0cRu8wl2Cxo9Ze3wl25xKeTajIBN6rwcVXH
 gg/5guOM/zBOOsGj7xSoJJRn5d/r2/i0frgGVkE+EMhltENGyqZub89iA8QgSnWj0ndtCP
 X4H/tIQ39UWF/eAONiQrgc9b7o5bcRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-LZ0kZjVhMnOzkcz1XoUlSA-1; Tue, 18 Jan 2022 05:06:50 -0500
X-MC-Unique: LZ0kZjVhMnOzkcz1XoUlSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E716A100CCC3;
 Tue, 18 Jan 2022 10:06:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01F5270D50;
 Tue, 18 Jan 2022 10:06:30 +0000 (UTC)
Date: Tue, 18 Jan 2022 10:06:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
Message-ID: <YeaRJF3tqMjipU3o@redhat.com>
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
 <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 06:27:24PM -0500, John Snow wrote:
> On Mon, Jan 17, 2022 at 9:11 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > With the current 'qmp-shell' tool developers must first spawn QEMU with
> > a suitable -qmp arg and then spawn qmp-shell in a separate terminal
> > pointing to the right socket.
> >
> > With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
> > just pass the QEMU command and arguments they want. The program will
> > listen on a UNIX socket and tell QEMU to connect QMP to that.
> >
> > For example, this:
> >
> >  # qmp-shell-wrap -- qemu-system-x86_64 -display none
> >
> > Is roughly equivalent of running:
> >
> >  # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
> >  # qmp-shell qmp-shell-1234
> >
> > Except that 'qmp-shell-wrap' switches the socket peers around so that
> > it is the UNIX socket server and QEMU is the socket client. This makes
> > QEMU reliably go away when qmp-shell-wrap exits, closing the server
> > socket.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  python/qemu/qmp/qmp_shell.py | 61 +++++++++++++++++++++++++++++++++---
> >  scripts/qmp/qmp-shell-wrap   | 11 +++++++
> >  2 files changed, 68 insertions(+), 4 deletions(-)
> >  create mode 100755 scripts/qmp/qmp-shell-wrap
> >
> > diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
> > index e7d7eb18f1..12f7d28afc 100644
> > --- a/python/qemu/qmp/qmp_shell.py
> > +++ b/python/qemu/qmp/qmp_shell.py
> > @@ -86,6 +86,7 @@
> >  import os
> >  import re
> >  import readline
> > +from subprocess import Popen
> >  import sys
> >  from typing import (
> >      Iterator,
> > @@ -162,8 +163,10 @@ class QMPShell(qmp.QEMUMonitorProtocol):
> >      :param verbose: Echo outgoing QMP messages to console.
> >      """
> >      def __init__(self, address: qmp.SocketAddrT,
> > -                 pretty: bool = False, verbose: bool = False):
> > -        super().__init__(address)
> > +                 pretty: bool = False,
> > +                 verbose: bool = False,
> > +                 server: bool = False):
> > +        super().__init__(address, server=server)
> >          self._greeting: Optional[QMPMessage] = None
> >          self._completer = QMPCompleter()
> >          self._transmode = False
> > @@ -404,8 +407,10 @@ class HMPShell(QMPShell):
> >      :param verbose: Echo outgoing QMP messages to console.
> >      """
> >      def __init__(self, address: qmp.SocketAddrT,
> > -                 pretty: bool = False, verbose: bool = False):
> > -        super().__init__(address, pretty, verbose)
> > +                 pretty: bool = False,
> > +                 verbose: bool = False,
> > +                 server: bool = False):
> > +        super().__init__(address, pretty, verbose, server)
> >          self._cpu_index = 0
> >
> >      def _cmd_completion(self) -> None:
> > @@ -529,6 +534,54 @@ def main() -> None:
> >          for _ in qemu.repl():
> >              pass
> >
> > +def main_wrap() -> None:
> > +    """
> > +    qmp-shell-wrap entry point: parse command line arguments and start the REPL.
> > +    """
> > +    parser = argparse.ArgumentParser()
> > +    parser.add_argument('-H', '--hmp', action='store_true',
> > +                        help='Use HMP interface')
> > +    parser.add_argument('-v', '--verbose', action='store_true',
> > +                        help='Verbose (echo commands sent and received)')
> > +    parser.add_argument('-p', '--pretty', action='store_true',
> > +                        help='Pretty-print JSON')
> > +
> > +    parser.add_argument('command', nargs=argparse.REMAINDER,
> > +                        help='QEMU command line to invoke')
> > +
> > +    args = parser.parse_args()
> > +
> > +    cmd = args.command
> > +    if len(cmd) != 0 and cmd[0] == '--':
> > +        cmd = cmd[1:]
> > +    if len(cmd) == 0:
> > +        cmd = "qemu-system-x86_64"
> > +
> > +    sockpath = "qmp-shell-wrap-%d" % os.getpid()
> > +    cmd += ["-qmp", "unix:%s" % sockpath]
> > +
> > +    shell_class = HMPShell if args.hmp else QMPShell
> > +
> > +    try:
> > +        address = shell_class.parse_address(sockpath)
> > +    except qmp.QMPBadPortError:
> > +        parser.error(f"Bad port number: {socketpath}")
> > +        return  # pycharm doesn't know error() is noreturn
> > +
> > +    with shell_class(address, args.pretty, args.verbose, True) as qemu:
> > +        qemuproc = Popen(cmd)
> > +
> > +        try:
> > +            qemu.accept()
> > +        except qmp.QMPConnectError:
> > +            die("Didn't get QMP greeting message")
> > +        except qmp.QMPCapabilitiesError:
> > +            die("Couldn't negotiate capabilities")
> > +        except OSError as err:
> > +            die(f"Couldn't connect to {sockpath}: {err!s}")
> > +
> > +        for _ in qemu.repl():
> > +            pass
> >
> >  if __name__ == '__main__':
> >      main()
> > diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
> > new file mode 100755
> > index 0000000000..9e94da114f
> > --- /dev/null
> > +++ b/scripts/qmp/qmp-shell-wrap
> > @@ -0,0 +1,11 @@
> > +#!/usr/bin/env python3
> > +
> > +import os
> > +import sys
> > +
> > +sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> > +from qemu.qmp import qmp_shell
> > +
> > +
> > +if __name__ == '__main__':
> > +    qmp_shell.main_wrap()
> > --
> > 2.33.1
> >
> 
> Adds some new failures to the python linters; try "make check-dev" in
> the python sub-dir.

It would be nice to just have this integrated into 'make check' so we
don't need to remember to run a special command.

> ... Though, due to a bug in avocado, this helpfully doesn't actually
> show you the failure output right now ...

Urgh.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


