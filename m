Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366274F5815
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:48:27 +0200 (CEST)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1L0-0002NZ-AL
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc1IL-0001Z7-QV
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nc1IK-0006o7-11
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649234738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zD8agiLNchrcOu96madB9mVJM/zb9dCX9l6v0p4KnmI=;
 b=exDOmcCZXeLS8/y9LqezHP3gl+JoxHt5PiMHx6QDMKNQ2UcnHKLkWIRKOsojf1XK+DOmsH
 m6pHbr9GYIenZPCuExKkswEcoEgbrAWa5Qg+LvAb2CebmVjbMyHyhymKhBkvAQg2tN/bCD
 ah7DXjxNxqjzKTW6eTNrcEq2BGO6aes=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-ZQzZufofPiyQCKyarw7nBg-1; Wed, 06 Apr 2022 04:45:37 -0400
X-MC-Unique: ZQzZufofPiyQCKyarw7nBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0494185A79C
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 08:45:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D63F1121319;
 Wed,  6 Apr 2022 08:45:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E99921E6A00; Wed,  6 Apr 2022 10:45:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 20/32] include: move dump_in_progress() to runstate.h
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-21-marcandre.lureau@redhat.com>
Date: Wed, 06 Apr 2022 10:45:35 +0200
In-Reply-To: <20220323155743.1585078-21-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:31 +0400")
Message-ID: <87lewir45s.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Along with other state tracking functions. Rename it for consistency.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu-common.h     | 4 ----
>  include/sysemu/runstate.h | 1 +
>  dump/dump.c               | 4 ++--
>  monitor/qmp-cmds.c        | 4 ++--
>  4 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index fdb0b16166a5..5f53a0e11287 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -76,8 +76,4 @@ int parse_debug_env(const char *name, int max, int init=
ial);
> =20
>  void page_size_init(void);
> =20
> -/* returns non-zero if dump is in progress, otherwise zero is
> - * returned. */
> -bool dump_in_progress(void);
> -
>  #endif
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index a53569157343..c3f445dd2683 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -69,6 +69,7 @@ void qemu_system_killed(int signal, pid_t pid);
>  void qemu_system_reset(ShutdownCause reason);
>  void qemu_system_guest_panicked(GuestPanicInformation *info);
>  void qemu_system_guest_crashloaded(GuestPanicInformation *info);
> +bool qemu_system_dump_in_progress(void);
> =20
>  #endif
> =20

include/sysemu/dump.h would also work, I think.  Perhaps Paolo has a
preference.

> diff --git a/dump/dump.c b/dump/dump.c
> index f57ed76fa76d..5d71c47d06aa 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1564,7 +1564,7 @@ static void dump_state_prepare(DumpState *s)
>      *s =3D (DumpState) { .status =3D DUMP_STATUS_ACTIVE };
>  }
> =20
> -bool dump_in_progress(void)
> +bool qemu_system_dump_in_progress(void)
>  {
>      DumpState *state =3D &dump_state_global;
>      return (qatomic_read(&state->status) =3D=3D DUMP_STATUS_ACTIVE);
> @@ -1930,7 +1930,7 @@ void qmp_dump_guest_memory(bool paging, const char =
*file,
> =20
>      /* if there is a dump in background, we should wait until the dump
>       * finished */
> -    if (dump_in_progress()) {
> +    if (qemu_system_dump_in_progress()) {
>          error_setg(errp, "There is a dump in process, please wait.");
>          return;
>      }
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 0b04855ce899..883cf1ca4bbf 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -85,7 +85,7 @@ void qmp_stop(Error **errp)
>  {
>      /* if there is a dump in background, we should wait until the dump
>       * finished */
> -    if (dump_in_progress()) {
> +    if (qemu_system_dump_in_progress()) {
>          error_setg(errp, "There is a dump in process, please wait.");
>          return;
>      }
> @@ -115,7 +115,7 @@ void qmp_cont(Error **errp)
> =20
>      /* if there is a dump in background, we should wait until the dump
>       * finished */
> -    if (dump_in_progress()) {
> +    if (qemu_system_dump_in_progress()) {
>          error_setg(errp, "There is a dump in process, please wait.");
>          return;
>      }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


