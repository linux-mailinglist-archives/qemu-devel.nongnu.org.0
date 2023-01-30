Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C66804FE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:29:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLmv-0004zE-Jh; Sun, 29 Jan 2023 23:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLmq-0004z4-1C
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:28:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLmo-0003VV-AK
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052933;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KhjXT6BQHgtsGNWDABLuD2cchnCnE8hoJ8rAvkgQVZo=;
 b=Utp2TMkji5H/l78Zj+AIl8/JhomqwSKytJ1diV3LJ7IGtm94h6sD1OjYWw2kEyzPq4z/oS
 R5ta/xrrL5iXje2B8amOs43fdHjm3M3CrHA7CF5wpiRYhmk39bjPLJvqgnn73vCwoUe/Ae
 GlWpVwz6Zvmb17Xl/Yw6buCGPItYBRw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-au9YbPltNcK53OhT5yKhEg-1; Sun, 29 Jan 2023 23:28:52 -0500
X-MC-Unique: au9YbPltNcK53OhT5yKhEg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso1433818wms.7
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhjXT6BQHgtsGNWDABLuD2cchnCnE8hoJ8rAvkgQVZo=;
 b=UEoiZ3juwsDYzBg2BOfgute/h+uhukwD/M+Jy4GVRQI434jNMb0G80GYSKLrM/RTf8
 9O83gizZ6YsxLljZwJi64nwcobSJk7Sa07gsyeawwaZ/53YdWUGpW5vN+tGiGWIQg8xR
 qqU11r7ygd0P5f+0+/jITsSeQNGlHRZh7nTTmX2ipen7BJPSFhmWLtbQdrpHuXNAtGft
 nwZju7IFjsddKvpUTx1m6oN0UGQ3KWIlu9w9FSo9Y+uOK7xP0GL6wDK8iZluKtm+ZEm/
 7jCSrrcYeBEucHPfWxTSkIijYIPcKT95iK/7f26YPZklv2vbtlIgOGGY7gSd0KUfyQgn
 YNaA==
X-Gm-Message-State: AO0yUKXiEix/GT2yr6ODW9M4LiowSJz5hZAHxfezxqKtIqT3sPqxniR/
 kOMoek5ouF+rdo+jmTGcZahcx9uvSXDRHIuwUyqox4Ij08yykMPqSQOZFa6n6wXzRY5cSlbknNw
 dRoa4I4peBrg/hjc=
X-Received: by 2002:a05:6000:5:b0:2bf:ae2f:c6ff with SMTP id
 h5-20020a056000000500b002bfae2fc6ffmr18016335wrx.31.1675052931212; 
 Sun, 29 Jan 2023 20:28:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+8Vjs4OTvIEe1eC6PvzOmpjFGWK+09JnPVg6raQgtwFvbQjdyVLENcNr8y944JrHf+/N2elA==
X-Received: by 2002:a05:6000:5:b0:2bf:ae2f:c6ff with SMTP id
 h5-20020a056000000500b002bfae2fc6ffmr18016323wrx.31.1675052930984; 
 Sun, 29 Jan 2023 20:28:50 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 i6-20020adff306000000b002425be3c9e2sm10686780wro.60.2023.01.29.20.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:28:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH 3/3] migration: save/delete migration thread info
In-Reply-To: <20230120084735.825054-4-jiangjiacheng@huawei.com> (Jiang
 Jiacheng's message of "Fri, 20 Jan 2023 16:47:35 +0800")
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-4-jiangjiacheng@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:28:49 +0100
Message-ID: <87k014odby.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> To support query migration thread infomation, save and delete
> thread information at thread creation and end.
>
> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>

Don't disagree with this, but if we create this on the sending side, why
this is not needed for the multifd_recv_threads?

Later, Juan.

> ---
>  migration/migration.c | 4 ++++
>  migration/multifd.c   | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index b4ce458bb9..957205e693 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -57,6 +57,7 @@
>  #include "net/announce.h"
>  #include "qemu/queue.h"
>  #include "multifd.h"
> +#include "threadinfo.h"
>  #include "qemu/yank.h"
>  #include "sysemu/cpus.h"
>  #include "yank_functions.h"
> @@ -3951,10 +3952,12 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>  static void *migration_thread(void *opaque)
>  {
>      MigrationState *s = opaque;
> +    MigrationThread *thread = NULL;
>      int64_t setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
>      MigThrError thr_error;
>      bool urgent = false;
>  
> +    thread = MigrationThreadAdd("live_migration", qemu_get_thread_id());
>      /* report migration thread name to libvirt */
>      qapi_event_send_migration_name("live_migration");
>  
> @@ -4034,6 +4037,7 @@ static void *migration_thread(void *opaque)
>      migration_iteration_finish(s);
>      object_unref(OBJECT(s));
>      rcu_unregister_thread();
> +    MigrationThreadDel(thread);
>      return NULL;
>  }


>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 6e834c7111..fca06284de 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -25,6 +25,7 @@
>  #include "qemu-file.h"
>  #include "trace.h"
>  #include "multifd.h"
> +#include "threadinfo.h"
>  #include "qemu/yank.h"
>  #include "io/channel-socket.h"
>  #include "yank_functions.h"
> @@ -646,10 +647,12 @@ int multifd_send_sync_main(QEMUFile *f)
>  static void *multifd_send_thread(void *opaque)
>  {
>      MultiFDSendParams *p = opaque;
> +    MigrationThread *thread = NULL;
>      Error *local_err = NULL;
>      int ret = 0;
>      bool use_zero_copy_send = migrate_use_zero_copy_send();
>  
> +    thread = MigrationThreadAdd(p->name, qemu_get_thread_id());
>      /* report multifd thread name to libvirt */
>      qapi_event_send_migration_name(p->name);
>  
> @@ -762,6 +765,7 @@ out:
>      qemu_mutex_unlock(&p->mutex);
>  
>      rcu_unregister_thread();
> +    MigrationThreadDel(thread);
>      trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
>  
>      return NULL;


