Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EB55E531
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:06:40 +0200 (CEST)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BrT-0004Yh-HW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6Bpr-0002id-G8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6Bpm-00015V-OW
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656425093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PfdeaqqNTOGyXQkjM9mQW0/juRCQshh4ExYHRswdsc=;
 b=TA7wRzXgxW7GoRowT/MbiQhfvA5bZ3dXv2bmlMC+u2802PCsfw1qp3bbSFyMN+9Fo8aR/j
 9Of1gq0eG1S2iNBZLCfe8owqC14Tet+WRCbMG4AH0BSnJ8ERzjIMDPfWC6gtX93t3wcKJo
 6bZ91Hx0C/vSafphJ6QoPL35KIrHqGE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-MPGqS-pJNF6ewOiMU3auTw-1; Tue, 28 Jun 2022 10:04:52 -0400
X-MC-Unique: MPGqS-pJNF6ewOiMU3auTw-1
Received: by mail-wr1-f71.google.com with SMTP id
 y18-20020adfdf12000000b0021b94ba4c37so1851315wrl.11
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1PfdeaqqNTOGyXQkjM9mQW0/juRCQshh4ExYHRswdsc=;
 b=wHe70v5liXeztU/vHtWpaYfhDT1zZpJgJB1cN6u4wE1HPXnAqznw32jlR3WcAX9go8
 QwF9va/k4LhWfl4++PvgWcnvJH7r5UB13QBnowLEvkDJzb27wXsLFgIi6aZ9nJHZqoPC
 Wuy0Iw9Iwv0OnBeMNeU81Wg0zj8wmgOzwIHB7TnA7KkLt0eHIHiNn1liErS8mMs9Oku3
 EGbJ3yKQYB2Gsb2SinHy3em23KvJk5I/MR+pBZMWfbod407rIPD07rUYng+ojC5yoZw6
 xFdbEfBOQ6cT76BWEqrk/EeBwXm/so/lDVykV8wYT79MkEKCecDScSwwN9vLR9ljJrKb
 yLxg==
X-Gm-Message-State: AJIora81BCptmXuhftNJNgF4qZr4IWRmPdmhQ33L8M+Zrjb4llRqEBfm
 1OJRkNh8zTXMBLjh4+sMmsBkebCD0bSk75uaqWGy7x/83EPcB6woGWxdIOSbvsjYJXQs7rCehbS
 MO7BvLX4U7jZUa10=
X-Received: by 2002:a5d:518a:0:b0:21a:39f4:b352 with SMTP id
 k10-20020a5d518a000000b0021a39f4b352mr17894550wrv.92.1656425091040; 
 Tue, 28 Jun 2022 07:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sB1OHdyM6EuGZ2NMn8PTQSaENyObpiQT/K7d5bt8qow281EHbMHQvJq6V5/E0xftZEptCkEg==
X-Received: by 2002:a5d:518a:0:b0:21a:39f4:b352 with SMTP id
 k10-20020a5d518a000000b0021a39f4b352mr17894529wrv.92.1656425090854; 
 Tue, 28 Jun 2022 07:04:50 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c218600b003a04b0bcb43sm7145482wme.40.2022.06.28.07.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:04:50 -0700 (PDT)
Date: Tue, 28 Jun 2022 15:04:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v8 01/15] fixup! migration: remove the QEMUFileOps
 'get_buffer' callback
Message-ID: <YrsKgH8B65XrBCFe@work-vm>
References: <20220622204920.79061-1-peterx@redhat.com>
 <20220622204920.79061-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622204920.79061-2-peterx@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Peter Xu (peterx@redhat.com) wrote:
> This fixes a bug with the cleanup patch.  Should be squashed into the patch
> in subject.

Yep, that one is already in; thanks.

Dave

> Cc: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/qemu-file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 3a380a6072..1e80d496b7 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -375,7 +375,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>                  qio_channel_wait(f->ioc, G_IO_IN);
>              }
>          } else if (len < 0) {
> -            len = EIO;
> +            len = -EIO;
>          }
>      } while (len == QIO_CHANNEL_ERR_BLOCK);
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


