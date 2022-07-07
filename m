Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1756A1E6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:26:25 +0200 (CEST)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9QaN-00051L-O7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9QXZ-0002qz-SY
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9QXW-0006B3-3F
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657196604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4dpt6iaoNQiNYojMuAjboQaAc/s0icsejYUBEnV540=;
 b=WxbbsICEm+QkJENJNaVpGpE78puOd9lUiSXDH3eXBao+J2IN/miSqixN14rzzVXYasvsAi
 NoLswLOjmRDOMo2bLimHHUFNbbpbFB0RuTzbBcyMcbzmkIjG8S7JYn9/i3Hn89pealy0X5
 hSU1ZooTIMpAZsjjd8zWQkyw9FMNUAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-XLlJwrSKMSKi5ey730dM_w-1; Thu, 07 Jul 2022 08:23:12 -0400
X-MC-Unique: XLlJwrSKMSKi5ey730dM_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC256805BDB;
 Thu,  7 Jul 2022 12:23:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61FDD2EF97;
 Thu,  7 Jul 2022 12:23:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D92D21E690D; Thu,  7 Jul 2022 14:23:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH 1/9] monitor: make error_vprintf_unless_qmp() static
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-2-marcandre.lureau@redhat.com>
Date: Thu, 07 Jul 2022 14:23:10 +0200
In-Reply-To: <20220616124034.3381391-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 16 Jun 2022 16:40:26 +0400")
Message-ID: <87edyxdscx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Not needed outside monitor.c. Remove the needless stub.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/monitor/monitor.h | 1 -
>  monitor/monitor.c         | 3 ++-
>  stubs/error-printf.c      | 5 -----
>  3 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index a4b40e8391db..44653e195b45 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -56,7 +56,6 @@ void monitor_register_hmp(const char *name, bool info,
>  void monitor_register_hmp_info_hrt(const char *name,
>                                     HumanReadableText *(*handler)(Error *=
*errp));
>=20=20
> -int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_GNUC_PRINTF(=
1, 0);
>  int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
>=20=20
>  #endif /* MONITOR_H */
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 86949024f643..ba4c1716a48a 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -273,7 +273,8 @@ int error_vprintf(const char *fmt, va_list ap)
>      return vfprintf(stderr, fmt, ap);
>  }
>=20=20
> -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> +G_GNUC_PRINTF(1, 0)
> +static int error_vprintf_unless_qmp(const char *fmt, va_list ap)
>  {
>      Monitor *cur_mon =3D monitor_cur();
>=20=20
> diff --git a/stubs/error-printf.c b/stubs/error-printf.c
> index 0e326d801059..1afa0f62ca26 100644
> --- a/stubs/error-printf.c
> +++ b/stubs/error-printf.c
> @@ -16,8 +16,3 @@ int error_vprintf(const char *fmt, va_list ap)
>      }
>      return vfprintf(stderr, fmt, ap);
>  }
> -
> -int error_vprintf_unless_qmp(const char *fmt, va_list ap)
> -{
> -    return error_vprintf(fmt, ap);
> -}

When I write a printf-like utility function, I habitually throw in a
vprintf-like function.

Any particular reason for hiding this one?  To avoid misunderstandings:
I'm fine with hiding it if it's causing you trouble.

Except I think we'd better delete than hide then: inline into
error_printf_unless_qmp().  Makes sense?


