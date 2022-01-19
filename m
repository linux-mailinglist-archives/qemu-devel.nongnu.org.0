Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1E1493EE4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:17:42 +0100 (CET)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEaI-0000dk-Gy
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAEIM-0004Ge-TM
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 11:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAEII-00082E-0m
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 11:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642611518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DAty5HP5h41Szy2f6C7rBsX4r5dnlhPmXLUFI8QR/PA=;
 b=XSGoG+y5DYarettQrhbAaxKRQUcEv6VWZwTaCpPR6rooURpegxyL7nBHl+oG2zyzAqUhWP
 LtPXiAvMz4/S1/gwegfkjX3rnBbz1fWsheaqH9c9L30gAVFioEAPfREKv17GuMx08Xrozb
 5lGRDznNyPzfRnoLClb0hm+Pdwv6KmQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-riCKVuXMPNeRzGKciFKkiA-1; Wed, 19 Jan 2022 11:58:36 -0500
X-MC-Unique: riCKVuXMPNeRzGKciFKkiA-1
Received: by mail-wm1-f70.google.com with SMTP id
 14-20020a05600c024e00b0034a83f7391aso2131780wmj.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 08:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DAty5HP5h41Szy2f6C7rBsX4r5dnlhPmXLUFI8QR/PA=;
 b=m7LvjAdw4vXELQe1xCyMEf8PHXq7u2Ik+F0wqF1uUCCDNrmSf+N7N9BVSoKbHqg1m2
 v5JEoPTRk/4tci2TU6CiLU+zypcCEMEMxr3LFb2lzM3TVbSPS0H5QKGxfeN+gPTIvwD9
 g8fDaHkJ/LXtkTEKk5cyyFJLQXixef58BXlLJL5ZsmuQsVT4YiG69xId4wyjTVsvHVvl
 uzSaWeVQXLW6ihXm6M/G8ucXiQKDjtfHA8z7dMdRlCsXDECf3ZRJtytGAJnE2ml3fNR7
 VWYID88PmMIRKnxo+59AkBHwhMmHIh/OZVbu2BPnDFSQCOW5+00eCPDGSoSMx8vowslE
 qHBQ==
X-Gm-Message-State: AOAM5323qefYxaE+nuNniEjWPWCzwTNa3J66am8NlbENUJ5r9muFbuuE
 9d5uLBogCiC0QUP5zwIuAYg7kw2C+ng1g+iFjF/80u2kzm5ynr4Ki8IGbB10xbva5AAzs/jA8Pp
 zCmitJjrGflZKYkI=
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr4457774wmq.143.1642611515563; 
 Wed, 19 Jan 2022 08:58:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMtDhQFiC/pkdqtRzl7KqzSDrMcpei61heCCdV2d8b80vpx0FTBJONMG0TiVTRCJRvuLg8WA==
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr4457755wmq.143.1642611515357; 
 Wed, 19 Jan 2022 08:58:35 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m12sm443802wrp.55.2022.01.19.08.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 08:58:34 -0800 (PST)
Date: Wed, 19 Jan 2022 16:58:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 06/15] migration: Move temp page setup and cleanup
 into separate functions
Message-ID: <YehDOBtwhyjBJRsC@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-7-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-7-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Temp pages will need to grow if we want to have multiple channels for postcopy,
> because each channel will need its own temp page to cache huge page data.
> 
> Before doing that, cleanup the related code.  No functional change intended.
> 
> Since at it, touch up the errno handling a little bit on the setup side.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/postcopy-ram.c | 82 +++++++++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 31 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 2176ed68a5..e662dd05cc 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -523,6 +523,19 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
>      return 0;
>  }
>  
> +static void postcopy_temp_pages_cleanup(MigrationIncomingState *mis)
> +{
> +    if (mis->postcopy_tmp_page) {
> +        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
> +        mis->postcopy_tmp_page = NULL;
> +    }
> +
> +    if (mis->postcopy_tmp_zero_page) {
> +        munmap(mis->postcopy_tmp_zero_page, mis->largest_page_size);
> +        mis->postcopy_tmp_zero_page = NULL;
> +    }
> +}
> +
>  /*
>   * At the end of a migration where postcopy_ram_incoming_init was called.
>   */
> @@ -564,14 +577,8 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
>          }
>      }
>  
> -    if (mis->postcopy_tmp_page) {
> -        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
> -        mis->postcopy_tmp_page = NULL;
> -    }
> -    if (mis->postcopy_tmp_zero_page) {
> -        munmap(mis->postcopy_tmp_zero_page, mis->largest_page_size);
> -        mis->postcopy_tmp_zero_page = NULL;
> -    }
> +    postcopy_temp_pages_cleanup(mis);
> +
>      trace_postcopy_ram_incoming_cleanup_blocktime(
>              get_postcopy_total_blocktime());
>  
> @@ -1082,6 +1089,40 @@ retry:
>      return NULL;
>  }
>  
> +static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
> +{
> +    int err;
> +
> +    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
> +                                  PROT_READ | PROT_WRITE,
> +                                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    if (mis->postcopy_tmp_page == MAP_FAILED) {
> +        err = errno;
> +        mis->postcopy_tmp_page = NULL;
> +        error_report("%s: Failed to map postcopy_tmp_page %s",
> +                     __func__, strerror(err));
> +        return -err;
> +    }
> +
> +    /*
> +     * Map large zero page when kernel can't use UFFDIO_ZEROPAGE for hugepages
> +     */
> +    mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
> +                                       PROT_READ | PROT_WRITE,
> +                                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
> +        err = errno;
> +        mis->postcopy_tmp_zero_page = NULL;
> +        error_report("%s: Failed to map large zero page %s",
> +                     __func__, strerror(err));
> +        return -err;
> +    }
> +
> +    memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
> +
> +    return 0;
> +}
> +
>  int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
>  {
>      /* Open the fd for the kernel to give us userfaults */
> @@ -1122,32 +1163,11 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
>          return -1;
>      }
>  
> -    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
> -                                  PROT_READ | PROT_WRITE, MAP_PRIVATE |
> -                                  MAP_ANONYMOUS, -1, 0);
> -    if (mis->postcopy_tmp_page == MAP_FAILED) {
> -        mis->postcopy_tmp_page = NULL;
> -        error_report("%s: Failed to map postcopy_tmp_page %s",
> -                     __func__, strerror(errno));
> +    if (postcopy_temp_pages_setup(mis)) {
> +        /* Error dumped in the sub-function */
>          return -1;
>      }
>  
> -    /*
> -     * Map large zero page when kernel can't use UFFDIO_ZEROPAGE for hugepages
> -     */
> -    mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
> -                                       PROT_READ | PROT_WRITE,
> -                                       MAP_PRIVATE | MAP_ANONYMOUS,
> -                                       -1, 0);
> -    if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
> -        int e = errno;
> -        mis->postcopy_tmp_zero_page = NULL;
> -        error_report("%s: Failed to map large zero page %s",
> -                     __func__, strerror(e));
> -        return -e;
> -    }
> -    memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
> -
>      trace_postcopy_ram_enable_notify();
>  
>      return 0;
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


