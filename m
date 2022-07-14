Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A557499B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:50:50 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvUf-0004I4-S7
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBvLf-0004zC-V6
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBvLd-00062F-L4
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657791689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e6WngOvFnjp1Y23ke9bR2x0k8F6DRTPfoahHHGVF3Wo=;
 b=E71RqEX2RwWi3nyYbF9SmatJraCCp4YcyRSq0O+UQ1worEGmq80M9nYTBaWOEVQmCyfWZ5
 nw6Tt53iEUrLVoDrLwRkHsU1ROcpdwOv2O+eX7Lmw8ujOKDPmK5wrQ0Nr2G996bpo9wTrE
 3u3vmZBfajoNlWs5egz7QHfwD/3vypQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-OA2YwJYyMRalcw1dWIkXBQ-1; Thu, 14 Jul 2022 05:41:25 -0400
X-MC-Unique: OA2YwJYyMRalcw1dWIkXBQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a2f3b04262so1653840wmb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e6WngOvFnjp1Y23ke9bR2x0k8F6DRTPfoahHHGVF3Wo=;
 b=Ak9E+oC5r4iiLzU4HZxSQG61dhX0NkY4Q3iG+Gm8q7MRKMqtTrzNRFe0e7Ie0PaVZc
 HTSb9zloS+i24rh2pXVVZfQWQqFnxu4vvUO8kRGIkJpwVVI1Chysfg9AFmWiGN1nk4fP
 5sy7kUTZafSNpyV833LVW7WgtJdZHqbSe5Sm8xz6gu1Jzm2tQLt7G2RR7pgmvDruO6Dd
 sgoOIMXoeeDzKdngXzOrFG5w7UPJiKp+lq+43TwLG5X11f6aZ/m9qhZY4ifNmHlBbm+o
 sonk9GY9eYtReVph2jKPAHzxZz4ZPZp7drQIrHQiC2a/3e3V8HPgG6KMAMeltSIErOVl
 WTIg==
X-Gm-Message-State: AJIora+3GDE88mBiESSvlECiGKHM1mwPqonWp0vz/cQchcyy6rplD4Qh
 qkJAiqiIdh9mt//hB3HUsZc5E8qT0WyQGDTvtiVVKqM9bXGzDwubub42rFMqlAEFtKtEnXLirxr
 Ap+G+IAK1sMhlvYs=
X-Received: by 2002:a5d:52cb:0:b0:21a:3cc5:f5f4 with SMTP id
 r11-20020a5d52cb000000b0021a3cc5f5f4mr7633646wrv.367.1657791684185; 
 Thu, 14 Jul 2022 02:41:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1txCUoPEFF4b9wOBwllbXoT2yMr+LbWitC/zw2LYsqA/D/ETdVeO5PxTAnekeAXGysUXkB9Uw==
X-Received: by 2002:a5d:52cb:0:b0:21a:3cc5:f5f4 with SMTP id
 r11-20020a5d52cb000000b0021a3cc5f5f4mr7633627wrv.367.1657791683948; 
 Thu, 14 Jul 2022 02:41:23 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm989811wrx.94.2022.07.14.02.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:41:23 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:41:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 01/13] multifd: Document the locking of
 MultiFD{Send/Recv}Params
Message-ID: <Ys/kwfuA2qnsSgVK@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-2-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Reorder the structures so we can know if the fields are:
> - Read only
> - Their own locking (i.e. sems)
> - Protected by 'mutex'
> - Only for the multifd channel
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h | 90 ++++++++++++++++++++++++++-------------------
>  1 file changed, 53 insertions(+), 37 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 4d8d89e5e5..345cfdb50c 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -65,7 +65,9 @@ typedef struct {
>  } MultiFDPages_t;
>  
>  typedef struct {
> -    /* this fields are not changed once the thread is created */
> +    /* Fiields are only written at creating/deletion time */

Other than the typo's that Chen spotted;


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +    /* No lock required for them, they are read only */
> +
>      /* channel number */
>      uint8_t id;
>      /* channel thread name */
> @@ -74,39 +76,47 @@ typedef struct {
>      QemuThread thread;
>      /* communication channel */
>      QIOChannel *c;
> -    /* sem where to wait for more work */
> -    QemuSemaphore sem;
> -    /* this mutex protects the following parameters */
> -    QemuMutex mutex;
> -    /* is this channel thread running */
> -    bool running;
> -    /* should this thread finish */
> -    bool quit;
>      /* is the yank function registered */
>      bool registered_yank;
> +    /* packet allocated len */
> +    uint32_t packet_len;
> +    /* multifd flags for sending ram */
> +    int write_flags;
> +
> +    /* sem where to wait for more work */
> +    QemuSemaphore sem;
> +    /* syncs main thread and channels */
> +    QemuSemaphore sem_sync;
> +
> +    /* this mutex protects the following parameters */
> +    QemuMutex mutex;
> +    /* is this channel thread running */
> +    bool running;
> +    /* should this thread finish */
> +    bool quit;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
> +    /* global number of generated multifd packets */
> +    uint64_t packet_num;
>      /* thread has work to do */
>      int pending_job;
> -    /* array of pages to sent */
> +    /* array of pages to sent.
> +     * The owner of 'pages' depends of 'pending_job' value:
> +     * pending_job == 0 -> migration_thread can use it.
> +     * pending_job != 0 -> multifd_channel can use it.
> +     */
>      MultiFDPages_t *pages;
> -    /* packet allocated len */
> -    uint32_t packet_len;
> +
> +    /* thread local variables. No locking required */
> +
>      /* pointer to the packet */
>      MultiFDPacket_t *packet;
> -    /* multifd flags for sending ram */
> -    int write_flags;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
> -    /* global number of generated multifd packets */
> -    uint64_t packet_num;
> -    /* thread local variables */
>      /* packets sent through this channel */
>      uint64_t num_packets;
>      /* non zero pages sent through this channel */
>      uint64_t total_normal_pages;
> -    /* syncs main thread and channels */
> -    QemuSemaphore sem_sync;
>      /* buffers to send */
>      struct iovec *iov;
>      /* number of iovs used */
> @@ -120,7 +130,9 @@ typedef struct {
>  }  MultiFDSendParams;
>  
>  typedef struct {
> -    /* this fields are not changed once the thread is created */
> +    /* Fiields are only written at creating/deletion time */
> +    /* No lock required for them, they are read only */
> +
>      /* channel number */
>      uint8_t id;
>      /* channel thread name */
> @@ -129,31 +141,35 @@ typedef struct {
>      QemuThread thread;
>      /* communication channel */
>      QIOChannel *c;
> +    /* packet allocated len */
> +    uint32_t packet_len;
> +
> +    /* syncs main thread and channels */
> +    QemuSemaphore sem_sync;
> +
>      /* this mutex protects the following parameters */
>      QemuMutex mutex;
>      /* is this channel thread running */
>      bool running;
>      /* should this thread finish */
>      bool quit;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
> +    /* global number of generated multifd packets */
> +    uint64_t packet_num;
> +
> +    /* thread local variables. No locking required */
> +
> +    /* pointer to the packet */
> +    MultiFDPacket_t *packet;
> +    /* size of the next packet that contains pages */
> +    uint32_t next_packet_size;
> +    /* packets sent through this channel */
> +    uint64_t num_packets;
>      /* ramblock host address */
>      uint8_t *host;
> -    /* packet allocated len */
> -    uint32_t packet_len;
> -    /* pointer to the packet */
> -    MultiFDPacket_t *packet;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
> -    /* global number of generated multifd packets */
> -    uint64_t packet_num;
> -    /* thread local variables */
> -    /* size of the next packet that contains pages */
> -    uint32_t next_packet_size;
> -    /* packets sent through this channel */
> -    uint64_t num_packets;
>      /* non zero pages recv through this channel */
>      uint64_t total_normal_pages;
> -    /* syncs main thread and channels */
> -    QemuSemaphore sem_sync;
>      /* buffers to recv */
>      struct iovec *iov;
>      /* Pages that are not zero */
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


