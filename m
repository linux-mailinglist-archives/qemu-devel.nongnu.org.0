Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD115451C0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:21:26 +0200 (CEST)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKuT-0007Fy-Id
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzJfh-0006FR-LX
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:02:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzJfU-0003lq-VR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654786912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LoSyIhi3czeJi92slLjL1ZGFG41rMVOXzulHRDdLkA=;
 b=gOPHb/E0JApm0o/qu0oqJya1WXsEw0q2zUV5T3Ajs/TUzhfdGb5UaTLho0Gx7UikaQoNkA
 iHd4CCXzmNcoHONBJ/HTVUTtKsMdOGUFJnXhymLxgDlwO0fp8RLUMEaPRZ3krYAPAzu1yi
 nmvJwklhvX0vOb6WV3IdygouvA6DK9Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-euaK5pM4Nqu6DI5UbSzWug-1; Thu, 09 Jun 2022 11:01:50 -0400
X-MC-Unique: euaK5pM4Nqu6DI5UbSzWug-1
Received: by mail-wm1-f69.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so11442514wms.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=1LoSyIhi3czeJi92slLjL1ZGFG41rMVOXzulHRDdLkA=;
 b=aUSO0qC4/rRIXUdt3Lzj7yBwmuREk9iMP0++QL+GOUOKoXn/D71w63nZBqsl4QIwmp
 l2mLBjUylLO7XGGnpRbHrf9zCxSo8xvDL2WRAjuBNZ5Z/UYMecgtGVMxXXUby/PjS50L
 0wdXTywySkNEmDGHQ57lcXENbb9DJSaojoKXYhVqsQ4USpsaFqAxZe7ZXuG8vqEIGp6r
 hYuJu1ilWFy79R9NR+XC9YTtxZ7wsWnfsDXqaSITgd0oVxPLLVs+Tebx06EfSv6SCp+X
 s+fJPsHr4AqJqnGL9mgnrURbkaKhMmJPwKbVlx0e0RRoRjjpjrnDn6tANgbTxoPTmy+Z
 JK2w==
X-Gm-Message-State: AOAM531BrL/3iVp5rZHiPp8WgmaHfkvRewgzHJEc0LesRuJ5j79rAC20
 +enbaoxoOqWFGrD5Ja0W1wXX5pkmxac53Jqp650SglIPhhmVQzdj2RArA+7QldGaVG+hEApUfBF
 3Qxemq+C61476vyM=
X-Received: by 2002:a5d:4302:0:b0:210:824:48ee with SMTP id
 h2-20020a5d4302000000b00210082448eemr38832839wrq.471.1654786909289; 
 Thu, 09 Jun 2022 08:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm3pUMbW+OKNyGf+eaMR937Ad/4Kg635w1twT5bsuh/S4/qNZCICnS3dydgTPZg10cKwol/A==
X-Received: by 2002:a5d:4302:0:b0:210:824:48ee with SMTP id
 h2-20020a5d4302000000b00210082448eemr38832801wrq.471.1654786908976; 
 Thu, 09 Jun 2022 08:01:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b0020e5b4ebaecsm24877516wrs.4.2022.06.09.08.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:01:48 -0700 (PDT)
Date: Thu, 9 Jun 2022 16:01:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 11/20] migration: hardcode assumption that QEMUFile is
 backed with QIOChannel
Message-ID: <YqILWrfAPkfr2VuZ@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-12-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-12-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The only callers of qemu_fopen_ops pass 'true' for the 'has_ioc'
> parameter, so hardcode this assumption in QEMUFile, by passing in
> the QIOChannel object as a non-opaque parameter.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file-channel.c |  4 ++--
>  migration/qemu-file.c         | 35 +++++++++++++++++------------------
>  migration/qemu-file.h         |  2 +-
>  3 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index bb5a5752df..ce8eced417 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -184,11 +184,11 @@ static const QEMUFileOps channel_output_ops = {
>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
>  {
>      object_ref(OBJECT(ioc));
> -    return qemu_fopen_ops(ioc, &channel_input_ops, true);
> +    return qemu_fopen_ops(ioc, &channel_input_ops);
>  }
>  
>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>  {
>      object_ref(OBJECT(ioc));
> -    return qemu_fopen_ops(ioc, &channel_output_ops, true);
> +    return qemu_fopen_ops(ioc, &channel_output_ops);
>  }
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 6badc8b0ec..ea1e8da0cb 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -37,7 +37,7 @@
>  struct QEMUFile {
>      const QEMUFileOps *ops;
>      const QEMUFileHooks *hooks;
> -    void *opaque;
> +    QIOChannel *ioc;
>  
>      /*
>       * Maximum amount of data in bytes to transfer during one
> @@ -65,8 +65,6 @@ struct QEMUFile {
>      Error *last_error_obj;
>      /* has the file has been shutdown */
>      bool shutdown;
> -    /* Whether opaque points to a QIOChannel */
> -    bool has_ioc;
>  };
>  
>  /*
> @@ -81,7 +79,7 @@ int qemu_file_shutdown(QEMUFile *f)
>      if (!f->ops->shut_down) {
>          return -ENOSYS;
>      }
> -    ret = f->ops->shut_down(f->opaque, true, true, NULL);
> +    ret = f->ops->shut_down(f->ioc, true, true, NULL);
>  
>      if (!f->last_error) {
>          qemu_file_set_error(f, -EIO);
> @@ -98,7 +96,7 @@ QEMUFile *qemu_file_get_return_path(QEMUFile *f)
>      if (!f->ops->get_return_path) {
>          return NULL;
>      }
> -    return f->ops->get_return_path(f->opaque);
> +    return f->ops->get_return_path(f->ioc);
>  }
>  
>  bool qemu_file_mode_is_not_valid(const char *mode)
> @@ -113,15 +111,15 @@ bool qemu_file_mode_is_not_valid(const char *mode)
>      return false;
>  }
>  
> -QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc)
> +QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops)
>  {
>      QEMUFile *f;
>  
>      f = g_new0(QEMUFile, 1);
>  
> -    f->opaque = opaque;
> +    f->ioc = ioc;
>      f->ops = ops;
> -    f->has_ioc = has_ioc;
> +
>      return f;
>  }
>  
> @@ -242,7 +240,7 @@ void qemu_fflush(QEMUFile *f)
>      }
>      if (f->iovcnt > 0) {
>          expect = iov_size(f->iov, f->iovcnt);
> -        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->total_transferred,
> +        ret = f->ops->writev_buffer(f->ioc, f->iov, f->iovcnt, f->total_transferred,
>                                      &local_error);
>  
>          qemu_iovec_release_ram(f);
> @@ -358,7 +356,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>          return 0;
>      }
>  
> -    len = f->ops->get_buffer(f->opaque, f->buf + pending, f->total_transferred,
> +    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
>                               IO_BUF_SIZE - pending, &local_error);
>      if (len > 0) {
>          f->buf_size += len;
> @@ -394,7 +392,7 @@ int qemu_fclose(QEMUFile *f)
>      ret = qemu_file_get_error(f);
>  
>      if (f->ops->close) {
> -        int ret2 = f->ops->close(f->opaque, NULL);
> +        int ret2 = f->ops->close(f->ioc, NULL);
>          if (ret >= 0) {
>              ret = ret2;
>          }
> @@ -861,18 +859,19 @@ void qemu_put_counted_string(QEMUFile *f, const char *str)
>  void qemu_file_set_blocking(QEMUFile *f, bool block)
>  {
>      if (f->ops->set_blocking) {
> -        f->ops->set_blocking(f->opaque, block, NULL);
> +        f->ops->set_blocking(f->ioc, block, NULL);
>      }
>  }
>  
>  /*
> - * Return the ioc object if it's a migration channel.  Note: it can return NULL
> - * for callers passing in a non-migration qemufile.  E.g. see qemu_fopen_bdrv()
> - * and its usage in e.g. load_snapshot().  So we need to check against NULL
> - * before using it.  If without the check, migration_incoming_state_destroy()
> - * could fail for load_snapshot().
> + * qemu_file_get_ioc:
> + *
> + * Get the ioc object for the file, without incrementing
> + * the reference count.
> + *
> + * Returns: the ioc object
>   */
>  QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>  {
> -    return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
> +    return file->ioc;
>  }
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 6310071f90..0458b1d3b6 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -118,7 +118,7 @@ typedef struct QEMUFileHooks {
>      QEMURamSaveFunc *save_page;
>  } QEMUFileHooks;
>  
> -QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
> +QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops);
>  void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
>  int qemu_get_fd(QEMUFile *f);
>  int qemu_fclose(QEMUFile *f);
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


