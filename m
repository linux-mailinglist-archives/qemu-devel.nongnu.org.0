Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E01528532
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:22:00 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaff-0004Tu-CW
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqaYp-0005K4-DM
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:14:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqaYm-0008Py-DN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652706891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyEI+1Z3FVAAG6OfathKXQFnPmsNgHdueUGZUwmTsh8=;
 b=cbg35uAn303RuP5+9XbhsMzuq0aX3rxgjZh8rLDIRO53fQoHqqJxYNz61+PGcmpbGLOWhG
 U/xJqJ8gEn0U1unzy6gyoFwWpjybkOSV3ULTaa4WI/x2mD9neaIgQxtcxLH6t3/E9lmqEi
 /bhknVrUvKUQwPuDfw0wfi2Ua6VTwPQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-Xu8NKftyP0-IpG_EOOdznA-1; Mon, 16 May 2022 09:14:42 -0400
X-MC-Unique: Xu8NKftyP0-IpG_EOOdznA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso10343458wma.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 06:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iyEI+1Z3FVAAG6OfathKXQFnPmsNgHdueUGZUwmTsh8=;
 b=wZJnkr4Vo+XJB8AUk3+qIB5hpZGiE90CIfaPMR0Eb1DZCo/PPKwNXXR/JbhcJReFwG
 6OQvlaFaNcbCGW9n7rhtJ/jKCUv/j8NYJ/hAWlif0UMLxnLl0997/BNzWMiGqBiD7JQa
 vQUu9R1FksoIiII7KsNmoOIn/D8Ul5uUGXbmfQhce+G1s1DRA9akBgYpaiVPfotetS59
 Yzvc3fT5SkSz4Z9+rDcAP2cGiftnH6hnhcU96p9gWWBwWDBMINxKegCovDGKZPFY91rz
 e3KwCwglV5XVWOzk3zh1w1zb31AjeMutvgOVe0FlLZQ6m/eeM9+CTGKvc99LWqkLmTJC
 akvQ==
X-Gm-Message-State: AOAM530w9uPGxGqTFUiYoO5ZbK9J0qkIi/XPfle/mUzfzQc5H+EBAB/u
 Fk2nryw1nMqtnZ81NQtVpak5greQ08xkEN16FN/gqbm0uVn5Wn7iva09oVUSPpLssApMbZNENLQ
 MFLzHXdOUq+ZP6Wk=
X-Received: by 2002:a05:6000:1e09:b0:20c:dbc7:e391 with SMTP id
 bj9-20020a0560001e0900b0020cdbc7e391mr14221502wrb.218.1652706881546; 
 Mon, 16 May 2022 06:14:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8IEnLvLbyPdHi5exG+nzbwD+2YtW6P0M4KZO2Oo/vAeTp1NBqrJtfGz+JJM+dGzwy/BWZeg==
X-Received: by 2002:a05:6000:1e09:b0:20c:dbc7:e391 with SMTP id
 bj9-20020a0560001e0900b0020cdbc7e391mr14221477wrb.218.1652706881233; 
 Mon, 16 May 2022 06:14:41 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j15-20020adfb30f000000b0020d042efd11sm4856987wrd.61.2022.05.16.06.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:40 -0700 (PDT)
Date: Mon, 16 May 2022 14:14:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v6 01/13] multifd: Document the locking of
 MultiFD{Send/Recv}Params
Message-ID: <YoJOPlRGJFIDcWoN@work-vm>
References: <20220510224220.5912-1-quintela@redhat.com>
 <20220510224220.5912-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510224220.5912-2-quintela@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> Reorder the structures so we can know if the fields are:
> - Read only
> - Their own locking (i.e. sems)
> - Protected by 'mutex'
> - Only for the multifd channel
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h | 86 +++++++++++++++++++++++++++------------------
>  1 file changed, 51 insertions(+), 35 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 7d0effcb03..f1f88c6737 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -65,7 +65,9 @@ typedef struct {
>  } MultiFDPages_t;
>  
>  typedef struct {
> -    /* this fields are not changed once the thread is created */
> +    /* Fiields are only written at creating/deletion time */
> +    /* No lock required for them, they are read only */
> +
>      /* channel number */
>      uint8_t id;
>      /* channel thread name */
> @@ -74,37 +76,45 @@ typedef struct {
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

Is there a way to explain why packet_num, being global, is inside
SendParams?  I understand why num_packets is - because
that's per channel; so why is a global isnide the params
(and having two things with almost the same name is very confusing!)

Dave

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
> @@ -118,7 +128,9 @@ typedef struct {
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
> @@ -127,31 +139,35 @@ typedef struct {
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
> 2.35.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


