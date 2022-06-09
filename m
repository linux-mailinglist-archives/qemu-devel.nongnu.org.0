Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7454522A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:40:34 +0200 (CEST)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLCz-0003Ex-Ml
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKmN-0005fm-A0
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKmI-0000p2-T6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654791178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lno4hjq4qtgKGSYjUz6KsFGxC1g0FJPRlxrpIyt6ysE=;
 b=ckqAs4L/WqtScii5DOZzqC7U1eyir9NXsa31h66qobZUyjpEEOFcMWQr8TUo7w+kQIHBom
 nxzQeBc/2E4elBB41p0PLGJfqHko8CltGTtrrgqjwe9S37Zzonhp0YiXHKtznJIGvGFRd4
 73ZDIUreESYi3oFG88TThWaC6wbIXiM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-uod9iP0rPEGBo5EtgbMIvw-1; Thu, 09 Jun 2022 12:12:54 -0400
X-MC-Unique: uod9iP0rPEGBo5EtgbMIvw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c16-20020a5d4cd0000000b00213b1d4a96cso5157415wrt.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lno4hjq4qtgKGSYjUz6KsFGxC1g0FJPRlxrpIyt6ysE=;
 b=LtrCwabArFyyx1VEDYKn0kMfj1dQl0rNiC1L6ojgpIx0WTNEB+yUSSOI8Lt7Zwc0Yb
 1tsUS5Eo00U/NeTgJOTmJh4R+F6SoMyqvJvQPE9MPkGb1hB9kh/4bbJtm/G3Bu+UDmfZ
 S8gMFdwzK4NJj6Gtm6DCWHMTjEW4zTeGzzbCbWdTECPC4qq7s/VHg3Fo9ilJA7Jgv4QH
 2PQUFrVZs2D1LJh3/9ctHzKkJQfkZadNTRIvryKGWkwfjY26D36P6/a/2ZEkDkmLkpa5
 Rw0y94VzAHiHL7R+JXrhL4Gr3Kc9/6Vn3jOABl7cwBAvPsNkNN6oy2bfR4KXVbuQb6fP
 L4ig==
X-Gm-Message-State: AOAM5313SfP6qzFPZF8rhWL4SVPlH+U1QO/sxdC7eesF4OSv718rGHd2
 MbOFsk+8Io7BGN6AN5d2dDICycEVJ44hDf1P4uSFzSsNjyGA6B20EpLJx9Tmg5BBYFXxJgh0cLL
 GtnUBoSP08GmzDlg=
X-Received: by 2002:adf:ff8f:0:b0:213:be00:ac2 with SMTP id
 j15-20020adfff8f000000b00213be000ac2mr32455543wrr.52.1654791164388; 
 Thu, 09 Jun 2022 09:12:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAh5dWXZ4iwq/nlacx8X18v3V56eMe87Z3USSnF4ZsS4RYPMAw1E+qenC08IejKaEPh4dPCw==
X-Received: by 2002:adf:ff8f:0:b0:213:be00:ac2 with SMTP id
 j15-20020adfff8f000000b00213be000ac2mr32455518wrr.52.1654791164086; 
 Thu, 09 Jun 2022 09:12:44 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c1c8300b0039c5fb1f592sm8179027wms.14.2022.06.09.09.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:12:43 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:12:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 14/20] migration: remove the QEMUFileOps 'shut_down'
 callback
Message-ID: <YqIb+S+UlgJMXkSa@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-15-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-15-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> This directly implements the shutdown logic using QIOChannel APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/qemu-file-channel.c | 27 ---------------------------
>  migration/qemu-file.c         | 10 +++++++---
>  migration/qemu-file.h         | 10 ----------
>  3 files changed, 7 insertions(+), 40 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 5cb8ac93c0..80f05dc371 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -112,31 +112,6 @@ static int channel_close(void *opaque, Error **errp)
>  }
>  
>  
> -static int channel_shutdown(void *opaque,
> -                            bool rd,
> -                            bool wr,
> -                            Error **errp)
> -{
> -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> -
> -    if (qio_channel_has_feature(ioc,
> -                                QIO_CHANNEL_FEATURE_SHUTDOWN)) {
> -        QIOChannelShutdown mode;
> -        if (rd && wr) {
> -            mode = QIO_CHANNEL_SHUTDOWN_BOTH;
> -        } else if (rd) {
> -            mode = QIO_CHANNEL_SHUTDOWN_READ;
> -        } else {
> -            mode = QIO_CHANNEL_SHUTDOWN_WRITE;
> -        }
> -        if (qio_channel_shutdown(ioc, mode, errp) < 0) {
> -            return -EIO;
> -        }
> -    }
> -    return 0;
> -}
> -
> -
>  static int channel_set_blocking(void *opaque,
>                                  bool enabled,
>                                  Error **errp)
> @@ -166,7 +141,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
>  static const QEMUFileOps channel_input_ops = {
>      .get_buffer = channel_get_buffer,
>      .close = channel_close,
> -    .shut_down = channel_shutdown,
>      .set_blocking = channel_set_blocking,
>      .get_return_path = channel_get_input_return_path,
>  };
> @@ -175,7 +149,6 @@ static const QEMUFileOps channel_input_ops = {
>  static const QEMUFileOps channel_output_ops = {
>      .writev_buffer = channel_writev_buffer,
>      .close = channel_close,
> -    .shut_down = channel_shutdown,
>      .set_blocking = channel_set_blocking,
>      .get_return_path = channel_get_output_return_path,
>  };
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 5548e1abf3..fd9f060c02 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -74,13 +74,17 @@ struct QEMUFile {
>   */
>  int qemu_file_shutdown(QEMUFile *f)
>  {
> -    int ret;
> +    int ret = 0;
>  
>      f->shutdown = true;
> -    if (!f->ops->shut_down) {
> +    if (!qio_channel_has_feature(f->ioc,
> +                                 QIO_CHANNEL_FEATURE_SHUTDOWN)) {
>          return -ENOSYS;
>      }
> -    ret = f->ops->shut_down(f->ioc, true, true, NULL);
> +
> +    if (qio_channel_shutdown(f->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL) < 0) {
> +        ret = -EIO;
> +    }

OK, so this is following the code you're flattening; so:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

 I wonder if there's any reason it doesn't just pass the return value through to ret rather
than flattening it to -EIO?


>      if (!f->last_error) {
>          qemu_file_set_error(f, -EIO);
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 674c2c409b..2049dfe7e4 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -89,22 +89,12 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
>   */
>  typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
>  
> -/*
> - * Stop any read or write (depending on flags) on the underlying
> - * transport on the QEMUFile.
> - * Existing blocking reads/writes must be woken
> - * Returns 0 on success, -err on error
> - */
> -typedef int (QEMUFileShutdownFunc)(void *opaque, bool rd, bool wr,
> -                                   Error **errp);
> -
>  typedef struct QEMUFileOps {
>      QEMUFileGetBufferFunc *get_buffer;
>      QEMUFileCloseFunc *close;
>      QEMUFileSetBlocking *set_blocking;
>      QEMUFileWritevBufferFunc *writev_buffer;
>      QEMURetPathFunc *get_return_path;
> -    QEMUFileShutdownFunc *shut_down;
>  } QEMUFileOps;
>  
>  typedef struct QEMUFileHooks {
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


