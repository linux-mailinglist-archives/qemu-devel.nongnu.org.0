Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988515AA9DC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:23:41 +0200 (CEST)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU1xk-0005Ov-Ov
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1eW-0007wu-BL
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU1eT-0004pg-T8
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662105824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDdbBnTnCXyRUFTMNu8An6zllWN5vDveMjbTY4Hsr1c=;
 b=BgbfTV6YdBo3WwnbHKp45vRPTNL7mMupc0hGIpcZ/9PEF6evxRxyCKfcXe/ddZsyTgGasr
 eQUGTy+ywcp0el8yRhja8/xrPiAhp82NC9TSnlpYjV/1b4r9mrL2FQD+OMU29zwN2DVnaB
 2kur1jAxTTvNHUbngEOopwbAKPCpACw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-bCBFBAIQNXyRstBCgZ-qRg-1; Fri, 02 Sep 2022 04:03:42 -0400
X-MC-Unique: bCBFBAIQNXyRstBCgZ-qRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 898D58041BE;
 Fri,  2 Sep 2022 08:03:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EDFFC15BBD;
 Fri,  2 Sep 2022 08:03:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EBA6A21E6900; Fri,  2 Sep 2022 10:03:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 2/8] qapi/migration: Introduce x-vcpu-dirty-limit
 parameters
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <58009ed32bc30ce40228b191fdd9cacc259ac859.1662052189.git.huangy81@chinatelecom.cn>
Date: Fri, 02 Sep 2022 10:03:40 +0200
In-Reply-To: <58009ed32bc30ce40228b191fdd9cacc259ac859.1662052189.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 2 Sep 2022 01:22:30 +0800")
Message-ID: <875yi6xkwz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Introduce "x-vcpu-dirty-limit" migration parameter used
> to limit dirty page rate during live migration.
>
> "x-vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
> two dirty-limit-related migration parameters, which can
> be set before and during live migration by qmp
> migrate-set-parameters.
>
> This two parameters are used to help implement the dirty
> page rate limit algo of migration.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
[...]
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 332c087..8554d33 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -779,6 +779,9 @@
>  # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
>  #                             Defaults to 500ms. (Since 7.1)
>  #
> +# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
> +#                      Defaults to 1. (Since 7.1)
> +#
>  # Features:
>  # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
>  #            are experimental.
> @@ -801,7 +804,8 @@
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level', 'multifd-zstd-level',
>             'block-bitmap-mapping',
> -           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable=
'] } ] }
> +           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable=
'] },
> +           'x-vcpu-dirty-limit'] }

Shouldn't 'x-vcpu-dirty-limit-period' have feature 'unstable', too?

Same below.

>=20=20
>  ##
>  # @MigrateSetParameters:
> @@ -949,6 +953,9 @@
>  # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
>  #                             Defaults to 500ms. (Since 7.1)
>  #
> +# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
> +#                      Defaults to 1. (Since 7.1)
> +#
>  # Features:
>  # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
>  #            are experimental.
> @@ -987,7 +994,8 @@
>              '*multifd-zstd-level': 'uint8',
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>              '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
> -                                            'features': [ 'unstable' ] }=
 } }
> +                                            'features': [ 'unstable' ] },
> +            '*x-vcpu-dirty-limit': 'uint64'} }
>=20=20
>  ##
>  # @migrate-set-parameters:
> @@ -1155,6 +1163,9 @@
>  # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
>  #                             Defaults to 500ms. (Since 7.1)
>  #
> +# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
> +#                      Defaults to 1. (Since 7.1)
> +#
>  # Features:
>  # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
>  #            are experimental.
> @@ -1191,7 +1202,8 @@
>              '*multifd-zstd-level': 'uint8',
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>              '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
> -                                            'features': [ 'unstable' ] }=
 } }
> +                                            'features': [ 'unstable' ] },
> +            '*x-vcpu-dirty-limit': 'uint64'} }
>=20=20
>  ##
>  # @query-migrate-parameters:


