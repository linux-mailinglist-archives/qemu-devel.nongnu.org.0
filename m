Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAA48B8B0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:34:16 +0100 (CET)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NqR-0003N2-EJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:34:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7NK9-0006t2-Vf
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:00:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7NK6-0000w3-QO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641931250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUNMvSln720s32sBcz/xDm1AnZ3PrPsKBFv09g/zTqE=;
 b=HWOp0atvjfzHek0RUHz8QGUBPYNdri7/vMUPA8uPvEuyOUHPyyBxW9UAl7EjrkcgYvVW+H
 1RYxWCIOeh1bZRnSUYE8UkqaIjRHjOJt+3HJWQ+mzgIPC8rmp52YUdrgh6vq5S43u07JPM
 sb6QnPJSjCRgYDnkXSUE/jFx4OCPxfc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-XrW1ryFjNP-15XI3o-cl-w-1; Tue, 11 Jan 2022 15:00:49 -0500
X-MC-Unique: XrW1ryFjNP-15XI3o-cl-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 n25-20020a05600c3b9900b00348b83fbd0dso175878wms.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 12:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pUNMvSln720s32sBcz/xDm1AnZ3PrPsKBFv09g/zTqE=;
 b=oH8ARRSKYyIwE453k4h09dOcF9bdHbCI+cHXE/4bU4jt1lsOE7w8RsRUBxPe9FSESv
 ddkLhfKI7h7ra0Ja3qsRy+/di0BUX5KprVD4sfDBAFT9mi04KA0AJqiPAa1nzz/A139a
 FdwVT8ufg7L4tsgglyFna8yWcfn2pQEQnphCEbfsdG4FMdWbiwN/k2OaqyjFAe1N0akF
 PQc72c3PBFJ/AAjLVfnVBmZ2ThAJf47oeqHOamuntuQnZqytTbpsQxOZiGbM4VhwJdsZ
 xftbRpqK4bn8AGQgfbgG/OZq4vmuAKHEAFIUfIV5R/ZTMW1sxNpPd/xzF5LTEOZJwdiA
 qBjg==
X-Gm-Message-State: AOAM533Cm8uyEvWb5nMgmoPy4N05UhMn+uGASTGrF1b3NbiPxSf3YSoU
 opTbhiDbnFg3KWjnnLCpJX5lFBTdu9BeA3kAM4JG0AyCd31SZfv6DlxWazQ0y8yG085Z4ZTztSC
 4LzFiDSp2kMK3g5c=
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr5179446wrc.686.1641931247892; 
 Tue, 11 Jan 2022 12:00:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0sQC/VCdon+G99H2ZryLRt0cL5IeYSkhBNxP/e108ahK9B3zDneqnY+uYrvl/u0mO52Vaqw==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr5179432wrc.686.1641931247746; 
 Tue, 11 Jan 2022 12:00:47 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f9sm2966555wry.115.2022.01.11.12.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 12:00:47 -0800 (PST)
Date: Tue, 11 Jan 2022 20:00:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 05/23] migration: simplify do_compress_ram_page
Message-ID: <Yd3h7U+cwNin0vez@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-6-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-6-quintela@redhat.com>
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
> The goto is not needed at all.

Another dupe,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index fa49d22e69..422c6bce28 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1341,12 +1341,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>  {
>      RAMState *rs = ram_state;
>      uint8_t *p = block->host + offset;
> -    bool zero_page = false;
>      int ret;
>  
>      if (save_zero_page_to_file(rs, f, block, offset)) {
> -        zero_page = true;
> -        goto exit;
> +        ram_release_page(block->idstr, offset);
> +        return true;
>      }
>  
>      save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
> @@ -1361,12 +1360,8 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>      if (ret < 0) {
>          qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>          error_report("compressed data failed!");
> -        return false;
>      }
> -
> -exit:
> -    ram_release_page(block->idstr, offset);
> -    return zero_page;
> +    return false;
>  }
>  
>  static void
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


