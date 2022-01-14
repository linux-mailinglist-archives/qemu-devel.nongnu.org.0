Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6A48E8F0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:10:36 +0100 (CET)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KTa-0004Ev-12
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:10:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8KGQ-0004JU-Lm
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:56:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8KGN-0001yr-CY
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642157807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/1BUvdynrr/sfzGKJLYGfcsX9/tsLp/OiKfcbHWtbQ=;
 b=Z7sDlDLI1IKpUH/+5xvP+ppMIGvJYi/Pw9ZZ9bD8HOgucIuiHl0CgAGxl9uY1yZNijlMTh
 6pZpGA3vU5wjWebXzUMyO1z7x7zspkNgFyC2aTu7znYt9AP7QcpRMzua4dQw8W5GDjruvE
 d2t6HqX68RknKSlJee91Fl3SooIgq+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-_ZX6h2W0Npa2mJcie-GhbA-1; Fri, 14 Jan 2022 05:56:46 -0500
X-MC-Unique: _ZX6h2W0Npa2mJcie-GhbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83DBA80D692;
 Fri, 14 Jan 2022 10:56:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F4881F63;
 Fri, 14 Jan 2022 10:56:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B81E11380A2; Fri, 14 Jan 2022 11:56:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
References: <20211223101426.3143647-1-philmd@redhat.com>
 <20211223101426.3143647-3-philmd@redhat.com>
Date: Fri, 14 Jan 2022 11:56:23 +0100
In-Reply-To: <20211223101426.3143647-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Dec 2021 11:14:26
 +0100")
Message-ID: <87zgny37s8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When building QEMU with --disable-vhost-user and using introspection,
> query-qmp-schema lists vhost-user-blk even though it's not actually
> available:
>
>   { "execute": "query-qmp-schema" }
>   {
>       "return": [
>           ...
>           {
>               "name": "312",
>               "members": [
>                   {
>                       "name": "nbd"
>                   },
>                   {
>                       "name": "vhost-user-blk"
>                   }
>               ],
>               "meta-type": "enum",
>               "values": [
>                   "nbd",
>                   "vhost-user-blk"
>               ]
>           },
>
> Restrict vhost-user-blk in BlockExportType when
> CONFIG_VHOST_USER_BLK_SERVER is disabled, so it
> doesn't end listed by query-qmp-schema.
>
> Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Reword + restrict BlockExportOptions union (armbru)
> ---
>  qapi/block-export.json | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index c1b92ce1c1c..f9ce79a974b 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -277,7 +277,8 @@
>  # Since: 4.2
>  ##
>  { 'enum': 'BlockExportType',
> -  'data': [ 'nbd', 'vhost-user-blk',
> +  'data': [ 'nbd',
> +            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SER=
VER' },

Please break this line like

               { 'name': 'vhost-user-blk',
                 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },

>              { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
> =20
>  ##
> @@ -319,7 +320,8 @@
>    'discriminator': 'type',
>    'data': {
>        'nbd': 'BlockExportOptionsNbd',
> -      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
> +      'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
> +                          'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>        'fuse': { 'type': 'BlockExportOptionsFuse',
>                  'if': 'CONFIG_FUSE' }
>     } }

Acked-by: Markus Armbruster <armbru@redhat.com>


