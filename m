Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C227545365
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:51:10 +0200 (CEST)
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMJJ-0002DI-4e
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLCg-0005L6-KG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzLCc-0005Ko-G9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654792809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WsHSdgad0YC4ns88sP949P2dFzciltYzw3CHmxtrto=;
 b=i/tq2/CzjUbbtaEj3xROHGn0kMN8GTP2hu/RfebgPUC9CvOiBdJagStyPDrgHzx0QsChjo
 nrTrW8RihxPve4P3DK03cSBf92IyuX7tqPZlaW2CPr4oAQ4s3IyhgGMDYBbRCUU1QuXsQT
 zCGiyukkzrnfHOEsTIo9oUXyvHZzzoc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-fXGl4dI-PV60Cutr_lJGaA-1; Thu, 09 Jun 2022 12:40:06 -0400
X-MC-Unique: fXGl4dI-PV60Cutr_lJGaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so8166270wmq.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=8WsHSdgad0YC4ns88sP949P2dFzciltYzw3CHmxtrto=;
 b=l48WlcTUFtFVuLr8cqGxxhOtT5mQUz+oayi9LGvSU1EJRAnbdCCMxAlSP366RzJ2ky
 FYSo7v87ZXdG3jS/Oswsna/s44LIqIHryYu5BLr3PeB0dkTt3iaP61gudCopXPVAQNNO
 PJbiPzsQ9zVduo96+4fff6DC+j3jr1sLkQ0R0Gj3OiQcQuSNSxBSInVP9NWoluwFIW3X
 mbgg6u7asT9jqAGhVG0kgCzI8yzW9VVMwvTGbgP9/RsKNTCBIK0nq4H8TNESqi+jpEG8
 quPTkp34OZroHHHySN8kr2zm3UKoSzMsv58nJ1VgyDqs3PHqsNm/pUFdXrOxztzB9NlX
 mfrw==
X-Gm-Message-State: AOAM530vJuPidBEtvbpFb8O/yj2sFjsuBifCYZSG3NYtRHaxEyHr7QZ2
 uOAUPRXUfnYT8xupZ1tcB73Sa1pzdkZIhSFO0h/0PSnze65+YLQ+UWlRqE3tyH9EXgSq9yja3aI
 lxeK95AO0IDRLaXE=
X-Received: by 2002:a05:6000:1683:b0:218:54a2:71cc with SMTP id
 y3-20020a056000168300b0021854a271ccmr13850416wrd.417.1654792805134; 
 Thu, 09 Jun 2022 09:40:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwkXAU/XcFbIovgeJ9C0RMrpzHz/4pkCz5NEIeDHGkf9HQC4fky1BSNrZ/FmtM9aQnN47K+A==
X-Received: by 2002:a05:6000:1683:b0:218:54a2:71cc with SMTP id
 y3-20020a056000168300b0021854a271ccmr13850390wrd.417.1654792804842; 
 Thu, 09 Jun 2022 09:40:04 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bi11-20020a05600c3d8b00b0039c3ecdca66sm20135262wmb.23.2022.06.09.09.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:40:04 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:40:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 16/20] migration: remove the QEMUFileOps 'close' callback
Message-ID: <YqIiYttjlZ9YFk1M@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-17-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-17-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> This directly implements the close logic using QIOChannel APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file-channel.c | 12 ------------
>  migration/qemu-file.c         | 12 ++++++------
>  migration/qemu-file.h         | 10 ----------
>  3 files changed, 6 insertions(+), 28 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 0350d367ec..8ff58e81f9 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -102,16 +102,6 @@ static ssize_t channel_get_buffer(void *opaque,
>  }
>  
>  
> -static int channel_close(void *opaque, Error **errp)
> -{
> -    int ret;
> -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> -    ret = qio_channel_close(ioc, errp);
> -    object_unref(OBJECT(ioc));
> -    return ret;
> -}
> -
> -
>  static QEMUFile *channel_get_input_return_path(void *opaque)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
> @@ -128,14 +118,12 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
>  
>  static const QEMUFileOps channel_input_ops = {
>      .get_buffer = channel_get_buffer,
> -    .close = channel_close,
>      .get_return_path = channel_get_input_return_path,
>  };
>  
>  
>  static const QEMUFileOps channel_output_ops = {
>      .writev_buffer = channel_writev_buffer,
> -    .close = channel_close,
>      .get_return_path = channel_get_output_return_path,
>  };
>  
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 171b9f85bf..a855ce33dc 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -405,16 +405,16 @@ void qemu_file_credit_transfer(QEMUFile *f, size_t size)
>   */
>  int qemu_fclose(QEMUFile *f)
>  {
> -    int ret;
> +    int ret, ret2;
>      qemu_fflush(f);
>      ret = qemu_file_get_error(f);
>  
> -    if (f->ops->close) {
> -        int ret2 = f->ops->close(f->ioc, NULL);
> -        if (ret >= 0) {
> -            ret = ret2;
> -        }
> +    ret2 = qio_channel_close(f->ioc, NULL);
> +    if (ret >= 0) {
> +        ret = ret2;
>      }
> +    g_clear_pointer(&f->ioc, object_unref);
> +
>      /* If any error was spotted before closing, we should report it
>       * instead of the close() return value.
>       */
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 6db4bb9fdb..7ec105bf96 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -37,15 +37,6 @@ typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
>                                          int64_t pos, size_t size,
>                                          Error **errp);
>  
> -/* Close a file
> - *
> - * Return negative error number on error, 0 or positive value on success.
> - *
> - * The meaning of return value on success depends on the specific back-end being
> - * used.
> - */
> -typedef int (QEMUFileCloseFunc)(void *opaque, Error **errp);
> -
>  /*
>   * This function writes an iovec to file. The handler must write all
>   * of the data or return a negative errno value.
> @@ -87,7 +78,6 @@ typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
>  
>  typedef struct QEMUFileOps {
>      QEMUFileGetBufferFunc *get_buffer;
> -    QEMUFileCloseFunc *close;
>      QEMUFileWritevBufferFunc *writev_buffer;
>      QEMURetPathFunc *get_return_path;
>  } QEMUFileOps;
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


