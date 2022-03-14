Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE64D8899
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:54:58 +0100 (CET)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTn28-0005Vg-V2
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:54:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTmzy-0003vK-2Y
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTmzv-0000Ay-BK
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647273157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtHfg2EbiVy315eL+aN//Mxmn1fKsPtntse4mtYoFZo=;
 b=f0WHI8ZA/JL6rFZgmm+f2BSzPfG2RjdjeYwoeYZ6LSbycTfWCY2nm8I9fKdRY5G3t6bRAD
 fJzvr1IJlRxxexYOhwz1OlXPo06MLa4bwvlADDrRm/3O9lfh2ZCFlJmeRztgxJ6lcWB9MF
 28unyPMgAn6LmpDeKgXXI8A/O2Vr7wY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-a_LwVYu1Pa-HhJeYQy-pgw-1; Mon, 14 Mar 2022 11:52:35 -0400
X-MC-Unique: a_LwVYu1Pa-HhJeYQy-pgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E247106655C;
 Mon, 14 Mar 2022 15:52:35 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE9C400F748;
 Mon, 14 Mar 2022 15:52:34 +0000 (UTC)
Date: Mon, 14 Mar 2022 10:52:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 v.sementsov-og@ya.ru
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220314155233.3wv64ipm72khftos@redhat.com>
References: <20220215171838.2651387-1-eblake@redhat.com>
 <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
 <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
 <a36660ff-c7d6-9bd1-bea8-dc0a10b74329@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a36660ff-c7d6-9bd1-bea8-dc0a10b74329@virtuozzo.com>
User-Agent: NeoMutt/20211029-410-d8ee8c
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Richard Jones <rjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Nir Soffer <nsoffer@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:08:06AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 16.02.2022 02:24, Eric Blake wrote:

> > > > +++ b/tests/qemu-iotests/tests/nbd-multiconn
> > > > @@ -0,0 +1,188 @@
> > > > +#!/usr/bin/env bash
> > > > +# group: rw auto quick
> > > > +#
> > > > +# Test that qemu-nbd MULTI_CONN works
> > > > +#
> > > > +echo
> > > > +echo "=== Initial image setup ==="
> > > > +echo
> > > > +
> > > > +_make_test_img 4M
> > > > +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
> > > > +_launch_qemu 2> >(_filter_nbd)
> > > > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
> > > > +_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
> > > > +  "arguments":{"driver":"qcow2", "node-name":"n",
> > > > +    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
> > 
> > I'm not the best at writing python iotests; I welcome a language
> > translation of this aspect.
> 
> 
> 
> Let me try:)
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

...

Thanks; I'm playing with this (and the improvements suggested in
followup messages) in preparation for a v3 posting.

> > > > +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
> > > > +assert h.can_multi_conn()
> > > > +h.shutdown()
> > > > +print("nbdsh passed")'
> > > > +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
> > > > +assert not h.can_multi_conn()
> > > > +h.shutdown()
> > > > +print("nbdsh passed")'
> > > > 
> > > 
> > > Mixing of shell and python is very confusing. Wouldn't it be much cleaner
> > > to write the test in python?
> > 
> > Here, nbdsh -c 'python snippet' is used as a shell command line
> > parameter.  Writing python code to call out to a system() command
> > where one of the arguments to that command is a python script snippet
> > is going to be just as annoying as writing it in bash.

Then again, since libnbd already includes python bindings, we wouldn't
have to detour through nbdsh, but just use the python bindings
directly (and I see that your translation did that).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


