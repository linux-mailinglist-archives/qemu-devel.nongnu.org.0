Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02F45CCBB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:10:12 +0100 (CET)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxel-0006Ru-9V
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:10:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpxKB-0007UH-5Q
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpxK3-0000rT-OL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637779726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cCA+vMBLJcLlRFhvF0lAEZ9zDvfxeGbpwUCYXpaXY6o=;
 b=ANrXKNp/SzU53jJqwORkuYsHwnDanvwRQ9a0+qP4nEmvLSX9206LZ2pMltVatVz+mh9DwC
 jOnB5U8MtR/MSOk/rp7D9a6WYpk71aCYNAQykkhCie4X8GPjn2ZCSCUKl0bQRSME4bJJow
 cJFclT2Q5ZKk4dL1YLyF08sGVl5D4Aw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-R5QCuJ3XPlaOSB_QKL2yrA-1; Wed, 24 Nov 2021 13:48:44 -0500
X-MC-Unique: R5QCuJ3XPlaOSB_QKL2yrA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso713497wrw.10
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cCA+vMBLJcLlRFhvF0lAEZ9zDvfxeGbpwUCYXpaXY6o=;
 b=2GLEViSNM1EFDhDVW4R3SAqXavcfZioCOVRdmQDYe/anbmtz6defhER0FwMzeaomQQ
 b2o3Z15gDVI3amQHWj05XCdbHHqH0tNyghgu5/QwRk/zxaSlDBP+KiXYxGV4UZKxHGnS
 95OVwQ/tjOSIYZobZM9jt6W4JWdHo3CAL9g1AqP1PH8zhUaDVnxrSCcgLtueZYn1245p
 sW/h/eMqi1X7aVVAep9lffhSnWtO5ahkSWN/dC4kCxL1q0KPO/vXW5TcdUVGYVVIxZIw
 /aEePWAZbetPBg4pEOO7nic9v4zYFjXHZukch/2Fwpqin43XTvTWU4Ik3zYI2EOG0RkY
 Hkjw==
X-Gm-Message-State: AOAM531C4whlQcRAwNu1Pk9ZUEpBJOYN0zsBcd1jlg2G1NJ4kyKi+kdm
 fVZkvlo05jUNo5r8oDCgZQv6aF0JhJM0689JU/tSy+d939AAO7fnjcuoxTIGV4ww/ejoXR56lmB
 I1TJhpvFSdQfLWNU=
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr22809869wrz.211.1637779723735; 
 Wed, 24 Nov 2021 10:48:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVSrqo9Aa6MzLBwO8iPy9+g4Bq8jsVsCiYMd+n2aKPAAduM8s9B5LFp0lPj/CF/1Ath7AkOQ==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr22809836wrz.211.1637779723501; 
 Wed, 24 Nov 2021 10:48:43 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id h204sm595944wmh.33.2021.11.24.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 10:48:42 -0800 (PST)
Date: Wed, 24 Nov 2021 18:48:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 01/23] multifd: Delete useless operation
Message-ID: <YZ6JCNdj0G4r3igs@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-2-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-2-quintela@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
> We are divining by page_size to multiply again in the only use.
             ^--- typo
> Once there, impreve the comments.
                  ^--- typo
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

OK, with the typo's fixed:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

but, could you also explain the  x 2 (that's no worse than the current
code); is this defined somewhere in zlib?  I thought there was a routine
that told you the worst case?

Dave
> ---
>  migration/multifd-zlib.c | 13 ++++---------
>  migration/multifd-zstd.c | 13 ++++---------
>  2 files changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index ab4ba75d75..3fc7813b44 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -42,7 +42,6 @@ struct zlib_data {
>   */
>  static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>  {
> -    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
>      struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
>      z_stream *zs = &z->zs;
>  
> @@ -54,9 +53,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>          error_setg(errp, "multifd %d: deflate init failed", p->id);
>          return -1;
>      }
> -    /* We will never have more than page_count pages */
> -    z->zbuff_len = page_count * qemu_target_page_size();
> -    z->zbuff_len *= 2;
> +    /* To be safe, we reserve twice the size of the packet */
> +    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
>      z->zbuff = g_try_malloc(z->zbuff_len);
>      if (!z->zbuff) {
>          deflateEnd(&z->zs);
> @@ -180,7 +178,6 @@ static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>   */
>  static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
>  {
> -    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
>      struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
>      z_stream *zs = &z->zs;
>  
> @@ -194,10 +191,8 @@ static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
>          error_setg(errp, "multifd %d: inflate init failed", p->id);
>          return -1;
>      }
> -    /* We will never have more than page_count pages */
> -    z->zbuff_len = page_count * qemu_target_page_size();
> -    /* We know compression "could" use more space */
> -    z->zbuff_len *= 2;
> +    /* To be safe, we reserve twice the size of the packet */
> +    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
>      z->zbuff = g_try_malloc(z->zbuff_len);
>      if (!z->zbuff) {
>          inflateEnd(zs);
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 693bddf8c9..cc3b8869c0 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -47,7 +47,6 @@ struct zstd_data {
>   */
>  static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
>  {
> -    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
>      struct zstd_data *z = g_new0(struct zstd_data, 1);
>      int res;
>  
> @@ -67,9 +66,8 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
>                     p->id, ZSTD_getErrorName(res));
>          return -1;
>      }
> -    /* We will never have more than page_count pages */
> -    z->zbuff_len = page_count * qemu_target_page_size();
> -    z->zbuff_len *= 2;
> +    /* To be safe, we reserve twice the size of the packet */
> +    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
>      z->zbuff = g_try_malloc(z->zbuff_len);
>      if (!z->zbuff) {
>          ZSTD_freeCStream(z->zcs);
> @@ -191,7 +189,6 @@ static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>   */
>  static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
>  {
> -    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
>      struct zstd_data *z = g_new0(struct zstd_data, 1);
>      int ret;
>  
> @@ -212,10 +209,8 @@ static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
>          return -1;
>      }
>  
> -    /* We will never have more than page_count pages */
> -    z->zbuff_len = page_count * qemu_target_page_size();
> -    /* We know compression "could" use more space */
> -    z->zbuff_len *= 2;
> +    /* To be safe, we reserve twice the size of the packet */
> +    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
>      z->zbuff = g_try_malloc(z->zbuff_len);
>      if (!z->zbuff) {
>          ZSTD_freeDStream(z->zds);
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


