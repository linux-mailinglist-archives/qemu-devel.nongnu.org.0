Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7754A400065
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:22:09 +0200 (CEST)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM98y-0006Sl-CI
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vx-0007AI-Vi
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vr-0001MX-Ln
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MVF4fhqjtH34MGKeiR5ZxavX1CxB8I9Kj1NkwXeFMU=;
 b=AdRYT2iTr12g6VBIKEd6tQHkV1dt1le4o1kAhC0AHX5dmlNr3LIcJy++9daiZET0Qsg5f5
 TUtZdlcGIXVpMjeJAPRE0nTBoTiF1DmK+erlkg5Mu/XfwSxtFY4XmC7rpJeW4dTo26iOHf
 K+nZIJCIImd+4P/+QVPjef/lTPKP+Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-_QXtinLrMNyi5aZAbpsMNA-1; Fri, 03 Sep 2021 09:08:32 -0400
X-MC-Unique: _QXtinLrMNyi5aZAbpsMNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B513F10054F6;
 Fri,  3 Sep 2021 13:08:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61A7C18AD4;
 Fri,  3 Sep 2021 13:08:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F2101138223; Wed,  1 Sep 2021 13:44:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 10/19] block: introduce fleecing block driver
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
 <20210827181808.311670-11-vsementsov@virtuozzo.com>
Date: Wed, 01 Sep 2021 13:44:58 +0200
In-Reply-To: <20210827181808.311670-11-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 27 Aug 2021 21:17:59 +0300")
Message-ID: <877dg0bjut.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Introduce a new driver, that works in pair with copy-before-write to
> improve fleecing.
>
> Without fleecing driver, old fleecing scheme looks as follows:
>
> [guest]
>   |
>   |root
>   v
> [copy-before-write] -----> [temp.qcow2] <--- [nbd export]
>   |                 target  |
>   |file                     |backing
>   v                         |
> [active disk] <-------------+
>
> With fleecing driver, new scheme is:
>
> [guest]
>   |
>   |root
>   v
> [copy-before-write] -----> [fleecing] <--- [nbd export]
>   |                 target  |    |
>   |file                     |    |file
>   v                         |    v
> [active disk]<--source------+  [temp.img]
>
> Benefits of new scheme:
>
> 1. Access control: if remote client try to read data that not covered
>    by original dirty bitmap used on copy-before-write open, client gets
>    -EACCES.
>
> 2. Discard support: if remote client do DISCARD, this additionally to
>    discarding data in temp.img informs block-copy process to not copy
>    these clusters. Next read from discarded area will return -EACCES.
>    This is significant thing: when fleecing user reads data that was
>    not yet copied to temp.img, we can avoid copying it on further guest
>    write.
>
> 3. Synchronisation between client reads and block-copy write is more
>    efficient: it doesn't block intersecting block-copy write during
>    client read.
>
> 4. We don't rely on backing feature: active disk should not be backing
>    of temp image, so we avoid some permission-related difficulties and
>    temp image now is not required to support backing, it may be simple
>    raw image.
>
> Note that now nobody calls fleecing_drv_activate(), so new driver is
> actually unusable. It's a work for the following patch: support
> fleecing block driver in copy-before-write filter driver.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json |  17 ++-
>  block/fleecing.h     |  16 +++
>  block/fleecing-drv.c | 260 +++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS          |   1 +
>  block/meson.build    |   1 +
>  5 files changed, 294 insertions(+), 1 deletion(-)
>  create mode 100644 block/fleecing-drv.c
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index c42d23752d..8a333136f5 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2826,13 +2826,14 @@
>  # @blkreplay: Since 4.2
>  # @compress: Since 5.0
>  # @copy-before-write: Since 6.2
> +# @fleecing: Since 6.2
>  #
>  # Since: 2.9
>  ##
>  { 'enum': 'BlockdevDriver',
>    'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
>              'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
> -            'file', 'ftp', 'ftps', 'gluster',
> +            'file', 'fleecing', 'ftp', 'ftps', 'gluster',
>              {'name': 'host_cdrom', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>              {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>              'http', 'https', 'iscsi',
> @@ -4077,6 +4078,19 @@
>    'base': 'BlockdevOptionsGenericFormat',
>    'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>  
> +##
> +# @BlockdevOptionsFleecing:
> +#
> +# Driver that works in pair with copy-before-write to make fleecing scheme.

This is really terse.  Do we explain the driver's intended use anywhere?

I'd suggest s/to make fleecing scheme/to make a fleecing scheme/, except
it doesn't make much sense to me either way :)

> +#
> +# @source: source node of fleecing

We usually say "node name of ...".

> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'BlockdevOptionsFleecing',
> +  'base': 'BlockdevOptionsGenericFormat',
> +  'data': { 'source': 'str' } }
> +
>  ##
>  # @BlockdevOptions:
>  #
> @@ -4133,6 +4147,7 @@
>        'copy-on-read':'BlockdevOptionsCor',
>        'dmg':        'BlockdevOptionsGenericFormat',
>        'file':       'BlockdevOptionsFile',
> +      'fleecing':   'BlockdevOptionsFleecing',
>        'ftp':        'BlockdevOptionsCurlFtp',
>        'ftps':       'BlockdevOptionsCurlFtps',
>        'gluster':    'BlockdevOptionsGluster',

[...]


