Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2254DFD7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:16:16 +0200 (CEST)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nTz-0005CS-DF
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1mnP-0005GU-AQ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:32:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1mnN-0002YW-BB
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655375532;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GhoTycfNu11UCeEYC1qrFZLHV1vuOwneaGC6Hf9UEHU=;
 b=TN6MrWWrp+ngKl1MiTO2yzg+MD1OcGlhRDbIIC/BC2HCDmHre54UToZSkjqFDTMlExYyPA
 MyZeEc7J3lh4NWCdHAz4ZYB/VQexpLCkZHSSEkll5YbJqtWnES3SIrCkClXNpN/UCNUD9h
 IZ/87qHEba2OV5B7WMINtQcQMhl8Ezg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-tPthA5VsMd2qF4TipKQySg-1; Thu, 16 Jun 2022 06:32:11 -0400
X-MC-Unique: tPthA5VsMd2qF4TipKQySg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FD87802D1F;
 Thu, 16 Jun 2022 10:32:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C7D6492CA5;
 Thu, 16 Jun 2022 10:32:10 +0000 (UTC)
Date: Thu, 16 Jun 2022 11:32:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: nikita.lapshin@openvz.org
Cc: qemu-devel@nongnu.org, den@virtuozzo.com,
 andrey.drobyshev@virtuozzo.com, quintela@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH 1/8] migration: Implemented new parameter stream_content
Message-ID: <YqsGp55KDVGtKOAH@redhat.com>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
 <20220616102006.218693-2-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616102006.218693-2-nikita.lapshin@openvz.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 01:19:57PM +0300, nikita.lapshin@openvz.org wrote:
> From: Nikita Lapshin <nikita.lapshin@openvz.org>
> 
> This new optional parameter contains inormation about migration
> stream parts to be sent (such as RAM, block, bitmap). This looks
> better than using capabilities to solve problem of dividing
> migration stream.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>  migration/migration.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
>  migration/migration.h |  2 ++
>  qapi/migration.json   | 21 ++++++++++++++++---
>  3 files changed, 66 insertions(+), 4 deletions(-)
> 

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 18e2610e88..80acf6dbc3 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -760,6 +760,12 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @stream-content-list: Parameter control content of migration stream such as RAM,
> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
> +#                       so migration will work correctly without it.
> +#                       This parameter takes string list as description of content
> +#                       and include that part of migration stream. (Since 7.0)
> +#
>  # Features:
>  # @unstable: Member @x-checkpoint-delay is experimental.
>  #
> @@ -780,7 +786,8 @@
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'block-bitmap-mapping',
> +           'stream-content-list' ] }
>  
>  ##
>  # @MigrateSetParameters:
> @@ -925,6 +932,12 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @stream-content-list: Parameter control content of migration stream such as RAM,
> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
> +#                       so migration will work correctly without it.
> +#                       This parameter takes string list as description of content
> +#                       and include that part of migration stream. (Since 7.0)
> +#
>  # Features:
>  # @unstable: Member @x-checkpoint-delay is experimental.
>  #
> @@ -960,7 +973,8 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*stream-content-list': [ 'str' ] } }
>  
>  ##
>  # @migrate-set-parameters:
> @@ -1158,7 +1172,8 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*stream-content-list': [ 'str' ] } }

These will need to be represented using an enum type rather than
a string, since this value accepts a fixed pre-determined list of
strings.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


