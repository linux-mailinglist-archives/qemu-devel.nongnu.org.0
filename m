Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B426A47CDA3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:42:11 +0100 (CET)
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzwGI-00034U-Dv
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:42:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzvhB-000300-1u
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 02:05:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzvh6-0001N3-EC
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 02:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640156747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3vZRM92fpIhK5NxSilSi89+e7DLacPHN9I490uwPqY=;
 b=i2bjmIQ+hTqGY6uo8CD9WWu/wYCoknQgGsRhST3/JVKNYDcVGJP6ls8iSZFBdi36S7TfKq
 y4CBK0sF7y3CA301EG1w2Q9PHM4pRATpLsjVR+IFLY1gffWwPZ4AWPWYz1C8c7a36veA6j
 6MQxQrGUaYMCE+QGuWMoggkzn5CXDxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-OsfKcLUjMbmyc_UAkLyXVA-1; Wed, 22 Dec 2021 02:05:46 -0500
X-MC-Unique: OsfKcLUjMbmyc_UAkLyXVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17FA7343CB;
 Wed, 22 Dec 2021 07:05:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A3437747D;
 Wed, 22 Dec 2021 07:05:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA41C113865F; Wed, 22 Dec 2021 08:05:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
References: <20211220200034.2233987-1-philmd@redhat.com>
 <20211220200034.2233987-3-philmd@redhat.com>
Date: Wed, 22 Dec 2021 08:05:24 +0100
In-Reply-To: <20211220200034.2233987-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 20 Dec 2021 21:00:34
 +0100")
Message-ID: <87h7b1dsqz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Do not list vhost-user-blk in BlockExportType
> when CONFIG_VHOST_USER_BLK_SERVER is disabled.
>
> Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")

My immediate reaction was "what exactly is broken before this patch?"

I think it's introspection: query-qmp-schema has vhost-user-blk even
though it's not actually available.  Let's spell that out.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qapi/block-export.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index c1b92ce1c1c..6bc29a75dc0 100644
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
>              { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
> =20
>  ##

Doesn't compile when I configure --disable-vhost-user.  Fix:

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 6bc29a75dc..f9ce79a974 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -320,7 +320,8 @@
   'discriminator': 'type',
   'data': {
       'nbd': 'BlockExportOptionsNbd',
-      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
+      'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
+                          'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
       'fuse': { 'type': 'BlockExportOptionsFuse',
                 'if': 'CONFIG_FUSE' }
    } }


