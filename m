Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465AB4D8B52
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:06:08 +0100 (CET)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTp55-0001FC-4j
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:06:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTou5-00066F-PA
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTou2-00028h-38
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647280480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/pSt/XpjoDkMzk4xHjl02HKeZeAzhGl+8korwbM8wcM=;
 b=SfqTJeT5qjziWEwSCiAFLdIKcDC0V17cWtS46j7f2tTaksLHp34gYVf7ksUONWFeHX+QCN
 Y0dsGJ9lnvhMm6wfLZPxk9G/q6OxL73XeS+GtoaaHMmVTf3kJeRB2nsvgF6+0Ee7Ln1FXf
 KFLiQahv6JmGStpDm7DLb3xbmqRiJis=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-E2E73q8nNgmCi-3ODHYj0g-1; Mon, 14 Mar 2022 13:54:34 -0400
X-MC-Unique: E2E73q8nNgmCi-3ODHYj0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 156271C05AE8;
 Mon, 14 Mar 2022 17:54:34 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FFFA40D2820;
 Mon, 14 Mar 2022 17:54:33 +0000 (UTC)
Date: Mon, 14 Mar 2022 12:54:31 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220314175431.fehxvysxxhrh32uz@redhat.com>
References: <20220215171838.2651387-1-eblake@redhat.com>
 <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
 <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
 <a36660ff-c7d6-9bd1-bea8-dc0a10b74329@virtuozzo.com>
 <CAMRbyysF6p=_Hdj-b6jdAVqfpQHqjGQ4V_=GfQmAxiPPwHyt0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyysF6p=_Hdj-b6jdAVqfpQHqjGQ4V_=GfQmAxiPPwHyt0Q@mail.gmail.com>
User-Agent: NeoMutt/20211029-427-23b03a
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Richard Jones <rjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 07:14:58PM +0200, Nir Soffer wrote:
> > > I'm not the best at writing python iotests; I welcome a language
> > > translation of this aspect.
> >
> >
> >
> > Let me try:)
> 
> Thanks! This is much nicer and will be easier to maintain.
> 
> >
> >
> > #!/usr/bin/env python3
> >
> > import os
> > import iotests
> > import nbd

What happens here if libnbd is not installed?  Is there a way to make
the test gracefully skip instead of error out?

> >      def check_multi_conn(self, export_name, multi_conn):
> >          cl = nbd.NBD()
> >          cl.connect_uri(nbd_uri.format(export_name))
> >          self.assertEqual(cl.can_multi_conn(), multi_conn)
> >          cl.shutdown()
> 
> The test will be more clear and the code more reusable if the helper
> was doing only connect/disconnect.
> 
> @contextmanager
> def open_nbd(nbd_uri, export_name):
>      h = nbd.NBD()
>      h.connect_uri(nbd_uri.format(export_name))

This can throw an exception if the connect fails; should it be inside
the try?  I'm comparing to libnbd/python/t/220-opt-list.py, which also
sets up a context manager.

>      try:
>          yield h
>      finally:
>          h.shutdown()
> 
> Any test that need nbd handle can do:
> 
>     with open_nbd(nbd_uri, export_name) as h:
>         use the handle...
> 
> Good example when we can use this is the block status cache test,
> using complicated qemu-img commands instead of opening
> a client and calling block_status a few times.
> 
> And this also cleans up at the end of the test so failure
> will not affect the next test.
> 
> The helper can live in the iotest module instead of inventing it for
> every new test.

Moving it into iotest makes the question about what to do if libnbd is
not installed even more important; while we could perhaps catch and
deal with a failed 'import' for this test, skipping the iotest module
due to a failed import has knock-on effects to all other iotests even
when they don't care if libnbd is installed.

> 
> >
> >      def test_default_settings(self):
> >          self.server_start()
> >          self.export_add('r'))
> >          self.export_add('w', writable=True)
> >          self.check_multi_conn('r', True)
> >          self.check_multi_conn('w', False)
> 
> With the helper suggested, this test will be:
> 
>     with open_nbd(nbd_uri, "r") as h:
>         self.assertTrue(h.can_multi_conn())
> 
>     with open_nbd(nbd_uri, "w") as h:
>         self.assertFalse(h.can_multi_conn())
> 
> Now you don't need to check what check_multicon() is doing when
> reading the tests, and it is very clear what open_nbd() does based
> on the name and usage as context manager.

Yes, I like that aspect of a context manager.

> 
> >
> >      def test_multiconn_option(self):
> >          self.server_start()
> >          self.export_add('r', multi_conn='off')
> >          self.export_add('w', writable=True, multi_conn='on')
> 
> It will be more natural to use:
> 
>     self.start_server()
>     self.add_export(...)
> 
> In C the other way is more natural because you don't have namespaces
> or classes.
> 
> >          self.check_multi_conn('r', False)
> >          self.check_multi_conn('w', True)
> 
> And I think you agree since you did not use:
> 
>     self.multi_con_check(...)
>

Useful naming advice.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


