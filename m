Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97E4CA945
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:40:00 +0100 (CET)
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPR56-00033R-1V
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nPR43-0002AT-FR
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:38:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nPR3z-0006QG-CY
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646235530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bLaqf8zZzG+Mk9l9cA2M2oVm1v17+4Q4r3Pv+L0Fb8=;
 b=WWFrjR+fTdyrOzJAxYBXDI+doz11/qgCsJfNymycJL7A4TeHG4DVBwc07gX0fi7FYGa6kx
 Ds8gqDqzPtPBaQGZRydunewH+OzyEeQ25H1hY29ucxWJyse88qdxt27mgKL7xlJBoeXqkP
 u/QARMZOzRgfdhGKnTpv08HKXTULGm4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-Cia_r-P2OpKpYjWYz6kIFw-1; Wed, 02 Mar 2022 10:38:49 -0500
X-MC-Unique: Cia_r-P2OpKpYjWYz6kIFw-1
Received: by mail-ot1-f72.google.com with SMTP id
 38-20020a9d0829000000b005afe328b01dso1479887oty.16
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=2bLaqf8zZzG+Mk9l9cA2M2oVm1v17+4Q4r3Pv+L0Fb8=;
 b=GuounA7kaHcou94m4CllpV8LTcUSdKC/nEXQjZCmDgvKiCgHPuG2B7EtrzTKNDwWar
 KaP1Ug9Vzl7uzxbDy6blOOFfwyVyg0316lLknAhI/NdxzIIrwkHieVHnCEf+m1nZYPTG
 DeWbw3TQvyB9cZ+xtN/nX+4tIu5lx5SSBYpy8AZ4Wixornk32rEzwIFU3m3/FPsl1/2h
 fUJ1xFHhiE8v1lHl+c19mdLmTKAQq7l7sXbEGG6Ehmj/GIwvWcWTsUd3DDfcvibJuWO4
 5Ur8QACDBg2CWqZsdzVxTTzpp8TaHQyxi32P8Braf2iISF1UzVX5auhHcOAyg3r8AGpu
 4X/w==
X-Gm-Message-State: AOAM5339znZmDD/djlW/4oN03dBiUxDtvBXvvIfkAi6sF/99p3nLyxw9
 YUXdeFqOTWmxYCBgvnbRQDQ5qr1xGiXnurQxg/9et57484/ZnSoNqMBAaPHP4OFJjCYQ1kU7BQC
 jiL3gujB/QNSHnsY=
X-Received: by 2002:a05:6830:2908:b0:5ad:1ed7:70ea with SMTP id
 z8-20020a056830290800b005ad1ed770eamr15951706otu.186.1646235528397; 
 Wed, 02 Mar 2022 07:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsq68iTiCIfg5IQs6o2AS7Q9lBJl+mszGsi/lLInLk2Mtj8Nz6mg+OCfT3JRVOvQi0XeGosA==
X-Received: by 2002:a05:6830:2908:b0:5ad:1ed7:70ea with SMTP id
 z8-20020a056830290800b005ad1ed770eamr15951675otu.186.1646235528094; 
 Wed, 02 Mar 2022 07:38:48 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c26-20020a4ae25a000000b0031c268c5436sm7783319oot.16.2022.03.02.07.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 07:38:47 -0800 (PST)
Date: Wed, 2 Mar 2022 08:38:45 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 1/2] Allow returning EventNotifier's wfd
Message-ID: <20220302083845.02433972.alex.williamson@redhat.com>
In-Reply-To: <20220302152342.3hlzw3ih2agqqu6c@mhamilton>
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-2-slp@redhat.com>
 <20220302081234.2378ef33.alex.williamson@redhat.com>
 <20220302152342.3hlzw3ih2agqqu6c@mhamilton>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 16:23:42 +0100
Sergio Lopez <slp@redhat.com> wrote:

> On Wed, Mar 02, 2022 at 08:12:34AM -0700, Alex Williamson wrote:
> > On Wed,  2 Mar 2022 12:36:43 +0100
> > Sergio Lopez <slp@redhat.com> wrote:
> >   
> > > event_notifier_get_fd(const EventNotifier *e) always returns
> > > EventNotifier's read file descriptor (rfd). This is not a problem when
> > > the EventNotifier is backed by a an eventfd, as a single file
> > > descriptor is used both for reading and triggering events (rfd ==
> > > wfd).
> > > 
> > > But, when EventNotifier is backed by a pipefd, we have two file
> > > descriptors, one that can only be used for reads (rfd), and the other
> > > only for writes (wfd).
> > > 
> > > There's, at least, one known situation in which we need to obtain wfd
> > > instead of rfd, which is when setting up the file that's going to be
> > > sent to the peer in vhost's SET_VRING_CALL.
> > > 
> > > Extend event_notifier_get_fd() to receive an argument which indicates
> > > whether the caller wants to obtain rfd (false) or wfd (true).  
> > 
> > There are about 50 places where we add the false arg here and 1 where
> > we use true.  Seems it would save a lot of churn to hide this
> > internally, event_notifier_get_fd() returns an rfd, a new
> > event_notifier_get_wfd() returns the wfd.  Thanks,  
> 
> I agree. In fact, that's what I implemented in the first place. I
> changed to this version in which event_notifier_get_fd() is extended
> because it feels more "correct". But yes, the pragmatic option would
> be adding a new event_notifier_get_wfd().
> 
> I'll wait for more reviews, and unless someone voices against it, I'll
> respin the patches with that strategy (I already have it around here).

I'd argue that adding a bool as an arg to a function to change the
return value is sufficiently non-intuitive to program for that the
wrapper method is actually more correct.  event_notifier_get_fd()
essentially becomes a shorthand for event_notifier_get_rfd().  Thanks,

Alex


