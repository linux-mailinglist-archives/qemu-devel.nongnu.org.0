Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C944F7588
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 07:58:42 +0200 (CEST)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncLAH-0001Zf-5V
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 01:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncL2i-00053h-5i
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncL2g-0000TJ-Fu
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649310649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/JaXl5dB2YqX8zsH5xdTDJZhSV8RzsYulgs5AwEZXA=;
 b=C0Bw8tRa1Zlx6GncHz0XxX+KwEOY85qGipQ3SQCvoYis7+5y3cDIEerjgvdxSS4PggnSJC
 jfqjhFQA5qAx9eBwZ5t4/Rki0zL/pr3DV9Gh7HKAeibq7ltUdHR3r7H1t4ORq8lmglKx0u
 5jngX26fUVv+x59higTm6zIz/SLvthE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-GkgA6wBwPKKONAwW6P6HEg-1; Thu, 07 Apr 2022 01:50:48 -0400
X-MC-Unique: GkgA6wBwPKKONAwW6P6HEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 113C7800882
 for <qemu-devel@nongnu.org>; Thu,  7 Apr 2022 05:50:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECB7A7ADB;
 Thu,  7 Apr 2022 05:50:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E521D21E6A21; Thu,  7 Apr 2022 07:50:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 15/32] error-report: use error_printf() for program prefix
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-16-marcandre.lureau@redhat.com>
Date: Thu, 07 Apr 2022 07:50:43 +0200
In-Reply-To: <20220323155743.1585078-16-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:26 +0400")
Message-ID: <87zgkxjvbg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> For consistency with other calls in the function, let's use
> error_printf(). (it will use stderr since !monitor_cur())
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/error-report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/error-report.c b/util/error-report.c
> index 4ea380dd4169..3a1d4923d620 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -156,7 +156,7 @@ static void print_loc(void)
>      const char *const *argp;
> =20
>      if (!monitor_cur() && g_get_prgname()) {
> -        fprintf(stderr, "%s:", g_get_prgname());
> +        error_printf("%s:", g_get_prgname());
>          sep =3D " ";
>      }
>      switch (cur_loc->kind) {

Reviewed-by: Markus Armbruster <armbru@redhat.com>


