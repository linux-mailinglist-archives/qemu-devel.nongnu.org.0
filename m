Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E9513C9FD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:51:54 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irltZ-0005Ew-R7
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1irlUy-0004hv-Mv
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:26:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1irlUw-0001a9-Ao
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:26:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44617
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1irlUw-0001Zp-6w
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579105585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/zHCq700K0aiEhkWXSk8n4MnRi4kSoqQVbI4wPrC2w=;
 b=PnndKk20cf5yusaIWXIytWZcx4+2vsvc/cjZ85WoAIsJJheQ6j/br52xwY+kdLKxu4qp3b
 5+2+DHVf395rVbRtv0OsE710tIb7SIsb9qCK7N0JraEzJsQ8Zywmqshqurjmr66pA4gsci
 4T9wBMfl7L4qUpzBcZ5d270LCCEj6mU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-B8sQRWToP5KHeK8_hfLCVQ-1; Wed, 15 Jan 2020 11:26:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8787318B9FD5;
 Wed, 15 Jan 2020 16:26:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12BA2620D8;
 Wed, 15 Jan 2020 16:26:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 976451138600; Wed, 15 Jan 2020 17:26:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 2/4] vl: Initialise main loop earlier
References: <20200115122326.26393-1-kwolf@redhat.com>
 <20200115122326.26393-3-kwolf@redhat.com>
Date: Wed, 15 Jan 2020 17:26:18 +0100
In-Reply-To: <20200115122326.26393-3-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 15 Jan 2020 13:23:24 +0100")
Message-ID: <87ftgg65zp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: B8sQRWToP5KHeK8_hfLCVQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: stefanha@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> We want to be able to use qemu_aio_context in the monitor
> initialisation.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  vl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 86474a55c9..4c79a00857 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2903,6 +2903,11 @@ int main(int argc, char **argv, char **envp)
>      runstate_init();
>      precopy_infrastructure_init();
>      postcopy_infrastructure_init();
> +
> +    if (qemu_init_main_loop(&main_loop_err)) {
> +        error_report_err(main_loop_err);
> +        exit(1);
> +    }
>      monitor_init_globals();
> =20
>      if (qcrypto_init(&err) < 0) {
> @@ -3817,11 +3822,6 @@ int main(int argc, char **argv, char **envp)
>      qemu_unlink_pidfile_notifier.notify =3D qemu_unlink_pidfile;
>      qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
> =20
> -    if (qemu_init_main_loop(&main_loop_err)) {
> -        error_report_err(main_loop_err);
> -        exit(1);
> -    }
> -
>  #ifdef CONFIG_SECCOMP
>      olist =3D qemu_find_opts_err("sandbox", NULL);
>      if (olist) {

Can't see anything wrong with this.  Doesn't mean much; every time I do
something like it, it comes back to bite me.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


