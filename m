Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81474B7B2B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 00:26:25 +0100 (CET)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK7DE-000877-Gc
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 18:26:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK7BL-00078V-5e
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK7BI-00018G-5G
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644967463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R8MYDs9GbnWZySyj85jzHHisSEs9j1WoFWDhSPSY9IM=;
 b=jNASmpFGSAnImpj9R9pZNXBI2jETOcxMml+sAyh7ppP2vftAhYbRyXbxpNBTTvBvWVjM3b
 mdZuCx5TiPkicq8c9DFz2Z0HbctV9kwSQBYjfXKK+V46FNO7pXrfapjPIPR7wEWTkP7q1w
 baLdWRHHov6Ttp/WjZU9UVxnsLnhSJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-YhChSWKQOHiYyNN7BYnzow-1; Tue, 15 Feb 2022 18:24:20 -0500
X-MC-Unique: YhChSWKQOHiYyNN7BYnzow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D721F801B1C;
 Tue, 15 Feb 2022 23:24:18 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3671A104F1;
 Tue, 15 Feb 2022 23:24:17 +0000 (UTC)
Date: Tue, 15 Feb 2022 17:24:14 -0600
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
References: <20220215171838.2651387-1-eblake@redhat.com>
 <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Richard Jones <rjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 09:23:36PM +0200, Nir Soffer wrote:
> On Tue, Feb 15, 2022 at 7:22 PM Eric Blake <eblake@redhat.com> wrote:
> 
> > According to the NBD spec, a server advertising
> > NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> > not see any cache inconsistencies: when properly separated by a single
> > flush, actions performed by one client will be visible to another
> > client, regardless of which client did the flush.  We satisfy these
> > conditions in qemu when our block layer is backed by the local
> > filesystem (by virtue of the semantics of fdatasync(), and the fact
> > that qemu itself is not buffering writes beyond flushes).  It is
> > harder to state whether we satisfy these conditions for network-based
> > protocols, so the safest course of action is to allow users to opt-in
> > to advertising multi-conn.  We may later tweak defaults to advertise
> > by default when the block layer can confirm that the underlying
> > protocol driver is cache consistent between multiple writers, but for
> > now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
> > explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
> > advertisement in a known-safe setup where the client end can then
> > benefit from parallel clients.
> >
> 
> It makes sense, and will be used by oVirt. Actually we are already using
> multiple connections for writing about 2 years, based on your promise
> that if every client writes to district  areas this is safe.

I presume s/district/distinct/, but yes, I'm glad we're finally trying
to make the code match existing practice ;)

> > +++ b/docs/tools/qemu-nbd.rst
> > @@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.
> >  .. option:: -e, --shared=NUM
> >
> >    Allow up to *NUM* clients to share the device (default
> > -  ``1``), 0 for unlimited. Safe for readers, but for now,
> > -  consistency is not guaranteed between multiple writers.
> > +  ``1``), 0 for unlimited.
> >
> 
> Removing the note means that now consistency is guaranteed between
> multiple writers, no?
> 
> Or maybe we want to mention here that consistency depends on the protocol
> and users can opt in, or refer to the section where this is discussed?

Yeah, a link to the QAPI docs where multi-conn is documented might be
nice, except I'm not sure the best way to do that in our sphinx
documentation setup.

> > +##
> > +# @NbdExportMultiConn:
> > +#
> > +# Possible settings for advertising NBD multiple client support.
> > +#
> > +# @off: Do not advertise multiple clients.
> > +#
> > +# @on: Allow multiple clients (for writable clients, this is only safe
> > +#      if the underlying BDS is cache-consistent, such as when backed
> > +#      by the raw file driver); ignored if the NBD server was set up
> > +#      with max-connections of 1.
> > +#
> > +# @auto: Behaves like @off if the export is writable, and @on if the
> > +#        export is read-only.
> > +#
> > +# Since: 7.0
> > +##
> > +{ 'enum': 'NbdExportMultiConn',
> > +  'data': ['off', 'on', 'auto'] }
> >
> 
> Are we going to have --multi-con=(on|off|auto)?

Oh. The QMP command (which is immediately visible through
nbd-server-add/block-storage-add to qemu and qemu-storage-daemon)
gains "multi-conn":"on", but you may be right that qemu-nbd would want
a command line option (either that, or we accellerate our plans that
qsd should replace qemu-nbd).

> > +++ b/blockdev-nbd.c
> > @@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
> >      return nbd_server || is_qemu_nbd;
> >  }
> >
> > +int nbd_server_max_connections(void)
> > +{
> > +    return nbd_server ? nbd_server->max_connections : -1;
> > +}
> >
> 
> -1 is a little bit strange for a limit, maybe 1 is a better default when
> we nbd_server == NULL? When can this happen?

In qemu, if you haven't used the QMP command 'nbd-server-start' yet.
In qemu-nbd, always (per the nbd_server_is_running function just
above).  My iotest only covered the qemu/qsd side, not the qemu-nbd
side, so it looks like I need a v3...

> > +++ b/nbd/server.c

> > +    /*
> > +     * Determine whether to advertise multi-conn.  Default is auto,
> > +     * which resolves to on for read-only and off for writable.  But
> > +     * if the server has max-connections 1, that forces the flag off.
> >
> 
> Looks good, this can be enabled automatically based on the driver
> if we want, so users using auto will can upgrade to multi-con automatically.

Yes, that's part of why I made it a tri-state with a default of 'auto'.

> 
> 
> > +     */
> > +    if (!arg->has_multi_conn) {
> > +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_AUTO;
> > +    }
> > +    if (nbd_server_max_connections() == 1) {
> 
> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_OFF;
> > +    }
> 
> +    if (arg->multi_conn == NBD_EXPORT_MULTI_CONN_AUTO) {
> > +        multi_conn = readonly;
> > +    } else {
> > +        multi_conn = arg->multi_conn == NBD_EXPORT_MULTI_CONN_ON;
> > +    }
> >
> 
> This part is a little bit confusing - we do:
> - initialize args->multi_con if it has not value
> - set the temporary multi_con based now initialized args->multi_con
> 
> I think it will be nicer to separate arguments parsing, so there is no need
> to initialize it here or have arg->has_multi_conn, but I did not check how
> other arguments are handled.

arg->has_multi_conn is fallout from the fact that our QAPI must remain
back-compat. If it is false, the user did not pass "multi-conn":...,
so we want the default value of "auto".  Once we've established the
default, then we force multi-conn off if we know we are limited to one
client (although as you pointed out, nbd_server_max_connections()
needs to be tested with qemu-nbd).  Then, it's easier to resolve the
tri-state enum variable into the bool of what we actually advertise to
the NBD client.

> > +++ b/tests/qemu-iotests/tests/nbd-multiconn
> > @@ -0,0 +1,188 @@
> > +#!/usr/bin/env bash
> > +# group: rw auto quick
> > +#
> > +# Test that qemu-nbd MULTI_CONN works
> > +#
> > +echo
> > +echo "=== Initial image setup ==="
> > +echo
> > +
> > +_make_test_img 4M
> > +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
> > +_launch_qemu 2> >(_filter_nbd)
> > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
> > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
> > +  "arguments":{"driver":"qcow2", "node-name":"n",
> > +    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"

I'm not the best at writing python iotests; I welcome a language
translation of this aspect.  But the shell code for
_launch_qemu/_send_qemu_cmd was already pretty nice for setting up a
long-running background qemu process where I can pass in QMP commands
at will, then interact from other processes.

> > +export nbd_unix_socket
> > +
> > +echo
> > +echo "=== Default nbd server settings ==="
> > +echo
> > +# Default allows for unlimited connections, readonly images advertise
> > +# multi-conn, and writable images do not
> > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
> > +  "arguments":{"addr":{"type":"unix",
> > +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
> > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> > +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> > +    "name":"r"}}' "return"
> > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> > +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> > +    "name":"w", "writable":true}}' "return"
> > +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
> > +assert h.can_multi_conn()
> > +h.shutdown()
> > +print("nbdsh passed")'
> > +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
> > +assert not h.can_multi_conn()
> > +h.shutdown()
> > +print("nbdsh passed")'
> >
> 
> Mixing of shell and python is very confusing. Wouldn't it be much cleaner
> to write the test in python?

Here, nbdsh -c 'python snippet' is used as a shell command line
parameter.  Writing python code to call out to a system() command
where one of the arguments to that command is a python script snippet
is going to be just as annoying as writing it in bash.

> > +echo
> > +echo "=== Demonstrate parallel writers ==="
> > +echo
> > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
> > +  "arguments":{"addr":{"type":"unix",
> > +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
> > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> > +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> > +    "name":"", "multi-conn":"on", "writable":true}}' "return"
> > +
> > +nbdsh -c '
> > +import os
> > +sock = os.getenv("nbd_unix_socket")
> > +h = []
> > +
> > +for i in range(3):
> > +  h.append(nbd.NBD())
> > +  h[i].connect_unix(sock)
> > +  assert h[i].can_multi_conn()
> >
> 
> This is somewhat C in python, maybe:
> 
>     handles = [nbd.NBD() for _ in range(3)]
> 
>     for h in handles:
>         h.connect_unix(sock)
>         assert h.can_multi_con()
> 
> Since assert will abort the test, and we don't handle
> exceptions, failure will not shutdown the connections
> but it should not matter for the purpose of a test.

As I said, I'm open to python suggestions :)  I like your approach.

> 
> 
> > +
> > +buf1 = h[0].pread(1024 * 1024, 0)
> > +if buf1 != b"\x01" * 1024 * 1024:
> > +  print("Unexpected initial read")
> >
> 
> Not clear when we initialize the buffer to \x01 - is this the qemu-io above?

Yes, when the qcow2 file was initially created.

> 
> 
> > +buf2 = b"\x03" * 1024 * 1024
> > +h[1].pwrite(buf2, 0)
> > +h[2].flush()
> > +buf1 = h[0].pread(1024 * 1024, 0)
> > +if buf1 == buf2:
> > +  print("Flush appears to be consistent across connections")
> >
> 
> buf1 was the initial content, buf2 is the new content, but now we override
> but1 to check that the right was flushed. It will be be better to use
> different
> names like inittial_data, updated_data, current_data.

Can do.

> 
> This block is the most important part of the test, showing that we can write
> in one connection, flush in the second, and read the written block in the
> third.
> Maybe add a comment about this? I think it will help someone else trying
> to understand what this part is trying to test.

Can do.

> > +{"execute":"block-export-add",
> > +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> > +    "name":"", "multi-conn":"on", "writable":true}}
> > +{"return": {}}
> > +Flush appears to be consistent across connections
> > +{"execute":"block-export-del",
> > +  "arguments":{"id":"w"}}
> > +{"return": {}}
> > +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> > "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
> > +{"execute":"nbd-server-stop"}
> > +{"return": {}}
> > +{"execute":"quit"}
> > +{"return": {}}
> > +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> > "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> >
> 
> Nothing about the contents here says anything about the actual test
> except the "Flush appears..." line.

Yeah, it's a lot of QMP debugging (to show what commands were run in
setting up the server), and less verbose in the nbdsh side.  Do I need
to add more output during the nbdsh that uses multiple connections?

> 
> 
> > +*** done
> > --
> > 2.35.1
> >
> 
> Looks good, feel free to ignore the style comments and suggestion to rewrite
> the test in python.

The style comments are nice, the rewriting is going to be harder for
me (but I'll accept help).  At any rate, getting qemu-nbd to be
feature-compatible may require a v3 anyway.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


