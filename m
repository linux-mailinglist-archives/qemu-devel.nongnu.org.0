Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D426F57A1AE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:34:30 +0200 (CEST)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDoIv-0005cT-FF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDoFu-0002e6-1p
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDoFr-0001WA-RO
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658241079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5hbhutJiVBxflDZ0HqkcBD0wROe0NHqHZ9wAGz8B2M=;
 b=cRRBTSfD/5YCraOkwBJsvEkbufNjIb9/W+GD49ifZVF/gIGUpOF5MxfQqON4MPA0EG5uli
 437Wk6SkE5b3Er3em6HIzvXBgXIfvVwpcmUKpVK0nzXBAhW0rOTF8XiksbECMVRiQHATPt
 PhaBB01VgJA0RsvmWAPuffWNGbY/KZA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-E1hygC0OOy6GqORnFkty0Q-1; Tue, 19 Jul 2022 10:31:17 -0400
X-MC-Unique: E1hygC0OOy6GqORnFkty0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 c126-20020a1c3584000000b003a02fa133ceso6873040wma.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=j5hbhutJiVBxflDZ0HqkcBD0wROe0NHqHZ9wAGz8B2M=;
 b=IveAmQAtiq0H57ULmeE2YE/4W4quEsAWuNF3I00fUoUB/NwljRKrJGLaA0hjGLawu7
 Dp7TjnpULu1j7m99MEcSGuXSLXWtj57W79B7aa4CTSxMFu8nzAFqADM2eVQZFjgz/I7o
 qNRL3yNrP22aUScmp6Z9mbXsf+BlfVHL4ClfBZxPPjXDW/BexqRlOInppT649yLulUk3
 fJWiTRtY1Qv3d7pIkSn3nxH+B7QXC83WvMSZWSgi4PUAUIIt1TodeiylBVy/RiLoRl8X
 16/o/67LXsfflyZGuwtVSiC42XvF1KwIYnEzd4d/vCmv9YrU3akCqkFpBD2OnKtpCD4G
 af3w==
X-Gm-Message-State: AJIora/XTdnVcpVsndceF5MPeAr9FUiiwNbWsfEFQwcqZyIn/eFDb1W5
 0+KEh5X40703bCef+7VN5YPgt4+USYyJ0dwYfiF6iuRwX4FMgsFnfJYHrM69hcLYf0HWnajNz0D
 kl7M3qTgBZkGpxms=
X-Received: by 2002:a05:6000:609:b0:21d:92ad:562 with SMTP id
 bn9-20020a056000060900b0021d92ad0562mr25888585wrb.369.1658241075957; 
 Tue, 19 Jul 2022 07:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1taCcPpwuQIuu7l1ajkDBi0feOYm4pAZqpybpHFGoDpLr1AMZ5/+qBxIKkY5lUw3+JWHpZFRQ==
X-Received: by 2002:a05:6000:609:b0:21d:92ad:562 with SMTP id
 bn9-20020a056000060900b0021d92ad0562mr25888567wrb.369.1658241075751; 
 Tue, 19 Jul 2022 07:31:15 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z16-20020adff1d0000000b0021d65675583sm13492096wro.52.2022.07.19.07.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 07:31:15 -0700 (PDT)
Date: Tue, 19 Jul 2022 15:31:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 01/13] multifd: Document the locking of
 MultiFD{Send/Recv}Params
Message-ID: <YtbAMX9PVdEQbMGx@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-2-quintela@redhat.com>
 <MWHPR11MB0031BA225F3B79FBC2CA305E9BA49@MWHPR11MB0031.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR11MB0031BA225F3B79FBC2CA305E9BA49@MWHPR11MB0031.namprd11.prod.outlook.com>
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

* Zhang, Chen (chen.zhang@intel.com) wrote:
> 
> 
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-
> > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Juan Quintela
> > Sent: Tuesday, May 31, 2022 6:43 PM
> > To: qemu-devel@nongnu.org
> > Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>; Philippe Mathieu-
> > Daudé <f4bug@amsat.org>; Yanan Wang <wangyanan55@huawei.com>; Dr.
> > David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
> > <quintela@redhat.com>; Eduardo Habkost <eduardo@habkost.net>; Peter
> > Xu <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
> > Subject: [PATCH v7 01/13] multifd: Document the locking of
> > MultiFD{Send/Recv}Params
> > 
> > Reorder the structures so we can know if the fields are:
> > - Read only
> > - Their own locking (i.e. sems)
> > - Protected by 'mutex'
> > - Only for the multifd channel
> > 
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > ---
> >  migration/multifd.h | 90 ++++++++++++++++++++++++++-------------------
> >  1 file changed, 53 insertions(+), 37 deletions(-)
> > 
> > diff --git a/migration/multifd.h b/migration/multifd.h index
> > 4d8d89e5e5..345cfdb50c 100644
> > --- a/migration/multifd.h
> > +++ b/migration/multifd.h
> > @@ -65,7 +65,9 @@ typedef struct {
> >  } MultiFDPages_t;
> > 
> >  typedef struct {
> > -    /* this fields are not changed once the thread is created */
> > +    /* Fiields are only written at creating/deletion time */
> 
> S/Fiields/Fields

Thanks, I've fixed that up.

> Thanks
> Chen
> 
> > +    /* No lock required for them, they are read only */
> > +
> >      /* channel number */
> >      uint8_t id;
> >      /* channel thread name */
> > @@ -74,39 +76,47 @@ typedef struct {
> >      QemuThread thread;
> >      /* communication channel */
> >      QIOChannel *c;
> > -    /* sem where to wait for more work */
> > -    QemuSemaphore sem;
> > -    /* this mutex protects the following parameters */
> > -    QemuMutex mutex;
> > -    /* is this channel thread running */
> > -    bool running;
> > -    /* should this thread finish */
> > -    bool quit;
> >      /* is the yank function registered */
> >      bool registered_yank;
> > +    /* packet allocated len */
> > +    uint32_t packet_len;
> > +    /* multifd flags for sending ram */
> > +    int write_flags;
> > +
> > +    /* sem where to wait for more work */
> > +    QemuSemaphore sem;
> > +    /* syncs main thread and channels */
> > +    QemuSemaphore sem_sync;
> > +
> > +    /* this mutex protects the following parameters */
> > +    QemuMutex mutex;
> > +    /* is this channel thread running */
> > +    bool running;
> > +    /* should this thread finish */
> > +    bool quit;
> > +    /* multifd flags for each packet */
> > +    uint32_t flags;
> > +    /* global number of generated multifd packets */
> > +    uint64_t packet_num;
> >      /* thread has work to do */
> >      int pending_job;
> > -    /* array of pages to sent */
> > +    /* array of pages to sent.
> > +     * The owner of 'pages' depends of 'pending_job' value:
> > +     * pending_job == 0 -> migration_thread can use it.
> > +     * pending_job != 0 -> multifd_channel can use it.
> > +     */
> >      MultiFDPages_t *pages;
> > -    /* packet allocated len */
> > -    uint32_t packet_len;
> > +
> > +    /* thread local variables. No locking required */
> > +
> >      /* pointer to the packet */
> >      MultiFDPacket_t *packet;
> > -    /* multifd flags for sending ram */
> > -    int write_flags;
> > -    /* multifd flags for each packet */
> > -    uint32_t flags;
> >      /* size of the next packet that contains pages */
> >      uint32_t next_packet_size;
> > -    /* global number of generated multifd packets */
> > -    uint64_t packet_num;
> > -    /* thread local variables */
> >      /* packets sent through this channel */
> >      uint64_t num_packets;
> >      /* non zero pages sent through this channel */
> >      uint64_t total_normal_pages;
> > -    /* syncs main thread and channels */
> > -    QemuSemaphore sem_sync;
> >      /* buffers to send */
> >      struct iovec *iov;
> >      /* number of iovs used */
> > @@ -120,7 +130,9 @@ typedef struct {
> >  }  MultiFDSendParams;
> > 
> >  typedef struct {
> > -    /* this fields are not changed once the thread is created */
> > +    /* Fiields are only written at creating/deletion time */
> > +    /* No lock required for them, they are read only */
> > +
> >      /* channel number */
> >      uint8_t id;
> >      /* channel thread name */
> > @@ -129,31 +141,35 @@ typedef struct {
> >      QemuThread thread;
> >      /* communication channel */
> >      QIOChannel *c;
> > +    /* packet allocated len */
> > +    uint32_t packet_len;
> > +
> > +    /* syncs main thread and channels */
> > +    QemuSemaphore sem_sync;
> > +
> >      /* this mutex protects the following parameters */
> >      QemuMutex mutex;
> >      /* is this channel thread running */
> >      bool running;
> >      /* should this thread finish */
> >      bool quit;
> > +    /* multifd flags for each packet */
> > +    uint32_t flags;
> > +    /* global number of generated multifd packets */
> > +    uint64_t packet_num;
> > +
> > +    /* thread local variables. No locking required */
> > +
> > +    /* pointer to the packet */
> > +    MultiFDPacket_t *packet;
> > +    /* size of the next packet that contains pages */
> > +    uint32_t next_packet_size;
> > +    /* packets sent through this channel */
> > +    uint64_t num_packets;
> >      /* ramblock host address */
> >      uint8_t *host;
> > -    /* packet allocated len */
> > -    uint32_t packet_len;
> > -    /* pointer to the packet */
> > -    MultiFDPacket_t *packet;
> > -    /* multifd flags for each packet */
> > -    uint32_t flags;
> > -    /* global number of generated multifd packets */
> > -    uint64_t packet_num;
> > -    /* thread local variables */
> > -    /* size of the next packet that contains pages */
> > -    uint32_t next_packet_size;
> > -    /* packets sent through this channel */
> > -    uint64_t num_packets;
> >      /* non zero pages recv through this channel */
> >      uint64_t total_normal_pages;
> > -    /* syncs main thread and channels */
> > -    QemuSemaphore sem_sync;
> >      /* buffers to recv */
> >      struct iovec *iov;
> >      /* Pages that are not zero */
> > --
> > 2.35.3
> > 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


