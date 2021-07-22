Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17963D263B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:52:20 +0200 (CEST)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6a3f-00017Q-Sc
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6a2U-00083J-0h
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6a2S-0006vL-IC
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626965464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yxwzf6wDvutQNyQmAOK7VwhpyzPMuO1hyML1FMOpZi4=;
 b=UOnc9VZl5YLOvE6KKBnVJAqVtpEOIhObdDYs9Zf80cbMFBgkkPjKc89a9xNZ5dTOTNr6Q3
 1mq5S/fP3rpX5vGuLPaeeDIKHb6qa4d8pO2a1j2LO493q+wugKLH5fz0kurlIFaOKNFt1s
 PcvTmNuEiyQzqCqETfrswOPpLPD31oA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-eLyA1BqPNGmK5YBBT8c9eQ-1; Thu, 22 Jul 2021 10:51:02 -0400
X-MC-Unique: eLyA1BqPNGmK5YBBT8c9eQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 kj25-20020a0562145299b02902fbda5d4988so3814115qvb.11
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yxwzf6wDvutQNyQmAOK7VwhpyzPMuO1hyML1FMOpZi4=;
 b=HeILT8tzpYvWziO1h3cWeze2o7+YMuFcOuc0wsvcAd2kfBYgwr8KuRHpSHi3V8GPyO
 4yTZsJXTK2i9IBUHEz+rq/yvhXcvjWdDAbEg7JEVpFCranB3N01jiQWbTwHffZVTkfZd
 DNB+4zVFZMoDmcI2ORbsgkVWTK8i988C0pL+642pA53lPUtUTRM9vQaAOF7YekGXeuhZ
 y44jfoYI1hmkCzFStncQyxsSqOZazeFpo0lWcZf423uKmOeAVrMVWhrsZfriIk2FtHzk
 66evvvOJJCfOiZHH7D7ppJwjC8C31nNh4h6f5Q1ucOvkts8kY/tr8csqNTOqPtuHHeOz
 Z0Lw==
X-Gm-Message-State: AOAM533en5iwPHkmCoOGjKAREvK1y4VUTqaCtAku8oupEtUcWdS6gUYQ
 ELmdCAFeX4x+vLOQLkZHwRljIuMtZHKk9GPTkzBpWouwGaoRgAbfEimOaWvsGVu+/XQPtdvy9gN
 VP9q4trW9tJe4ZQw=
X-Received: by 2002:a37:9d12:: with SMTP id g18mr29545qke.457.1626965462378;
 Thu, 22 Jul 2021 07:51:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9Q1vmh92dsTl3wNw9fQkZzx5Owo424UL1PM58pbkCnEqplTBYJgdGO03ahsqEESxS1uCx9g==
X-Received: by 2002:a37:9d12:: with SMTP id g18mr29525qke.457.1626965462200;
 Thu, 22 Jul 2021 07:51:02 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id r4sm10670772qtc.66.2021.07.22.07.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:51:01 -0700 (PDT)
Date: Thu, 22 Jul 2021 10:51:00 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
Message-ID: <YPmF1BAHA059yYln@t490s>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com>
MIME-Version: 1.0
In-Reply-To: <b39f279ef6634325ab2be8d903e41001@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "quintela@redhat.com" <quintela@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 09:57:13AM +0000, Wang, Wei W wrote:
> On Thursday, July 22, 2021 5:48 PM, David Hildenbrand wrote:
> > On 22.07.21 10:30, Wei Wang wrote:
> > > When skipping free pages to send, their corresponding dirty bits in
> > > the memory region dirty bitmap need to be cleared. Otherwise the
> > > skipped pages will be sent in the next round after the migration
> > > thread syncs dirty bits from the memory region dirty bitmap.
> > >
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Reported-by: David Hildenbrand <david@redhat.com>
> > > Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> > > ---
> > >   migration/ram.c | 74
> > +++++++++++++++++++++++++++++++++++++------------
> > >   1 file changed, 56 insertions(+), 18 deletions(-)
> > >
> > 
> > LGTM, thanks
> > 
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > 
> 
> Thanks. Please remember to have a regression test together with Peterx's that patch when you get a chance.

I can continue to try that; but it's slightly low priority to me so it could be
a bit delayed.  If either of you could help that would be great, as I still
don't know last time why I didn't use free-page-hint right (note: I definitely
checked lsmod for sure; so it's there).  So I'll need to figure that out first.

Thanks,

-- 
Peter Xu


