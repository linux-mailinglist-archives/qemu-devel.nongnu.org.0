Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB22245E119
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 20:43:19 +0100 (CET)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqKeG-0004tC-9j
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 14:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqKcU-00042u-V3
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 14:41:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqKcR-0002Op-5D
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 14:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637869276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=evqjXThHOwHzjwJ++v4v5Tt3mDYmiU7q8nNFa7mORjQ=;
 b=OR+U/jSW48DBROAz+AqGCnva5z7ZhML9fJdgQU6QAJb5Yn8rQudQ/ngy2YpZJtCTywVMv/
 JPzacPf2FaGwTv/neZtqKF34xLWwQBxVgS4F3uc3PqSitEkUMZbofHAcYKKZXH//xKHZbG
 JhTWzj1bmNHMpT3sbdddaW67usEq4XY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-ohuemYjUOqOfQ0Nw1G6rEw-1; Thu, 25 Nov 2021 14:41:15 -0500
X-MC-Unique: ohuemYjUOqOfQ0Nw1G6rEw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so4018881wmr.3
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 11:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=evqjXThHOwHzjwJ++v4v5Tt3mDYmiU7q8nNFa7mORjQ=;
 b=1Z02cEWMacGGORIGTiXs3BA/0vfhpf5xEyx0EdQyaig/ljWVNBgM+0Na18lWxZZl03
 SmWVtq1DCyExmmFMx1w2ySNB4RLPD5vMUTU+urogqbLZyikoeOhq/tb+E6HPWO4nTpZ7
 Uw2bPdbDqpYMgY7k57ajFEgj1vS5jD06ZhGxYSB6mc0asUWt3n8hwoRTRRaVsp7EsAsq
 sDDBLtwJ2KMRgAkvxwlmYnkUF09UJwknQZxRa7x+NQQ38G8XGrPyDpE9Zr+KwxiI07fB
 HVHnu/OQlzMestENkiZjCmRuQcM68wndDdlso/bZaSjshHw3ZErJZdEaerZyGX8wQHU7
 MIEw==
X-Gm-Message-State: AOAM530l4SH31G/umWKsKgO8JsWdA5T0IJ47hzKzJUMY96NFHk3Qa9Qz
 RHJoi1igFNKMiRtiUVKliUG9eGQ/DU2sHMUPAOwMg1f6PKFxI8cicoA2OhWAOhbV9noPYfeHE1d
 OuypLA5SgXntjBDU=
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr9441141wrr.252.1637869273566; 
 Thu, 25 Nov 2021 11:41:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJwBfDGEl54yGLZciG67fW0eSTZbpcPSIJMWe+tLFpIjI31mTTncvaeXq+tvCi0gkCY2j/DA==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr9441117wrr.252.1637869273357; 
 Thu, 25 Nov 2021 11:41:13 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z14sm4035664wrp.70.2021.11.25.11.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 11:41:12 -0800 (PST)
Date: Thu, 25 Nov 2021 19:41:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 08/23] multifd: Fill offset and block for reception
Message-ID: <YZ/m1vur4fvGzMg2@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-9-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-9-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We were using the iov directly, but we will need this info on the
> following patch.

Yes I think so;  have you considered that really need to check the
fields of MultiFD*Params to see which fields you're actually using?



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 55d99a8232..0533da154a 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -354,6 +354,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          return -1;
>      }
>  
> +    p->pages->block = block;
>      for (i = 0; i < p->pages->num; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
> @@ -363,6 +364,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>                         offset, block->used_length);
>              return -1;
>          }
> +        p->pages->offset[i] = offset;
>          p->pages->iov[i].iov_base = block->host + offset;
>          p->pages->iov[i].iov_len = page_size;
>      }
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


