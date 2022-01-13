Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5EF48D89E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 14:16:38 +0100 (CET)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7zy1-0006l0-7f
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 08:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7zsL-00056u-2I
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7zsB-00016q-Ni
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642079431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzPPB3BQ/nkgp793b/k7wZKQJ7hPiD+ODAZBYFdWHnk=;
 b=SasXq5Iq1TYLSQRTSHtx5l6nQgfMnzbsGGiUBI6xxaI+O9btlMWmWOdmxats3tkpabsmDV
 5ltfkEzqfOn7RkLhSbhU6NZToEabrJ7Cd6Lbq5HIqmnVgFCpoev6DEgjE0RZiRiemJzzZc
 4O3l8ZOO2+RqWyW3X8Zf/t9WxcEMIHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-ynOC1U-BOkSSctlluV6HwA-1; Thu, 13 Jan 2022 08:10:30 -0500
X-MC-Unique: ynOC1U-BOkSSctlluV6HwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D587D1023F4F
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 13:10:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A3CD708F4;
 Thu, 13 Jan 2022 13:09:59 +0000 (UTC)
Date: Thu, 13 Jan 2022 13:09:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP
 for Linux
Message-ID: <YeAkpTE0gqf1dj4C@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-4-leobras@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
> Add property that allows zero-copy migration of memory pages,
> and also includes a helper function migrate_use_zero_copy() to check
> if it's enabled.
> 
> No code is introduced to actually do the migration, but it allow
> future implementations to enable/disable this feature.
> 
> On non-Linux builds this parameter is compiled-out.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  qapi/migration.json   | 24 ++++++++++++++++++++++++
>  migration/migration.h |  5 +++++
>  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
>  migration/socket.c    |  5 +++++
>  monitor/hmp-cmds.c    |  6 ++++++
>  5 files changed, 72 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index bbfd48cf0b..2e62ea6ebd 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -730,6 +730,13 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> +# @zero-copy: Controls behavior on sending memory pages on migration.
> +#             When true, enables a zero-copy mechanism for sending memory
> +#             pages, if host supports it.
> +#             Requires that QEMU be permitted to use locked memory for guest
> +#             RAM pages.
> +#             Defaults to false. (Since 7.0)
> +#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migration.  Such
>  #                        aliases may for example be the corresponding names on the
> @@ -769,6 +776,7 @@
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level' ,'multifd-zstd-level',
> +           { 'name': 'zero-copy', 'if' : 'CONFIG_LINUX'},
>             'block-bitmap-mapping' ] }
>  
>  ##
> @@ -895,6 +903,13 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> +# @zero-copy: Controls behavior on sending memory pages on migration.
> +#             When true, enables a zero-copy mechanism for sending memory
> +#             pages, if host supports it.
> +#             Requires that QEMU be permitted to use locked memory for guest
> +#             RAM pages.
> +#             Defaults to false. (Since 7.0)
> +#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migration.  Such
>  #                        aliases may for example be the corresponding names on the
> @@ -949,6 +964,7 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> +            '*zero-copy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }

The current zerocopy impl is for the send path.

Do you expect we might get zerocopy in the receive path
later ?

If so then either call this 'send-zero-copy', or change it
from a bool to an enum taking '["send", "recv", "both"]'.

I'd probably take the former and just rename it.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


