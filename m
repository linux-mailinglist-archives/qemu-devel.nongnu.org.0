Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753A45FC930
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:26:45 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieZA-0002jk-6k
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oieNR-00067o-L8
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oieNF-0006tT-KD
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665591260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LGXGz+hVNGubrq7p4/B0Z0Eb75hu8/FbIDpUU3vL4E=;
 b=gIvWDaBcB3w/koEF0PiBBdMPpWWDZnv4OjetFrhBIK3D7i73OU5bj8UkNXu9a4GpqxlsIM
 DdJECDx+0J++0aB+WyQ027yEDae3Z+DSji7EMSIYKohS9giBxJGFitoO0NiF+ji9VgdpMT
 x3sdJdHG4zGYnjtK1ee0pGTuzneL5lI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-KkNX0XSZNnCv41F0mhCv4g-1; Wed, 12 Oct 2022 12:14:18 -0400
X-MC-Unique: KkNX0XSZNnCv41F0mhCv4g-1
Received: by mail-wr1-f69.google.com with SMTP id
 m20-20020adfa3d4000000b0022e2fa93dd1so5117133wrb.2
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 09:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/LGXGz+hVNGubrq7p4/B0Z0Eb75hu8/FbIDpUU3vL4E=;
 b=MitX74M7YRaA8f97Y15+9SERrDOgDZnVBWeZCM4bDoWyeYR3u7DMxg59GSeP+XvDIz
 wRX5ODGdC+AYLwIgguXJQL6Nj/aUZROUyFQVDl546IFZgYVpfFSaPJUTXkJ06WN0LSO8
 aSNdtz7Ql6ybpnvuizkhK73NIjFIXkLNb6kcWELYJIDear0lm+JIVtSUQ1hzRjLo3lPk
 4OToz/3Q5ybUJtfZhuq9l48GgBmw9XoVC1O/eAj1sJAsC2Sx70/2I+ZTGDhgDo/sldpw
 vzh4bugWwSKn9Jusju6EFQDXUWIGs8NNRTg+ZgGLwpFSuSpmvJHsdPm2ARUHir8Z6leF
 hSvw==
X-Gm-Message-State: ACrzQf2bYlxiETdbvscAFOujnfqKte19UGMBNDTTYZZIJWpn/bWZ8Qb/
 2aQM1vIdBnvfbkc5G7lEaXkO51FU7KANXOTrQyRS2Pi94JMLXhhYpfLXJ/w8DUoiEhrVKji1tgC
 dDqM3qhvpnhkpqBM=
X-Received: by 2002:a7b:ca4f:0:b0:3c6:ce01:bc4a with SMTP id
 m15-20020a7bca4f000000b003c6ce01bc4amr3484311wml.42.1665591257547; 
 Wed, 12 Oct 2022 09:14:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6d2CaKDNaG0Dr4yx6kUmeXssAm8tYxUqMPgmdgMdx9eCE30qpr8iqJ5CxUygqQFBnt+ojJRw==
X-Received: by 2002:a7b:ca4f:0:b0:3c6:ce01:bc4a with SMTP id
 m15-20020a7bca4f000000b003c6ce01bc4amr3484292wml.42.1665591257305; 
 Wed, 12 Oct 2022 09:14:17 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h15-20020adffd4f000000b0022ae0965a8asm110199wrs.24.2022.10.12.09.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 09:14:16 -0700 (PDT)
Date: Wed, 12 Oct 2022 17:14:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 01/15] migration: Take bitmap mutex when completing
 ram migration
Message-ID: <Y0bn1qowyVHJ78J4@work-vm>
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011215559.602584-2-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Any call to ram_find_and_save_block() needs to take the bitmap mutex.  We
> used to not take it for most of ram_save_complete() because we thought
> we're the only one left using the bitmap, but it's not true after the
> preempt full patchset applied, since the return path can be taking it too.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 1338e47665..cfeb571800 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3406,6 +3406,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>          /* try transferring iterative blocks of memory */
>  
>          /* flush all remaining blocks regardless of rate limiting */
> +        qemu_mutex_lock(&rs->bitmap_mutex);
>          while (true) {
>              int pages;
>  
> @@ -3419,6 +3420,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>                  break;
>              }
>          }
> +        qemu_mutex_unlock(&rs->bitmap_mutex);
>  
>          flush_compressed_data(rs);
>          ram_control_after_iterate(f, RAM_CONTROL_FINISH);
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


