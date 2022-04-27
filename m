Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEE511C10
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 17:53:29 +0200 (CEST)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njjyq-0000W9-Gq
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 11:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njjxi-000885-P2
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njjxg-00040E-Sw
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651074736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o+/cdX66SrUUtT1al3s/ZatbK23K/MYaufzZ0NrX5tY=;
 b=H5/hUwZQEjCrZcmiL4mECjMlOLDcNKvN3hJRIOQkgvaYMKy3qbydZ+85EhWKbqfGjHt2GB
 tJg/MuQFKAJp64vv8g6CEjJsK5w1mV1cYe0e1H5qijfac7UyOuFLw7szuBsuHYDO2+o3rB
 p+t8N6+RhhMzVl6WbMzXLimrrJ1rxwY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-Ds2S2ppUNGq0t72uyb8LAA-1; Wed, 27 Apr 2022 11:52:13 -0400
X-MC-Unique: Ds2S2ppUNGq0t72uyb8LAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 736E53C0E187;
 Wed, 27 Apr 2022 15:52:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90039C08087;
 Wed, 27 Apr 2022 15:52:10 +0000 (UTC)
Date: Wed, 27 Apr 2022 17:52:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <YmlmqSh9QADBm9jp@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
 <20220314203818.3681277-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314203818.3681277-4-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, rjones@redhat.com, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.03.2022 um 21:38 hat Eric Blake geschrieben:
> According to the NBD spec, a server that advertises
> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> not see any cache inconsistencies: when properly separated by a single
> flush, actions performed by one client will be visible to another
> client, regardless of which client did the flush.  We satisfy these
> conditions in qemu when our block layer is backed by the local
> filesystem (by virtue of the semantics of fdatasync(), and the fact
> that qemu itself is not buffering writes beyond flushes).  It is
> harder to state whether we satisfy these conditions for network-based
> protocols, so the safest course of action is to allow users to opt-in
> to advertising multi-conn.

Do you have an example of how this could be unsafe?

As I understand it, the NBD server has a single BlockBackend and
therefore is a single client for the backend, be it file-posix or any
network-based protocol. It doesn't really make a difference for the
storage from how many different NBD clients the requests are coming.

I would have expected that cache coherency of the protocol level driver
would only matter if you had two QEMU processes accessing the same file
concurrently.

In fact, I don't think we even need the flush restriction from the NBD
spec. All clients see the same state (that of the NBD server
BlockBackend) even without anyone issuing any flush. The flush is only
needed to make sure that cached data is written to the backing storage
when writeback caches are involved.

Please correct me if I'm misunderstanding something here.

> We may later tweak defaults to advertise
> by default when the block layer can confirm that the underlying
> protocol driver is cache consistent between multiple writers, but for
> now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
> explicitly start qemu-nbd (new -m command-line option) or
> qemu-storage-daemon (new qapi field 'multi-conn') with multi-conn
> advertisement in a known-safe setup where the client end can then
> benefit from parallel clients.
> 
> Note, however, that we don't want to advertise MULTI_CONN when we know
> that a second client cannot connect (for historical reasons, qemu-nbd
> defaults to a single connection while nbd-server-add and QMP commands
> default to unlimited connections; but we already have existing means
> to let either style of NBD server creation alter those defaults).  The
> harder part of this patch is setting up an iotest to demonstrate
> behavior of multiple NBD clients to a single server.  It might be
> possible with parallel qemu-io processes, but I found it easier to do
> in python with the help of libnbd, and help from Nir and Vladimir in
> writing the test.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Suggested-by: Nir Soffer <nsoffer@redhat.com>
> Suggested-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>

> @@ -709,6 +714,17 @@ int main(int argc, char **argv)
>                  exit(EXIT_FAILURE);
>              }
>              break;
> +        case 'm':
> +        {
> +            Error *err = NULL;
> +            multi_conn = qapi_enum_parse(&OnOffAuto_lookup, optarg,
> +                                         ON_OFF_AUTO_AUTO, &err);
> +            if (err) {
> +                error_report_err(err);
> +                exit(EXIT_FAILURE);
> +            }

I think this is the same as passing &error_fatal.

> +            break;
> +        }
>          case 'f':
>              fmt = optarg;
>              break;
> diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
> new file mode 100755
> index 000000000000..7d1179b33b05
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/nbd-multiconn
> @@ -0,0 +1,157 @@
> +#!/usr/bin/env python3
> +# group: rw auto quick
> +#
> +# Test cases for NBD multi-conn advertisement
> +#
> +# Copyright (C) 2022 Red Hat, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +
> +import os
> +from contextlib import contextmanager
> +import iotests
> +from iotests import qemu_img_create, qemu_io_silent

qemu_io_silent() doesn't exist any more, commit 72cfb937 removed it.

Kevin


