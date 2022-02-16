Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CC4B8F12
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:22:12 +0100 (CET)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKO0J-0000QA-4Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:22:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1nKNtl-0001MG-3P
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:15:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1nKNtf-0002fc-RC
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645031718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RJBopkJONM+p7/tvTxD1ZFp3g0u8D9kn8Q/ICglqrNw=;
 b=OhhDRJpXQsvAyIByqHw0itHU7ZRNbrGraPzYO4r9ylULgc+FVx15AjJ8jADpSIiFDqxUe8
 mgvgQ1M3OqdVquh913pvK5McRUzQmnUOB5ibdIOErR4ECIm3yvETiMAdAENf4vqLFb/qvi
 /9nPz+MJTU/jPpMFm5nP321SQOc0Ncc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-1VVVmSYtNcyoKe0Q21kY-w-1; Wed, 16 Feb 2022 12:15:17 -0500
X-MC-Unique: 1VVVmSYtNcyoKe0Q21kY-w-1
Received: by mail-lf1-f72.google.com with SMTP id
 x12-20020a19f60c000000b00443972023c6so333165lfe.10
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RJBopkJONM+p7/tvTxD1ZFp3g0u8D9kn8Q/ICglqrNw=;
 b=HWXFvispzHCrRWfijyggmnf2UAur1XzgsbzCx9qOrUX5AiqXtEujczgLIh6/M6yCe5
 YZMj9xLWWEbmEceLDK1EcEWRRK47wCvcuAnht9ZLLuogGQgKI92+BsfGvNcFuGHmoJZ1
 6fHFOA8XfjkqX0dVNsDWn6wSkMZmKJzGIDBcq59VndrfpJ/1o39nYGcQdYlL6yq0ptcK
 uge842SkzvYxcyvYqcBwKigvAfees5p8a/vEvibewJvqLRjDiwGR6yFRHgIRRbeOlQpc
 jXRVGtRw5AnQ+bko28B/Y1d4rIFarnRucfpk0lrYWgQB3o0h1Mrhb3245C70eERSq6dP
 Iaaw==
X-Gm-Message-State: AOAM530EqZbLlGG8NbbQ2ivht/u+NGqmhLuiU4SuYomXd8jVXdBSPAe6
 J1yxQXrykw+Xari1iA/QBdRiTAw1tNmM6VfFqBJQ4sNQD8qTckPy9O8XXtm885ADfXVX3x2KeFh
 H5aYfRkd9noCrxk43pH1iF8/DzBiUjhY=
X-Received: by 2002:a05:651c:1147:b0:23f:2ab8:2e0 with SMTP id
 h7-20020a05651c114700b0023f2ab802e0mr2852971ljo.156.1645031715437; 
 Wed, 16 Feb 2022 09:15:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcV3pKjAK6LFbcU4A7JEtGeS3j8+uM32W6Ru4T9M/WIiLnswnFn48A7yByHDQwk41InfNf8vwzsbVsBdtoRKA=
X-Received: by 2002:a05:651c:1147:b0:23f:2ab8:2e0 with SMTP id
 h7-20020a05651c114700b0023f2ab802e0mr2852939ljo.156.1645031714979; Wed, 16
 Feb 2022 09:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20220215171838.2651387-1-eblake@redhat.com>
 <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
 <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
 <a36660ff-c7d6-9bd1-bea8-dc0a10b74329@virtuozzo.com>
In-Reply-To: <a36660ff-c7d6-9bd1-bea8-dc0a10b74329@virtuozzo.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 16 Feb 2022 19:14:58 +0200
Message-ID: <CAMRbyysF6p=_Hdj-b6jdAVqfpQHqjGQ4V_=GfQmAxiPPwHyt0Q@mail.gmail.com>
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Richard Jones <rjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 10:08 AM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> 16.02.2022 02:24, Eric Blake wrote:
> > On Tue, Feb 15, 2022 at 09:23:36PM +0200, Nir Soffer wrote:
> >> On Tue, Feb 15, 2022 at 7:22 PM Eric Blake <eblake@redhat.com> wrote:
> >>
> >>> According to the NBD spec, a server advertising
> >>> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> >>> not see any cache inconsistencies: when properly separated by a single
> >>> flush, actions performed by one client will be visible to another
> >>> client, regardless of which client did the flush.  We satisfy these
> >>> conditions in qemu when our block layer is backed by the local
> >>> filesystem (by virtue of the semantics of fdatasync(), and the fact
> >>> that qemu itself is not buffering writes beyond flushes).  It is
> >>> harder to state whether we satisfy these conditions for network-based
> >>> protocols, so the safest course of action is to allow users to opt-in
> >>> to advertising multi-conn.  We may later tweak defaults to advertise
> >>> by default when the block layer can confirm that the underlying
> >>> protocol driver is cache consistent between multiple writers, but for
> >>> now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
> >>> explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
> >>> advertisement in a known-safe setup where the client end can then
> >>> benefit from parallel clients.
> >>>
> >>
> >> It makes sense, and will be used by oVirt. Actually we are already using
> >> multiple connections for writing about 2 years, based on your promise
> >> that if every client writes to district  areas this is safe.
> >
> > I presume s/district/distinct/, but yes, I'm glad we're finally trying
> > to make the code match existing practice ;)
> >
> >>> +++ b/docs/tools/qemu-nbd.rst
> >>> @@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.
> >>>   .. option:: -e, --shared=NUM
> >>>
> >>>     Allow up to *NUM* clients to share the device (default
> >>> -  ``1``), 0 for unlimited. Safe for readers, but for now,
> >>> -  consistency is not guaranteed between multiple writers.
> >>> +  ``1``), 0 for unlimited.
> >>>
> >>
> >> Removing the note means that now consistency is guaranteed between
> >> multiple writers, no?
> >>
> >> Or maybe we want to mention here that consistency depends on the protocol
> >> and users can opt in, or refer to the section where this is discussed?
> >
> > Yeah, a link to the QAPI docs where multi-conn is documented might be
> > nice, except I'm not sure the best way to do that in our sphinx
> > documentation setup.
> >
> >>> +##
> >>> +# @NbdExportMultiConn:
> >>> +#
> >>> +# Possible settings for advertising NBD multiple client support.
> >>> +#
> >>> +# @off: Do not advertise multiple clients.
> >>> +#
> >>> +# @on: Allow multiple clients (for writable clients, this is only safe
> >>> +#      if the underlying BDS is cache-consistent, such as when backed
> >>> +#      by the raw file driver); ignored if the NBD server was set up
> >>> +#      with max-connections of 1.
> >>> +#
> >>> +# @auto: Behaves like @off if the export is writable, and @on if the
> >>> +#        export is read-only.
> >>> +#
> >>> +# Since: 7.0
> >>> +##
> >>> +{ 'enum': 'NbdExportMultiConn',
> >>> +  'data': ['off', 'on', 'auto'] }
> >>>
> >>
> >> Are we going to have --multi-con=(on|off|auto)?
> >
> > Oh. The QMP command (which is immediately visible through
> > nbd-server-add/block-storage-add to qemu and qemu-storage-daemon)
> > gains "multi-conn":"on", but you may be right that qemu-nbd would want
> > a command line option (either that, or we accellerate our plans that
> > qsd should replace qemu-nbd).
> >
> >>> +++ b/blockdev-nbd.c
> >>> @@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
> >>>       return nbd_server || is_qemu_nbd;
> >>>   }
> >>>
> >>> +int nbd_server_max_connections(void)
> >>> +{
> >>> +    return nbd_server ? nbd_server->max_connections : -1;
> >>> +}
> >>>
> >>
> >> -1 is a little bit strange for a limit, maybe 1 is a better default when
> >> we nbd_server == NULL? When can this happen?
> >
> > In qemu, if you haven't used the QMP command 'nbd-server-start' yet.
> > In qemu-nbd, always (per the nbd_server_is_running function just
> > above).  My iotest only covered the qemu/qsd side, not the qemu-nbd
> > side, so it looks like I need a v3...
> >
> >>> +++ b/nbd/server.c
> >
> >>> +    /*
> >>> +     * Determine whether to advertise multi-conn.  Default is auto,
> >>> +     * which resolves to on for read-only and off for writable.  But
> >>> +     * if the server has max-connections 1, that forces the flag off.
> >>>
> >>
> >> Looks good, this can be enabled automatically based on the driver
> >> if we want, so users using auto will can upgrade to multi-con automatically.
> >
> > Yes, that's part of why I made it a tri-state with a default of 'auto'.
> >
> >>
> >>
> >>> +     */
> >>> +    if (!arg->has_multi_conn) {
> >>> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_AUTO;
> >>> +    }
> >>> +    if (nbd_server_max_connections() == 1) {
> >>
> >> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_OFF;
> >>> +    }
> >>
> >> +    if (arg->multi_conn == NBD_EXPORT_MULTI_CONN_AUTO) {
> >>> +        multi_conn = readonly;
> >>> +    } else {
> >>> +        multi_conn = arg->multi_conn == NBD_EXPORT_MULTI_CONN_ON;
> >>> +    }
> >>>
> >>
> >> This part is a little bit confusing - we do:
> >> - initialize args->multi_con if it has not value
> >> - set the temporary multi_con based now initialized args->multi_con
> >>
> >> I think it will be nicer to separate arguments parsing, so there is no need
> >> to initialize it here or have arg->has_multi_conn, but I did not check how
> >> other arguments are handled.
> >
> > arg->has_multi_conn is fallout from the fact that our QAPI must remain
> > back-compat. If it is false, the user did not pass "multi-conn":...,
> > so we want the default value of "auto".  Once we've established the
> > default, then we force multi-conn off if we know we are limited to one
> > client (although as you pointed out, nbd_server_max_connections()
> > needs to be tested with qemu-nbd).  Then, it's easier to resolve the
> > tri-state enum variable into the bool of what we actually advertise to
> > the NBD client.
> >
> >>> +++ b/tests/qemu-iotests/tests/nbd-multiconn
> >>> @@ -0,0 +1,188 @@
> >>> +#!/usr/bin/env bash
> >>> +# group: rw auto quick
> >>> +#
> >>> +# Test that qemu-nbd MULTI_CONN works
> >>> +#
> >>> +echo
> >>> +echo "=== Initial image setup ==="
> >>> +echo
> >>> +
> >>> +_make_test_img 4M
> >>> +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
> >>> +_launch_qemu 2> >(_filter_nbd)
> >>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
> >>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
> >>> +  "arguments":{"driver":"qcow2", "node-name":"n",
> >>> +    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
> >
> > I'm not the best at writing python iotests; I welcome a language
> > translation of this aspect.
>
>
>
> Let me try:)

Thanks! This is much nicer and will be easier to maintain.

>
>
> #!/usr/bin/env python3
>
> import os
> import iotests
> import nbd
> from iotests import qemu_img_create, qemu_io_silent
>
>
> disk = os.path.join(iotests.test_dir, 'disk')
> size = '4M'
> nbd_sock = os.path.join(iotests.test_dir, 'nbd_sock')
> nbd_uri = 'nbd+unix:///{}?socket=' + nbd_sock
>
>
> class TestNbdMulticonn(iotests.QMPTestCase):
>      def setUp(self):
>          assert qemu_img_create('-f', iotests.imgfmt, disk, size) == 0
>          assert qemu_io_silent('-c', 'w -P 1 0 2M',
>                                '-c', 'w -P 2 2M 2M', disk) == 0
>
>          self.vm = iotests.VM()
>          self.vm.launch()
>          result = self.vm.qmp('blockdev-add', {
>              'driver': 'qcow2',
>              'node-name': 'n',
>              'file': {'driver': 'file', 'filename': disk}
>          })
>          self.assert_qmp(result, 'return', {})
>
>      def tearDown(self):
>          self.vm.shutdown()
>          os.remove(disk)
>          os.remove(nbd_sock)
>
>      def server_start(self, max_connections=None):
>          args = {
>              'addr': {
>                  'type': 'unix',
>                  'data': {'path': nbd_sock}
>              }
>          }
>          if max_connections is not None:
>              args['max-connections'] = max_connections
>
>          result = self.vm.qmp('nbd-server-start', args)
>          self.assert_qmp(result, 'return', {})
>
>      def export_add(self, name, writable=None, multi_conn=None):
>          args = {
>              'type': 'nbd',
>              'id': name,
>              'node-name': 'n',
>              'name': name,
>          }
>          if writable is not None:
>              args['writable'] = writable
>          if multi_conn is not None:
>              args['multi-conn'] = multi_conn
>
>          result = self.vm.qmp('block-export-add', args)
>          self.assert_qmp(result, 'return', {})
>
>      def check_multi_conn(self, export_name, multi_conn):
>          cl = nbd.NBD()
>          cl.connect_uri(nbd_uri.format(export_name))
>          self.assertEqual(cl.can_multi_conn(), multi_conn)
>          cl.shutdown()

The test will be more clear and the code more reusable if the helper
was doing only connect/disconnect.

@contextmanager
def open_nbd(nbd_uri, export_name):
     h = nbd.NBD()
     h.connect_uri(nbd_uri.format(export_name))
     try:
         yield h
     finally:
         h.shutdown()

Any test that need nbd handle can do:

    with open_nbd(nbd_uri, export_name) as h:
        use the handle...

Good example when we can use this is the block status cache test,
using complicated qemu-img commands instead of opening
a client and calling block_status a few times.

And this also cleans up at the end of the test so failure
will not affect the next test.

The helper can live in the iotest module instead of inventing it for
every new test.

>
>      def test_default_settings(self):
>          self.server_start()
>          self.export_add('r'))
>          self.export_add('w', writable=True)
>          self.check_multi_conn('r', True)
>          self.check_multi_conn('w', False)

With the helper suggested, this test will be:

    with open_nbd(nbd_uri, "r") as h:
        self.assertTrue(h.can_multi_conn())

    with open_nbd(nbd_uri, "w") as h:
        self.assertFalse(h.can_multi_conn())

Now you don't need to check what check_multicon() is doing when
reading the tests, and it is very clear what open_nbd() does based
on the name and usage as context manager.

>
>      def test_multiconn_option(self):
>          self.server_start()
>          self.export_add('r', multi_conn='off')
>          self.export_add('w', writable=True, multi_conn='on')

It will be more natural to use:

    self.start_server()
    self.add_export(...)

In C the other way is more natural because you don't have namespaces
or classes.

>          self.check_multi_conn('r', False)
>          self.check_multi_conn('w', True)

And I think you agree since you did not use:

    self.multi_con_check(...)

>
>      def test_limited_connections(self):
>          self.server_start(max_connections=1)
>          self.export_add('r', multi_conn='on')
>          self.export_add('w', writable=True, multi_conn='on')
>          self.check_multi_conn('r', False)
>          self.check_multi_conn('w', False)
>
>      def test_parallel_writes(self):
>          self.server_start()
>          self.export_add('w', writable=True, multi_conn='on')
>
>          clients = [nbd.NBD() for _ in range(3)]
>          for c in clients:
>              c.connect_uri(nbd_uri.format('w'))
>              assert c.can_multi_conn()
>
>          buf1 = clients[0].pread(1024 * 1024, 0)
>          self.assertEqual(buf1, b"\x01" * 1024 * 1024)
>
>          buf2 = b"\x03" * 1024 * 1024
>          clients[1].pwrite(buf2, 0)
>          clients[2].flush()
>          buf1 = clients[0].pread(1024 * 1024, 0)
>
>          self.assertEqual(buf1, buf2)
>
>          for i in range(3):
>              clients[i].shutdown()
>
>
> if __name__ == '__main__':
>      iotests.main(supported_fmts=['qcow2'])
>
> > But the shell code for
> > _launch_qemu/_send_qemu_cmd was already pretty nice for setting up a
> > long-running background qemu process where I can pass in QMP commands
> > at will, then interact from other processes.
> >
> >>> +export nbd_unix_socket
> >>> +
> >>> +echo
> >>> +echo "=== Default nbd server settings ==="
> >>> +echo
> >>> +# Default allows for unlimited connections, readonly images advertise
> >>> +# multi-conn, and writable images do not
> >>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
> >>> +  "arguments":{"addr":{"type":"unix",
> >>> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
> >>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> >>> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> >>> +    "name":"r"}}' "return"
> >>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> >>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> >>> +    "name":"w", "writable":true}}' "return"
> >>> +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
> >>> +assert h.can_multi_conn()
> >>> +h.shutdown()
> >>> +print("nbdsh passed")'
> >>> +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
> >>> +assert not h.can_multi_conn()
> >>> +h.shutdown()
> >>> +print("nbdsh passed")'
> >>>
> >>
> >> Mixing of shell and python is very confusing. Wouldn't it be much cleaner
> >> to write the test in python?
> >
> > Here, nbdsh -c 'python snippet' is used as a shell command line
> > parameter.  Writing python code to call out to a system() command
> > where one of the arguments to that command is a python script snippet
> > is going to be just as annoying as writing it in bash.
> >
> >>> +echo
> >>> +echo "=== Demonstrate parallel writers ==="
> >>> +echo
> >>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
> >>> +  "arguments":{"addr":{"type":"unix",
> >>> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
> >>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> >>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> >>> +    "name":"", "multi-conn":"on", "writable":true}}' "return"
> >>> +
> >>> +nbdsh -c '
> >>> +import os
> >>> +sock = os.getenv("nbd_unix_socket")
> >>> +h = []
> >>> +
> >>> +for i in range(3):
> >>> +  h.append(nbd.NBD())
> >>> +  h[i].connect_unix(sock)
> >>> +  assert h[i].can_multi_conn()
> >>>
> >>
> >> This is somewhat C in python, maybe:
> >>
> >>      handles = [nbd.NBD() for _ in range(3)]
> >>
> >>      for h in handles:
> >>          h.connect_unix(sock)
> >>          assert h.can_multi_con()
> >>
> >> Since assert will abort the test, and we don't handle
> >> exceptions, failure will not shutdown the connections
> >> but it should not matter for the purpose of a test.
> >
> > As I said, I'm open to python suggestions :)  I like your approach.
> >
> >>
> >>
> >>> +
> >>> +buf1 = h[0].pread(1024 * 1024, 0)
> >>> +if buf1 != b"\x01" * 1024 * 1024:
> >>> +  print("Unexpected initial read")
> >>>
> >>
> >> Not clear when we initialize the buffer to \x01 - is this the qemu-io above?
> >
> > Yes, when the qcow2 file was initially created.
> >
> >>
> >>
> >>> +buf2 = b"\x03" * 1024 * 1024
> >>> +h[1].pwrite(buf2, 0)
> >>> +h[2].flush()
> >>> +buf1 = h[0].pread(1024 * 1024, 0)
> >>> +if buf1 == buf2:
> >>> +  print("Flush appears to be consistent across connections")
> >>>
> >>
> >> buf1 was the initial content, buf2 is the new content, but now we override
> >> but1 to check that the right was flushed. It will be be better to use
> >> different
> >> names like inittial_data, updated_data, current_data.
> >
> > Can do.
> >
> >>
> >> This block is the most important part of the test, showing that we can write
> >> in one connection, flush in the second, and read the written block in the
> >> third.
> >> Maybe add a comment about this? I think it will help someone else trying
> >> to understand what this part is trying to test.
> >
> > Can do.
> >
> >>> +{"execute":"block-export-add",
> >>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> >>> +    "name":"", "multi-conn":"on", "writable":true}}
> >>> +{"return": {}}
> >>> +Flush appears to be consistent across connections
> >>> +{"execute":"block-export-del",
> >>> +  "arguments":{"id":"w"}}
> >>> +{"return": {}}
> >>> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> >>> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
> >>> +{"execute":"nbd-server-stop"}
> >>> +{"return": {}}
> >>> +{"execute":"quit"}
> >>> +{"return": {}}
> >>> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> >>> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
> >>>
> >>
> >> Nothing about the contents here says anything about the actual test
> >> except the "Flush appears..." line.
> >
> > Yeah, it's a lot of QMP debugging (to show what commands were run in
> > setting up the server), and less verbose in the nbdsh side.  Do I need
> > to add more output during the nbdsh that uses multiple connections?
> >
> >>
> >>
> >>> +*** done
> >>> --
> >>> 2.35.1
> >>>
> >>
> >> Looks good, feel free to ignore the style comments and suggestion to rewrite
> >> the test in python.
> >
> > The style comments are nice, the rewriting is going to be harder for
> > me (but I'll accept help).  At any rate, getting qemu-nbd to be
> > feature-compatible may require a v3 anyway.
> >
>
>
> --
> Best regards,
> Vladimir
>


