Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF651FF5C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:17:27 +0200 (CEST)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4CU-0006vi-Ee
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no49v-0005CV-M7
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no49t-0000Sc-2E
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652105684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glyyTyjV/0s/fAdivoI0oqS+328roGbNnE9fZpQWKZ0=;
 b=X485mJwQNzOVlQnxslaHwcBbUeDq54Zx+9LHqV0zznufALI1eOL4ob1rMgC0DfgifyvuAt
 AXuBLaoC2lGyrzlZ17s7mzWOnXgG6OClLNMbdmnf7sGqZN86u/qaHzNgGsJvle9zc7+Ll1
 Cy1FTHi+EEq2I/XM2g3WDqg6Emn/zXM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-waMYiENZO0KpQkOIF3LB6A-1; Mon, 09 May 2022 10:14:41 -0400
X-MC-Unique: waMYiENZO0KpQkOIF3LB6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so38146wmn.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 07:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=glyyTyjV/0s/fAdivoI0oqS+328roGbNnE9fZpQWKZ0=;
 b=ETdNkLJCDbKREm6rb9KDNGm0JGHwN6fz4ibcJfZL8aNn824TZ5IAhyqTt1fnCeQzeZ
 91sm3lizl0RijLpFti1Te9QfkLNDejdFvxACZ5yQDnHo0cZPDYDNYdaeBs2ZFtRYCQK6
 xX48GOwPNpcTiAxq9u0m1/UxUdUbDXmReXEw/1VdAg5bDxkDMoieDWBspdaF2TZfVBxQ
 /GJOzxYavQ58B/pYn4t2Pk6rMHFhG/ZODKub8Ifbttr4R2BGpEwcR/za1HES0m2xjkJW
 5HksPdefBowpU58N952ZMW8cYt0l0gTMNc+SFFzs5PD40ITsZ4LjIE3r8hm1Wc5buJ0k
 kEWQ==
X-Gm-Message-State: AOAM533Yo0bM1zFHvDtAKx7h3hpxyUmCSKxRoyUKNVif9ytXQe1Dbv0t
 An5ipFje3HRm8tjqFyQwvh3cZKBZ7E+ACE2phga+RzT9VgySnzhhZmUzhGRKSBIRptKexhrEqal
 U4qpy+ZkkUzXht1o=
X-Received: by 2002:a05:600c:4f90:b0:394:970a:71bd with SMTP id
 n16-20020a05600c4f9000b00394970a71bdmr2508376wmq.158.1652105680438; 
 Mon, 09 May 2022 07:14:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySap1oPZ4ztSAwjfRQheNrbIqofOIicA/ZDf63XsBmCtVbWYzJ98AJ56SzbMyTWAT/Fz5NtA==
X-Received: by 2002:a05:600c:4f90:b0:394:970a:71bd with SMTP id
 n16-20020a05600c4f9000b00394970a71bdmr2508362wmq.158.1652105680288; 
 Mon, 09 May 2022 07:14:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f186-20020a1c38c3000000b003942a244ec9sm15262052wma.14.2022.05.09.07.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:14:39 -0700 (PDT)
Date: Mon, 9 May 2022 15:14:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v12 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnkhzRGqZVwwIsLt@work-vm>
References: <20220507015759.840466-1-leobras@redhat.com>
 <20220507015759.840466-3-leobras@redhat.com>
 <YnbEuH3nmSUCQ4ao@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnbEuH3nmSUCQ4ao@xz-m1.local>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> On Fri, May 06, 2022 at 10:57:54PM -0300, Leonardo Bras wrote:
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index 05c425abb8..f03a068f25 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -25,9 +25,18 @@
> >  #include "io/channel-watch.h"
> >  #include "trace.h"
> >  #include "qapi/clone-visitor.h"
> > +#ifdef CONFIG_LINUX
> > +#include <linux/errqueue.h>
> > +#include <sys/socket.h>
> > +
> > +#if (defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY))
> > +#define QEMU_MSG_ZEROCOPY
> > +#endif
> > +#endif
> >  
> >  #define SOCKET_MAX_FDS 16
> >  
> > +
> 
> This line can be dropped when merge.

Done

> >  SocketAddress *
> >  qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
> >                                       Error **errp)
> 
> This does look nicer, imho. :)
> 
> Thanks!
> 
> -- 
> Peter Xu
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


