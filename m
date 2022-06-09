Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEFD545476
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:54:27 +0200 (CEST)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNIY-0002Yz-Fx
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLIt-0007Zs-Ua
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLIq-0006RR-TG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654793196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtfK/j6NAZcePTrfFsCilMYIzm1U70plvu2sQUDgTqk=;
 b=gpWLX616XxKnwLPO7P7gD8xb2KnTBBD+DERiKaGyyLd33C/k6hg0p0hfk2hs7saIHj5l+W
 wOeImauPSO8SjDranEFm28zH33lO0hDN94zhJQhqFegjbU/8wUbyxKtXXIBQU7ESyzrYYB
 QvykdCW/MrjEPRc6Z9dJZttWuRphMuU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-mu_2w8-mNpCZsQ2znn9wbw-1; Thu, 09 Jun 2022 12:46:35 -0400
X-MC-Unique: mu_2w8-mNpCZsQ2znn9wbw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c1c8500b003974c5d636dso11558194wms.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dtfK/j6NAZcePTrfFsCilMYIzm1U70plvu2sQUDgTqk=;
 b=2nmWLIaarCVWq7FA9map1mc+Oype9bsNxIjZftyK/9JPxjK5QmPYEqNPUc4QCqBA/W
 qRY85vVfBJWGb9ZRNp4w7JuVMFcRhTqiuEMZxNIY0bMlSooCp8sGaLZimlC9YotkD4Fz
 w31ZFmCMkS6QbkZaaEvDGXSK09Sto1MtF8xMPMdzVZZs1ggjRu5xmRwVLxUYrvrsTIhz
 eSivn+4tb8Oe0SrQcrldp6enrjBACn9QnyeK8depKp8eE/Kmc7fH82Pai324ruqquIaP
 LNzFVvpdXRjDzzdo316uHS0it7GzovPr8PjFqC76jHoVWds7tFBg59ox2oOxyyxS3smY
 5uQQ==
X-Gm-Message-State: AOAM533j34s7QvM2GgvYLfgrSMmjnHLe4empW8Kv+jYRh6DlPt/cAm/S
 YC5ht6gBfbHWUDDOg3AM17O9jZfGbOiIbDsSGhWUUjkaz1G1zYwvTjRdTz76kbi6TCHCOXc+KvN
 nSb7DIExTYBLmElo=
X-Received: by 2002:a5d:4141:0:b0:210:3de0:359f with SMTP id
 c1-20020a5d4141000000b002103de0359fmr38946420wrq.441.1654793191633; 
 Thu, 09 Jun 2022 09:46:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytXwa1wc+TNlhGb6iuFPkJH77Amue6LK0qsom7YCcjakyDD1wPd9jE0hnyp5tK6x5dxTGzZA==
X-Received: by 2002:a5d:4141:0:b0:210:3de0:359f with SMTP id
 c1-20020a5d4141000000b002103de0359fmr38946399wrq.441.1654793191385; 
 Thu, 09 Jun 2022 09:46:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c378700b0039c6fd3d573sm2127831wmr.47.2022.06.09.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:46:30 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:46:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 17/20] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YqIj5YNn0XZZqyIw@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-18-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-18-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> This directly implements the get_buffer logic using QIOChannel APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/qemu-file-channel.c | 29 -----------------------------
>  migration/qemu-file.c         | 18 ++++++++++++++++--
>  migration/qemu-file.h         |  9 ---------
>  3 files changed, 16 insertions(+), 40 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 8ff58e81f9..7b32831752 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -74,34 +74,6 @@ static ssize_t channel_writev_buffer(void *opaque,
>  }
>  
>  
> -static ssize_t channel_get_buffer(void *opaque,
> -                                  uint8_t *buf,
> -                                  int64_t pos,
> -                                  size_t size,
> -                                  Error **errp)
> -{
> -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> -    ssize_t ret;
> -
> -    do {
> -        ret = qio_channel_read(ioc, (char *)buf, size, errp);
> -        if (ret < 0) {
> -            if (ret == QIO_CHANNEL_ERR_BLOCK) {
> -                if (qemu_in_coroutine()) {
> -                    qio_channel_yield(ioc, G_IO_IN);
> -                } else {
> -                    qio_channel_wait(ioc, G_IO_IN);
> -                }
> -            } else {
> -                return -EIO;
> -            }
> -        }
> -    } while (ret == QIO_CHANNEL_ERR_BLOCK);
> -
> -    return ret;
> -}
> -
> -
>  static QEMUFile *channel_get_input_return_path(void *opaque)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
> @@ -117,7 +89,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
>  }
>  
>  static const QEMUFileOps channel_input_ops = {
> -    .get_buffer = channel_get_buffer,
>      .get_return_path = channel_get_input_return_path,
>  };
>  
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index a855ce33dc..e024b43851 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -374,8 +374,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>          return 0;
>      }
>  
> -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> -                             IO_BUF_SIZE - pending, &local_error);
> +    do {
> +        len = qio_channel_read(f->ioc,

Yes, I think that's OK - not that 'len' is an int where 'ret'
was a ssize_t; but I think our buffers are guranteed to be 'small'.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +                               (char *)f->buf + pending,
> +                               IO_BUF_SIZE - pending,
> +                               &local_error);
> +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(f->ioc, G_IO_IN);
> +            } else {
> +                qio_channel_wait(f->ioc, G_IO_IN);
> +            }
> +        } else if (len < 0) {
> +            len = EIO;
> +        }
> +    } while (len == QIO_CHANNEL_ERR_BLOCK);
> +
>      if (len > 0) {
>          f->buf_size += len;
>          f->total_transferred += len;
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 7ec105bf96..cd49184c00 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -29,14 +29,6 @@
>  #include "exec/cpu-common.h"
>  #include "io/channel.h"
>  
> -/* Read a chunk of data from a file at the given position.  The pos argument
> - * can be ignored if the file is only be used for streaming.  The number of
> - * bytes actually read should be returned.
> - */
> -typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
> -                                        int64_t pos, size_t size,
> -                                        Error **errp);
> -
>  /*
>   * This function writes an iovec to file. The handler must write all
>   * of the data or return a negative errno value.
> @@ -77,7 +69,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
>  typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
>  
>  typedef struct QEMUFileOps {
> -    QEMUFileGetBufferFunc *get_buffer;
>      QEMUFileWritevBufferFunc *writev_buffer;
>      QEMURetPathFunc *get_return_path;
>  } QEMUFileOps;
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


