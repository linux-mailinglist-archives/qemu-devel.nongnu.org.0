Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A44545E09A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 19:42:19 +0100 (CET)
Received: from localhost ([::1]:58850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqJhK-00048O-E6
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 13:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJdW-0002x1-IG
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJdT-0005CC-RM
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637865498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FcrP/g531E7ZdHIYV+/aPZ2nj83NAgzDWdvXz5qVelw=;
 b=JVPUhhlyZaxL4/4lwLIfXijro/uGAwDv/KEsp7MthWW6AjEc0kGRmvNacT+27EmS7RE9ld
 gcjXN9qobbAxp8+cWItPFjdoVvKIJUnXwC45V62/dikGV3SFgzFOSIepvbFmqMIwqXecjr
 j0HXuPXqKy4ftA1GPKFIFj9wJu9CyX4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-273-lq6GyXraN2-LX7AdMuhLAA-1; Thu, 25 Nov 2021 13:38:17 -0500
X-MC-Unique: lq6GyXraN2-LX7AdMuhLAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so5388230wmc.7
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 10:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FcrP/g531E7ZdHIYV+/aPZ2nj83NAgzDWdvXz5qVelw=;
 b=m6jtg0uk/60Q9VmXm4nYgf/S1HENUbIHTrnPaO872cYayDux4MdVRumLYREQZ2uCGD
 PbQD5R2sPf28eEQWhHyNkgn8mEJlGW6/CAuTr87OVGubtYKtlEJsiUKrBWASPLiPGx88
 zeoeOK5gHfZnvi9dZNmqQEUU+ctSKxQfjNxrbTd8mafb01EWTfejQjc0QXyImKiqNM1A
 F1GNfquZm2F0ngVKYEU43zFRSuBfD72DnNCaG1H3gMmhew85sjFNaDNgo1/HSWezhZFm
 nucgPLv55xq0JWNbryOQEe7+342MpN/jBCWRu0dvq6fdKbMV95xe2fyiZl5+foC+cybC
 1miA==
X-Gm-Message-State: AOAM532mCj0rNGIGfO6bpt26KKs9vpGd4QCZgJSCXtgZLkzuymPctxMt
 aG7NUjT68HXw3MRvNLMQPHkU52SKgjruGr1yhtm97Bfv5PjhUUam81rVSxM223F0Gaq72Yg1zna
 s+iH/O8lsIt/aUo8=
X-Received: by 2002:a5d:5643:: with SMTP id j3mr9141211wrw.138.1637865496015; 
 Thu, 25 Nov 2021 10:38:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhKw+Wj3+v+N38RR7ZKX/sBaTAyG/ceXwgVSrtVko7dHbmzgOAiuHMO7EG+seGtmHe10pdKg==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr9141186wrw.138.1637865495816; 
 Thu, 25 Nov 2021 10:38:15 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id d6sm3645444wrn.53.2021.11.25.10.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 10:38:15 -0800 (PST)
Date: Thu, 25 Nov 2021 18:38:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 04/23] multifd: Add missing documention
Message-ID: <YZ/YFQxtw+ZCkuFu@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-5-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-5-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Pretty obvious, but I guess to have the complete set of comments:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd-zlib.c | 2 ++
>  migration/multifd-zstd.c | 2 ++
>  migration/multifd.c      | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 3fc7813b44..d0437cce2a 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -72,6 +72,7 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>   * Close the channel and return memory.
>   *
>   * @p: Params for the channel that we are using
> + * @errp: pointer to an error
>   */
>  static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
>  {
> @@ -94,6 +95,7 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
>   *
>   * @p: Params for the channel that we are using
>   * @used: number of pages used
> + * @errp: pointer to an error
>   */
>  static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index cc3b8869c0..09ae1cf91a 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -84,6 +84,7 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
>   * Close the channel and return memory.
>   *
>   * @p: Params for the channel that we are using
> + * @errp: pointer to an error
>   */
>  static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
>  {
> @@ -107,6 +108,7 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
>   *
>   * @p: Params for the channel that we are using
>   * @used: number of pages used
> + * @errp: pointer to an error
>   */
>  static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 8ea86d81dc..cdeffdc4c5 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -66,6 +66,7 @@ static int nocomp_send_setup(MultiFDSendParams *p, Error **errp)
>   * For no compression this function does nothing.
>   *
>   * @p: Params for the channel that we are using
> + * @errp: pointer to an error
>   */
>  static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
>  {
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


