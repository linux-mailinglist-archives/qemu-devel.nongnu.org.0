Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9B665E2A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:41:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcF7-00083D-1i; Wed, 11 Jan 2023 09:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFcF5-00082h-7l
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFcF2-0003Ls-NJ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673447891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXWmTQJ7MOiwWma5pSckilyRtmlYN0mg1kUX3+lUosw=;
 b=SxjCqlltyTbpYCBlYjWh4fUEwpkdOPF5Wy4K7gpl7jrdCXXy0rxo/PXoEUsstgEcokqCxj
 DMIyXvPsn3I3ZgYzdSPb8mbGrsnD2OA/Gy0QcRYmRNJN3t1ptvqEzyy1OilUT4rczQyK6C
 ALaQLJWZb24xLUIR5gVTPP4nJGCde+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-ousr9VlgOJmRe9n2pnIaMw-1; Wed, 11 Jan 2023 09:38:05 -0500
X-MC-Unique: ousr9VlgOJmRe9n2pnIaMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBE7C280412B;
 Wed, 11 Jan 2023 14:38:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75195C15BA0;
 Wed, 11 Jan 2023 14:38:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3D9F21E6A36; Wed, 11 Jan 2023 15:38:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH RESEND v3 09/10] migration: Export dirty-limit time info
 for observation
References: <cover.1670087275.git.huangy81@chinatelecom.cn>
 <cover.1670087275.git.huangy81@chinatelecom.cn>
 <522bd838bcc4df6c232a240a71e5c2fa550f3f48.1670087276.git.huangy81@chinatelecom.cn>
Date: Wed, 11 Jan 2023 15:38:01 +0100
In-Reply-To: <522bd838bcc4df6c232a240a71e5c2fa550f3f48.1670087276.git.huangy81@chinatelecom.cn>
 (huangy's message of "Sun, 4 Dec 2022 01:09:12 +0800")
Message-ID: <875ydddtme.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Export dirty limit throttle time and estimated ring full
> time, through which we can observe if dirty limit take
> effect during live migration.

Suggest something like "Extend query-migrate to provide ..." both here
and in subject.

> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  include/sysemu/dirtylimit.h |  2 ++
>  migration/migration.c       | 10 ++++++++++
>  monitor/hmp-cmds.c          | 10 ++++++++++
>  qapi/migration.json         | 15 ++++++++++++++-
>  softmmu/dirtylimit.c        | 39 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 75 insertions(+), 1 deletion(-)
>
> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
> index 8d2c1f3..f15e01d 100644
> --- a/include/sysemu/dirtylimit.h
> +++ b/include/sysemu/dirtylimit.h
> @@ -34,4 +34,6 @@ void dirtylimit_set_vcpu(int cpu_index,
>  void dirtylimit_set_all(uint64_t quota,
>                          bool enable);
>  void dirtylimit_vcpu_execute(CPUState *cpu);
> +int64_t dirtylimit_throttle_time_per_full(void);
> +int64_t dirtylimit_ring_full_time(void);
>  #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index 127d0fe..3f92389 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -62,6 +62,7 @@
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/dirtylimit.h"
>=20=20
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throt=
tling */
>=20=20
> @@ -1114,6 +1115,15 @@ static void populate_ram_info(MigrationInfo *info,=
 MigrationState *s)
>          info->ram->remaining =3D ram_bytes_remaining();
>          info->ram->dirty_pages_rate =3D ram_counters.dirty_pages_rate;
>      }
> +
> +    if (migrate_dirty_limit() && dirtylimit_in_service()) {
> +        info->has_dirty_limit_throttle_time_per_full =3D true;
> +        info->dirty_limit_throttle_time_per_full =3D
> +                            dirtylimit_throttle_time_per_full();
> +
> +        info->has_dirty_limit_ring_full_time =3D true;
> +        info->dirty_limit_ring_full_time =3D dirtylimit_us_ring_full();
> +    }
>  }
>=20=20
>  static void populate_disk_info(MigrationInfo *info)
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 9ad6ee5..c3aaba3 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -339,6 +339,16 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdi=
ct)
>                         info->cpu_throttle_percentage);
>      }
>=20=20
> +    if (info->has_dirty_limit_throttle_time_per_full) {
> +        monitor_printf(mon, "dirty-limit throttle time: %" PRIi64 " us\n=
",
> +                       info->dirty_limit_throttle_time_per_full);
> +    }
> +
> +    if (info->has_dirty_limit_ring_full_time) {
> +        monitor_printf(mon, "dirty-limit ring full time: %" PRIi64 " us\=
n",
> +                       info->dirty_limit_ring_full_time);
> +    }

I discuss naming below.  If we change the names, we probably want to
change the string literals here, too.

> +
>      if (info->has_postcopy_blocktime) {
>          monitor_printf(mon, "postcopy blocktime: %u\n",
>                         info->postcopy_blocktime);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 6055fdc..ae7d22d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -242,6 +242,17 @@
>  #                   Present and non-empty when migration is blocked.
>  #                   (since 6.0)
>  #
> +# @dirty-limit-throttle-time-per-full: Maximum throttle time (in microse=
conds) of virtual
> +#                                      CPUs each dirty ring full round, =
used to observe

What's a dirty "ring full round"?  Is it a migration round?  Something
else?

> +#                                      if dirty-limit take effect during=
 live migration.

takes effect

I think "if dirty-limit takes effect" isn't quite right.  We can use
this to observe how MigrationCapability dirty-limit affects the guest.
What about "shows how MigrationCapability dirty-limit affects the
guest"?

Even though dirty-limit-throttle-time-per-full is quite long, it still
feels abbreviated.  Full what?  What about
dirty-limit-throttle-time-per-round?  Naming is hard.

> +#                                      (since 7.3)
> +#
> +# @dirty-limit-ring-full-time: Estimated average dirty ring full time (i=
n microseconds)
> +#                              each dirty ring full round, note that the=
 value equals
> +#                              dirty ring memory size divided by average=
 dirty page rate
> +#                              of virtual CPU, which can be used to obse=
rve the average
> +#                              memory load of virtual CPU indirectly. (s=
ince 7.3)
> +#

Uff.

What is estimated?  The average amount of time the dirty ring (whatever
that is) is full in each migration round?

Aside: our doc comment syntax can push text blocks far to the right.
Not good.  Also not your fault, and not your problem to fix.

>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationInfo',
> @@ -259,7 +270,9 @@
>             '*postcopy-blocktime' : 'uint32',
>             '*postcopy-vcpu-blocktime': ['uint32'],
>             '*compression': 'CompressionStats',
> -           '*socket-address': ['SocketAddress'] } }
> +           '*socket-address': ['SocketAddress'],
> +           '*dirty-limit-throttle-time-per-full': 'int64',
> +           '*dirty-limit-ring-full-time': 'int64'} }
>=20=20
>  ##
>  # @query-migrate:

[...]


