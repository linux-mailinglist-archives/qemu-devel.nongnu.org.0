Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6AA2663D8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 18:26:11 +0200 (CEST)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGlsI-0008Mt-Jh
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 12:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGlrF-0007r6-6g
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 12:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGlrD-0008CM-65
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 12:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599841502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FTG13XRpQRmIOiuUxd9JdS/JgSvMLjnwnl5liS2NV9c=;
 b=ZjyL9JChPIRUhUenFbLhL6ycIvzrjDHtD/gQn1gyU4VVPmb8Vvp5zQr6hQJUptn31ThXg8
 QQxGHww8jhepG2wwZ+KKH8aWvmCRbMtSKMlCWEqH2DDh9bJxTYcB5I7h3How5KIMxTYRCH
 AwjbN6q2OcDSvpZoThGcX4Pp5TccUyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-Tcj739AkOo2MXvK-hXhgPg-1; Fri, 11 Sep 2020 12:25:00 -0400
X-MC-Unique: Tcj739AkOo2MXvK-hXhgPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7FE480EDA1;
 Fri, 11 Sep 2020 16:24:58 +0000 (UTC)
Received: from work-vm (ovpn-113-52.ams2.redhat.com [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C4C60C07;
 Fri, 11 Sep 2020 16:24:44 +0000 (UTC)
Date: Fri, 11 Sep 2020 17:24:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V1 01/32] savevm: add vmstate handler iterators
Message-ID: <20200911162441.GJ3310@work-vm>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-2-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1596122076-341293-2-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 08:18:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apologies for taking a while to get around to this, 

* Steve Sistare (steven.sistare@oracle.com) wrote:
> Provide the SAVEVM_FOREACH and SAVEVM_FORALL macros to loop over all save
> VM state handlers.  The former will filter handlers based on the operation
> in the later patch "savevm: VM handlers mode mask".  The latter loops over
> all handlers.
> 
> No functional change.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  migration/savevm.c | 57 ++++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 38 insertions(+), 19 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 45c9dd9..a07fcad 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -266,6 +266,25 @@ static SaveState savevm_state = {
>      .global_section_id = 0,
>  };
>  
> +/*
> + * The FOREACH macros will filter handlers based on the current operation when
> + * additional conditions are added in a subsequent patch.
> + */
> +
> +#define SAVEVM_FOREACH(se, entry)                                    \
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry)                \
> +
> +#define SAVEVM_FOREACH_SAFE(se, entry, new_se)                       \
> +    QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se)   \
> +
> +/* The FORALL macros unconditionally loop over all handlers. */
> +
> +#define SAVEVM_FORALL(se, entry)                                     \
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry)
> +
> +#define SAVEVM_FORALL_SAFE(se, entry, new_se)                        \
> +    QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se)
> +

OK, can I ask you to merge this with the next patch but to spin it the
other way, so that we have:

  SAVEVM_FOR(se, entry, mask)

and the places you use SAVEVM_FORALL_SAFE would become

  SAVEVM_FOR(se, entry, VMS_MODE_ALL)

I'm thinking at some point in the future we could merge a bunch of the
other flag checks in there.

Dave


>  static bool should_validate_capability(int capability)
>  {
>      assert(capability >= 0 && capability < MIGRATION_CAPABILITY__MAX);
> @@ -673,7 +692,7 @@ static uint32_t calculate_new_instance_id(const char *idstr)
>      SaveStateEntry *se;
>      uint32_t instance_id = 0;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FORALL(se, entry) {
>          if (strcmp(idstr, se->idstr) == 0
>              && instance_id <= se->instance_id) {
>              instance_id = se->instance_id + 1;
> @@ -689,7 +708,7 @@ static int calculate_compat_instance_id(const char *idstr)
>      SaveStateEntry *se;
>      int instance_id = 0;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FORALL(se, entry) {
>          if (!se->compat) {
>              continue;
>          }
> @@ -803,7 +822,7 @@ void unregister_savevm(VMStateIf *obj, const char *idstr, void *opaque)
>      }
>      pstrcat(id, sizeof(id), idstr);
>  
> -    QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se) {
> +    SAVEVM_FORALL_SAFE(se, entry, new_se) {
>          if (strcmp(se->idstr, id) == 0 && se->opaque == opaque) {
>              savevm_state_handler_remove(se);
>              g_free(se->compat);
> @@ -867,7 +886,7 @@ void vmstate_unregister(VMStateIf *obj, const VMStateDescription *vmsd,
>  {
>      SaveStateEntry *se, *new_se;
>  
> -    QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se) {
> +    SAVEVM_FORALL_SAFE(se, entry, new_se) {
>          if (se->vmsd == vmsd && se->opaque == opaque) {
>              savevm_state_handler_remove(se);
>              g_free(se->compat);
> @@ -1119,7 +1138,7 @@ bool qemu_savevm_state_blocked(Error **errp)
>  {
>      SaveStateEntry *se;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FORALL(se, entry) {
>          if (se->vmsd && se->vmsd->unmigratable) {
>              error_setg(errp, "State blocked by non-migratable device '%s'",
>                         se->idstr);
> @@ -1145,7 +1164,7 @@ bool qemu_savevm_state_guest_unplug_pending(void)
>  {
>      SaveStateEntry *se;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (se->vmsd && se->vmsd->dev_unplug_pending &&
>              se->vmsd->dev_unplug_pending(se->opaque)) {
>              return true;
> @@ -1162,7 +1181,7 @@ void qemu_savevm_state_setup(QEMUFile *f)
>      int ret;
>  
>      trace_savevm_state_setup();
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (!se->ops || !se->ops->save_setup) {
>              continue;
>          }
> @@ -1193,7 +1212,7 @@ int qemu_savevm_state_resume_prepare(MigrationState *s)
>  
>      trace_savevm_state_resume_prepare();
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (!se->ops || !se->ops->resume_prepare) {
>              continue;
>          }
> @@ -1223,7 +1242,7 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
>      int ret = 1;
>  
>      trace_savevm_state_iterate();
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (!se->ops || !se->ops->save_live_iterate) {
>              continue;
>          }
> @@ -1291,7 +1310,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>      SaveStateEntry *se;
>      int ret;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (!se->ops || !se->ops->save_live_complete_postcopy) {
>              continue;
>          }
> @@ -1324,7 +1343,7 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>      SaveStateEntry *se;
>      int ret;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (!se->ops ||
>              (in_postcopy && se->ops->has_postcopy &&
>               se->ops->has_postcopy(se->opaque)) ||
> @@ -1366,7 +1385,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>      vmdesc = qjson_new();
>      json_prop_int(vmdesc, "page_size", qemu_target_page_size());
>      json_start_array(vmdesc, "devices");
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>  
>          if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
>              continue;
> @@ -1476,7 +1495,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
>      *res_postcopy_only = 0;
>  
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (!se->ops || !se->ops->save_live_pending) {
>              continue;
>          }
> @@ -1501,7 +1520,7 @@ void qemu_savevm_state_cleanup(void)
>      }
>  
>      trace_savevm_state_cleanup();
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (se->ops && se->ops->save_cleanup) {
>              se->ops->save_cleanup(se->opaque);
>          }
> @@ -1580,7 +1599,7 @@ int qemu_save_device_state(QEMUFile *f)
>      }
>      cpu_synchronize_all_states();
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          int ret;
>  
>          if (se->is_ram) {
> @@ -1612,7 +1631,7 @@ static SaveStateEntry *find_se(const char *idstr, uint32_t instance_id)
>  {
>      SaveStateEntry *se;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FORALL(se, entry) {
>          if (!strcmp(se->idstr, idstr) &&
>              (instance_id == se->instance_id ||
>               instance_id == se->alias_id))
> @@ -2334,7 +2353,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
>      }
>  
>      trace_qemu_loadvm_state_section_partend(section_id);
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (se->load_section_id == section_id) {
>              break;
>          }
> @@ -2400,7 +2419,7 @@ static int qemu_loadvm_state_setup(QEMUFile *f)
>      int ret;
>  
>      trace_loadvm_state_setup();
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (!se->ops || !se->ops->load_setup) {
>              continue;
>          }
> @@ -2425,7 +2444,7 @@ void qemu_loadvm_state_cleanup(void)
>      SaveStateEntry *se;
>  
>      trace_loadvm_state_cleanup();
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +    SAVEVM_FOREACH(se, entry) {
>          if (se->ops && se->ops->load_cleanup) {
>              se->ops->load_cleanup(se->opaque);
>          }
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


