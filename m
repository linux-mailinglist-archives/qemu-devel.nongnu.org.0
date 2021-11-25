Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA5045E0C2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 19:54:10 +0100 (CET)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqJsn-0007bA-Ay
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 13:54:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJrt-0006tI-Hg
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJrq-0000ur-SY
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637866386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UG+vF1lhOUC0N4clRz7TfuTxt+rYv7gEWrlVHgk9/xU=;
 b=Fw0d1FjvO68P6PAF/NDzCqtT3kgygCWUpAOXgnkDaZ1JAFRno9MiVdjP0uPk3qef9n9iq9
 1m8nqSs7KuGbcmzDL8dq8WqBzDtJyC44tjkKo9mqkDUwWgEbWd7BswGpkmoP9cRcBEiHjG
 xKb4es5jaf7sZOxYjtQQojkwnOND9fU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-l9PscGUMPY2bSlHMrszM8g-1; Thu, 25 Nov 2021 13:53:05 -0500
X-MC-Unique: l9PscGUMPY2bSlHMrszM8g-1
Received: by mail-wm1-f71.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so5406283wmc.7
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 10:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UG+vF1lhOUC0N4clRz7TfuTxt+rYv7gEWrlVHgk9/xU=;
 b=p7eHZrClCWcFoggblVBO3day6AKGNy5s7zHkYynMEdgssCZkb+loLIiPPOYwjL1UC0
 355PiKqGn5WZbi/WMVNnWvECRYgSjOo/uSd7o2/TaaCEfAg6HDq2U7FSpUSkAbyvU/bi
 B8ecBjYL2tucsFPt2XeB0beovM7po1Na2V/A05UsFZdoEbRzimyCSDtSL/WhK1+R2E0t
 uFRUzIHDPUvXajQA8WtIflIGIUYYCHD8IAytf432kZhkgIZyzDm9EEb/7pZAGoYgrEDD
 O822cCtJ/pNHQJS34nYCvP2kh124uepPibObd9F9l5h2UdR5wLsQBnBioP7gDrmVvYKR
 8hCQ==
X-Gm-Message-State: AOAM533dceVHRacFN1tqxGsQO959cPfNHXo+ObBy8KIAgZshzy/2d4Rf
 ybnDfWPufAaqrO2kIrkKyhHk7JHqxQ9QAA451u+E5YtVtRQJ1k8iM7YDcfMTWwglourkNVzsrIt
 mGJFPxDtvr48uXD8=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr10023114wmj.67.1637866383866; 
 Thu, 25 Nov 2021 10:53:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaOddHWmPfk91g6VznpFwb3zjdGPBZjyqji8y5Q21l13DaN6FJmHSioX8fFPszXsGl4lAuig==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr10023090wmj.67.1637866383707; 
 Thu, 25 Nov 2021 10:53:03 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z6sm5452323wmp.9.2021.11.25.10.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 10:53:03 -0800 (PST)
Date: Thu, 25 Nov 2021 18:53:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 07/23] multifd: remove used parameter from
 send_recv_pages() method
Message-ID: <YZ/bjZvZlPIq0tzh@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-8-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-8-quintela@redhat.com>
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
> It is already there as p->pages->num.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.h      | 2 +-
>  migration/multifd-zlib.c | 9 ++++-----
>  migration/multifd-zstd.c | 7 +++----
>  migration/multifd.c      | 7 +++----
>  4 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 7968cc5c20..e57adc783b 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -167,7 +167,7 @@ typedef struct {
>      /* Cleanup for receiving side */
>      void (*recv_cleanup)(MultiFDRecvParams *p);
>      /* Read all pages */
> -    int (*recv_pages)(MultiFDRecvParams *p, uint32_t used, Error **errp);
> +    int (*recv_pages)(MultiFDRecvParams *p, Error **errp);
>  } MultiFDMethods;
>  
>  void multifd_register_ops(int method, MultiFDMethods *ops);
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 28f0ed933b..e85ef8824d 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -230,17 +230,16 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
>   * Returns 0 for success or -1 for error
>   *
>   * @p: Params for the channel that we are using
> - * @used: number of pages used
>   * @errp: pointer to an error
>   */
> -static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
> +static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      struct zlib_data *z = p->data;
>      z_stream *zs = &z->zs;
>      uint32_t in_size = p->next_packet_size;
>      /* we measure the change of total_out */
>      uint32_t out_size = zs->total_out;
> -    uint32_t expected_size = used * qemu_target_page_size();
> +    uint32_t expected_size = p->pages->num * qemu_target_page_size();
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      int ret;
>      int i;
> @@ -259,12 +258,12 @@ static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
>      zs->avail_in = in_size;
>      zs->next_in = z->zbuff;
>  
> -    for (i = 0; i < used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          struct iovec *iov = &p->pages->iov[i];
>          int flush = Z_NO_FLUSH;
>          unsigned long start = zs->total_out;
>  
> -        if (i == used - 1) {
> +        if (i == p->pages->num - 1) {
>              flush = Z_SYNC_FLUSH;
>          }
>  
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 4a71e96e06..a8b104f4ee 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -250,14 +250,13 @@ static void zstd_recv_cleanup(MultiFDRecvParams *p)
>   * Returns 0 for success or -1 for error
>   *
>   * @p: Params for the channel that we are using
> - * @used: number of pages used
>   * @errp: pointer to an error
>   */
> -static int zstd_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
> +static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t in_size = p->next_packet_size;
>      uint32_t out_size = 0;
> -    uint32_t expected_size = used * qemu_target_page_size();
> +    uint32_t expected_size = p->pages->num * qemu_target_page_size();
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      struct zstd_data *z = p->data;
>      int ret;
> @@ -278,7 +277,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
>      z->in.size = in_size;
>      z->in.pos = 0;
>  
> -    for (i = 0; i < used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          struct iovec *iov = &p->pages->iov[i];
>  
>          z->out.dst = iov->iov_base;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 098ef8842c..55d99a8232 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -141,10 +141,9 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
>   * Returns 0 for success or -1 for error
>   *
>   * @p: Params for the channel that we are using
> - * @used: number of pages used
>   * @errp: pointer to an error
>   */
> -static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
> +static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>  
> @@ -153,7 +152,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
>                     p->id, flags, MULTIFD_FLAG_NOCOMP);
>          return -1;
>      }
> -    return qio_channel_readv_all(p->c, p->pages->iov, used, errp);
> +    return qio_channel_readv_all(p->c, p->pages->iov, p->pages->num, errp);
>  }
>  
>  static MultiFDMethods multifd_nocomp_ops = {
> @@ -1099,7 +1098,7 @@ static void *multifd_recv_thread(void *opaque)
>          qemu_mutex_unlock(&p->mutex);
>  
>          if (used) {
> -            ret = multifd_recv_state->ops->recv_pages(p, used, &local_err);
> +            ret = multifd_recv_state->ops->recv_pages(p, &local_err);
>              if (ret != 0) {
>                  break;
>              }
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


