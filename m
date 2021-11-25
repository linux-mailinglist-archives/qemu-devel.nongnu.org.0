Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4C45E091
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 19:32:08 +0100 (CET)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqJXT-0004WM-AE
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 13:32:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJWW-0003pU-89
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJWS-0004EQ-7A
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637865062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PAXH3PJhPNZATgy1ArrtX9g4dCv5DZC4d03wq6RtQk=;
 b=cNvdhdI2ndyDPWPPWLAXwx9hQJW/VUKgMkacAAOgaew81oP65ErZyIIASfE8oo0Us7vEUj
 0BFcmO+GS6eQDZyBTGdgaMDr9Sig6r2oej5FvnkL1VKUte14RyHSTtRfvq3YZNa5+gAHK9
 YzBuH+ujhqFWpRz1s3TggV5tfeJ8wlw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-fbukpeiKMPKr5Btf4QLPDA-1; Thu, 25 Nov 2021 13:31:01 -0500
X-MC-Unique: fbukpeiKMPKr5Btf4QLPDA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so3915535wms.6
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 10:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7PAXH3PJhPNZATgy1ArrtX9g4dCv5DZC4d03wq6RtQk=;
 b=jlETkgKgpnG7MFblPN5MgR+wF1ttr61houcdi9PUXRXhwezJZIKf+pyDz2Jvvz+nKV
 zROh0aztYgt+UISJhg9VNUTxWCDeIkZOvUeKAs7lCeMUyLK5MTE1tlf1++GVUu+ET2bg
 uQTDQKCkkHslTgDb1cFXXJf0WexF7h6m7rzU2ROQ+MvLiNZ908xYfUFWUEL19zXxwXNP
 +u21RwfU5qUgKXUa1y8zOWbaCCi62JXjbY0TIKk2PNOdz0q1e1BsVtL/8R7ph5YqtK3V
 NGva+VR36DYXX8wxozp0WlVoLAB7NLnPK0dEi9Cmk8KomZ3Lzrj839T9TXnZjpBoj86D
 2yXg==
X-Gm-Message-State: AOAM533NDnxAXq2m9s5evVlyi1wbWguZOU9fOWEDp0yjVKfYb1JOEox6
 BvuDn07CnyBnZfKA7ro8NlmGt1rdHHtZdj1j3bHla/nl/ixaBa+D1vO4u0kRINqROGRBcmlj2Xe
 LNa2Vr0wM/ghzPno=
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr10004579wmq.195.1637865060160; 
 Thu, 25 Nov 2021 10:31:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeipSvXUXftQOkkMRPUbyKphqD+npEz2XYAKl8UMGR100GY60HEq1mBkwQavLM+62f4e1HZg==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr10004524wmq.195.1637865059887; 
 Thu, 25 Nov 2021 10:30:59 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id s8sm3562200wro.19.2021.11.25.10.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 10:30:59 -0800 (PST)
Date: Thu, 25 Nov 2021 18:30:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 03/23] multifd: Rename used field to num
Message-ID: <YZ/WYX7ss1mcZTAs@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-4-quintela@redhat.com>
 <YZ6Ug+P2YjHndWKK@work-vm> <87a6hsg0d3.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87a6hsg0d3.fsf@secure.mitica>
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
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> We will need to split it later in zero_num (number of zero pages) and
> >> normal_num (number of normal pages).  This name is better.
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  migration/multifd.h |  2 +-
> >>  migration/multifd.c | 38 +++++++++++++++++++-------------------
> >>  2 files changed, 20 insertions(+), 20 deletions(-)
> >> 
> >> diff --git a/migration/multifd.h b/migration/multifd.h
> >> index 15c50ca0b2..86820dd028 100644
> >> --- a/migration/multifd.h
> >> +++ b/migration/multifd.h
> >> @@ -55,7 +55,7 @@ typedef struct {
> >>  
> >>  typedef struct {
> >>      /* number of used pages */
> >> -    uint32_t used;
> >> +    uint32_t num;
> >
> > What does 'used' actually mean here?
> 
> We allocate 128 pages for each "packet".
> But we can ben handled less than that (we are at the end of one
> iteration, the end of a ramblock, ...).
> That is what used mean.
> 
> But later on the series, we enter with normal pages, and zero pages, and
> naming get really confusing.  So, I moved to use *_num for everything.
> 
> Even after all the series, I didn't rename everything on multifd, only
> the fields that I have to use sooner or later.

Hmm OK, I'm not sure 'num' is much better than used, but OK


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


