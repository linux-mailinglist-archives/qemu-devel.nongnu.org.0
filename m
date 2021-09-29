Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF241C364
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 13:24:53 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVXhj-000521-KU
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 07:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVXg8-0004A6-SM
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:23:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVXg0-0007PF-4q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632914582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=911CbwO7PJExtaUmLDhRwr0+WRpe0b49ldP+r5WQjgU=;
 b=KbKiB4q9Z6OyxbZR3uJUgF57ScVvHsdxg7RF3ofiE2c1Hq5xLaBoftAdqhaziSE+CxD69Z
 VllPBqmjj0KPK3e9HS9mlqL/uBKdpzT3khQOBZvdVQp5IsbnDQAj3OIvf1xop6FqjZgu3k
 /kjTcny1wkyN60zksTS4VOT4UeJq0eU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-eh_QvTdRN4eOJ5DduycUuw-1; Wed, 29 Sep 2021 07:22:58 -0400
X-MC-Unique: eh_QvTdRN4eOJ5DduycUuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E5D4100F96D;
 Wed, 29 Sep 2021 11:22:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1D151F0A;
 Wed, 29 Sep 2021 11:22:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 87F9B113865F; Wed, 29 Sep 2021 13:22:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
Date: Wed, 29 Sep 2021 13:22:53 +0200
In-Reply-To: <20210929025816.21076-17-wangyanan55@huawei.com> (Yanan Wang's
 message of "Wed, 29 Sep 2021 10:58:16 +0800")
Message-ID: <87ee97zkvm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yanan Wang <wangyanan55@huawei.com> writes:

> Quoting one of the Rules described in include/qapi/error.h:
> "
> Whenever practical, also return a value that indicates success /
> failure.  This can make the error checking more concise, and can
> avoid useless error object creation and destruction.  Note that
> we still have many functions returning void.  We recommend
> =E2=80=A2 bool-valued functions return true on success / false on failure=
,
> =E2=80=A2 pointer-valued functions return non-null / null pointer, and
> =E2=80=A2 integer-valued functions return non-negative / negative.
> "
>
> So make smp_parse() return true on success and false on failure,
> so that we can more laconically check whether the parsing has
> succeeded without touching the errp.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 4dc936732e..3e3a2707af 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c

[...]

> @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, =
const char *name,
   {
       MachineState *ms =3D MACHINE(obj);
       SMPConfiguration *config;
       ERRP_GUARD();

I believe ERRP_GUARD() is now redundant and should be dropped.

       if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
>          return;
>      }
> =20
> -    smp_parse(ms, config, errp);
> -    if (*errp) {
> +    if (!smp_parse(ms, config, errp)) {
>          qapi_free_SMPConfiguration(config);
>      }
>  }


