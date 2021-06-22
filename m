Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3F3B05B3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:18:42 +0200 (CEST)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgIc-0001lS-0Q
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvgDj-00053K-49
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:13:39 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:33239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvgDf-0000eG-6T
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:13:38 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-xJkWBc-dNVWCmaUPrhYrNQ-1; Tue, 22 Jun 2021 09:13:26 -0400
X-MC-Unique: xJkWBc-dNVWCmaUPrhYrNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A43A100F947;
 Tue, 22 Jun 2021 13:13:25 +0000 (UTC)
Received: from bahia.lan (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B37D510016FE;
 Tue, 22 Jun 2021 13:13:23 +0000 (UTC)
Date: Tue, 22 Jun 2021 15:13:22 +0200
From: Greg Kurz <groug@kaod.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/5] monitor: allow register hmp commands
Message-ID: <20210622151322.65ca0c3e@bahia.lan>
In-Reply-To: <20210622124915.261060-2-kraxel@redhat.com>
References: <20210622124915.261060-1-kraxel@redhat.com>
 <20210622124915.261060-2-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 14:49:11 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Allow commands having a NULL cmd pointer, add a function to set the
> pointer later.  Use case: allow modules implement hmp commands.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/monitor/monitor.h |  3 +++
>  monitor/hmp.c             |  7 +++++++
>  monitor/misc.c            | 15 +++++++++++++++
>  3 files changed, 25 insertions(+)
>=20
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 1211d6e6d69f..1a8a369b50b2 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -51,4 +51,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flag=
s);
>  void monitor_fdset_dup_fd_remove(int dup_fd);
>  int64_t monitor_fdset_dup_fd_find(int dup_fd);
> =20
> +void monitor_register_hmp(const char *name, bool info,
> +                          void (*cmd)(Monitor *mon, const QDict *qdict))=
;
> +
>  #endif /* MONITOR_H */
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 6c0b33a0b19d..d50c3124e1e1 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1089,6 +1089,13 @@ void handle_hmp_command(MonitorHMP *mon, const cha=
r *cmdline)
>          return;
>      }
> =20
> +    if (!cmd->cmd) {
> +        /* FIXME: is it useful to try autoload modules here ??? */
> +        monitor_printf(&mon->common, "Command \"%.*s\" is not available.=
\n",
> +                       (int)(cmdline - cmd_start), cmd_start);
> +        return;
> +    }
> +
>      qdict =3D monitor_parse_arguments(&mon->common, &cmdline, cmd);
>      if (!qdict) {
>          while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 1539e18557f0..672267008b02 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1974,6 +1974,21 @@ static void sortcmdlist(void)
>            compare_mon_cmd);
>  }
> =20
> +void monitor_register_hmp(const char *name, bool info,
> +                          void (*cmd)(Monitor *mon, const QDict *qdict))
> +{
> +    HMPCommand *table =3D info ? hmp_info_cmds : hmp_cmds;
> +
> +    while (table->name !=3D NULL) {
> +        if (strcmp(table->name, name) =3D=3D 0) {

Would it make sense to register the same command multiple times ?
I guess it doesn't, so you may add an assert(table->cmd =3D=3D NULL)
here.

> +            table->cmd =3D cmd;
> +            return;
> +        }
> +        table++;
> +    }
> +    g_assert_not_reached();
> +}
> +
>  void monitor_init_globals(void)
>  {
>      monitor_init_globals_core();


