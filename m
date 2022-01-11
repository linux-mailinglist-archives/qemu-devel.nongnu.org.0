Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8119048AF4F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:18:14 +0100 (CET)
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HyX-0002yT-Jy
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:18:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7HLr-0005oi-8n
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:38:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7HLo-0003Z2-P7
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641908292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VAHXfsAdbd4f1SfGvI2iLMrRZiO8zhsVxQ2btKVePYk=;
 b=RDPzIcpdlDamtV5AK/RBTp4bKDmMHSOsdUCpX0tl8QDY5xotm+TI0BwvvYm3msmnxSiqVi
 8gLgkZuXUJCIw6c1xUKb7xU/v11yIlJCpabKLqtFwjWBh4KD2blU01RrG2YLkwxb9ejy5/
 X4qJg5ESeDch4QIM6vidkD/1gIwUqTk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-mNydgj_6Pxe1AckNkf0VTA-1; Tue, 11 Jan 2022 08:38:10 -0500
X-MC-Unique: mNydgj_6Pxe1AckNkf0VTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 s17-20020a7bc0d1000000b00348737ba2a2so1831207wmh.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VAHXfsAdbd4f1SfGvI2iLMrRZiO8zhsVxQ2btKVePYk=;
 b=wys725L86uu/420luMGPR+zVan5gVfc1dicQZD3b8/2wKuypsl7nA5MiIfsrIg0Owc
 a19F35T/so5IJSdYLM3prEldb+VAD5AQYtGx3kl2GXcmyvGpVjCjH0WdEcLy7ADtLdEc
 GlVLyvX3BQkpM7y41+HeBWtw4N+3JcvYMdRpYsmGOh5+/i4hrA4fxRuQ5oZs8kP2hyQh
 rqQxW5ts7X7f+fB7neW804tJ9U2qUb0iiHXg/Mgb61+v/YRIKSfzlu4wWYU2DV0vzkwO
 DOvV1lIeK2DDugTgnFwEgneO6kNHZiWUvPbCD6lAzF16qmxzajoT8HNy/SnoyZDwK70c
 RUHQ==
X-Gm-Message-State: AOAM530s1hdhgFsstc3MDlRe5KLIsd2T8jKIZ8rfRA/BfmbdQ0P/qlbY
 rGgZRoGnFw3xYYNukoGR61vSuVqlNQVu+IySctEoS2PB1t1f3NUqahxdb0lF2nTgpaxym8onTsE
 vEytEv9pDmyglFuM=
X-Received: by 2002:a1c:f012:: with SMTP id a18mr2503648wmb.73.1641908289765; 
 Tue, 11 Jan 2022 05:38:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTr9bO6rxfK17JyOnOjtl2Mkvjl/wSqXRw3KtwkqtgDWcurKLmvgybutr/httBe3FPC/YXsw==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr2503630wmb.73.1641908289582; 
 Tue, 11 Jan 2022 05:38:09 -0800 (PST)
Received: from work-vm (82-132-238-227.dab.02.net. [82.132.238.227])
 by smtp.gmail.com with ESMTPSA id o10sm1959594wmq.31.2022.01.11.05.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:38:09 -0800 (PST)
Date: Tue, 11 Jan 2022 13:38:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 4/6] migration: Remove masking for compression
Message-ID: <Yd2IPjiM8bH1eWxR@work-vm>
References: <20220111124556.4892-1-quintela@redhat.com>
 <20220111124556.4892-5-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111124556.4892-5-quintela@redhat.com>
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Remove the mask in the call to ram_release_pages().  Nothing else does
> it, and if the offset has that bits set, we have a lot of trouble.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Yeh I think that comes from ram_save_target_page which does:
    ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;



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


