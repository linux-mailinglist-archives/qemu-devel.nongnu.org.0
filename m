Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A20A3E01D8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:22:46 +0200 (CEST)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGr7-0003D6-7m
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBGmr-0002NA-Nz
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:18:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBGmn-0005Z7-I4
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628083096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=heT617uQeY4Du2Y1KnJOFG2khX1TLEEICvcYubVGSSI=;
 b=MbJNPI9Vomm3BeNpvmsrPUwM+26z86CfNtF9+ZHxV8QRfumSb2WxEgWoFgoTWvGQqaRfe/
 oEl41wdn/jiyGwMwtheLFucS9UVyvD8S5+4GGRm1sp/brI+aU6H6HNE659iGV+oRJk1+ME
 1ZrJVRQpnmNsKV/ddL61A5qo279RA5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-HXZpSzHWPEauB7FMP2ACUg-1; Wed, 04 Aug 2021 09:18:13 -0400
X-MC-Unique: HXZpSzHWPEauB7FMP2ACUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6740A8005A2;
 Wed,  4 Aug 2021 13:18:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FBFB1B5C1;
 Wed,  4 Aug 2021 13:18:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 74D2711380A0; Wed,  4 Aug 2021 15:18:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 22/33] qapi: publish copy-before-write filter
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-23-vsementsov@virtuozzo.com>
Date: Wed, 04 Aug 2021 15:18:10 +0200
In-Reply-To: <20210804093813.20688-23-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 4 Aug 2021 12:38:02 +0300")
Message-ID: <87r1f9fiwd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, crosa@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>  qapi/block-core.json | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 675d8265eb..59d3e5e42d 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2825,13 +2825,14 @@
>  # @blklogwrites: Since 3.0
>  # @blkreplay: Since 4.2
>  # @compress: Since 5.0
> +# @copy-before-write: Since 6.1
>  #
>  # Since: 2.9
>  ##
>  { 'enum': 'BlockdevDriver',
>    'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
> -            'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
> -            'gluster',
> +            'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
> +            'file', 'ftp', 'ftps', 'gluster',
>              {'name': 'host_cdrom', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>              {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>              'http', 'https', 'iscsi',
> @@ -4049,6 +4050,25 @@
>    'base': 'BlockdevOptionsGenericFormat',
>    'data': { '*bottom': 'str' } }
>  
> +##
> +# @BlockdevOptionsCbw:
> +#
> +# Driver specific block device options for the copy-before-write driver,
> +# which does so called copy-before-write operations: when data is
> +# written to the filter, the filter firstly reads corresponding blocks

s/firstly/first/

> +# from its file child and copies them to @target child. After successful

s/successful/successfully/

> +# copying the write request is propagated to file child. If copying

Comma after copying, I think.

> +# failed, the original write request is failed too and no data is written

s/failed,/fails,/

> +# to file child.
> +#
> +# @target: The target for copy-before-write operations.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'BlockdevOptionsCbw',
> +  'base': 'BlockdevOptionsGenericFormat',
> +  'data': { 'target': 'BlockdevRef' } }
> +
>  ##
>  # @BlockdevOptions:
>  #
> @@ -4101,6 +4121,7 @@
>        'bochs':      'BlockdevOptionsGenericFormat',
>        'cloop':      'BlockdevOptionsGenericFormat',
>        'compress':   'BlockdevOptionsGenericFormat',
> +      'copy-before-write':'BlockdevOptionsCbw',
>        'copy-on-read':'BlockdevOptionsCor',
>        'dmg':        'BlockdevOptionsGenericFormat',
>        'file':       'BlockdevOptionsFile',

With the doc phrasing tweaks duly considered:
Acked-by: Markus Armbruster <armbru@redhat.com>


