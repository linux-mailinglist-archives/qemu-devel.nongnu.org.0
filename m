Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673FD5452DA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:23:10 +0200 (CEST)
Received: from localhost ([::1]:59506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLsD-00068J-1w
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKv7-00028G-QN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKv5-0002F1-2Y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654791721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDyVL3fXX8s6eguwDGUKJ/pyQ1V2IOfDbxp79WOUO5c=;
 b=O1mvK4nsbK4oshIoQ34jWKfVF+tMpBuumInuvBjZ3x7k7GxlwQJoe3TCXxyz1QIpyli4IZ
 JML8fw5a69tvoNOldpPNbUtvndV+ErLLuodezYxvE+sm2LWCqVyf2ILoKNc8hpkwBIEwHx
 sTp5YnJxHPpNz6ze7Ix9JpJxa5Eiwyo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-YaHxjRtqNbiOADGJckarEw-1; Thu, 09 Jun 2022 12:21:59 -0400
X-MC-Unique: YaHxjRtqNbiOADGJckarEw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b0039c747a1e5aso399657wms.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lDyVL3fXX8s6eguwDGUKJ/pyQ1V2IOfDbxp79WOUO5c=;
 b=MRAAGIq1VWhq84vjp8Xh9ncXmx87LGComEg99JgA/fARKv9ozkv2JhlPxMlLa7oEP1
 4pM/1n7Ldz40Kb4749LUzB7wEVozn9p4rM7nwTTD4ukR+XzKQizQyHg6Jwm6KFVKINo6
 K2gacGiUGmh+mo20fmcoXlEUaXI+aTW0uBszySA11htPGJYafoYO1CJiX52YFVhH1j8w
 xgsy2kchW0RPvIGDM1aSAG2itJYfDWdJUPyMZVTShWqqsnxN6XB6HeUDTp+aVrKNUIAx
 mMq85RwIf8R1SeCK+bVxwn9wdZ2ZWlhy80OgL8nNUj6aw535nRjZ1fEbJvCCZhbRgFOn
 VguQ==
X-Gm-Message-State: AOAM531qUDoO6hLbSuBez05zTypIj4r4juP/OWCw7KlZQrfHC8Wa5Jye
 7Jkf6qSMdb6nFmSsVo22waZrWgWmyAYuDSamgXJfC4f+6fhi5iL4QWnK4rGAH1JUZEpHlmcjCKS
 rEiIl5Zu1tRpsQZ8=
X-Received: by 2002:a05:600c:2653:b0:39c:752b:8c1f with SMTP id
 19-20020a05600c265300b0039c752b8c1fmr1555384wmy.54.1654791718094; 
 Thu, 09 Jun 2022 09:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLDSZCSu8BGVRyLOMO17DeVDem2TIy66pSDVGiX0e4+NFeLmKC3ENb+JuLUeOV1N0ZyW8PsQ==
X-Received: by 2002:a05:600c:2653:b0:39c:752b:8c1f with SMTP id
 19-20020a05600c265300b0039c752b8c1fmr1555364wmy.54.1654791717845; 
 Thu, 09 Jun 2022 09:21:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b00397402ae674sm11094722wmi.11.2022.06.09.09.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:21:57 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:21:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 15/20] migration: remove the QEMUFileOps 'set_blocking'
 callback
Message-ID: <YqIeI0Pe6rLkWSnl@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-16-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-16-berrange@redhat.com>
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
> This directly implements the set_blocking logic using QIOChannel APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file-channel.c | 14 --------------
>  migration/qemu-file.c         |  4 +---
>  migration/qemu-file.h         |  5 -----
>  3 files changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 80f05dc371..0350d367ec 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -112,18 +112,6 @@ static int channel_close(void *opaque, Error **errp)
>  }
>  
>  
> -static int channel_set_blocking(void *opaque,
> -                                bool enabled,
> -                                Error **errp)
> -{
> -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> -
> -    if (qio_channel_set_blocking(ioc, enabled, errp) < 0) {
> -        return -1;
> -    }
> -    return 0;
> -}
> -
>  static QEMUFile *channel_get_input_return_path(void *opaque)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
> @@ -141,7 +129,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
>  static const QEMUFileOps channel_input_ops = {
>      .get_buffer = channel_get_buffer,
>      .close = channel_close,
> -    .set_blocking = channel_set_blocking,
>      .get_return_path = channel_get_input_return_path,
>  };
>  
> @@ -149,7 +136,6 @@ static const QEMUFileOps channel_input_ops = {
>  static const QEMUFileOps channel_output_ops = {
>      .writev_buffer = channel_writev_buffer,
>      .close = channel_close,
> -    .set_blocking = channel_set_blocking,
>      .get_return_path = channel_get_output_return_path,
>  };
>  
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index fd9f060c02..171b9f85bf 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -876,9 +876,7 @@ void qemu_put_counted_string(QEMUFile *f, const char *str)
>   */
>  void qemu_file_set_blocking(QEMUFile *f, bool block)
>  {
> -    if (f->ops->set_blocking) {
> -        f->ops->set_blocking(f->ioc, block, NULL);
> -    }
> +    qio_channel_set_blocking(f->ioc, block, NULL);
>  }
>  
>  /*
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 2049dfe7e4..6db4bb9fdb 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -46,10 +46,6 @@ typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
>   */
>  typedef int (QEMUFileCloseFunc)(void *opaque, Error **errp);
>  
> -/* Called to change the blocking mode of the file
> - */
> -typedef int (QEMUFileSetBlocking)(void *opaque, bool enabled, Error **errp);
> -
>  /*
>   * This function writes an iovec to file. The handler must write all
>   * of the data or return a negative errno value.
> @@ -92,7 +88,6 @@ typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
>  typedef struct QEMUFileOps {
>      QEMUFileGetBufferFunc *get_buffer;
>      QEMUFileCloseFunc *close;
> -    QEMUFileSetBlocking *set_blocking;
>      QEMUFileWritevBufferFunc *writev_buffer;
>      QEMURetPathFunc *get_return_path;
>  } QEMUFileOps;
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


