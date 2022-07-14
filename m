Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6AA574A92
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:23:49 +0200 (CEST)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBw0a-0002DL-Dh
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBvwy-0007r2-F8
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBvwu-0007eL-VC
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657794000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M4n+oEyGQJD4z+df4hN7FnMA3uEZSQydaDOfO70BU5M=;
 b=dWMWqmOyvI+Bi0r+2T5Eb5l7hZj23i5zxsRc67S7FfqDgzEq5S49omhoPiLWF4CZUJtmOx
 VcRXKVbl7t1V8nYsIWkGEz+HZt+2DESmMcJAGjX7i5xt6T9bwPkQovd0PF+ZECkKGZP9d3
 2TkWsZshdp5rSwBawdror9wSYOYR4yY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-Lb5znIP9O5uMNGHql0_vng-1; Thu, 14 Jul 2022 06:19:58 -0400
X-MC-Unique: Lb5znIP9O5uMNGHql0_vng-1
Received: by mail-wm1-f72.google.com with SMTP id
 h65-20020a1c2144000000b003a2cf5b5aabso2428048wmh.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M4n+oEyGQJD4z+df4hN7FnMA3uEZSQydaDOfO70BU5M=;
 b=Co7ddMgSsSdc/HKFaH7Ly6MqJmy75/E/7vtpX/+LXIL5fPvJYd6Va/JU7TLqSQtFv2
 8RHF6LdpeKkUtInjZzvk1EiTjf7Ho7nS5BgMJymrrW5P518+nrZYSkJSvcbVHLCrwyw7
 orfWhLtkGp8GeT3CXpo6BGyWQem6+aaWZKfOUX8lU+OCCe+Kv9ZwK/Lvcg77zmVicPKs
 r2RANAIJ7k6VW2XBLok+t3fy5zoQo6WojaT3zzwa8zqhg7iJ5ujRNVFnpuRkKJHaqf0d
 aa/9RwrKNUknicr0F60fGUM8xfbEzugc3H83t4mfnNl6SaoFN+D2cWeF1LWc/Xk0QPGo
 aqFA==
X-Gm-Message-State: AJIora+GJVlcSrsREdkF3qWAl1SS+gOdUtn6DkcIt/LFogbXm/fospUi
 ap0ejG+7hXwBlYUYG6hXmWOV4updDAE2o4EDtBUxhQTd1MN4jp6DP6JPMqy03ZucyLwfcONekx3
 MgpUX1j5UbTuLQR0=
X-Received: by 2002:a05:600c:a02:b0:39c:97cc:82e3 with SMTP id
 z2-20020a05600c0a0200b0039c97cc82e3mr14755169wmp.97.1657793997642; 
 Thu, 14 Jul 2022 03:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3ZZReCWqsuHVSocPVraOGTDojpbn8yJTQGseN7mlN1ROoXxb0tXXDa+9zOtZhJfd7fwACvg==
X-Received: by 2002:a05:600c:a02:b0:39c:97cc:82e3 with SMTP id
 z2-20020a05600c0a0200b0039c97cc82e3mr14755152wmp.97.1657793997453; 
 Thu, 14 Jul 2022 03:19:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003a2d47d3051sm1584933wmp.41.2022.07.14.03.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 03:19:56 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:19:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 03/13] multifd: Create page_count fields into both
 MultiFD{Recv,Send}Params
Message-ID: <Ys/tyzlemTIIr9gY@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-4-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-4-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We were recalculating it left and right.  We plan to change that
> values on next patches.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.h | 4 ++++
>  migration/multifd.c | 7 ++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 9e07dd00f4..71f49b4063 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -82,6 +82,8 @@ typedef struct {
>      uint32_t packet_len;
>      /* guest page size */
>      uint32_t page_size;
> +    /* number of pages in a full packet */
> +    uint32_t page_count;
>      /* multifd flags for sending ram */
>      int write_flags;
>  
> @@ -147,6 +149,8 @@ typedef struct {
>      uint32_t packet_len;
>      /* guest page size */
>      uint32_t page_size;
> +    /* number of pages in a full packet */
> +    uint32_t page_count;
>  
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7505aa3412..166246b9b7 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -279,7 +279,6 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  {
>      MultiFDPacket_t *packet = p->packet;
> -    uint32_t page_count = MULTIFD_PACKET_SIZE / p->page_size;
>      RAMBlock *block;
>      int i;
>  
> @@ -306,10 +305,10 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>       * If we received a packet that is 100 times bigger than expected
>       * just stop migration.  It is a magic number.
>       */
> -    if (packet->pages_alloc > page_count) {
> +    if (packet->pages_alloc > p->page_count) {
>          error_setg(errp, "multifd: received packet "
>                     "with size %u and expected a size of %u",
> -                   packet->pages_alloc, page_count) ;
> +                   packet->pages_alloc, p->page_count) ;
>          return -1;
>      }
>  
> @@ -936,6 +935,7 @@ int multifd_save_setup(Error **errp)
>          p->iov = g_new0(struct iovec, page_count + 1);
>          p->normal = g_new0(ram_addr_t, page_count);
>          p->page_size = qemu_target_page_size();
> +        p->page_count = page_count;
>  
>          if (migrate_use_zero_copy_send()) {
>              p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> @@ -1183,6 +1183,7 @@ int multifd_load_setup(Error **errp)
>          p->name = g_strdup_printf("multifdrecv_%d", i);
>          p->iov = g_new0(struct iovec, page_count);
>          p->normal = g_new0(ram_addr_t, page_count);
> +        p->page_count = page_count;
>          p->page_size = qemu_target_page_size();
>      }
>  
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


