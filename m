Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B14551177
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:26:35 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Bnu-0002ii-Dx
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3BmE-00016L-NZ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3BmC-0001OS-KA
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655709888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byubxzZHCvSr/0NostF7YHTQrtJeorDOQ0qHzAL75fs=;
 b=EaSak7kC7sqlat7kxVsoxSJkG+WCuawAL+vxVmdFGmV+4YgiEC0/2CPKjVSo3Ft2GS5Sbc
 VbqW6vsDnySosJ1IB5zL+JnYA9mY0/duicmECaopkNyDe5UavF1XCUuc4/7g/EtDJNvLfH
 9OcGeafLA84+vvKmFovwix26E5k7E4U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-MeQeLhkyOeWVjhYXMTNMuA-1; Mon, 20 Jun 2022 03:24:44 -0400
X-MC-Unique: MeQeLhkyOeWVjhYXMTNMuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90421811E76;
 Mon, 20 Jun 2022 07:24:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65FEC40C141F;
 Mon, 20 Jun 2022 07:24:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F06221E688E; Mon, 20 Jun 2022 09:24:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH 4/9] error-report: simplify print_loc()
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-5-marcandre.lureau@redhat.com>
Date: Mon, 20 Jun 2022 09:24:42 +0200
In-Reply-To: <20220616124034.3381391-5-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 16 Jun 2022 16:40:29 +0400")
Message-ID: <875ykv6blx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Pass the program name as "prefix" argument to print_loc() if printing
> with "details". This allows to get rid of monitor_cur() call in
> print_loc().
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/error-report.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/util/error-report.c b/util/error-report.c
> index 893da10f19bc..c43227a975e2 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -138,14 +138,14 @@ void loc_set_file(const char *fname, int lno)
>  /*
>   * Print current location to current monitor if we have one, else to std=
err.

Document the argument?  Not sure it's worth the bother...

>   */
> -static void print_loc(void)
> +static void print_loc(const char *prefix)
>  {
>      const char *sep =3D "";
>      int i;
>      const char *const *argp;
>=20=20
> -    if (!monitor_cur() && g_get_prgname()) {
> -        error_printf("%s:", g_get_prgname());
> +    if (prefix) {
> +        error_printf("%s:", prefix);
>          sep =3D " ";
>      }
>      switch (cur_loc->kind) {
> @@ -209,7 +209,7 @@ static void vreport(report_type type, const char *fmt=
, va_list ap)
>          error_printf("%s ", error_guest_name);
>      }
>=20=20
> -    print_loc();
> +    print_loc(detailed ? g_get_prgname() : NULL);
>=20=20
>      switch (type) {
>      case REPORT_TYPE_ERROR:

Reviewed-by: Markus Armbruster <armbru@redhat.com>


