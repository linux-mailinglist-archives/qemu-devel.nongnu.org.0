Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F3A5452A3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:07:20 +0200 (CEST)
Received: from localhost ([::1]:58628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLct-0002vC-Hr
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKA0-0007tB-SD
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzK9x-0002DN-UK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654788800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHbMCNCH5SzXwuO4U4LH1AUOWeJH8WuvvchHQ+21I1s=;
 b=MoG7aJqYwXAPPh1/ChUR4TIheXxbS5Vn2QZxCz71Ke0QWdaRIbotTj0+4Nf96ZVjm5BwIS
 ZQhS3qm54/KS5tT2ZUj7GTPXykOfNrHow6OOeuGgkeaBLxJ8NpVjdfVFJL4JD2UyskDaPN
 jgXTwtcKHgHUVJtr6Cx9RTn1eGKJVAc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-EntkLUmwMlueDVPoH8F94A-1; Thu, 09 Jun 2022 11:33:19 -0400
X-MC-Unique: EntkLUmwMlueDVPoH8F94A-1
Received: by mail-wr1-f71.google.com with SMTP id
 c16-20020a5d4cd0000000b00213b1d4a96cso5119490wrt.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FHbMCNCH5SzXwuO4U4LH1AUOWeJH8WuvvchHQ+21I1s=;
 b=vQ5uo7J12OS5EOpo3bXq7yaaUF1ijLzmhKCh4f0OKcxc7eGD4ADK3D+0UclPlDNBDz
 yRdprWyD4twn09pC4IMT2lTDvdB5mYlBOawFmYUOFzMQBxrSywfWpT0/kV7Iw0CgCJW+
 x7EWmiL4bRRhJz/a874FPkEzhNnUmCcFO2JT4anTNLFjtfkyKarCDcNBjo9Jqg+KKAHm
 Xp6DwvGBrJo4lTwpev2jbNbJNLu/Fwl9kCxkdzQbRDK92FpqleybEZGBySzLjeN4eOLo
 g4P14pGYMB5O/kZLbnobZ63N1iS5udCeUUCWLV2yr+s4Wem0pnVDXiQbn4WTUsO7RjuK
 jM6g==
X-Gm-Message-State: AOAM530QqLi89Op7aLVLJzYKx6tlAtH7xDEXYnCG7OnHTu+PON/HWZu1
 cSj27gXhG7j3V19tBKfTRiXR85v3/PHoBiuVfTGTor54YfyBtECbDWy1l3RAUU7XLf+Pd1QfIA+
 shIpux3ipQ/7qE94=
X-Received: by 2002:a5d:5142:0:b0:212:af29:530 with SMTP id
 u2-20020a5d5142000000b00212af290530mr39093355wrt.444.1654788798517; 
 Thu, 09 Jun 2022 08:33:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyezLjluDBX0DxVA6ZLL6wsCVkLAzKafW5v4V7xW/vSvwG7skpqsAJzBK9emEguIHm8BFIErA==
X-Received: by 2002:a5d:5142:0:b0:212:af29:530 with SMTP id
 u2-20020a5d5142000000b00212af290530mr39093329wrt.444.1654788798262; 
 Thu, 09 Jun 2022 08:33:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c501400b003971fc23185sm7554690wmr.20.2022.06.09.08.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:33:17 -0700 (PDT)
Date: Thu, 9 Jun 2022 16:33:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 12/20] migration: introduce new constructors for QEMUFile
Message-ID: <YqISuz4WW7jqfoUq@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-13-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-13-berrange@redhat.com>
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
> Prepare for the elimination of QEMUFileOps by introducing a pair of new
> constructors. This lets us distinguish between an input and output file
> object explicitly rather than via the existance of specific callbacks.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file-channel.c |  4 ++--
>  migration/qemu-file.c         | 18 ++++++++++++++++--
>  migration/qemu-file.h         |  3 ++-
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index ce8eced417..5cb8ac93c0 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -184,11 +184,11 @@ static const QEMUFileOps channel_output_ops = {
>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
>  {
>      object_ref(OBJECT(ioc));
> -    return qemu_fopen_ops(ioc, &channel_input_ops);
> +    return qemu_file_new_input(ioc, &channel_input_ops);
>  }
>  
>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>  {
>      object_ref(OBJECT(ioc));
> -    return qemu_fopen_ops(ioc, &channel_output_ops);
> +    return qemu_file_new_output(ioc, &channel_output_ops);
>  }
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index ea1e8da0cb..5548e1abf3 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -38,6 +38,7 @@ struct QEMUFile {
>      const QEMUFileOps *ops;
>      const QEMUFileHooks *hooks;
>      QIOChannel *ioc;
> +    bool is_writable;
>  
>      /*
>       * Maximum amount of data in bytes to transfer during one
> @@ -111,7 +112,9 @@ bool qemu_file_mode_is_not_valid(const char *mode)
>      return false;
>  }
>  
> -QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops)
> +static QEMUFile *qemu_file_new_impl(QIOChannel *ioc,
> +                                    const QEMUFileOps *ops,
> +                                    bool is_writable)
>  {
>      QEMUFile *f;
>  
> @@ -119,10 +122,21 @@ QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops)
>  
>      f->ioc = ioc;
>      f->ops = ops;
> +    f->is_writable = is_writable;
>  
>      return f;
>  }
>  
> +QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops)
> +{
> +    return qemu_file_new_impl(ioc, ops, true);
> +}
> +
> +QEMUFile *qemu_file_new_input(QIOChannel *ioc, const QEMUFileOps *ops)
> +{
> +    return qemu_file_new_impl(ioc, ops, false);
> +}
> +
>  
>  void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks)
>  {
> @@ -181,7 +195,7 @@ void qemu_file_set_error(QEMUFile *f, int ret)
>  
>  bool qemu_file_is_writable(QEMUFile *f)
>  {
> -    return f->ops->writev_buffer;
> +    return f->is_writable;
>  }
>  
>  static void qemu_iovec_release_ram(QEMUFile *f)
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 0458b1d3b6..07c86bfea3 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -118,7 +118,8 @@ typedef struct QEMUFileHooks {
>      QEMURamSaveFunc *save_page;
>  } QEMUFileHooks;
>  
> -QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops);
> +QEMUFile *qemu_file_new_input(QIOChannel *ioc, const QEMUFileOps *ops);
> +QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops);
>  void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
>  int qemu_get_fd(QEMUFile *f);
>  int qemu_fclose(QEMUFile *f);
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


