Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931C551172
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:25:31 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Bms-0000yD-95
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3BkR-0007U7-Sk
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3BkP-0001FB-Oa
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655709777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMCAIatMugv0aMgyJ3GS44Jw0udOjYl6kx+AaST6YX4=;
 b=Rjiq4u1IxCRkIx8NjciPqK8VFK3nKjK39oQ1dEk4Kohk9VLdyQtWVgQ50f1mvatDN5sYoZ
 nsG7z0Ib2z0wZ1hAofyXofs5APaw0IqX9MDa0U2BcFAL9HhBPBrCybJZ0G42pIazpMW38H
 dOeViPdyGdiZyDh7i0C2RD6Su+s/zrM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-fyN1jEfTM8SuOJlQbDZ6rQ-1; Mon, 20 Jun 2022 03:22:54 -0400
X-MC-Unique: fyN1jEfTM8SuOJlQbDZ6rQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 177EA3815D23;
 Mon, 20 Jun 2022 07:22:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD30F2026D2D;
 Mon, 20 Jun 2022 07:22:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9765321E688E; Mon, 20 Jun 2022 09:22:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH 3/9] error-report: introduce "detailed" variable
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-4-marcandre.lureau@redhat.com>
Date: Mon, 20 Jun 2022 09:22:51 +0200
In-Reply-To: <20220616124034.3381391-4-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 16 Jun 2022 16:40:28 +0400")
Message-ID: <87a6a76bp0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Let's use a more explicit variable "detailed" instead of calling
> monitor_cur() multiple times.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/error-report.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/util/error-report.c b/util/error-report.c
> index 98f242b75bbf..893da10f19bc 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -195,16 +195,17 @@ real_time_iso8601(void)
>   */
>  static void vreport(report_type type, const char *fmt, va_list ap)
>  {
> +    bool detailed =3D !monitor_cur();
>      gchar *timestr;
>=20=20
> -    if (message_with_timestamp && !monitor_cur()) {
> +    if (message_with_timestamp && detailed) {
>          timestr =3D real_time_iso8601();
>          error_printf("%s ", timestr);
>          g_free(timestr);
>      }
>=20=20
>      /* Only prepend guest name if -msg guest-name and -name guest=3D... =
are set */
> -    if (error_with_guestname && error_guest_name && !monitor_cur()) {
> +    if (error_with_guestname && error_guest_name && detailed) {
>          error_printf("%s ", error_guest_name);
>      }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


