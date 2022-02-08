Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F31B4AD833
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:16:21 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPPw-0004Sc-6b
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:16:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHOqi-0000fm-FK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHOqc-00023O-HZ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644320390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=26hAYo/RAsLRP12ZjtcJtgV1b1Ao/8HeaP8VJVAXN8c=;
 b=adN5E8QH1WB8JGqOVfhYZvRkpFSEk4WzotnIK9N1EeBZLoweaTWf6ArhBpZBZNu2qtrFco
 PSPCD/VCMN5WVUG3pQvLTQb/0k1YY0sGXw+t+96al+gDCeHLrLkjTsZmDPvCqrAD87LX1W
 E4fsqty7mKEMBEv3Y59j5VK2PFj3BdI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-0mTXlnlQO5KIA7ph3qzaBw-1; Tue, 08 Feb 2022 06:39:43 -0500
X-MC-Unique: 0mTXlnlQO5KIA7ph3qzaBw-1
Received: by mail-pj1-f70.google.com with SMTP id
 t16-20020a17090b019000b001b8af627800so1358373pjs.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=26hAYo/RAsLRP12ZjtcJtgV1b1Ao/8HeaP8VJVAXN8c=;
 b=CRaLdeQ8AM09e0xjCURzBux/1XB8eskMxbCGNwN+ICc1A8e28rF7uOLr2MJUh2D+TK
 Whk499oYvUdE6W/oMF2j9OHT0JkaU645zzty+ZhdrR/GrbA/E/0wZNW/ZwOF9e1b0vyZ
 G2dE2Z9wFhJIb3nWOg9SrHdTkyV4OfAxj3rNRuFdvO+tGmxtjh8hXtLwQz66fjiO+tBU
 qkFGzN4vZJmREdZSmq39bpzjXc8bPqMJ7Em0CN7WB5uFCOe97cBI1dRuYXnxBGlcLz90
 ZltSKozADt17fgv91SjK+BejK2+nOy7vEQOxvxr7R2RxRgredzusdgt+RKLeqYw7bMaR
 /leg==
X-Gm-Message-State: AOAM532acG4RIC4gVluXYHJFujOOZxD9OLLzU3+eIMvu/MkNKQpX4j5V
 QBoKb/BtW4FC5DSUHKnxVBMCjFvGfR3K6I9zLTOUU4JDzmHIp1eEPkE/C+Wo6rM8EfLbqZRU5im
 FW7D+ucJ9aBPSpLQ=
X-Received: by 2002:a17:902:bd03:: with SMTP id
 p3mr4219109pls.50.1644320382701; 
 Tue, 08 Feb 2022 03:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCOqdX8817HgzfYtnknNdIVXroIjmhXXiQ715D+jFwfbcvzZWn3BTc7S1BZgl/4mx6xihE2w==
X-Received: by 2002:a17:902:bd03:: with SMTP id
 p3mr4219080pls.50.1644320382351; 
 Tue, 08 Feb 2022 03:39:42 -0800 (PST)
Received: from xz-m1.local ([94.177.118.119])
 by smtp.gmail.com with ESMTPSA id kb11sm2776540pjb.51.2022.02.08.03.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:42 -0800 (PST)
Date: Tue, 8 Feb 2022 19:39:37 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 14/15] migration: Postcopy preemption on separate
 channel
Message-ID: <YgJWeQm3THpv8iG/@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-15-peterx@redhat.com>
 <YfwUvGfE46G1oXOv@work-vm> <YgHv/4Ep4JUhfLB4@xz-m1.local>
 <YgJS3qUuyopB+JFZ@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgJS3qUuyopB+JFZ@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 11:24:14AM +0000, Dr. David Alan Gilbert wrote:
> > The current model is we only have 1 postcopy channel and 1 precopy channel, but
> > it should be easier if we want to make it N post + 1 pre base on this series.
> 
> It's not clear to me if we need to be able to do N post + M pre, or
> whether we have a rule like always at least 1 post, but if there's more
> pagefaults in the queue then you can steal all of the pre channels.

Right, >1 queue length should easily happen with workloads in real cloud
environment.  Though even with only 1post channel we can already hit at least
<~1ms with this series even if there're 16 pending requests per my test.  I
think that may cover quite some real workloads.

One thing to mention is that we should always assume the pre-channels are
filled up with tons of pages already in the NIC send buffer, so they won't be
good candidate for postcopy requests, IMHO.  So I'm not sure whether we can
mixly use the pre/post channels - we may need to leave the post channels idle.

Then, if we keep some of the multifd channels idle, then it will become some
other thing rather than the existing multifd, since we will start to treat
threads and channels differently and break the "equality" rule in the strict
version of multifd world.

> > This also reminded me that, instead of a new capability, should I simply expose
> > a parameter "postcopy-channels=N" to CLI so that we can be prepared with multi
> > postcopy channels?
> 
> I'm not sure we know enough yet about what configuration it would have;
> I'd be tempted to just make it work for the user by enabling both
> multifd and preemption and then using this new mechanism rather than
> having to add yet another parameter.

Let me stick with the current capability bit then, so as to make it 1pre+1post.
And we can leave Npre+1post for later.

Thanks,

-- 
Peter Xu


