Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18CF5AA9EE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:27:38 +0200 (CEST)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU21Z-0000Me-Qx
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1dM-0006jt-Kj
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1dF-00041U-KR
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662105747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrUfUy4wveb/dnwj/g02i8W6eyFevkrVIWX2lQWnmIQ=;
 b=E0lUoIrEN0yOOMDbSZp107TBnNb7xKvoo0gphv2qgrAC+66jPeGszgtO6NS/UvFP5h9UEq
 iC7CCfrCkyBQKD5XnexJRryKob/fjx3f0H1NKhSWAFm7rdWFrGJz5z/bLqRjZuPmgh/1rp
 ymBfuY9DR9sS0DMsGfosm3I1CuIzNBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-kG6CcbGcPNqD6FaDXB4VRQ-1; Fri, 02 Sep 2022 04:02:18 -0400
X-MC-Unique: kG6CcbGcPNqD6FaDXB4VRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B14F63C0ED6B;
 Fri,  2 Sep 2022 08:02:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B361121314;
 Fri,  2 Sep 2022 08:02:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 860AD21E6900; Fri,  2 Sep 2022 10:02:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 1/8] qapi/migration: Introduce
 x-vcpu-dirty-limit-period parameter
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <19babf1ee708a8673eee4cae300bddd250a80147.1662052189.git.huangy81@chinatelecom.cn>
Date: Fri, 02 Sep 2022 10:02:13 +0200
In-Reply-To: <19babf1ee708a8673eee4cae300bddd250a80147.1662052189.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 2 Sep 2022 01:22:29 +0800")
Message-ID: <87a67ixkze.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Introduce "x-vcpu-dirty-limit-period" migration experimental
> parameter, which is used to make dirtyrate calculation period
> configurable.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 81185d4..332c087 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -776,8 +776,12 @@
>  #                        block device name if there is one, and to their=
 node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
> +#                             Defaults to 500ms. (Since 7.1)
> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period

Members

> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -795,8 +799,9 @@
>             'multifd-channels',
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
> -           'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'multifd-zlib-level', 'multifd-zstd-level',
> +           'block-bitmap-mapping',
> +           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable=
'] } ] }
>=20=20
>  ##
>  # @MigrateSetParameters:
> @@ -941,8 +946,12 @@
>  #                        block device name if there is one, and to their=
 node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
> +#                             Defaults to 500ms. (Since 7.1)
> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period

Members

> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -976,7 +985,9 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
> +                                            'features': [ 'unstable' ] }=
 } }
>=20=20
>  ##
>  # @migrate-set-parameters:
> @@ -1141,8 +1152,12 @@
>  #                        block device name if there is one, and to their=
 node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
> +#                             Defaults to 500ms. (Since 7.1)
> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period

Members

> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -1174,7 +1189,9 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
> +                                            'features': [ 'unstable' ] }=
 } }
>=20=20
>  ##
>  # @query-migrate-parameters:


