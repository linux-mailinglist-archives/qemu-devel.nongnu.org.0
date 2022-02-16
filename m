Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E374B8AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 14:47:24 +0100 (CET)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKKeQ-0004fs-Pc
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 08:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKKcA-0003LY-VJ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 08:45:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKKc7-0004xs-8H
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 08:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645019098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CfIsl86mQM63ny8/LjLJYqiQ5OUgWkUJ0CcLDgQopw4=;
 b=OTz1sIomBZ58kdL4USuSGawL/GPmlRWDuvbPpLXy2pKLDmEMif1yKUqveSVvxI1rs1zUaQ
 8VsbYcz/nCzmZXLNoCuqu5nKRst7iErMCGnNxEvJOhEY7CX2PTj9DPaYxEXulLsg9QLEoA
 Y6s5a0oQj6xXAd2ZVXaPtLmMJhqjKSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-BE-_jZh5PI-WDfGnYE38aw-1; Wed, 16 Feb 2022 08:44:55 -0500
X-MC-Unique: BE-_jZh5PI-WDfGnYE38aw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 441ED2F44;
 Wed, 16 Feb 2022 13:44:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8A670D2E;
 Wed, 16 Feb 2022 13:44:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D79321608DA; Wed, 16 Feb 2022 14:44:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
References: <20220215171838.2651387-1-eblake@redhat.com>
Date: Wed, 16 Feb 2022 14:44:52 +0100
In-Reply-To: <20220215171838.2651387-1-eblake@redhat.com> (Eric Blake's
 message of "Tue, 15 Feb 2022 11:18:38 -0600")
Message-ID: <87bkz77wob.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, rjones@redhat.com, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> According to the NBD spec, a server advertising
> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> not see any cache inconsistencies: when properly separated by a single
> flush, actions performed by one client will be visible to another
> client, regardless of which client did the flush.  We satisfy these
> conditions in qemu when our block layer is backed by the local
> filesystem (by virtue of the semantics of fdatasync(), and the fact
> that qemu itself is not buffering writes beyond flushes).  It is
> harder to state whether we satisfy these conditions for network-based
> protocols, so the safest course of action is to allow users to opt-in
> to advertising multi-conn.  We may later tweak defaults to advertise
> by default when the block layer can confirm that the underlying
> protocol driver is cache consistent between multiple writers, but for
> now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
> explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
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
> possible with parallel qemu-io processes, but concisely managing that
> in shell is painful.  I found it easier to do by relying on the libnbd
> project's nbdsh, which means this test will be skipped on platforms
> where that is not available.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Fixes: https://bugzilla.redhat.com/1708300
> ---
>
> v1 was in Aug 2021 [1], with further replies in Sep [2] and Oct [3].
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04900.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00038.html
> [3] https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06744.html
>
> Since then, I've tweaked the QAPI to mention 7.0 (instead of 6.2), and
> reworked the logic so that default behavior is unchanged for now
> (advertising multi-conn on a writable export requires opt-in during
> the command line or QMP, but remains default for a readonly export).
> I've also expanded the amount of testing done in the new iotest.
>
>  docs/interop/nbd.txt                       |   1 +
>  docs/tools/qemu-nbd.rst                    |   3 +-
>  qapi/block-export.json                     |  34 +++-
>  include/block/nbd.h                        |   3 +-
>  blockdev-nbd.c                             |   5 +
>  nbd/server.c                               |  27 ++-
>  MAINTAINERS                                |   1 +
>  tests/qemu-iotests/tests/nbd-multiconn     | 188 +++++++++++++++++++++
>  tests/qemu-iotests/tests/nbd-multiconn.out | 112 ++++++++++++
>  9 files changed, 363 insertions(+), 11 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
>  create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out
>
> diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
> index bdb0f2a41aca..6c99070b99c8 100644
> --- a/docs/interop/nbd.txt
> +++ b/docs/interop/nbd.txt
> @@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
>  * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
>  NBD_CMD_FLAG_FAST_ZERO
>  * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
> +* 7.0: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 6031f9689312..1de785524c36 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.
>  .. option:: -e, --shared=NUM
>
>    Allow up to *NUM* clients to share the device (default
> -  ``1``), 0 for unlimited. Safe for readers, but for now,
> -  consistency is not guaranteed between multiple writers.
> +  ``1``), 0 for unlimited.
>
>  .. option:: -t, --persistent
>
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index f183522d0d2c..0a27e8ee84f9 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -21,7 +21,9 @@
>  #             recreated on the fly while the NBD server is active.
>  #             If missing, it will default to denying access (since 4.0).
>  # @max-connections: The maximum number of connections to allow at the same
> -#                   time, 0 for unlimited. (since 5.2; default: 0)
> +#                   time, 0 for unlimited. Setting this to 1 also stops
> +#                   the server from advertising multiple client support
> +#                   (since 5.2; default: 0)
>  #
>  # Since: 4.2
>  ##
> @@ -50,7 +52,9 @@
>  #             recreated on the fly while the NBD server is active.
>  #             If missing, it will default to denying access (since 4.0).
>  # @max-connections: The maximum number of connections to allow at the same
> -#                   time, 0 for unlimited. (since 5.2; default: 0)
> +#                   time, 0 for unlimited. Setting this to 1 also stops
> +#                   the server from advertising multiple client support
> +#                   (since 5.2; default: 0).
>  #
>  # Returns: error if the server is already running.
>  #
> @@ -79,6 +83,26 @@
>  { 'struct': 'BlockExportOptionsNbdBase',
>    'data': { '*name': 'str', '*description': 'str' } }
>
> +##
> +# @NbdExportMultiConn:
> +#
> +# Possible settings for advertising NBD multiple client support.
> +#
> +# @off: Do not advertise multiple clients.
> +#
> +# @on: Allow multiple clients (for writable clients, this is only safe
> +#      if the underlying BDS is cache-consistent, such as when backed
> +#      by the raw file driver); ignored if the NBD server was set up
> +#      with max-connections of 1.
> +#
> +# @auto: Behaves like @off if the export is writable, and @on if the
> +#        export is read-only.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'NbdExportMultiConn',
> +  'data': ['off', 'on', 'auto'] }

Have you considered using OnOffAuto from common.json?

Duplicating it as NbdExportMultiConn lets you document the values right
in the enum.  If you reuse it, you have to document them where the enum
is used, i.e. ...

> +
>  ##
>  # @BlockExportOptionsNbd:
>  #
> @@ -95,11 +119,15 @@
>  #                    the metadata context name "qemu:allocation-depth" to
>  #                    inspect allocation details. (since 5.2)
>  #
> +# @multi-conn: Controls whether multiple client support is advertised, if the
> +#              server's max-connections is not 1. (default auto, since 7.0)
> +#

... here.

>  # Since: 5.2
>  ##
>  { 'struct': 'BlockExportOptionsNbd',
>    'base': 'BlockExportOptionsNbdBase',
> -  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
> +  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool',
> +            '*multi-conn': 'NbdExportMultiConn' } }
>
>  ##
>  # @BlockExportOptionsVhostUserBlk:

[...]


