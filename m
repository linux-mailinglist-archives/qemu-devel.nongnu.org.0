Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B34176AE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:14:35 +0200 (CEST)
Received: from localhost ([::1]:37732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlyE-0006r9-Eh
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTlrp-00060E-L1
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:07:58 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTlro-0004JE-13
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:07:57 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-DjfudSeKNymuxT-4oY9cOQ-1; Fri, 24 Sep 2021 10:07:51 -0400
X-MC-Unique: DjfudSeKNymuxT-4oY9cOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07EF0100CCC4;
 Fri, 24 Sep 2021 14:07:50 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B76E019D9B;
 Fri, 24 Sep 2021 14:07:08 +0000 (UTC)
Date: Fri, 24 Sep 2021 16:07:07 +0200
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/2] qapi: Move RTC_CHANGE back out of target schema
Message-ID: <20210924160707.6f76ac09@bahia.huguette>
In-Reply-To: <20210924140142.31398-2-peter.maydell@linaro.org>
References: <20210924140142.31398-1-peter.maydell@linaro.org>
 <20210924140142.31398-2-peter.maydell@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sep 2021 15:01:41 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> This commit effectively reverts commit 183e4281a30962, which moved
> the RTC_CHANGE event to the target schema.  That change was an
> attempt to make the event target-specific to improve introspection,
> but the event isn't really target-specific: it's machine or device
> specific.  Putting RTC_CHANGE in the target schema with an ifdef list
> reduces maintainability (by adding an if: list with a long list of
> targets that needs to be manually updated as architectures are added
> or removed or as new devices gain the RTC_CHANGE functionality) and
> increases compile time (by preventing RTC devices which emit the
> event from being "compile once" rather than "compile once per
> target", because qapi-events-misc-target.h uses TARGET_* ifdefs,
> which are poisoned in "compile once" files.)
>=20
> Move RTC_CHANGE back to misc.json.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

For the ppc part,

Acked-by: Greg Kurz <groug@kaod.org>

>  qapi/misc-target.json | 33 ---------------------------------
>  qapi/misc.json        | 22 ++++++++++++++++++++++
>  hw/ppc/spapr_rtc.c    |  2 +-
>  hw/rtc/mc146818rtc.c  |  2 +-
>  4 files changed, 24 insertions(+), 35 deletions(-)
>=20
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 3b05ad3dbfb..f442421e838 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -2,39 +2,6 @@
>  # vim: filetype=3Dpython
>  #
> =20
> -##
> -# @RTC_CHANGE:
> -#
> -# Emitted when the guest changes the RTC time.
> -#
> -# @offset: offset between base RTC clock (as specified by -rtc base), an=
d
> -#          new RTC clock value
> -#
> -# Note: This event is rate-limited.
> -#
> -# Since: 0.13
> -#
> -# Example:
> -#
> -# <-   { "event": "RTC_CHANGE",
> -#        "data": { "offset": 78 },
> -#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } =
}
> -#
> -##
> -{ 'event': 'RTC_CHANGE',
> -  'data': { 'offset': 'int' },
> -  'if': { 'any': [ 'TARGET_ALPHA',
> -                   'TARGET_ARM',
> -                   'TARGET_HPPA',
> -                   'TARGET_I386',
> -                   'TARGET_MIPS',
> -                   'TARGET_MIPS64',
> -                   'TARGET_PPC',
> -                   'TARGET_PPC64',
> -                   'TARGET_S390X',
> -                   'TARGET_SH4',
> -                   'TARGET_SPARC' ] } }
> -
>  ##
>  # @rtc-reset-reinjection:
>  #
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 5c2ca3b5566..ce7edd3f7bf 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -523,3 +523,25 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @RTC_CHANGE:
> +#
> +# Emitted when the guest changes the RTC time.
> +#
> +# @offset: offset between base RTC clock (as specified by -rtc base), an=
d
> +#          new RTC clock value
> +#
> +# Note: This event is rate-limited.
> +#
> +# Since: 0.13
> +#
> +# Example:
> +#
> +# <-   { "event": "RTC_CHANGE",
> +#        "data": { "offset": 78 },
> +#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } =
}
> +#
> +##
> +{ 'event': 'RTC_CHANGE',
> +  'data': { 'offset': 'int' } }
> diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
> index fba4dfca358..7a185d45400 100644
> --- a/hw/ppc/spapr_rtc.c
> +++ b/hw/ppc/spapr_rtc.c
> @@ -32,7 +32,7 @@
>  #include "hw/ppc/spapr.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
> -#include "qapi/qapi-events-misc-target.h"
> +#include "qapi/qapi-events-misc.h"
>  #include "qemu/cutils.h"
>  #include "qemu/module.h"
> =20
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 4fbafddb226..5ecf96142a1 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -40,7 +40,7 @@
>  #include "hw/rtc/mc146818rtc_regs.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
> -#include "qapi/qapi-events-misc-target.h"
> +#include "qapi/qapi-events-misc.h"
>  #include "qapi/visitor.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
> =20


