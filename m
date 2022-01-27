Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37C049EA2E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:13:24 +0100 (CET)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9Gt-0004Gg-T4
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD8Pf-0006W6-6q
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:18:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD8PH-00059b-Fv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643303878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LLX/v28MOoXA8jr0fBXClHI3lSbq1QoGjHAa3j0fMRw=;
 b=EHnik0F2a51Ra6bpOYH5dazZypEV6+PIafKlTwv+DQLEHdV6p6OQc4oxMbiHN02IruhFPk
 9NpT341qObXf/y3vtnfGr7TeBsGfjEozcWp6ocjr+ToSBcS6Ha3LpvoX5GLekngr1rMiIH
 KrLQ9TSrGw8shzl9UFbM7F6XNNTIJx8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-DBjoOyfgPm2qTGab4COZKA-1; Thu, 27 Jan 2022 12:17:42 -0500
X-MC-Unique: DBjoOyfgPm2qTGab4COZKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso1776039wme.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 09:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LLX/v28MOoXA8jr0fBXClHI3lSbq1QoGjHAa3j0fMRw=;
 b=Lq52Xv4TqpgEFqmfoQzgw2uGacBOECihHm8fq09bOtzAjQSo7crrHuhANAqi0MmRpe
 GH2maEMQNZcQ+VAYgB/eqxAzNF9/pD4ifT4CoaqDGFqgP9ciEv+6qRMA8+iKgbPlycyK
 mga2KHFwSVhqHJmClVVd/KVLhPPycmQh3O0mywE7OP0Uy62mwyOn8b+fDaZpSbgEjBUU
 ovy7EEKx9/ISyWz7IhnwARKjfHnHIRvbZUB/dxeUdsNjMxU/Jo5qTatl6IKIOKOZcG7D
 /EnYWG/HhznCX876Mwk6bi/kk4F30o2Vrbo0/8aCP8RD9e8QFOBiT4XVUXPM4BP3gaSr
 YTtw==
X-Gm-Message-State: AOAM530H1fUOPseDkfoIFksM+O8xdoVH58pTo2NooqcpKUJsA93bBilZ
 6zzQfj0Q4oAJhXr3N4oEdfRAcPkv8hesPrmFO/KLOIOdVnjPxD36YYsCWCm6v6ey3/YAa8tPVc4
 r5IyZsEdTf+QTq8c=
X-Received: by 2002:adf:cd85:: with SMTP id q5mr3854109wrj.450.1643303860952; 
 Thu, 27 Jan 2022 09:17:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8fJQPwDLpGKFmDgfpeTFhXMe7mzOAgjXyc/a5TbdzuD4P1B3hFAvhoS52JrrbL1o9F8/uUw==
X-Received: by 2002:adf:cd85:: with SMTP id q5mr3854090wrj.450.1643303860741; 
 Thu, 27 Jan 2022 09:17:40 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u14sm2665735wmq.24.2022.01.27.09.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:17:40 -0800 (PST)
Date: Thu, 27 Jan 2022 17:17:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 2/9] virtiofsd: Fix breakage due to fuse_init_in size
 change
Message-ID: <YfLTsnyhTdylJn+u@work-vm>
References: <20220124212455.83968-1-vgoyal@redhat.com>
 <20220124212455.83968-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220124212455.83968-3-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Kernel version 5.17 has increased the size of "struct fuse_init_in" struct.
> Previously this struct was 16 bytes and now it has been extended to
> 64 bytes in size.
> 
> Once qemu headers are updated to latest, it will expect to receive 64 byte
> size struct (for protocol version major 7 and minor > 6). But if guest is
> booting older kernel (older than 5.17), then it still sends older
> fuse_init_in of size 16 bytes. And do_init() fails. It is expecting
> 64 byte struct. And this results in mount of virtiofs failing.
> 
> Fix this by parsing 16 bytes only for now. Separate patches will be
> posted which will parse rest of the bytes and enable new functionality.
> Right now we don't support any of the new functionality, so we don't
> lose anything by not parsing bytes beyond 16.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

OK, I think we should make this 1/9 and get this in quickly; that way
bisect works.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_lowlevel.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index e4679c73ab..ce29a70253 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1880,6 +1880,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>                      struct fuse_mbuf_iter *iter)
>  {
>      size_t compat_size = offsetof(struct fuse_init_in, max_readahead);
> +    size_t compat2_size = offsetof(struct fuse_init_in, flags) + sizeof(uint32_t);

Yeh so that sizeof() is sizeof the flags, so that's the size of the
sturcture upto and including the flags.

>      struct fuse_init_in *arg;
>      struct fuse_init_out outarg;
>      struct fuse_session *se = req->se;
> @@ -1897,7 +1898,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>  
>      /* ...and now consume the new fields. */
>      if (arg->major == 7 && arg->minor >= 6) {
> -        if (!fuse_mbuf_iter_advance(iter, sizeof(*arg) - compat_size)) {
> +        if (!fuse_mbuf_iter_advance(iter, compat2_size - compat_size)) {
>              fuse_reply_err(req, EINVAL);
>              return;
>          }
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


