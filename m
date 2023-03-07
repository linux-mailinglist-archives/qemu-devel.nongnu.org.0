Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71FB6ADEED
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:41:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWbO-0002j3-RO; Tue, 07 Mar 2023 07:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZWbG-0002ii-TN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZWbF-0002OS-2V
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678192763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJBe5yOp/KD+gAqs/3DV8/eUP4wAMsMRzPwW3JQKfJ4=;
 b=I2RlYVylFvr1uQWaqiKjSqng2Ax0Y9hEsE2CFrr8Q6jwdqaIKPTLqHPg2nL3VZAV1gK+cc
 fpsfNTcn9G/Pvs5+l8lH/BrmCduzyjazyJYBYSTwjyl52b+lkg95w/lyNXa3u2y6HVmPJT
 +CD3wDOT+vG0514T8ihkotAhwDdObBQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-RqUHwf78P2ial_OztPmeIw-1; Tue, 07 Mar 2023 07:39:21 -0500
X-MC-Unique: RqUHwf78P2ial_OztPmeIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED143101A55E;
 Tue,  7 Mar 2023 12:39:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BB82403570F;
 Tue,  7 Mar 2023 12:39:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7177C21E6A1F; Tue,  7 Mar 2023 13:39:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] qapi: give available enum values in error string
References: <20230307112212.2437449-1-marcandre.lureau@redhat.com>
Date: Tue, 07 Mar 2023 13:39:19 +0100
In-Reply-To: <20230307112212.2437449-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Mar 2023 15:22:11 +0400")
Message-ID: <87ttyw91mw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
> qemu-system-x86_64: -display egl-headless,gl=3Dhelp: Parameter 'gl' does
> not accept value '' (available: 'off', 'on', 'core', 'es')

error.h recommends to user error_append_hint() for this:

 * Create an error and add additional explanation:
 *     error_setg(errp, "invalid quark");
 *     error_append_hint(errp, "Valid quarks are up, down, strange, "
 *                       "charm, top, bottom.\n");

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qapi/util.h             |  1 +
>  qapi/qapi-util.c                | 15 +++++++++++++++
>  qapi/qapi-visit-core.c          |  7 +++++--
>  tests/unit/check-qom-proplist.c |  4 ++--
>  4 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 81a2b13a33..a5363e595d 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -23,6 +23,7 @@ typedef struct QEnumLookup {
>  } QEnumLookup;
>=20=20
>  const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
> +char *qapi_enum_available(const QEnumLookup *lookup);
>  int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>                      int def, Error **errp);
>  bool qapi_bool_parse(const char *name, const char *value, bool *obj,
> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> index 63596e11c5..19ba4b695a 100644
> --- a/qapi/qapi-util.c
> +++ b/qapi/qapi-util.c
> @@ -84,6 +84,21 @@ int qapi_enum_parse(const QEnumLookup *lookup, const c=
har *buf,
>      return def;
>  }
>=20=20
> +char *qapi_enum_available(const QEnumLookup *lookup)
> +{
> +    int i;
> +    GString *str =3D g_string_new(NULL);
> +
> +    for (i =3D 0; i < lookup->size; i++) {
> +        g_string_append_printf(str, "'%s'", lookup->array[i]);
> +        if (i + 1 < lookup->size) {
> +            g_string_append(str, ", ");
> +        }
> +    }
> +
> +    return g_string_free(str, FALSE);
> +}
> +

If we use error_append_hint(), we can fold it into the reusable helper,
and name the result error_append_qapi_enum_hint().  Easier to use than
qapi_enum_available(), because the caller doesn't have to free anything.

>  bool qapi_bool_parse(const char *name, const char *value, bool *obj, Err=
or **errp)
>  {
>      if (g_str_equal(value, "on") ||
> diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
> index 6c13510a2b..b887cbf3fd 100644
> --- a/qapi/qapi-visit-core.c
> +++ b/qapi/qapi-visit-core.c
> @@ -404,8 +404,11 @@ static bool input_type_enum(Visitor *v, const char *=
name, int *obj,
>=20=20
>      value =3D qapi_enum_parse(lookup, enum_str, -1, NULL);
>      if (value < 0) {
> -        error_setg(errp, "Parameter '%s' does not accept value '%s'",
> -                   name ? name : "null", enum_str);
> +        g_autofree char *avail =3D NULL;
> +
> +        avail =3D qapi_enum_available(lookup);
> +        error_setg(errp, "Parameter '%s' does not accept value '%s' (ava=
ilable: %s)",
> +                   name ? name : "null", enum_str, avail);
>          return false;
>      }
>=20=20
> diff --git a/tests/unit/check-qom-proplist.c b/tests/unit/check-qom-propl=
ist.c
> index 79d4a8b89d..eb0b215abb 100644
> --- a/tests/unit/check-qom-proplist.c
> +++ b/tests/unit/check-qom-proplist.c
> @@ -488,8 +488,8 @@ static void test_dummy_badenum(void)
>=20=20
>      g_assert(dobj =3D=3D NULL);
>      g_assert(err !=3D NULL);
> -    g_assert_cmpstr(error_get_pretty(err), =3D=3D,
> -                    "Parameter 'av' does not accept value 'yeti'");
> +    g_assert_nonnull(strstr(error_get_pretty(err),
> +                            "Parameter 'av' does not accept value 'yeti'=
"));
>=20=20
>      g_assert(object_resolve_path_component(parent, "dummy0")
>               =3D=3D NULL);

No need to mess with the test then.

What do you think?


