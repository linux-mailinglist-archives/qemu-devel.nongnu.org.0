Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E45D4F5832
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:11:21 +0200 (CEST)
Received: from localhost ([::1]:54770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1h9-0005xz-Nj
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc1e8-0003yh-4E
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc1e5-0005xc-2Y
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649236087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqZWC9pDZLhaVpZeyYjcY806SXHuEZnpbHFSnDLPZd8=;
 b=G6dUIx3WCm/F6d8PETAHbbntd7sXzC5QHJp7fFETdE87yfdvg06RQb+WLmeXJ9pVyclEZn
 QrkZTbE9BlDCFolkduHodG8ss43CcYXhLAMSMKbvMIBnAzUmIU6M60xx6ZS5izfEOa601M
 C3MxY6kOnuVlxaBP7PYLesBNf9TL+3E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-gzzVluYEOZqKv_aXKF1jlQ-1; Wed, 06 Apr 2022 05:08:06 -0400
X-MC-Unique: gzzVluYEOZqKv_aXKF1jlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7651F1C05B0F
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 09:08:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 188E61415126;
 Wed,  6 Apr 2022 09:07:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E213921E6A00; Wed,  6 Apr 2022 11:07:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 13/32] error-report: replace deprecated
 g_get_current_time() with glib >= 2.62
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-14-marcandre.lureau@redhat.com>
Date: Wed, 06 Apr 2022 11:07:54 +0200
In-Reply-To: <20220323155743.1585078-14-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:24 +0400")
Message-ID: <87fsmqr34l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> According to GLib API:
> g_get_current_time has been deprecated since version 2.62 and should not
> be used in newly-written code. GTimeVal is not year-2038-safe. Use
> g_get_real_time() instead.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/glib-compat.h | 10 ++++++++++
>  util/qemu-error.c     | 17 ++++++++++++++---
>  2 files changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 3113a7d2af84..dc14d3ec0d1e 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -145,6 +145,16 @@ qemu_g_test_slow(void)
>  #define g_test_thorough() qemu_g_test_slow()
>  #define g_test_quick() (!qemu_g_test_slow())
> =20
> +#if GLIB_CHECK_VERSION(2,62,0)
> +static inline gchar *
> +g_date_time_format_iso8601_compat(GDateTime *datetime)
> +{
> +    return g_date_time_format_iso8601(datetime);
> +}
> +
> +#define g_date_time_format_iso8601 g_date_time_format_iso8601_compat
> +#endif

I'm confused.

If we're using v2.62 or later, g_time_val_to_iso8601(dt) calls GLib's
g_time_val_to_iso8601().  Why do we need the inline function and the
macro?

Else, I expect g_date_time_format_iso8601(dt) not to compile.

> +
>  #pragma GCC diagnostic pop
> =20
>  #endif
> diff --git a/util/qemu-error.c b/util/qemu-error.c
> index 7769aee8e791..4ea380dd4169 100644
> --- a/util/qemu-error.c
> +++ b/util/qemu-error.c
> @@ -180,6 +180,19 @@ static void print_loc(void)
>      }
>  }
> =20
> +static char *
> +real_time_iso8601(void)
> +{
> +#if GLIB_CHECK_VERSION(2,62,0)
> +    g_autoptr(GDateTime) dt =3D g_date_time_new_from_unix_utc(g_get_real=
_time());
> +    return g_date_time_format_iso8601(dt);
> +#else
> +    GTimeVal tv;
> +    g_get_current_time(&tv);
> +    return g_time_val_to_iso8601(&tv);
> +#endif
> +}
> +
>  /*
>   * Print a message to current monitor if we have one, else to stderr.
>   * @report_type is the type of message: error, warning or informational.
> @@ -189,12 +202,10 @@ static void print_loc(void)
>   */
>  static void vreport(report_type type, const char *fmt, va_list ap)
>  {
> -    GTimeVal tv;
>      gchar *timestr;
> =20
>      if (message_with_timestamp && !monitor_cur()) {
> -        g_get_current_time(&tv);
> -        timestr =3D g_time_val_to_iso8601(&tv);
> +        timestr =3D real_time_iso8601();
>          error_printf("%s ", timestr);
>          g_free(timestr);
>      }


