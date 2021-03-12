Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9833881C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:00:36 +0100 (CET)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdet-0007yu-HA
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKddR-0007Mf-GA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKddP-000710-I1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHGAx/6lm1LdMPq013KHy7dFnae4WibuAqHLh38oJHs=;
 b=Cffulvfbx/ywRDsFFbKWhq/5G0UUYW+TAVqGTxEZsYDwbBnap1gKFqq7SlF1PbpURLKd4C
 GSXMI9yh86kRDorBuwdv/rsdIk40n2/HiPJD46ldU2JRwrUJgLj7NHVpRtZ0cy56J7348i
 jiAnq3sG8M2Kl3RCaMEhgxxpl12UUBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-SkRpbsttOZedepWNsVU37g-1; Fri, 12 Mar 2021 03:58:59 -0500
X-MC-Unique: SkRpbsttOZedepWNsVU37g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A35A6760C1;
 Fri, 12 Mar 2021 08:58:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7553A5C234;
 Fri, 12 Mar 2021 08:58:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC7761132C12; Fri, 12 Mar 2021 09:58:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] scripts/coccinelle: Catch dubious code after
 &error_abort/&error_fatal
References: <20210311192700.1441263-1-philmd@redhat.com>
Date: Fri, 12 Mar 2021 09:58:56 +0100
In-Reply-To: <20210311192700.1441263-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 11 Mar 2021 20:27:00
 +0100")
Message-ID: <87czw4694f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Calls passing &error_abort or &error_fatal don't return.

Correction: they *can* return.  What they can't is return failure.

> Any code after such use is dubious. Add a coccinelle patch
> to detect such pattern.

To be precise: any failure path from such a call is dead code.

> Inspired-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .../use-after-abort-fatal-errp.cocci          | 33 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 scripts/coccinelle/use-after-abort-fatal-errp.cocci
>
> diff --git a/scripts/coccinelle/use-after-abort-fatal-errp.cocci b/script=
s/coccinelle/use-after-abort-fatal-errp.cocci
> new file mode 100644
> index 00000000000..ead9de5826a
> --- /dev/null
> +++ b/scripts/coccinelle/use-after-abort-fatal-errp.cocci
> @@ -0,0 +1,33 @@
> +/* Find dubious code use after error_abort/error_fatal
> + *
> + * Inspired by this patch:
> + * https://www.mail-archive.com/qemu-devel@nongnu.org/msg789501.html
> + *
> + * Copyright (C) 2121 Red Hat, Inc.
> + *
> + * Authors:
> + *  Philippe Mathieu-Daud=C3=A9
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +@@
> +identifier func_with_errp;
> +@@
> +(
> + if (func_with_errp(..., &error_fatal)) {
> +    /* Used for displaying help message */
> +    ...
> +    exit(...);
> +  }
> +|
> +*if (func_with_errp(..., &error_fatal)) {
> +    /* dubious code */
> +    ...
> +  }
> +|
> +*if (func_with_errp(..., &error_abort)) {
> +    /* dubious code */
> +    ...
> +  }
> +)

This assumes func_with_errp() returns a falsy value on failure.
Functions returning bool and pointers do that by convention, but not
functions returning (signed) integers:

 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.

Special case of integer-valued functions: return zero / negative.  Your
script gets that one backwards, I'm afraid.

Moreover, I expect the convention to be violated in places.

I'm converned about the script's rate of false positives.  How many
reports do you get for the whole tree?  Can you guesstimate the rate of
false positives?

Next issue.  We commonly assign the return value to a variable before
checking it, like this:

    ret =3D func_with_errp(..., errp);
    if (!ret) {
        ...
        return some error value;
    }
    do something with @ret...

I suspect your script can't flag dead error handling there.  False
negatives.  These merely make the script less useful, whereas false
positives make it less usable, which is arguably worse.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e15dab8cd4..db6596eb06d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2368,6 +2368,7 @@ F: scripts/coccinelle/error_propagate_null.cocci
>  F: scripts/coccinelle/remove_local_err.cocci
>  F: scripts/coccinelle/use-error_fatal.cocci
>  F: scripts/coccinelle/errp-guard.cocci
> +F: scripts/coccinelle/use-after-abort-fatal-errp.cocci
> =20
>  GDB stub
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>


