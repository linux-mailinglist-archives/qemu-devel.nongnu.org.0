Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C13D0C8F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:50:00 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69nb-0005Im-VC
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m69SE-0008Ru-Eu
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m69SA-0007n6-PP
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626863269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7TiYGdZN0KuiKydvkcwjwTepRs5JIATDP4evOOBaE2k=;
 b=MAGj6kYrLbWcIjyDY8YtFmHktSwlSVtqEjBWgVa30xkwBlP/4TIuyiTBVpyMDW+MtDl2cQ
 nqlpW0eeEl17DStD2l+CJsXk0sstQILB7846QPSXNdM7TAWXvQVMKu8E2POh/OpeAZQnl2
 dMvc3+I1G9MaqCLbnMRC7irm7Mfho5k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-Or-ZN2VDMlSL5p_SGl8kZw-1; Wed, 21 Jul 2021 06:27:48 -0400
X-MC-Unique: Or-ZN2VDMlSL5p_SGl8kZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o21-20020a05600c4fd5b029023448cbd285so415174wmq.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7TiYGdZN0KuiKydvkcwjwTepRs5JIATDP4evOOBaE2k=;
 b=aHTQXHEnU1VMzep/+jyRXwXXpVfrnrpr7kOyaA0gPH88Uye64Jsf2adlcJDLdKqLCT
 hU/rxv07KVeT2J2dJWYT+qKJM91dTv+r+xio/D9wlp5X5sRaiNPnnnmc7UP9tThe3z05
 eo9hLGESHiAzgaN9cxGyL6ncN56ThlgRyVaXqQVEVAcsL2Jxu0QPVbm7y2TZL4tTlNoB
 GJ57ZCZxruASZ4zP7jBv0QEbKZDrh9kzzdo8qiooHBTZc3R/6HmfD5R018DaPocwH21y
 Up9ZENbf19mOpRiSlmt8rannQd39THGN8Jj1udF30j2RnXim/FLZnihvV+yu4glYrwo+
 kwNQ==
X-Gm-Message-State: AOAM531csdaRNGo2Afk4EVdtMxo+aojQR4ILj/lrrnAkDmm+aNvF6tO/
 cBSuDGz659fQWel6pO4GZtle4jzeIcBemtWRH9SNOIYC56imooIsMYKpLqVNxJjLPqZ1J5FMyLF
 olrpS7n1OWRBeXVA=
X-Received: by 2002:adf:fd11:: with SMTP id e17mr42211097wrr.309.1626863266846; 
 Wed, 21 Jul 2021 03:27:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcbdYC+AWoFQCdUveqs6LEao2D5/oOJcWsdecp6lSt0QJVjpBu3/mZAcigX/RbFWlDBAXwgg==
X-Received: by 2002:adf:fd11:: with SMTP id e17mr42211075wrr.309.1626863266631; 
 Wed, 21 Jul 2021 03:27:46 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id m187sm26742827wmm.16.2021.07.21.03.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:27:46 -0700 (PDT)
Date: Wed, 21 Jul 2021 11:27:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/5] migration: Teach QEMUFile to be QIOChannel-aware
Message-ID: <YPf2oCUmObpCkMeG@work-vm>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-5-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721012134.792845-5-peterx@redhat.com>
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
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
> No functional change.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

This is messy but I can't see another quick way; the better way would be
to add an OBJECT or QIOCHannel wrapper for BlockDriverState.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file-channel.c | 4 ++--
>  migration/qemu-file.c         | 5 ++++-
>  migration/qemu-file.h         | 2 +-
>  migration/ram.c               | 2 +-
>  migration/savevm.c            | 4 ++--
>  5 files changed, 10 insertions(+), 7 deletions(-)
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
> index 1eacf9e831..ada58c94dd 100644
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
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index a9b6d6ccb7..80d0e79fd1 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -119,7 +119,7 @@ typedef struct QEMUFileHooks {
>      QEMURamSaveFunc *save_page;
>  } QEMUFileHooks;
>  
> -QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops);
> +QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
>  void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
>  int qemu_get_fd(QEMUFile *f);
>  int qemu_fclose(QEMUFile *f);
> diff --git a/migration/ram.c b/migration/ram.c
> index b5fc454b2f..f2a86f9971 100644
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


