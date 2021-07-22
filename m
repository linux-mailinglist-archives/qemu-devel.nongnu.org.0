Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D13D26A1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:28:55 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ad4-000529-Bn
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6abz-0004MB-0z
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6abw-0005aC-KU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626967663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o/5IZQzAjmeNzuJuL3L64dEw01Mo9J6kIwdDpgyrotM=;
 b=dQfJlelQCwPyIeWZ1bwjeDHF1OKDYlT5VwtBr46MoTJKT/p+/i8vdG7BwOhIgPAkt/blDV
 cNAhIKZMalLbd3rLpPlT6OrmKfMuoDGW86FxXZAe4OMMYUTpoQUusLdzND2tJDpuZPukhp
 jCLSnN164IFSdlr3H9oZu/j6yiNrnAA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-LVCcWowPMUC-vianVk5gmw-1; Thu, 22 Jul 2021 11:27:42 -0400
X-MC-Unique: LVCcWowPMUC-vianVk5gmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n11-20020a05600c294bb029022095f349f3so1457814wmd.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o/5IZQzAjmeNzuJuL3L64dEw01Mo9J6kIwdDpgyrotM=;
 b=kVu87ApmQZdJgEwiaFGAKZKDnkyTJ9o+zSsGumL077BLKDWiL6IDM/GgYRf0Qv1vjp
 zTX7ur8YfTGUICgWlfAtKGo64EFOTBD/SppAEW/yTcTnTnFM/lJtg4lAjNLsU0DzYvIC
 PkJGIwcHydhc2XBg3CrLiVYl3kuBqwGpv2pb1ZZYiGqNiEKL7EUm8j1vkf9EyenPocpx
 uex7pBrXoeWUQxanKUrGKnAKx+r9PUIf/H9+ZJgrRS6AX21maG1nl+OW4G3Kh+Bhgdau
 L9glVUGzUtKlHeHVfjt0egRsB9N+mRdZS7duHglvZrdY+W2w8ZhLbLaAyp6vyyQTMlMm
 glpg==
X-Gm-Message-State: AOAM530k1tp4+G+lgIP8f7CUdZHixG5og7moRNG6JUcv4jN1jG5nj3k0
 8jXwgwPFThjgVyNELMXm0GgEKPN5GwseKaHKdf+V01eHukY8gGygY4r2bFiPbohvkuL8PXRfBpJ
 38xRY6On4sMYpFyU=
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr156638wmi.49.1626967661189; 
 Thu, 22 Jul 2021 08:27:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvsTnnbqZ+RK5Rir2JqVskzweYtYzfeldZzymBlo8BDOAnDZeTWhxoIvFzmmtAWeyqRjSO8Q==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr156617wmi.49.1626967660907; 
 Thu, 22 Jul 2021 08:27:40 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id z13sm31018555wro.79.2021.07.22.08.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:27:36 -0700 (PDT)
Date: Thu, 22 Jul 2021 16:27:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 5/5] migration: Move the yank unregister of
 channel_close out
Message-ID: <YPmOZ3LGm0u7GoBA@work-vm>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-6-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721193409.910462-6-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> It's efficient, but hackish to call yank unregister calls in channel_close(),
> especially it'll be hard to debug when qemu crashed with some yank function
> leaked.
> 
> Remove that hack, but instead explicitly unregister yank functions at the
> places where needed, they are:
> 
>   (on src)
>   - migrate_fd_cleanup
>   - postcopy_pause
> 
>   (on dst)
>   - migration_incoming_state_destroy
>   - postcopy_pause_incoming
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c         |  5 +++++
>  migration/qemu-file-channel.c |  3 ---
>  migration/savevm.c            |  7 +++++++
>  migration/yank_functions.c    | 14 ++++++++++++++
>  migration/yank_functions.h    |  1 +
>  5 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index fa70400f98..bfeb65b8f7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -59,6 +59,7 @@
>  #include "multifd.h"
>  #include "qemu/yank.h"
>  #include "sysemu/cpus.h"
> +#include "yank_functions.h"
>  
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>  
> @@ -273,6 +274,7 @@ void migration_incoming_state_destroy(void)
>      }
>  
>      if (mis->from_src_file) {
> +        migration_ioc_unregister_yank_from_file(mis->from_src_file);
>          qemu_fclose(mis->from_src_file);
>          mis->from_src_file = NULL;
>      }
> @@ -1811,6 +1813,7 @@ static void migrate_fd_cleanup(MigrationState *s)
>           * Close the file handle without the lock to make sure the
>           * critical section won't block for long.
>           */
> +        migration_ioc_unregister_yank_from_file(tmp);
>          qemu_fclose(tmp);
>      }
>  
> @@ -3352,6 +3355,8 @@ static MigThrError postcopy_pause(MigrationState *s)
>  
>          /* Current channel is possibly broken. Release it. */
>          assert(s->to_dst_file);
> +        /* Unregister yank for current channel */
> +        migration_ioc_unregister_yank_from_file(s->to_dst_file);

Should this go inside the lock?

Dave

>          qemu_mutex_lock(&s->qemu_file_lock);
>          file = s->to_dst_file;
>          s->to_dst_file = NULL;
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 2f8b1fcd46..bb5a5752df 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -107,9 +107,6 @@ static int channel_close(void *opaque, Error **errp)
>      int ret;
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>      ret = qio_channel_close(ioc, errp);
> -    if (OBJECT(ioc)->ref == 1) {
> -        migration_ioc_unregister_yank(ioc);
> -    }
>      object_unref(OBJECT(ioc));
>      return ret;
>  }
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 96b5e5d639..7b7b64bd13 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -65,6 +65,7 @@
>  #include "qemu/bitmap.h"
>  #include "net/announce.h"
>  #include "qemu/yank.h"
> +#include "yank_functions.h"
>  
>  const unsigned int postcopy_ram_discard_version;
>  
> @@ -2568,6 +2569,12 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>      /* Clear the triggered bit to allow one recovery */
>      mis->postcopy_recover_triggered = false;
>  
> +    /*
> +     * Unregister yank with either from/to src would work, since ioc behind it
> +     * is the same
> +     */
> +    migration_ioc_unregister_yank_from_file(mis->from_src_file);
> +
>      assert(mis->from_src_file);
>      qemu_file_shutdown(mis->from_src_file);
>      qemu_fclose(mis->from_src_file);
> diff --git a/migration/yank_functions.c b/migration/yank_functions.c
> index 23697173ae..8c08aef14a 100644
> --- a/migration/yank_functions.c
> +++ b/migration/yank_functions.c
> @@ -14,6 +14,7 @@
>  #include "qemu/yank.h"
>  #include "io/channel-socket.h"
>  #include "io/channel-tls.h"
> +#include "qemu-file.h"
>  
>  void migration_yank_iochannel(void *opaque)
>  {
> @@ -46,3 +47,16 @@ void migration_ioc_unregister_yank(QIOChannel *ioc)
>                                   QIO_CHANNEL(ioc));
>      }
>  }
> +
> +void migration_ioc_unregister_yank_from_file(QEMUFile *file)
> +{
> +    QIOChannel *ioc = qemu_file_get_ioc(file);
> +
> +    if (ioc) {
> +        /*
> +         * For migration qemufiles, we'll always reach here.  Though we'll skip
> +         * calls from e.g. savevm/loadvm as they don't use yank.
> +         */
> +        migration_ioc_unregister_yank(ioc);
> +    }
> +}
> diff --git a/migration/yank_functions.h b/migration/yank_functions.h
> index 74c7f18c91..a7577955ed 100644
> --- a/migration/yank_functions.h
> +++ b/migration/yank_functions.h
> @@ -17,3 +17,4 @@
>  void migration_yank_iochannel(void *opaque);
>  void migration_ioc_register_yank(QIOChannel *ioc);
>  void migration_ioc_unregister_yank(QIOChannel *ioc);
> +void migration_ioc_unregister_yank_from_file(QEMUFile *file);
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


