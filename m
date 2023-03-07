Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A134D6AE2DA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:40:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYUb-0001Js-2U; Tue, 07 Mar 2023 09:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZYUZ-0001Ja-9E
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZYUX-00018R-Oa
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678200036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zsiYS2H5acATYULJQayTICeqDxDLCghLavxPDrv9Ec=;
 b=LUp4yY9KvAmA5ngn/B+WxCJguZAsoJfh3i+oMsiv2JFjW5QPlGDdLWThfBAkd8Z7giPoJO
 9H3h4qnpKAvOYQxMlxD+cnEuQlaZX4UF3XzG0vLr42LtKLdMXcGogNAHyDHfbheWO2XJRz
 5I9M8Bpdv1ErTDS6RqhwxlI+WGntT10=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-c7cfaYueM2uRiQMtr9Y7Zw-1; Tue, 07 Mar 2023 09:40:34 -0500
X-MC-Unique: c7cfaYueM2uRiQMtr9Y7Zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3322811E6E;
 Tue,  7 Mar 2023 14:40:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A14FBC15BA0;
 Tue,  7 Mar 2023 14:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 64D8E21E6A1F; Tue,  7 Mar 2023 15:40:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2] qapi: give available enum values as error hint
References: <20230307131434.2509895-1-marcandre.lureau@redhat.com>
Date: Tue, 07 Mar 2023 15:40:32 +0100
In-Reply-To: <20230307131434.2509895-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Mar 2023 17:14:34 +0400")
Message-ID: <87zg8o62vz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This allows for a more pleasant user experience.
>
> Before:
> $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does not =
accept value ''
>
> After:
> $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does not =
accept value ''
> Available: 'off', 'on', 'core', 'es'

I think "Acceptable values are ..." would go more nicely with "does not
accept".  What do you think?

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi/qapi-visit-core.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
> index 6c13510a2b..45e39ff533 100644
> --- a/qapi/qapi-visit-core.c
> +++ b/qapi/qapi-visit-core.c
> @@ -392,9 +392,25 @@ static bool output_type_enum(Visitor *v, const char =
*name, int *obj,
>      return visit_type_str(v, name, &enum_str, errp);
>  }
>=20=20
> +static void error_append_qapi_enum_hint(Error **errp, const QEnumLookup =
*lookup)

error_append_hint() has Error *const *errp to make it obvious[*] that
the function does *not* set an error (by assigning to *errp).  We need
to do the same here.

See also commit 49fbc7236dd (error: make Error **errp const where it is
appropriate).

> +{
> +    int i;
> +
> +    error_append_hint(errp, "Available: ");
> +    for (i =3D 0; i < lookup->size; i++) {
> +        error_append_hint(errp, "'%s'", lookup->array[i]);
> +        if (i + 1 < lookup->size) {
> +            error_append_hint(errp, ", ");
> +        }
> +    }
> +    error_append_hint(errp, "\n");
> +}
> +
> +
>  static bool input_type_enum(Visitor *v, const char *name, int *obj,
>                              const QEnumLookup *lookup, Error **errp)
>  {
> +    ERRP_GUARD();
>      int64_t value;
>      g_autofree char *enum_str =3D NULL;
>=20=20
> @@ -406,6 +422,7 @@ static bool input_type_enum(Visitor *v, const char *n=
ame, int *obj,
>      if (value < 0) {
>          error_setg(errp, "Parameter '%s' does not accept value '%s'",
>                     name ? name : "null", enum_str);
> +        error_append_qapi_enum_hint(errp, lookup);
>          return false;
>      }

Both of my review comments could be addressed without a respin.  Up to
you!


[*] Obvious to C language lawyers, I guess.  And also to Coccinelle
scripts.


