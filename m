Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445C48B8A7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:28:56 +0100 (CET)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NlH-0004LI-AA
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7NFp-0006aB-89
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7NFm-0000PI-OC
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641930981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ERRFWTv/4xcUdxDHrrJ13uErXmj17NQgq8dRykCypA=;
 b=WQKkIQJjR8nQ/S1/Gjk8iUpKG98Zt4ciFMvHKK3rwV5kGEMfzlwEbbK5Qkne93IFxhKjMO
 hUhvC4HpatYs8bewHtkDSsioY/L2CqWe6WF7Pjq83zbIMFMCR2upEqPtUwzgB0RH1Fe5qQ
 SX6Uaq/VXng3f62sPVJbA8KsQK9sNtQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-b_Z4vTCpMrGFV_8NjWFS9w-1; Tue, 11 Jan 2022 14:56:20 -0500
X-MC-Unique: b_Z4vTCpMrGFV_8NjWFS9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 a68-20020a1c9847000000b00346939a2d7cso609841wme.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 11:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+ERRFWTv/4xcUdxDHrrJ13uErXmj17NQgq8dRykCypA=;
 b=PsEO0hnJctszgGDllF+GuGdbPGSJ6PlWjrQ2qCDfcwc2K01Mk2p6h54874O/kxuhEA
 6oP4j1PBGHCKXOncmIIi8xrtrp2go1FQkKB5QjvEsRZnPV5Qo9TuMCeJlH9W4iJ68RWP
 9nOCLuUporZ14zglvSEuhcqIB8dauvz1BQvD6aMaiVGCzDk2afTbBLMfhS4+WqevYU38
 e+0J8YBS49E4XbOIAOOK9Yi8KymMx4R7YWqdaZb3x7VlOhkraKWqcLkaQ/e8GDUzEPnL
 HW/H2wF8xUwaVC40heDb/T6585I5hmimNcdEJC5uPqPMnS4a0n9Zv1f9eb361U2fOMPM
 WEXQ==
X-Gm-Message-State: AOAM531t0+0F7k5FJexmjA69CEemknT66aSAmZ2B7O1wSwdTQRaKF4L5
 qd1R/W6+6nckOZgqfTLb0Qa+17hMsu5L1LqJr20NOUiAz+7o72phlR8WOf/A5ZfE0PbTU3cLzFI
 Rohr7F8yf/EXgY8Q=
X-Received: by 2002:a05:6000:1ac6:: with SMTP id
 i6mr5199740wry.373.1641930979378; 
 Tue, 11 Jan 2022 11:56:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIO0+Imp9/sMxpm/f9INry5axPs146pAohzh0s9HD0xpjiuC8H2Y4NbbV2XHtO3DeBjhVsUQ==
X-Received: by 2002:a05:6000:1ac6:: with SMTP id
 i6mr5199731wry.373.1641930979185; 
 Tue, 11 Jan 2022 11:56:19 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id r19sm2466581wmh.42.2022.01.11.11.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 11:56:18 -0800 (PST)
Date: Tue, 11 Jan 2022 19:56:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 04/23] migration: Remove masking for compression
Message-ID: <Yd3g4FOe+IzujP/V@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-5-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-5-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Remove the mask in the call to ram_release_pages().  Nothing else does
> it, and if the offset has that bits set, we have a lot of trouble.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Yeh same as in the other branch

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 881fe4974e..fa49d22e69 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1340,7 +1340,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>                                   ram_addr_t offset, uint8_t *source_buf)
>  {
>      RAMState *rs = ram_state;
> -    uint8_t *p = block->host + (offset & TARGET_PAGE_MASK);
> +    uint8_t *p = block->host + offset;
>      bool zero_page = false;
>      int ret;
>  
> @@ -1365,7 +1365,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>      }
>  
>  exit:
> -    ram_release_page(block->idstr, offset & TARGET_PAGE_MASK);
> +    ram_release_page(block->idstr, offset);
>      return zero_page;
>  }
>  
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


