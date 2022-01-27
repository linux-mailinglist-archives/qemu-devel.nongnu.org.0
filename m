Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E949E992
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:00:58 +0100 (CET)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD94q-0006G6-Mf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD8xb-0008Dn-Da
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:53:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD8xZ-0002XZ-Oi
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643306005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CCK9zJrBjuFW0xS//43nifPWEuCg0fH4iQX7IUvFewI=;
 b=QGRBmHafFRYZ7tefc0jms6K1otAdz5g8krv83YPKPAMDCb1QWPBjtrPVVLU/VQwm6wobP3
 vkxjA5610XHSMemnMfgn1af2HNX1xl2AwBRUjpkAASOcY6V/9T0J4g2uua6JliFwBQCaJo
 isJBfb9JJQt3FqLRreQ7PlFxPYc6/qw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-3etUxamYO7S3MBez-G8I6Q-1; Thu, 27 Jan 2022 12:53:24 -0500
X-MC-Unique: 3etUxamYO7S3MBez-G8I6Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a7bcf10000000b0034ffdd81e7aso1825339wmg.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 09:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CCK9zJrBjuFW0xS//43nifPWEuCg0fH4iQX7IUvFewI=;
 b=e2ZRe90tLvxksbyz6galblpYDDYOk/bCLna8211Ooj7fQcbAxNB1NLE0SXIBo69BS5
 v+SkQm+PepJmXIQ4Qnhx9mIbk60C278W+XNUvfvKjsB3VhFWctsPn9JPdBjBDGoZaIv6
 0cW6IvNP3DzdIA4too7WHm//YRcZNtwYCTxfeGEcRThriwZNZU3NgQ+6NJfXIoOnT+nZ
 np3DwjxzK5+ZF4ie1eguj3ENgbIanqsbjRnL2kJILwaM3MdUt08iAe2zMrs5i1kLSuHc
 RIWwC/2ewmKJnSS3B85FuAEDYyDfz3Oy0cERNq6q0jkCGS3W7Bz2aGRU/ClyOTIo2CQV
 nFEQ==
X-Gm-Message-State: AOAM53062O6DFKz0lMhV1RfuWr7vJrx3QyQz7LH3t/2jxHlEG30iJsoh
 d/6l3/9yUAppLcoarb7ZL7NmTJ/bNPJX2OoLfVPYixDe9tyguI6GbjaNu7NdTtCXH0e7pN2Oe/h
 M5IGmhwPKYEnbnQY=
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr4295567wmh.57.1643306002470; 
 Thu, 27 Jan 2022 09:53:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY7/8//pUHgUU/1V5xLyv6ZHOoPR3+SYNh0pXiSOsNpanScQYZABGMRmq5B850IvpdTUPtTA==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr4295555wmh.57.1643306002301; 
 Thu, 27 Jan 2022 09:53:22 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m12sm3411838wrp.61.2022.01.27.09.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:53:21 -0800 (PST)
Date: Thu, 27 Jan 2022 17:53:20 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 4/9] virtiofsd: Extend size of fuse_conn_info->capable
 and ->want fields
Message-ID: <YfLcEJzqRdBG3SOO@work-vm>
References: <20220124212455.83968-1-vgoyal@redhat.com>
 <20220124212455.83968-5-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220124212455.83968-5-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
> ->capable keeps track of what capabilities kernel supports and ->wants keep
> track of what capabilities filesytem wants.
> 
> Right now these fields are 32bit in size. But now fuse has run out of
> bits and capabilities can now have bit number which are higher than 31.
> 
> That means 32 bit fields are not suffcient anymore. Increase size to 64
> bit so that we can add newer capabilities and still be able to use existing
> code to check and set the capabilities.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_common.h   | 4 ++--
>  tools/virtiofsd/fuse_lowlevel.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> index 0c2665b977..6f8a988202 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -439,7 +439,7 @@ struct fuse_conn_info {
>      /**
>       * Capability flags that the kernel supports (read-only)
>       */
> -    unsigned capable;
> +    uint64_t capable;
>  
>      /**
>       * Capability flags that the filesystem wants to enable.
> @@ -447,7 +447,7 @@ struct fuse_conn_info {
>       * libfuse attempts to initialize this field with
>       * reasonable default values before calling the init() handler.
>       */
> -    unsigned want;
> +    uint64_t want;
>  
>      /**
>       * Maximum number of pending "background" requests. A
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index c3af5ede08..f3f5e70be6 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -2063,7 +2063,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (se->conn.want & (~se->conn.capable)) {
>          fuse_log(FUSE_LOG_ERR,
>                   "fuse: error: filesystem requested capabilities "
> -                 "0x%x that are not supported by kernel, aborting.\n",
> +                 "0x%lx that are not supported by kernel, aborting.\n",

I think this will be OK in practice (need to check 32 bit); but weren't
you using llx in the last patch?



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Dave

>                   se->conn.want & (~se->conn.capable));
>          fuse_reply_err(req, EPROTO);
>          se->error = -EPROTO;
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


