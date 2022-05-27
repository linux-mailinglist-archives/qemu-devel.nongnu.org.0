Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F153640E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:29:22 +0200 (CEST)
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuaxs-0004UB-Qv
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nuajd-00044Y-RG
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nuaja-0003pV-Ny
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653660873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYazQ5djE7Qr1yms8YuU47Mb8PfAUfdywloNC4vuAp0=;
 b=EsyV51p6RymICAuKdo077Eri6VjttJh70kexAxnzdURkBBodXpt+lcgiN+i8x2h25i0LUI
 A+5FDreHN5qn8GlKkqj7xP/1Uwe3LFxvyxLr8igAWlgiNvEktuMlIL1sh1z6HYKBfqEwfr
 Cdb7afocXFLEqDgy2PkykyPfAHFa6Q8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-HBOKQ2EePDGQGiK2yPPc8Q-1; Fri, 27 May 2022 10:14:31 -0400
X-MC-Unique: HBOKQ2EePDGQGiK2yPPc8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 911A41C14485
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 14:14:31 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D92231121315;
 Fri, 27 May 2022 14:14:29 +0000 (UTC)
Date: Fri, 27 May 2022 16:14:27 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [libvirt PATCH] tools: add virt-qmp-proxy for proxying QMP
 clients to libvirt QEMU guests
Message-ID: <YpDcw97r7SPnJVfi@angien.pipo.sk>
References: <20220527094758.604621-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220527094758.604621-1-berrange@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, May 27, 2022 at 10:47:58 +0100, Daniel P. Berrangé wrote:
> Libvirt provides QMP passthrough APIs for the QEMU driver and these are
> exposed in virsh. It is not especially pleasant, however, using the raw
> QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
> exposes a human friendly interactive shell. It is not possible to use
> this with libvirt managed guest, however, since only one client can
> attach to he QMP socket at any point in time.
> 
> The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
> socket and listens for incoming client connections, speaking QMP on
> the connected socket. It will forward any QMP commands received onto
> the running libvirt QEMU guest, and forward any replies back to the
> QMP client.
> 
>   $ virsh start demo
>   $ virt-qmp-proxy demo demo.qmp &
>   $ qmp-shell demo.qmp
>   Welcome to the QMP low-level shell!
>   Connected to QEMU 6.2.0
> 
>   (QEMU) query-kvm
>   {
>       "return": {
>           "enabled": true,
>           "present": true
>       }
>   }
> 
> Note this tool of course has the same risks as the raw libvirt
> QMP passthrough. It is safe to run query commands to fetch information
> but commands which change the QEMU state risk disrupting libvirt's
> management of QEMU, potentially resulting in data loss/corruption in
> the worst case.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> CC'ing QEMU since this is likely of interest to maintainers and users
> who work with QEMU and libvirt
> 
> Note this impl is fairly crude in that it assumes it is receiving
> the QMP commands linewise one at a time. None the less it is good
> enough to work with qmp-shell already, so I figured it was worth
> exposing to the world. It also lacks support for forwarding events
> back to the QMP client.
> 
>  docs/manpages/meson.build        |   1 +
>  docs/manpages/virt-qmp-proxy.rst | 123 ++++++++++++++++++++++++++++
>  tools/meson.build                |   5 ++
>  tools/virt-qmp-proxy             | 133 +++++++++++++++++++++++++++++++
>  4 files changed, 262 insertions(+)
>  create mode 100644 docs/manpages/virt-qmp-proxy.rst
>  create mode 100755 tools/virt-qmp-proxy

[...]

> diff --git a/docs/manpages/virt-qmp-proxy.rst b/docs/manpages/virt-qmp-proxy.rst
> new file mode 100644
> index 0000000000..94679406ab
> --- /dev/null
> +++ b/docs/manpages/virt-qmp-proxy.rst
> @@ -0,0 +1,123 @@
> +==============
> +virt-qmp-proxy
> +==============
> +
> +--------------------------------------------------
> +Expose a QMP proxy server for a libvirt QEMU guest
> +--------------------------------------------------
> +
> +:Manual section: 1
> +:Manual group: Virtualization Support
> +
> +.. contents::
> +
> +
> +SYNOPSIS
> +========
> +
> +``virt-qmp-proxy`` [*OPTION*]... *DOMAIN* *QMP-SOCKET-PATH*
> +
> +
> +DESCRIPTION
> +===========
> +
> +This tool provides a way to expose a QMP proxy server that communicates
> +with a QEMU guest managed by libvirt. This enables standard QMP client
> +tools to interact with libvirt managed guests.
> +
> +**NOTE: use of this tool will result in the running QEMU guest being
> +marked as tainted.** It is strongly recommended that this tool *only be
> +used to send commands which query information* about the running guest.
> +If this tool is used to make changes to the state of the guest, this
> +may have negative interactions with the QEMU driver, resulting in an
> +inability to manage the guest operation thereafter, and in the worst
> +case **potentially lead to data loss or corruption**.
> +
> +The ``virt-qmp-proxy`` program will listen on a UNIX socket for incoming
> +client connections, and run the QMP protocol over the connection. Any
> +commands received will be sent to the running libvirt guest, and replies
> +sent back.
> +
> +The ``virt-qemu-proxy`` program may be interrupted (eg Ctrl-C) when it
> +is no longer required. The libvirt QEMU guest will continue running.
> +
> +
> +OPTIONS
> +=======
> +
> +*DOMAIN*
> +
> +The ID or UUID or Name of the libvirt QEMU guest.
> +
> +*QMP-SOCKET-PATH*
> +
> +The filesystem path at which to run the QMP server, listening for
> +incoming connections.
> +
> +``-c`` *CONNECTION-URI*
> +``--connect``\ =\ *CONNECTION-URI*
> +
> +The URI for the connection to the libvirt QEMU driver. If omitted,
> +a URI will be auto-detected.
> +
> +``-v``, ``--verbose``
> +
> +Run in verbose mode, printing all QMP commands and replies that
> +are handled.
> +
> +``-h``, ``--help``
> +
> +Display the command line help.
> +
> +
> +EXIT STATUS
> +===========
> +
> +Upon successful shutdown, an exit status of 0 will be set. Upon
> +failure a non-zero status will be set.
> +
> +
> +AUTHOR
> +======
> +
> +Daniel P. Berrangé
> +
> +
> +BUGS
> +====
> +
> +Please report all bugs you discover.  This should be done via either:
> +
> +#. the mailing list
> +
> +   `https://libvirt.org/contact.html <https://libvirt.org/contact.html>`_
> +
> +#. the bug tracker
> +
> +   `https://libvirt.org/bugs.html <https://libvirt.org/bugs.html>`_
> +
> +Alternatively, you may report bugs to your software distributor / vendor.
> +
> +NOTE: at this time there is no support for forwarding QMP events back
> +to the clients

Also add caveat about FD passing support.

[...]

> diff --git a/tools/virt-qmp-proxy b/tools/virt-qmp-proxy
> new file mode 100755
> index 0000000000..57f9759fab
> --- /dev/null
> +++ b/tools/virt-qmp-proxy
> @@ -0,0 +1,133 @@
> +#!/usr/bin/env python3
> +
> +import argparse
> +import libvirt
> +import libvirt_qemu
> +import os
> +import re
> +import socket
> +import sys
> +import json
> +
> +
> +def get_domain(uri, domstr):
> +    conn = libvirt.open(uri)
> +
> +    dom = None
> +    if re.match(r'^\d+$', domstr):
> +        dom = conn.lookupByID(int(domstr))
> +    elif re.match(r'^[+a-f0-9]+$', domstr):

This works very poorly if you have a VM named for example 'cd' or any
combination of just letters abcdef.

> +        dom = conn.lookupByUUIDString(domstr)
> +    else:
> +        dom = conn.lookupByName(domstr)
> +
> +    if not dom.isActive():
> +        raise Exception(
> +            "Domain must be running to validate measurement")

This should mention the current usage or a generic error ;)

> +
> +    return conn, dom
> +
> +
> +def qmp_server(conn, dom, client, verbose):
> +    ver = conn.getVersion()

So this gets the version of the "default" emulator version, but if your
VM is using a custom one this will report it wrong.

E.g in my case I have a git qemu for a VM:

 517 2022-05-27 14:01:09.604+0000: 373562: debug : qemuMonitorJSONIOProcessLine:199 : Line [{"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 7}, "package": "v7.0.0-1253-g2417cbd591"}, "capabilities": ["oob"]}}]



> +    major = int(ver / 1000000) % 1000
> +    minor = int(ver / 1000) % 1000
> +    micro = ver % 1000
> +
> +    greetingobj = {
> +        "QMP": {
> +            "version": {
> +                "qemu": {
> +                    "major": major,
> +                    "minor": minor,
> +                    "micro": micro,
> +                },
> +                "package": f"qemu-{major}.{minor}.{micro}",
> +            },
> +            "capabilities": [
> +                "oob"
> +            ],
> +        }
> +    }

But when I conect I get:

{"QMP": {"version": {"qemu": {"major": 7, "minor": 0, "micro": 0}, "package": "qemu-7.0.0"}, "capabilities": ["oob"]}}


At the very least this should be documented.

> +    greeting = json.dumps(greetingobj) + "\r\n"
> +    if verbose:
> +        print(greeting, end='')
> +    client.send(greeting.encode("utf-8"))
> +
> +    while True:
> +        # XXX shouldn't blindly assume this one read
> +        # will fully capture one-and-only-one cmd
> +        cmd = client.recv(1024).decode('utf8')

IIUC this limits the buffer to 1k max. Libvirt's RPC supports up to 4M.
1k could be limiting with some commands such as blockdev-add.

> +        if verbose:
> +            print(cmd)
> +
> +        if cmd == "":
> +            break
> +
> +        if "qmp_capabilities" in cmd:
> +            capabilitiesobj = {
> +                "return": {},
> +            }
> +            capabilities = json.dumps(capabilitiesobj) + "\r\n"
> +            if verbose:
> +                print(capabilities, end='')
> +            client.send(capabilities.encode("utf-8"))
> +            continue
> +
> +        id = None
> +        if "id" in cmd:
> +            id = cmd[id]
> +
> +        res = libvirt_qemu.qemuMonitorCommand(dom, cmd, 0)

If 'cmd' is not JSON this breaks horribly:

$ tools/virt-qmp-proxy 2 /tmp/asdf
libvirt:  error : internal error: cannot parse json test
: lexical error: invalid string in json text.
                                       test
                     (right here) ------^
tools/virt-qmp-proxy: internal error: cannot parse json test
: lexical error: invalid string in json text.
                                       test
                     (right here) ------^

and stops working, while real qemu behaves differently:

$ qemu-system-x86_64 -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 0, "minor": 0, "major": 7}, "package": "qemu-7.0.0-2.fc35"}, "capabilities": ["oob"]}}


help
{"error": {"class": "GenericError", "desc": "JSON parse error, invalid keyword 'help'"}}


Also since it's just a simple loop without event handling from qemu.
E.g. if I destroy the VM while it's running it simply waits. When I
issue another command, then the proxy exits:

$ tools/virt-qmp-proxy 2 /tmp/asdf
libvirt: Domain Config error : Requested operation is not valid: domain is not running
tools/virt-qmp-proxy: Requested operation is not valid: domain is not running


but the client itself just sees a closed socket.

Given the use case it's not a big problem but it should be at least
mentioned in the docs.

> +
> +        resobj = json.loads(res)
> +        del resobj["id"]
> +        if id is not None:
> +            resobj["id"] = id
> +        res = json.dumps(resobj) + "\r\n"
> +        if verbose:
> +            print(res, end='')
> +
> +        client.send(res.encode('utf8'))
> +
> +
> +def parse_commandline():
> +    parser = argparse.ArgumentParser(description="Libvirt QMP proxy")
> +    parser.add_argument("--connect", "-c",
> +                        help="Libvirt QEMU driver connection URI")
> +    parser.add_argument("--verbose", "-v", action='store_true',
> +                        help="Display QMP traffic")
> +    parser.add_argument("domain", metavar="DOMAIN",
> +                        help="Libvirt guest domain ID/UUID/Name")
> +    parser.add_argument("sockpath", metavar="QMP-SOCK-PATH",
> +                        help="UNIX socket path for QMP server")
> +
> +    return parser.parse_args()
> +
> +
> +def main():
> +    args = parse_commandline()
> +
> +    conn, dom = get_domain(args.connect, args.domain)
> +
> +    if conn.getType() != "QEMU":
> +        raise Exception("QMP proxy requires a QEMU driver connection not %s" %
> +                        conn.getType())
> +
> +    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
> +    if os.path.exists(args.sockpath):
> +        os.unlink(args.sockpath)
> +    sock.bind(args.sockpath)
> +    sock.listen(1)
> +
> +    while True:
> +        client, peeraddr = sock.accept()
> +        qmp_server(conn, dom, client, args.verbose)
> +
> +
> +try:
> +    main()
> +    sys.exit(0)
> +except Exception as e:
> +    print("%s: %s" % (sys.argv[0], str(e)))
> +    sys.exit(1)
> -- 
> 2.36.1
> 


