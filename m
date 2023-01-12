Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB96667CDB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1cF-0001n9-3s; Thu, 12 Jan 2023 12:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG1cB-0001l5-EA
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:43:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG1c9-00033J-Pq
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RkZwghprMB2BGreji/ah+85nLdsJPz6AK3ML33k+Mdw=;
 b=a4L4Nd2BIibShLLnaKzWvMNetAH/rnI3MUw8qROTpyklq9sPaApUuoChqw6n6HQR8//se8
 CPGVggo6ywl5KBqWY5wZT1ERf0Ig840twcFlNvkp7LJXc1FfOIUV7q1ofIOoTV2mf+5D+g
 7ShcrPfhalRzcddqtsFqZydm4vWPaYY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-VNsC5RDaMbSuMG0iFtImqQ-1; Thu, 12 Jan 2023 12:43:43 -0500
X-MC-Unique: VNsC5RDaMbSuMG0iFtImqQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 n13-20020adfc60d000000b0029bdfcf52eeso3663688wrg.8
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RkZwghprMB2BGreji/ah+85nLdsJPz6AK3ML33k+Mdw=;
 b=wvbVYPdtF5T16ddxMciGXWALHcOAF++89cVblPCB4BLP2jlpzz1+1hYGXKxkRvXiY7
 fREMXo/qkpufzJwbEBtWk8TDdtkByrG8MS+7vKX5kRjzq5GSu6zLEijKJr3cdQh9zn/W
 CFMgdBMq5jNtQJ29G8fyT9SUEpUndWdViHddWmyIfPW1ynP9e4MHlUDlqtnC0vHvGO8r
 34AOZ3ShA8tQLUt/IL3wPBwZsFIa23S2HN1vCaO+vJRm8uct5t6GJKK5oDhb8u42KjXp
 RdXoN0LvMlIvO3DebLGojndW+iyxryOfxtl4vpgaomLKikzipR+1x7RLPHLgeyHHneX4
 qh8A==
X-Gm-Message-State: AFqh2kp/izQq+iDxsbrZ/fR0gTEt6QxfJmdmRR/Z/EsHqFTAM/ogCs6D
 0NkdDeq6O3AxbFqyvPrnWU6TvEUosjhyWGpJURs5hlPtBL13EZ230weQ48fepTdtgLEvfVK2/qI
 rQBPd5QeloG4nEoA=
X-Received: by 2002:adf:dd0d:0:b0:2bd:d6bd:57c7 with SMTP id
 a13-20020adfdd0d000000b002bdd6bd57c7mr2124216wrm.12.1673545422552; 
 Thu, 12 Jan 2023 09:43:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuU/HhyZU4QgB0vns0l08HWTNj4pyYZZdUgMCpMGELh5Y4itTmardrXOnn7y6edim6LzGYSKA==
X-Received: by 2002:adf:dd0d:0:b0:2bd:d6bd:57c7 with SMTP id
 a13-20020adfdd0d000000b002bdd6bd57c7mr2124199wrm.12.1673545422297; 
 Thu, 12 Jan 2023 09:43:42 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adf9b01000000b0028e55b44a99sm16808140wrc.17.2023.01.12.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:43:41 -0800 (PST)
Date: Thu, 12 Jan 2023 17:43:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Message-ID: <Y8BGzE/HtpXZJ8Lz@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112164403.105085-3-david@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* David Hildenbrand (david@redhat.com) wrote:
> ... and store it in the migration state. This is a preparation for
> storing selected vmds's already in qemu_savevm_state_setup().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/migration.c |  4 ++++
>  migration/migration.h |  4 ++++
>  migration/savevm.c    | 18 ++++++++++++------
>  3 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 52b5d39244..1d33a7efa0 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
>      s->vm_was_running = false;
>      s->iteration_initial_bytes = 0;
>      s->threshold_size = 0;
> +
> +    json_writer_free(s->vmdesc);
> +    s->vmdesc = NULL;
>  }
>  
>  int migrate_add_blocker_internal(Error *reason, Error **errp)
> @@ -4445,6 +4448,7 @@ static void migration_instance_finalize(Object *obj)
>      qemu_sem_destroy(&ms->rp_state.rp_sem);
>      qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
>      error_free(ms->error);
> +    json_writer_free(ms->vmdesc);

I'm not sure this is happening when you think it is.
I *think* this only happens when qemu quits....

>  }
>  
>  static void migration_instance_init(Object *obj)
> diff --git a/migration/migration.h b/migration/migration.h
> index ae4ffd3454..66511ce532 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -17,6 +17,7 @@
>  #include "exec/cpu-common.h"
>  #include "hw/qdev-core.h"
>  #include "qapi/qapi-types-migration.h"
> +#include "qapi/qmp/json-writer.h"
>  #include "qemu/thread.h"
>  #include "qemu/coroutine_int.h"
>  #include "io/channel.h"
> @@ -366,6 +367,9 @@ struct MigrationState {
>       * This save hostname when out-going migration starts
>       */
>      char *hostname;
> +
> +    /* QEMU_VM_VMDESCRIPTION content filled for all non-iterable devices. */
> +    JSONWriter *vmdesc;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d8830297e4..ff2b8d0064 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -42,7 +42,6 @@
>  #include "postcopy-ram.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-migration.h"
> -#include "qapi/qmp/json-writer.h"
>  #include "qapi/clone-visitor.h"
>  #include "qapi/qapi-builtin-visit.h"
>  #include "qapi/qmp/qerror.h"
> @@ -1189,10 +1188,16 @@ bool qemu_savevm_state_guest_unplug_pending(void)
>  
>  void qemu_savevm_state_setup(QEMUFile *f)
>  {
> +    MigrationState *ms = migrate_get_current();
>      SaveStateEntry *se;
>      Error *local_err = NULL;
>      int ret;
>  
> +    ms->vmdesc = json_writer_new(false);
> +    json_writer_start_object(ms->vmdesc, NULL);
> +    json_writer_int64(ms->vmdesc, "page_size", qemu_target_page_size());
> +    json_writer_start_array(ms->vmdesc, "devices");
> +
>      trace_savevm_state_setup();
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>          if (!se->ops || !se->ops->save_setup) {
> @@ -1390,15 +1395,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>                                                      bool in_postcopy,
>                                                      bool inactivate_disks)
>  {
> -    g_autoptr(JSONWriter) vmdesc = NULL;
> +    MigrationState *ms = migrate_get_current();
> +    JSONWriter *vmdesc = ms->vmdesc;
>      int vmdesc_len;
>      SaveStateEntry *se;
>      int ret;
>  
> -    vmdesc = json_writer_new(false);
> -    json_writer_start_object(vmdesc, NULL);
> -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
> -    json_writer_start_array(vmdesc, "devices");
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>          ret = vmstate_save(f, se, vmdesc);
>          if (ret) {
> @@ -1433,6 +1435,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>          qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
>      }
>  
> +    /* Free it now to detect any inconsistencies. */
> +    json_writer_free(vmdesc);
> +    ms->vmdesc = NULL;

and this only happens when this succesfully exits;  so if this errors
out, and then you retry an outwards migration, I think you've leaked a
writer.

Dave

>      return 0;
>  }
>  
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


