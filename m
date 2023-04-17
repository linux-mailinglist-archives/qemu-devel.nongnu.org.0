Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D66E49E8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:28:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOt6-00027V-3y; Mon, 17 Apr 2023 09:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1poOt0-00027M-5p
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1poOsy-0001tp-4I
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681738030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CuufHBPy3Jw1K3TRtLfekJl1WEOorWIduK/sp8Y1uz8=;
 b=fj5Rnq0+71j1LzRNEFGCgnX6VH04qUEcXCBbZUuzJghrp+KOZKad884hhiBQw0rOf2sj+4
 y4u42lz7iQw5R6ki28c49jOVZxDSMygwpeGJe7ilfNI40vjRszj/KsZBMffHQwX/E4a0Vu
 rikWUbXOfqoAvF06QgiO7FR0izcViY8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-16DiK8uWN_Gk6YQF__7p0Q-1; Mon, 17 Apr 2023 09:27:09 -0400
X-MC-Unique: 16DiK8uWN_Gk6YQF__7p0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC67185A7B3;
 Mon, 17 Apr 2023 13:27:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79D65C15E7F;
 Mon, 17 Apr 2023 13:27:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 74B5321E5A0D; Mon, 17 Apr 2023 15:27:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "you.chen" <you.chen@intel.com>
Cc: qemu-devel@nongnu.org,  "dennis . wu" <dennis.wu@intel.com>,  Juan
 Quintela <quintela@redhat.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 2/2] migration: add support for qatzip compression
 when doing live migration
References: <20230417083935.415782-1-you.chen@intel.com>
 <20230417083935.415782-3-you.chen@intel.com>
Date: Mon, 17 Apr 2023 15:27:07 +0200
In-Reply-To: <20230417083935.415782-3-you.chen@intel.com> (you chen's message
 of "Mon, 17 Apr 2023 16:39:35 +0800")
Message-ID: <87r0siabbo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"you.chen" <you.chen@intel.com> writes:

> Add config and logics to use qatzip for page compression, in order to support qatzip compression better, we collect multipe pages together to do qatzip compression for best performance.
> And we use compile option CONFIG_QATZIP to determine whether should qatzip related code be compiled or not.
>
> Co-developed-by: dennis.wu <dennis.wu@intel.com>
> Signed-off-by: you.chen <you.chen@intel.com>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..6459927c7a 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -644,6 +644,8 @@
>  #                  no compression, 1 means the best compression speed, and 9 means best
>  #                  compression ratio which will consume more CPU.
>  #
> +# @compress-with-qat: compress with qat on and off. (Since 8.1)
> +#
>  # @compress-threads: Set compression thread count to be used in live migration,
>  #                    the compression thread count is an integer between 1 and 255.
>  #
> @@ -784,7 +786,7 @@
>  { 'enum': 'MigrationParameter',
>    'data': ['announce-initial', 'announce-max',
>             'announce-rounds', 'announce-step',
> -           'compress-level', 'compress-threads', 'decompress-threads',
> +           'compress-level', 'compress-with-qat', 'compress-threads', 'decompress-threads',
>             'compress-wait-thread', 'throttle-trigger-threshold',
>             'cpu-throttle-initial', 'cpu-throttle-increment',
>             'cpu-throttle-tailslow',
> @@ -815,6 +817,8 @@
>  #
>  # @compress-level: compression level
>  #
> +# @compress-with-qat: compression with qat (Since 8.1)
> +#
>  # @compress-threads: compression thread count
>  #
>  # @compress-wait-thread: Controls behavior when all compression threads are
> @@ -954,6 +958,7 @@
>              '*announce-rounds': 'size',
>              '*announce-step': 'size',
>              '*compress-level': 'uint8',
> +            '*compress-with-qat': 'bool',
>              '*compress-threads': 'uint8',
>              '*compress-wait-thread': 'bool',
>              '*decompress-threads': 'uint8',
> @@ -1152,6 +1157,7 @@
>              '*announce-rounds': 'size',
>              '*announce-step': 'size',
>              '*compress-level': 'uint8',
> +            '*compress-with-qat': 'bool',
>              '*compress-threads': 'uint8',
>              '*compress-wait-thread': 'bool',
>              '*decompress-threads': 'uint8',

We already have MigrationCapability compress

    # @compress: Use multiple compression threads to accelerate live migration.
    #            This feature can help to reduce the migration traffic, by sending
    #            compressed pages. Please note that if compress and xbzrle are both
    #            on, compress only takes effect in the ram bulk stage, after that,
    #            it will be disabled and only xbzrle takes effect, this can help to
    #            minimize migration traffic. The feature is disabled by default.
    #            (since 2.4 )

and xbzrle

    # @xbzrle: Migration supports xbzrle (Xor Based Zero Run Length Encoding).
    #          This feature allows us to minimize migration traffic for certain work
    #          loads, by sending compressed difference of the pages
    #

and MigrationParameters / MigrateSetParameters multifd-compression

    # @multifd-compression: Which compression method to use.
    #                       Defaults to none. (Since 5.0)
    #
    # @multifd-zlib-level: Set the compression level to be used in live
    #                      migration, the compression level is an integer between 0
    #                      and 9, where 0 means no compression, 1 means the best
    #                      compression speed, and 9 means best compression ratio which
    #                      will consume more CPU.
    #                      Defaults to 1. (Since 5.0)
    #
    # @multifd-zstd-level: Set the compression level to be used in live
    #                      migration, the compression level is an integer between 0
    #                      and 20, where 0 means no compression, 1 means the best
    #                      compression speed, and 20 means best compression ratio which
    #                      will consume more CPU.
    #                      Defaults to 1. (Since 5.0)

where multifd-compression is

    ##
    # @MultiFDCompression:
    #
    # An enumeration of multifd compression methods.
    #
    # @none: no compression.
    # @zlib: use zlib compression method.
    # @zstd: use zstd compression method.
    #
    # Since: 5.0
    ##

How does this all fit together?  It feels like a bunch of featured piled
onto each other, then shaken well.  Or am I confused?

I could use an abstract description of compression in migration.


