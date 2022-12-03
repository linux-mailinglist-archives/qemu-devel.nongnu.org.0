Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C219641527
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:06:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1OTa-0008Fe-AE; Sat, 03 Dec 2022 04:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OTY-0008FF-5M
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:06:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1OTW-0002lq-Is
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670058381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlMuZGzGWE1WaWi3+0laH5PLE0zitvuPyNcTfw6MZCc=;
 b=Sa8j5W8PufJoQ3acq1kwdRQy90jAb5Pv+uwKincnmOPMn11SAF6jK0vWDvqKNnjdBOZgzW
 mZzLBFfRhAvr3HDc44hLW01mKnmmLARaB7y4RlleIBtlfHLNjAAQOgut/27P2ZUdE8ynq0
 3zNptbLmhNFooIW91EKabeD3R5XM6VY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-n9ui2tj-OUqSSjI_mvbz4Q-1; Sat, 03 Dec 2022 04:06:20 -0500
X-MC-Unique: n9ui2tj-OUqSSjI_mvbz4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 848752833B09;
 Sat,  3 Dec 2022 09:06:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3697F40C8469;
 Sat,  3 Dec 2022 09:06:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0132621E6921; Sat,  3 Dec 2022 10:06:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/11] qapi/migration: Introduce
 x-vcpu-dirty-limit-period parameter
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cover.1669047366.git.huangy81@chinatelecom.cn>
 <9e6d5e0ab54c82c8b42a3b318249320fb20e3a44.1669047366.git.huangy81@chinatelecom.cn>
Date: Sat, 03 Dec 2022 10:06:15 +0100
In-Reply-To: <9e6d5e0ab54c82c8b42a3b318249320fb20e3a44.1669047366.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 21 Nov 2022 11:26:36 -0500")
Message-ID: <877cz8q2k8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Introduce "x-vcpu-dirty-limit-period" migration experimental
> parameter, which is in the range of 1 to 1000ms and used to
> make dirtyrate calculation period configurable.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86..5175779 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -776,8 +776,13 @@
>  #                        block device name if there is one, and to their=
 node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
> +#                             Should be in the range 1 to 1000ms, defaul=
ts to 500ms.
> +#                             (Since 7.1)

8.0

> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period

Members

> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -795,8 +800,9 @@
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
> @@ -941,8 +947,13 @@
>  #                        block device name if there is one, and to their=
 node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
> +#                             Should be in the range 1 to 1000ms, defaul=
ts to 500ms.
> +#                             (Since 7.1)
> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period

Members

> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -976,7 +987,9 @@
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
> @@ -1141,8 +1154,13 @@
>  #                        block device name if there is one, and to their=
 node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during l=
ive migration.
> +#                             Should be in the range 1 to 1000ms, defaul=
ts to 500ms.
> +#                             (Since 7.1)
> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period

Members

> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -1174,7 +1192,9 @@
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


