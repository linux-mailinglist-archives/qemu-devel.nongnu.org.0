Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A98665D66
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:13:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFbpe-0003Fg-Hx; Wed, 11 Jan 2023 09:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFbpb-0003FU-Rb
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:11:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFbpZ-0003aA-IH
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673446312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYmS28x6XoRTFecmVILo5hZoCXVtVYyvuEe0qOMtJSc=;
 b=Jv5/PTHLOrJ35mGsokxgZUZ0TnbaFePzNmjo8fMe5Z53Du+JtqrZx05c8V3YLvZ43o/NPG
 m6vfW7GAW/GOQLzcAYNyadvFC5++luADtFAC3KxWApEHWgfwoRzRKlh3QUglWNJMuAvwJc
 xY5UCPcCTa3/c+TG+/Oq+dHnWSdQftw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-3meJ_LWVPAWu7cAr1P2jKw-1; Wed, 11 Jan 2023 09:11:49 -0500
X-MC-Unique: 3meJ_LWVPAWu7cAr1P2jKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A15685A588;
 Wed, 11 Jan 2023 14:11:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 447B22166B26;
 Wed, 11 Jan 2023 14:11:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25E8721E675B; Wed, 11 Jan 2023 15:11:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Eric Blake <eblake@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH RESEND v3 08/10] migration: Implement dirty-limit
 convergence algo
References: <cover.1670087275.git.huangy81@chinatelecom.cn>
 <cover.1670087275.git.huangy81@chinatelecom.cn>
 <60408b08bf680b30393c8aa6d1422189521ca8cc.1670087276.git.huangy81@chinatelecom.cn>
Date: Wed, 11 Jan 2023 15:11:47 +0100
In-Reply-To: <60408b08bf680b30393c8aa6d1422189521ca8cc.1670087276.git.huangy81@chinatelecom.cn>
 (huangy's message of "Sun, 4 Dec 2022 01:09:11 +0800")
Message-ID: <87v8ldduu4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
> Implement dirty-limit convergence algo for live migration,
> which is kind of like auto-converge algo but using dirty-limit
> instead of cpu throttle to make migration convergent.
>
> Enable dirty page limit if dirty_rate_high_cnt greater than 2
> when dirty-limit capability enabled, disable dirty-limit if
> migration be cancled.
>
> Note that "set_vcpu_dirty_limit", "cancel_vcpu_dirty_limit"
> commands are not allowed during dirty-limit live migration.

Only during live migration, or also during migration of a stopped guest?
If the latter, the easy fix is to scratch "live".

> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  migration/migration.c  |  3 +++
>  migration/ram.c        | 63 ++++++++++++++++++++++++++++++++++++++------=
------
>  migration/trace-events |  1 +
>  softmmu/dirtylimit.c   | 22 ++++++++++++++++++
>  4 files changed, 74 insertions(+), 15 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 702e7f4..127d0fe 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -240,6 +240,9 @@ void migration_cancel(const Error *error)
>      if (error) {
>          migrate_set_error(current_migration, error);
>      }
> +    if (migrate_dirty_limit()) {
> +        qmp_cancel_vcpu_dirty_limit(false, -1, NULL);
> +    }
>      migrate_fd_cancel(current_migration);
>  }
>=20=20
> diff --git a/migration/ram.c b/migration/ram.c
> index 5e66652..78b9167 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -45,6 +45,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-types-migration.h"
>  #include "qapi/qapi-events-migration.h"
> +#include "qapi/qapi-commands-migration.h"
>  #include "qapi/qmp/qerror.h"
>  #include "trace.h"
>  #include "exec/ram_addr.h"
> @@ -57,6 +58,8 @@
>  #include "qemu/iov.h"
>  #include "multifd.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/dirtylimit.h"
> +#include "sysemu/kvm.h"
>=20=20
>  #include "hw/boards.h" /* for machine_dump_guest_core() */
>=20=20
> @@ -1139,6 +1142,30 @@ static void migration_update_rates(RAMState *rs, i=
nt64_t end_time)
>      }
>  }
>=20=20
> +/*
> + * Enable dirty-limit to throttle down the guest
> + */
> +static void migration_dirty_limit_guest(void)
> +{
> +    static int64_t quota_dirtyrate;
> +    MigrationState *s =3D migrate_get_current();
> +
> +    /*
> +     * If dirty limit already enabled and migration parameter
> +     * vcpu-dirty-limit untouched.
> +     */
> +    if (dirtylimit_in_service() &&
> +        quota_dirtyrate =3D=3D s->parameters.vcpu_dirty_limit) {
> +        return;
> +    }
> +
> +    quota_dirtyrate =3D s->parameters.vcpu_dirty_limit;
> +
> +    /* Set or update quota dirty limit */
> +    qmp_set_vcpu_dirty_limit(false, -1, quota_dirtyrate, NULL);
> +    trace_migration_dirty_limit_guest(quota_dirtyrate);
> +}
> +
>  static void migration_trigger_throttle(RAMState *rs)
>  {
>      MigrationState *s =3D migrate_get_current();
> @@ -1148,26 +1175,32 @@ static void migration_trigger_throttle(RAMState *=
rs)
>      uint64_t bytes_dirty_period =3D rs->num_dirty_pages_period * TARGET_=
PAGE_SIZE;
>      uint64_t bytes_dirty_threshold =3D bytes_xfer_period * threshold / 1=
00;
>=20=20
> -    /* During block migration the auto-converge logic incorrectly detects
> -     * that ram migration makes no progress. Avoid this by disabling the
> -     * throttling logic during the bulk phase of block migration. */
> -    if (blk_mig_bulk_active()) {
> -        return;
> -    }
> +    /*
> +     * The following detection logic can be refined later. For now:
> +     * Check to see if the ratio between dirtied bytes and the approx.
> +     * amount of bytes that just got transferred since the last time
> +     * we were in this routine reaches the threshold. If that happens
> +     * twice, start or increase throttling.
> +     */
>=20=20
> -    if (migrate_auto_converge()) {
> -        /* The following detection logic can be refined later. For now:
> -           Check to see if the ratio between dirtied bytes and the appro=
x.
> -           amount of bytes that just got transferred since the last time
> -           we were in this routine reaches the threshold. If that happens
> -           twice, start or increase throttling. */
> +    if ((bytes_dirty_period > bytes_dirty_threshold) &&
> +        (++rs->dirty_rate_high_cnt >=3D 2)) {
> +        rs->dirty_rate_high_cnt =3D 0;
> +        /*
> +         * During block migration the auto-converge logic incorrectly de=
tects
> +         * that ram migration makes no progress. Avoid this by disabling=
 the
> +         * throttling logic during the bulk phase of block migration
> +         */
> +        if (blk_mig_bulk_active()) {
> +            return;
> +        }
>=20=20
> -        if ((bytes_dirty_period > bytes_dirty_threshold) &&
> -            (++rs->dirty_rate_high_cnt >=3D 2)) {
> +        if (migrate_auto_converge()) {
>              trace_migration_throttle();
> -            rs->dirty_rate_high_cnt =3D 0;
>              mig_throttle_guest_down(bytes_dirty_period,
>                                      bytes_dirty_threshold);
> +        } else if (migrate_dirty_limit()) {
> +            migration_dirty_limit_guest();
>          }
>      }
>  }
> diff --git a/migration/trace-events b/migration/trace-events
> index 57003ed..33a2666 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -91,6 +91,7 @@ migration_bitmap_sync_start(void) ""
>  migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
>  migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, u=
nsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
>  migration_throttle(void) ""
> +migration_dirty_limit_guest(int64_t dirtyrate) "guest dirty page rate li=
mit %" PRIi64 " MB/s"
>  ram_discard_range(const char *rbname, uint64_t start, size_t len) "%s: s=
tart: %" PRIx64 " %zx"
>  ram_load_loop(const char *rbname, uint64_t addr, int flags, void *host) =
"%s: addr: 0x%" PRIx64 " flags: 0x%x host: %p"
>  ram_load_postcopy_loop(int channel, uint64_t addr, int flags) "chan=3D%d=
 addr=3D0x%" PRIx64 " flags=3D0x%x"
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 2a07200..b63032c 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -439,6 +439,8 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
>                                   int64_t cpu_index,
>                                   Error **errp)
>  {
> +    MigrationState *ms =3D migrate_get_current();
> +
>      if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>          return;
>      }
> @@ -452,6 +454,15 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
>          return;
>      }
>=20=20
> +    if (migration_is_running(ms->state) &&
> +        (!qemu_thread_is_self(&ms->thread)) &&
> +        migrate_dirty_limit() &&
> +        dirtylimit_in_service()) {
> +        error_setg(errp, "dirty-limit live migration is running, do"
> +                   " not allow dirty page limit to be canceled manually"=
);

"do not allow" sounds like a request.  What about "can't cancel dirty
page limit while migration is running"?

> +        return;
> +    }
> +
>      dirtylimit_state_lock();
>=20=20
>      if (has_cpu_index) {
> @@ -487,6 +498,8 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
>                                uint64_t dirty_rate,
>                                Error **errp)
>  {
> +    MigrationState *ms =3D migrate_get_current();
> +
>      if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>          error_setg(errp, "dirty page limit feature requires KVM with"
>                     " accelerator property 'dirty-ring-size' set'");
> @@ -503,6 +516,15 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
>          return;
>      }
>=20=20
> +    if (migration_is_running(ms->state) &&
> +        (!qemu_thread_is_self(&ms->thread)) &&
> +        migrate_dirty_limit() &&
> +        dirtylimit_in_service()) {
> +        error_setg(errp, "dirty-limit live migration is running, do"
> +                   " not allow dirty page limit to be configured manuall=
y");

Likewise.

> +        return;
> +    }
> +
>      dirtylimit_state_lock();
>=20=20
>      if (!dirtylimit_in_service()) {


