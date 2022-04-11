Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4FA4FBAFA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 13:32:41 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndsHg-0008Pi-L6
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 07:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ndsG2-0007GU-AM
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 07:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ndsFz-0002GD-DB
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 07:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649676654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5at6wxarIpSj6ax92ja7ZpPDXF6vPUahWuzrajBFnM=;
 b=d/hTsR4S+4w2PXxaSsnp7AG+U+dqJo1uNqSna4YGXKZcQrwTHEFhO+pNMmcJyHCkTTO2Dg
 L3VAVIj0vKyow3T3etPGolV4GUG0lyAAUWSffzzo9y4ZCPVtmEujrwLO4oyct76VFgt67F
 7it24mK/VJj8mEcR/p4g4yLA2KLp42M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-y-0BSJyjN9yiUodHj4PVxA-1; Mon, 11 Apr 2022 07:30:52 -0400
X-MC-Unique: y-0BSJyjN9yiUodHj4PVxA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v62-20020a1cac41000000b0038cfe6edf3fso9894603wme.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 04:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q5at6wxarIpSj6ax92ja7ZpPDXF6vPUahWuzrajBFnM=;
 b=2fLnhdwM8b1Pyj918MY+sWAg8q6M6LsiIiaPETvi+yUQXkWhkivkgB9DN5elhE5kd8
 bhCiwRTiR25NDXFLggK/JM2azovM/eV6XpkoEp6RZvn5pszt+Hlo7biIqlSK81/afXHV
 mPxdnDaSM2WKYQpbva+RvzDV+Xo9DTtxZ8Wd9PZ21p4dMzaclHCldXr87WaJpMDsGL+D
 fmv15PtvYbekR4BcO/2zR6zZVdBi46BDhYDSDoWaPWzCnDEtyxf2vXZlxALgoSicers5
 nnSQ7zmpl/KjildbhlQJnjXrCeZc6sq3auwgigHthK6sLhB0ICqgu4NHL8IfRSM1auuh
 /Lig==
X-Gm-Message-State: AOAM532tc3ZnIZ/+0YzMLElrrZBM85ATxlgdoQFteBWDQlYRF8En0SHW
 Y/JOd5Br/BGodQUJaWH/eLavHqjQbIaudlSBovICnrRp9mIIjlhZfE2W5b7PqpuuiIdbJhXLekq
 yEzwVBtFjrXz4+s4=
X-Received: by 2002:a05:6000:15cb:b0:207:9f9e:547e with SMTP id
 y11-20020a05600015cb00b002079f9e547emr8087943wry.549.1649676651762; 
 Mon, 11 Apr 2022 04:30:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoNCwE5nZmE3IM5z+sK1jPyM0qh61R6f7LpRGawqPacpxDBPVIHyM7BlKn0Uojj0IrvmVrWg==
X-Received: by 2002:a05:6000:15cb:b0:207:9f9e:547e with SMTP id
 y11-20020a05600015cb00b002079f9e547emr8087926wry.549.1649676651571; 
 Mon, 11 Apr 2022 04:30:51 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i31-20020adf90a2000000b00205ad559c87sm25926895wri.21.2022.04.11.04.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 04:30:51 -0700 (PDT)
Date: Mon, 11 Apr 2022 12:30:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: Re: [PATCH] migration/dirtyrate: Replace malloc with g_new
Message-ID: <YlQRaSNLx72WS1TN@work-vm>
References: <20220411094703.7000-1-jianchunfu@cmss.chinamobile.com>
MIME-Version: 1.0
In-Reply-To: <20220411094703.7000-1-jianchunfu@cmss.chinamobile.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* jianchunfu (jianchunfu@cmss.chinamobile.com) wrote:
> Using macro g_new() to handling potential memory allocation failures
> in dirtyrate.
> 
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
> ---
>  migration/dirtyrate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index aace12a787..0e59aacbb0 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -522,10 +522,10 @@ static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
>          nvcpu++;
>      }
>  
> -    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
> +    dirty_pages = g_new(DirtyPageRecord, nvcpu);
>  
>      DirtyStat.dirty_ring.nvcpu = nvcpu;
> -    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
> +    DirtyStat.dirty_ring.rates = g_new(DirtyRateVcpu, nvcpu);
>  
>      dirtyrate_global_dirty_log_start();

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  
> -- 
> 2.18.4
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


