Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29D2BAF18
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:37:22 +0100 (CET)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8TR-0000dr-BI
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg8QZ-000817-6N
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg8QR-0006cO-V5
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605886454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQ8M0BpdSYaYC0Tt5c1hvNrfgwFsU5v5UaAoQu9bkpM=;
 b=BK1hLbEn4uotoLc4rSRIj+9ZJuWruHC15LWou7MNell3LLQJ/34263TftzXg1dxNHxDfIo
 3MCRysLyCvjQDAKVUuX97nm0JjQPrNtovYlyWAf8ZoAOi+PCCumkizJuitTzyEcGIMAO5H
 79/4DXSEgG2E4g5vwKDCRU7G4W9gcKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-O4YxiRLIOcGKC1LQq3Cexg-1; Fri, 20 Nov 2020 10:34:12 -0500
X-MC-Unique: O4YxiRLIOcGKC1LQq3Cexg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E439EC1A5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 15:34:11 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49D5C5C1D5;
 Fri, 20 Nov 2020 15:34:10 +0000 (UTC)
Date: Fri, 20 Nov 2020 16:34:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 24/29] migration, vl: start migration via
 qmp_migrate_incoming
Message-ID: <20201120163408.7740a92f@redhat.com>
In-Reply-To: <20201027182144.3315885-25-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-25-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:39 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Make qemu_start_incoming_migration local to migration/migration.c.
> By using the runstate instead of a separate flag, vl need not do
> anything to setup deferred incoming migration.
> 
> qmp_migrate_incoming also does not need the deferred_incoming flag
> anymore, because "-incoming PROTOCOL" will clear the "once" flag
> before the main loop starts.  Therefore, later invocations of
> the migrate-incoming command will fail with the existing
> "The incoming migration has already been started" error message.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/migration/misc.h |  1 -
>  migration/migration.c    | 33 ++++++++-------------------------
>  softmmu/vl.c             | 11 +++++++----
>  3 files changed, 15 insertions(+), 30 deletions(-)
> 
> diff --git a/include/migration/misc.h b/include/migration/misc.h
> index 34e7d75713..bccc1b6b44 100644
> --- a/include/migration/misc.h
> +++ b/include/migration/misc.h
> @@ -58,7 +58,6 @@ void dump_vmstate_json_to_file(FILE *out_fp);
>  /* migration/migration.c */
>  void migration_object_init(void);
>  void migration_shutdown(void);
> -void qemu_start_incoming_migration(const char *uri, Error **errp);
>  bool migration_is_idle(void);
>  bool migration_is_active(MigrationState *);
>  void add_migration_state_change_notifier(Notifier *notify);
> diff --git a/migration/migration.c b/migration/migration.c
> index f48b03cac2..d078094c56 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -114,8 +114,6 @@
>  static NotifierList migration_state_notifiers =
>      NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
>  
> -static bool deferred_incoming;
> -
>  /* Messages sent on the return path from destination to source */
>  enum mig_rp_message_type {
>      MIG_RP_MSG_INVALID = 0,  /* Must be 0 */
> @@ -257,19 +255,6 @@ static bool migrate_late_block_activate(void)
>          MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
>  }
>  
> -/*
> - * Called on -incoming with a defer: uri.
> - * The migration can be started later after any parameters have been
> - * changed.
> - */
> -static void deferred_incoming_migration(Error **errp)
> -{
> -    if (deferred_incoming) {
> -        error_setg(errp, "Incoming migration already deferred");
> -    }
> -    deferred_incoming = true;
> -}
> -
>  /*
>   * Send a message on the return channel back to the source
>   * of the migration.
> @@ -380,16 +365,14 @@ void migrate_add_address(SocketAddress *address)
>      addrs->value = QAPI_CLONE(SocketAddress, address);
>  }
>  
> -void qemu_start_incoming_migration(const char *uri, Error **errp)
> +static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
>  
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> -    if (!strcmp(uri, "defer")) {
> -        deferred_incoming_migration(errp);
> -    } else if (strstart(uri, "tcp:", &p) ||
> -               strstart(uri, "unix:", NULL) ||
> -               strstart(uri, "vsock:", NULL)) {
considering the last hunk does won't call qmp_migrate_incoming
if 'defer' was used, wouldn't we will lose QAPI event here?
not sure how important it to users,
Ccing David

> +    if (strstart(uri, "tcp:", &p) ||
> +        strstart(uri, "unix:", NULL) ||
> +        strstart(uri, "vsock:", NULL)) {
>          socket_start_incoming_migration(p ? p : uri, errp);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> @@ -1926,14 +1909,14 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
>      Error *local_err = NULL;
>      static bool once = true;
>  
> -    if (!deferred_incoming) {
> -        error_setg(errp, "For use with '-incoming defer'");
> -        return;
> -    }
>      if (!once) {
>          error_setg(errp, "The incoming migration has already been started");
>          return;
>      }
> +    if (!runstate_check(RUN_STATE_INMIGRATE)) {
> +        error_setg(errp, "'-incoming' was not specified on the command line");
> +        return;
> +    }
>  
>      qemu_start_incoming_migration(uri, &local_err);
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ae2854d8af..583366510b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -109,6 +109,7 @@
>  #include "qapi/qapi-visit-block-core.h"
>  #include "qapi/qapi-visit-ui.h"
>  #include "qapi/qapi-commands-block-core.h"
> +#include "qapi/qapi-commands-migration.h"
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/qmp/qerror.h"
> @@ -4557,10 +4558,12 @@ void qemu_init(int argc, char **argv, char **envp)
>      }
>      if (incoming) {
>          Error *local_err = NULL;
> -        qemu_start_incoming_migration(incoming, &local_err);
> -        if (local_err) {
> -            error_reportf_err(local_err, "-incoming %s: ", incoming);
> -            exit(1);
> +        if (strcmp(incoming, "defer") != 0) {
> +            qmp_migrate_incoming(incoming, &local_err);
> +            if (local_err) {
> +                error_reportf_err(local_err, "-incoming %s: ", incoming);
> +                exit(1);
> +            }
>          }
>      } else if (autostart) {
>          vm_start();


