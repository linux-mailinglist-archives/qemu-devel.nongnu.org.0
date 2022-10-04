Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510A5F4137
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:58:01 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offce-0005Qi-1G
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1offYy-0001Vj-UW
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1offYx-0004qv-15
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664880850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUHfO2Mh69k9a8osXZXmsb1fwGn2T7H9oRzERsWZ6zg=;
 b=cO/khiTFQfgCpeaJyLiKpMjfwlAAjQTNDaxOs5FINnPHm3A4Be1AghwTWbgBoCl5APWdjd
 L3SXTSiOey4B8fZ4bASPKX2c/6JpCDVm5QoGZ60YSBbjJkEvZNZtwmMddD7o8qmQoZQWpv
 koB7aEBv6uPizqmsJEyuSEu3oWJdHu0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-c3LxKxqRML2KzDYZwmWxgg-1; Tue, 04 Oct 2022 06:54:07 -0400
X-MC-Unique: c3LxKxqRML2KzDYZwmWxgg-1
Received: by mail-wr1-f72.google.com with SMTP id
 e14-20020adf9bce000000b0022d18139c79so3006144wrc.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 03:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PUHfO2Mh69k9a8osXZXmsb1fwGn2T7H9oRzERsWZ6zg=;
 b=6f/RfrpxgW8jU/gRlF7fJ06eG1Q59YZZBbdHtgqOTKnpS18pGuRJd8waIjZAcR6rMW
 4Va/396I4vir7pA2wjnrQfD50wcPJfCIaVM4MMrcRYcYNteFWFyZwzA2zNrYCzFw+I+1
 JHjksfuIqApOnS3+s8Thx5SzVbiUjlBJDZwpdV/+lrJYYSLVy0j3PL1DX2XM9nxGXP7s
 rrSSuoKisKwd6O2mmJpXfwnw1acWaJaDPKYAwCJm8Ki+ILS0qYTqRgbzBOOrDsn4uWjP
 Y2pfTl35y/60O7vFemcaotA12Fu5WS61XMkjjlq/53BYk1FXSJaAHP2hJ8NtQ/Q/WTur
 DLqQ==
X-Gm-Message-State: ACrzQf1l3c7r4xdCNVjgrHFsodJZne9Wro8czjfhjUh4KQuyCPkVjUK2
 iaHYexf8KdRfojKy7pg3LruIsK4+B1eyyuEX5liInqUIvR043PvjTEaIAfLgyK2/guZlBZYz731
 f8A1WJGSIfbiUAeM=
X-Received: by 2002:a7b:c8d5:0:b0:3b4:76bc:5dae with SMTP id
 f21-20020a7bc8d5000000b003b476bc5daemr9859827wml.122.1664880845063; 
 Tue, 04 Oct 2022 03:54:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BP2z6v5bN1grKr6NdyMq1npuOulwCuiDGzFZAtc1gWuFilAe43/etHsrfIfe8pEWe2Si30A==
X-Received: by 2002:a7b:c8d5:0:b0:3b4:76bc:5dae with SMTP id
 f21-20020a7bc8d5000000b003b476bc5daemr9859810wml.122.1664880844828; 
 Tue, 04 Oct 2022 03:54:04 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i16-20020adff310000000b0022e344a63c7sm7512922wro.92.2022.10.04.03.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 03:54:04 -0700 (PDT)
Date: Tue, 4 Oct 2022 11:54:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 04/14] migration: Remove RAMState.f references in
 compression code
Message-ID: <YzwQyty0Ds935+wr@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225106.48451-5-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225106.48451-5-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> Removing referencing to RAMState.f in compress_page_with_multi_thread() and
> flush_compressed_data().
> 
> Compression code by default isn't compatible with having >1 channels (or it
> won't currently know which channel to flush the compressed data), so to
> make it simple we always flush on the default to_dst_file port until
> someone wants to add >1 ports support, as rs->f right now can really
> change (after postcopy preempt is introduced).
> 
> There should be no functional change at all after patch applied, since as
> long as rs->f referenced in compression code, it must be to_dst_file.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yes, I think that's true - although I think we need to add checks to
stop someone trying to enable compression+multifd?



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


> ---
>  migration/ram.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 62ff2c1469..8303252b6d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1461,6 +1461,7 @@ static bool save_page_use_compression(RAMState *rs);
>  
>  static void flush_compressed_data(RAMState *rs)
>  {
> +    MigrationState *ms = migrate_get_current();
>      int idx, len, thread_count;
>  
>      if (!save_page_use_compression(rs)) {
> @@ -1479,7 +1480,7 @@ static void flush_compressed_data(RAMState *rs)
>      for (idx = 0; idx < thread_count; idx++) {
>          qemu_mutex_lock(&comp_param[idx].mutex);
>          if (!comp_param[idx].quit) {
> -            len = qemu_put_qemu_file(rs->f, comp_param[idx].file);
> +            len = qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].file);
>              /*
>               * it's safe to fetch zero_page without holding comp_done_lock
>               * as there is no further request submitted to the thread,
> @@ -1498,11 +1499,11 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
>      param->offset = offset;
>  }
>  
> -static int compress_page_with_multi_thread(RAMState *rs, RAMBlock *block,
> -                                           ram_addr_t offset)
> +static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
>  {
>      int idx, thread_count, bytes_xmit = -1, pages = -1;
>      bool wait = migrate_compress_wait_thread();
> +    MigrationState *ms = migrate_get_current();
>  
>      thread_count = migrate_compress_threads();
>      qemu_mutex_lock(&comp_done_lock);
> @@ -1510,7 +1511,8 @@ retry:
>      for (idx = 0; idx < thread_count; idx++) {
>          if (comp_param[idx].done) {
>              comp_param[idx].done = false;
> -            bytes_xmit = qemu_put_qemu_file(rs->f, comp_param[idx].file);
> +            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file,
> +                                            comp_param[idx].file);
>              qemu_mutex_lock(&comp_param[idx].mutex);
>              set_compress_params(&comp_param[idx], block, offset);
>              qemu_cond_signal(&comp_param[idx].cond);
> @@ -2263,7 +2265,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
>          return false;
>      }
>  
> -    if (compress_page_with_multi_thread(rs, block, offset) > 0) {
> +    if (compress_page_with_multi_thread(block, offset) > 0) {
>          return true;
>      }
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


