Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A794B74E2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:57:50 +0100 (CET)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3xN-00044T-QZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK3w4-0002gF-55
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK3vx-0002X7-Sd
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644954967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AJdwyj1ecgDiTlW+/m10v5zwSygEd/NGf6kxxjQx+ro=;
 b=i4kp9gynfu5ThK3YC0ZE2zZrB6aJ7q3+QvzJJjjgaQ+XA/H1JXwyVkdUbXypHL4I5O4wPy
 lcrvYeRH0CI0VkIi5l98vTy4HygyqR8axsFQJIk2f2djpH0K+ObD3ssAjbPki+n1Ph6h+O
 4X+PSmDod8ivlDhRsUJSWnLHGxiDAjk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-RneQT2awPYiTeEX1rKd12w-1; Tue, 15 Feb 2022 14:56:06 -0500
X-MC-Unique: RneQT2awPYiTeEX1rKd12w-1
Received: by mail-wm1-f72.google.com with SMTP id
 b17-20020a05600c4e1100b0037cc0d56524so1948405wmq.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AJdwyj1ecgDiTlW+/m10v5zwSygEd/NGf6kxxjQx+ro=;
 b=uX9KdOMF08uyQykYFJ0FtEKijXb5N82GYvrRajefe48BejSfr0XmyHP4J6mdKKyWko
 uKEe3ZzBChxNTsSVTWDM9dZPd9n+VWRRyHfsqHpeFWW8bWnoO7Y1QuEPTvleS+Ffq3YH
 xcIunDJUKX39YxCGVdkhX+WPsdn3ts8hD5BKEZaT3Pe0HYEu26wargas+ksQnz4EYJyE
 iN9HPOVojAVEDL7ajIRXNs7b4wtgZpJtVSb4az6MhVOQYFgFp3jqg691qgp3xgGipdGv
 uSIspuvpPRBDddn2Cq63H6LmwQ4cmNtY6Q4fjZHHX5g8YrEnxp+VJ3f1A595/psMtUy7
 R+FQ==
X-Gm-Message-State: AOAM533OuVUHXgklLswxwZFA4IVQW/zNfTjg0XncT3WRmTGZZptLXX5c
 8hwxieb/BFc5yAm8dRhK11ZaIuPtRPCr2ND0w5doDqndVGub9FJilHaQBjjwyn1T2ne461TzOq5
 tKl/k3lo0o1Z3tXA=
X-Received: by 2002:a05:600c:3650:b0:37b:dd89:2f01 with SMTP id
 y16-20020a05600c365000b0037bdd892f01mr4387796wmq.43.1644954965619; 
 Tue, 15 Feb 2022 11:56:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKyI5czZAx+uJ+70xrEOkymnewarP9TtxJYA1iaTApghDwtpTSdh8bLDJiDIs9UVwa9kSzKg==
X-Received: by 2002:a05:600c:3650:b0:37b:dd89:2f01 with SMTP id
 y16-20020a05600c365000b0037bdd892f01mr4387785wmq.43.1644954965413; 
 Tue, 15 Feb 2022 11:56:05 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id a10sm4535079wri.74.2022.02.15.11.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:56:03 -0800 (PST)
Date: Tue, 15 Feb 2022 19:56:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: Do not support blocking flock
Message-ID: <YgwFUaBIvyL0/bFB@work-vm>
References: <20220113153249.710216-1-sebastian.hasler@stuvus.uni-stuttgart.de>
MIME-Version: 1.0
In-Reply-To: <20220113153249.710216-1-sebastian.hasler@stuvus.uni-stuttgart.de>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sebastian Hasler (sebastian.hasler@stuvus.uni-stuttgart.de) wrote:
> With the current implementation, blocking flock can lead to
> deadlock. Thus, it's better to return EOPNOTSUPP if a user attempts
> to perform a blocking flock request.
> 
> Signed-off-by: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>

Queued, apologies for the delay.

> ---
>  tools/virtiofsd/passthrough_ll.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 64b5b4fbb1..faa62278c5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2442,6 +2442,15 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
>      int res;
>      (void)ino;
>  
> +    if (!(op & LOCK_NB)) {
> +        /*
> +         * Blocking flock can deadlock as there is only one thread
> +         * serving the queue.
> +         */
> +        fuse_reply_err(req, EOPNOTSUPP);
> +        return;
> +    }
> +
>      res = flock(lo_fi_fd(req, fi), op);
>  
>      fuse_reply_err(req, res == -1 ? errno : 0);
> -- 
> 2.33.1
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


