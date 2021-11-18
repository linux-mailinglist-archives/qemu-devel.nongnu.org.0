Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5979455B1F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:01:01 +0100 (CET)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mng68-0007C6-K7
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:01:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mng3m-0003cA-Aa
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mng3k-0002Pp-Ar
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637236711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6Q20w0hauRVTMRWuZI3AukHVhqyWKhfQ2OupBahNCY=;
 b=aZM4MXfLecAZm3d72xIhNh/rWnN0DqcyXuxZID+rGgpN0SCBeJ9FVthQiH9LVIAtGFnQb0
 GGbgD9wlKo6KMg0rKuD8HWPiOjFxKX8Dj2+Dde4WAbqO0xfy1KEeCWVEAvZSFc+Mw3ha9j
 na0OepA01asA8vh+lVAdeZKNMotmmGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-Zj3-m5OTNqKGQB7pudGf8Q-1; Thu, 18 Nov 2021 06:58:30 -0500
X-MC-Unique: Zj3-m5OTNqKGQB7pudGf8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D9A1006AA5
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 11:58:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F4960BF1;
 Thu, 18 Nov 2021 11:58:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79D4111380A7; Thu, 18 Nov 2021 12:58:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 1/2] qemu-options: define -spice only #ifdef
 CONFIG_SPICE
References: <20211115080312.64692-1-marcandre.lureau@redhat.com>
 <20211115080312.64692-2-marcandre.lureau@redhat.com>
Date: Thu, 18 Nov 2021 12:58:27 +0100
In-Reply-To: <20211115080312.64692-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Mon, 15 Nov 2021 12:03:11 +0400")
Message-ID: <87czmxwu8s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1982600
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  softmmu/vl.c    | 2 ++
>  qemu-options.hx | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1159a64bce4e..385465fbeb6d 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3538,6 +3538,7 @@ void qemu_init(int argc, char **argv, char **envp)
>              case QEMU_OPTION_readconfig:
>                  qemu_read_config_file(optarg, qemu_parse_config_group, &=
error_fatal);
>                  break;
> +#ifdef CONFIG_SPICE
>              case QEMU_OPTION_spice:
>                  olist =3D qemu_find_opts_err("spice", NULL);
>                  if (!olist) {
                       error_report("spice support is disabled");
                       exit(1);
                   }

Is this error still reachable?

> @@ -3550,6 +3551,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  display_remote++;
>                  break;
> +#endif
>              case QEMU_OPTION_writeconfig:
>                  {
>                      FILE *fp;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7749f59300b5..323913945a5d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2017,6 +2017,7 @@ SRST
>      Enable SDL.
>  ERST
> =20
> +#ifdef CONFIG_SPICE
>  DEF("spice", HAS_ARG, QEMU_OPTION_spice,
>      "-spice [port=3Dport][,tls-port=3Dsecured-port][,x509-dir=3D<dir>]\n=
"
>      "       [,x509-key-file=3D<file>][,x509-key-password=3D<file>]\n"
> @@ -2038,6 +2039,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
>      "   enable spice\n"
>      "   at least one of {port, tls-port} is mandatory\n",
>      QEMU_ARCH_ALL)
> +#endif
>  SRST
>  ``-spice option[,option[,...]]``
>      Enable the spice remote desktop protocol. Valid options are


