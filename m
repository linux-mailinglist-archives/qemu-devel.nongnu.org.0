Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5555B970
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 14:07:07 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nWE-0007aN-54
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 08:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o5nU7-0006bl-El
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 08:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o5nU3-0008TX-Pc
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 08:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656331490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtAqLXv5Hqs5D3sGfiJXoSL5x7P2cwpXTB1KoYyjqHs=;
 b=ex7jhPAOBvXET9x+dyQq/8YFM61Y3VfKKqRUXeoNVF98LXZg6QBEAJYj1I9Q4qdKOUKifW
 50vxBa2EZVjd3mtroaYcf3liZTuOGHPJDigYET6/fwkE1FGo4KCjL5owMVNLmJxL+mKpgK
 rdBgJowqxJmC/+WAmBUBSNVwlkzQaks=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-ncZpA1YAMAqZ4NCkI--ZjA-1; Mon, 27 Jun 2022 08:04:49 -0400
X-MC-Unique: ncZpA1YAMAqZ4NCkI--ZjA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q6-20020adfea06000000b0021bad47edaeso1145762wrm.20
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 05:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gtAqLXv5Hqs5D3sGfiJXoSL5x7P2cwpXTB1KoYyjqHs=;
 b=1CX3B2XVKHHGEpXFgN0EZv7WnEEwtKINJb+tz/GGiIZ9uQjQyqi+626XVyPpQDURBm
 AiAJVk3t4XPLHLQ+qz9/qu8mBFFxPpcttosHc5LI7kY/620KAmkSRPWpSj4zOtQawgDz
 WE/DYb2LkvNe9dlAzNYzp24cAvUiTtJLOsJUcwic8LqZr2YevOO5IJeC7eoJvQd5tRXo
 Wa+kTbTEjNB/Cy5fSx4wZuCiIELk5e4Q7Z4gdEfXrIO+SloI/LSAO3XJNpsxirkOoLqg
 Z/fSOK5Y3qOFXh/3iu1VByLDx+QiPOsruPmEABjShCmc0cu8DAd1XrYDWV5+Q5UuZa2I
 NIMQ==
X-Gm-Message-State: AJIora8FevzjU0JqkrGCwc//BhVGz1GdPYUjNOED+dh6QVYrp/I9NsHE
 cTa8QVzrfFHZqWlmIBAXuGJ7nLRvwtNB5yEh7n/ZfcjLlj4qXsQahmcNuFvF+0wnUA4KNZFs7uh
 B5W6Wnc/jBBp1xGg=
X-Received: by 2002:a05:6000:38f:b0:21b:aded:e791 with SMTP id
 u15-20020a056000038f00b0021badede791mr11669357wrf.225.1656331488375; 
 Mon, 27 Jun 2022 05:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vclRS4yKOYbXow/9LJ88+ey17viP15qqcekEDNpq5twi0TnNAbvRSXkzZecXc819MrM+p/8g==
X-Received: by 2002:a05:6000:38f:b0:21b:aded:e791 with SMTP id
 u15-20020a056000038f00b0021badede791mr11669321wrf.225.1656331488016; 
 Mon, 27 Jun 2022 05:04:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b0021ba3d1f2a0sm10163198wrn.48.2022.06.27.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 05:04:47 -0700 (PDT)
Date: Mon, 27 Jun 2022 13:04:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 18/21] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <Yrmc3Tvj7GAwKYaf@work-vm>
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-19-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620110205.1357829-19-berrange@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
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
> This directly implements the get_buffer logic using QIOChannel APIs.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Coverity is pointing out a fun deadcode path from this:

> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 5eb8cf0e28..df438724cd 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>          return 0;
>      }
>  
> -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> -                             IO_BUF_SIZE - pending, &local_error);
> +    do {
> +        len = qio_channel_read(f->ioc,
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

the next code is:
    if (len > 0) {
        f->buf_size += len;
        f->total_transferred += len;      
    } else if (len == 0) {
        qemu_file_set_error_obj(f, -EIO, local_error);
    } else if (len != -EAGAIN) {          
        qemu_file_set_error_obj(f, len, local_error);
    } else {
****    error_free(local_error);          
    }

because of the while loop, we should never actually see
len = QIO_CHANNEL_ERR_BLOCK out of the bottom; so the only
error value we should have is -EIO;  so that error_free is 
not hittable.

Dave

>      if (len > 0) {
>          f->buf_size += len;
>          f->total_transferred += len;
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 4a3beedb5b..f7ed568894 100644
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


