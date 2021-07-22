Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE03D2698
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:23:23 +0200 (CEST)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aXi-0002lU-Fd
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6aW1-0001nT-3X
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6aVz-0001N2-2A
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626967294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6L1USCVJGC7J1gTr+npEUDHteE5jIXskM56v3WsYMsI=;
 b=IfMgsR3zXDpVxxWBoe59DENvXHQ9WY1kcVssLembQbRNfvzrnMxBrxsmrIIBCqXpYLI9MN
 VjqH6NyqMOrX//FzNCdoQAtet5wR1yrib9VQQcGcEl4vXLhhuQco3BUmDlcDfVl1WfQy0X
 nxjb1oT3tnLkQPoC6thj7QEAMTp2Vqs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-VwOVTNdLPSeNAw0kpqH5dw-1; Thu, 22 Jul 2021 11:21:33 -0400
X-MC-Unique: VwOVTNdLPSeNAw0kpqH5dw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j11-20020a05600c410bb02902278758ab90so816153wmi.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6L1USCVJGC7J1gTr+npEUDHteE5jIXskM56v3WsYMsI=;
 b=BVGFDcyKDZEfRZh0ntqfnpor9ftKYyzVikJq575glas8DBURhqGbc1+Sri7a4nIXfz
 coPWAJFr/JNWbRNIQzsdxBGC45h9pVTUi5MMvDiJWXxT/mxPwGdt4MsLfvs9herBcoFA
 HVooIXtFdsxUcfDc9cCHOY7CN01niXNdIYcCz+sypKMfXWh2evO+RnKKVZWb3cPjx8N9
 hl4ba1+x5ItgO/n2ZOna917bB8nB4lbrGqdOQNNqk/fwnLuChPTsu+HXFgz3AcGaaMaJ
 /0VQWE+ddnqiZpqw7E/6Wa3GErn7hQqWSQeq8yD6elV87AV/YwmXPKeW6G1Ew9OLKwDa
 jC+w==
X-Gm-Message-State: AOAM531GmzimWQf3byMCNPLjTbihZmbuJeaR7xDYgxPx611KtokSEb4R
 wfOxJBztHcdPkC4y7iFzdkSXDOULmhgoHyOAQmTpZPfOdEyQFkJ6ZBrcpUQvIc0jO1NT19S6c0U
 817nQi5jKVweIe2U=
X-Received: by 2002:a7b:c846:: with SMTP id c6mr158834wml.92.1626967291923;
 Thu, 22 Jul 2021 08:21:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT86DV5w46UUAwjKDbQk7orqDNmd0qkSbFHLqEJ1ahYdrxBHCan40z37g6yYUI61dq8a8dRg==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr158815wml.92.1626967291635;
 Thu, 22 Jul 2021 08:21:31 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id n7sm14181135wrw.77.2021.07.22.08.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:21:27 -0700 (PDT)
Date: Thu, 22 Jul 2021 16:21:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 4/5] migration: Teach QEMUFile to be QIOChannel-aware
Message-ID: <YPmM9Z+qjkgFqEQZ@work-vm>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-5-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721193409.910462-5-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> migration uses QIOChannel typed qemufiles.  In follow up patches, we'll need
> the capability to identify this fact, so that we can get the backing QIOChannel
> from a QEMUFile.
> 
> We can also define types for QEMUFile but so far since we only need to be able
> to identify QIOChannel, introduce a boolean which is simpler.
> 
> Introduce another helper qemu_file_get_ioc() to return the ioc backend of a
> qemufile if has_ioc is set.
> 
> No functional change.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yep, one day we'll sort out the block case, but until then

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file-channel.c |  4 ++--
>  migration/qemu-file.c         | 17 ++++++++++++++++-
>  migration/qemu-file.h         |  4 +++-
>  migration/ram.c               |  2 +-
>  migration/savevm.c            |  4 ++--
>  5 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 867a5ed0c3..2f8b1fcd46 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -187,11 +187,11 @@ static const QEMUFileOps channel_output_ops = {
>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
>  {
>      object_ref(OBJECT(ioc));
> -    return qemu_fopen_ops(ioc, &channel_input_ops);
> +    return qemu_fopen_ops(ioc, &channel_input_ops, true);
>  }
>  
>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>  {
>      object_ref(OBJECT(ioc));
> -    return qemu_fopen_ops(ioc, &channel_output_ops);
> +    return qemu_fopen_ops(ioc, &channel_output_ops, true);
>  }
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1eacf9e831..6338d8e2ff 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -55,6 +55,8 @@ struct QEMUFile {
>      Error *last_error_obj;
>      /* has the file has been shutdown */
>      bool shutdown;
> +    /* Whether opaque points to a QIOChannel */
> +    bool has_ioc;
>  };
>  
>  /*
> @@ -101,7 +103,7 @@ bool qemu_file_mode_is_not_valid(const char *mode)
>      return false;
>  }
>  
> -QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
> +QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc)
>  {
>      QEMUFile *f;
>  
> @@ -109,6 +111,7 @@ QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
>  
>      f->opaque = opaque;
>      f->ops = ops;
> +    f->has_ioc = has_ioc;
>      return f;
>  }
>  
> @@ -851,3 +854,15 @@ void qemu_file_set_blocking(QEMUFile *f, bool block)
>          f->ops->set_blocking(f->opaque, block, NULL);
>      }
>  }
> +
> +/*
> + * Return the ioc object if it's a migration channel.  Note: it can return NULL
> + * for callers passing in a non-migration qemufile.  E.g. see qemu_fopen_bdrv()
> + * and its usage in e.g. load_snapshot().  So we need to check against NULL
> + * before using it.  If without the check, migration_incoming_state_destroy()
> + * could fail for load_snapshot().
> + */
> +QIOChannel *qemu_file_get_ioc(QEMUFile *file)
> +{
> +    return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
> +}
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index a9b6d6ccb7..3f36d4dc8c 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -27,6 +27,7 @@
>  
>  #include <zlib.h>
>  #include "exec/cpu-common.h"
> +#include "io/channel.h"
>  
>  /* Read a chunk of data from a file at the given position.  The pos argument
>   * can be ignored if the file is only be used for streaming.  The number of
> @@ -119,7 +120,7 @@ typedef struct QEMUFileHooks {
>      QEMURamSaveFunc *save_page;
>  } QEMUFileHooks;
>  
> -QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops);
> +QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
>  void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
>  int qemu_get_fd(QEMUFile *f);
>  int qemu_fclose(QEMUFile *f);
> @@ -179,5 +180,6 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
>  size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
>                               ram_addr_t offset, size_t size,
>                               uint64_t *bytes_sent);
> +QIOChannel *qemu_file_get_ioc(QEMUFile *file);
>  
>  #endif
> diff --git a/migration/ram.c b/migration/ram.c
> index f728f5072f..08b3cb7a4a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -550,7 +550,7 @@ static int compress_threads_save_setup(void)
>          /* comp_param[i].file is just used as a dummy buffer to save data,
>           * set its ops to empty.
>           */
> -        comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops);
> +        comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops, false);
>          comp_param[i].done = true;
>          comp_param[i].quit = false;
>          qemu_mutex_init(&comp_param[i].mutex);
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 72848b946c..96b5e5d639 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -168,9 +168,9 @@ static const QEMUFileOps bdrv_write_ops = {
>  static QEMUFile *qemu_fopen_bdrv(BlockDriverState *bs, int is_writable)
>  {
>      if (is_writable) {
> -        return qemu_fopen_ops(bs, &bdrv_write_ops);
> +        return qemu_fopen_ops(bs, &bdrv_write_ops, false);
>      }
> -    return qemu_fopen_ops(bs, &bdrv_read_ops);
> +    return qemu_fopen_ops(bs, &bdrv_read_ops, false);
>  }
>  
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


