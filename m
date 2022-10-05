Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EEA5F567F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 16:34:51 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5U2-0000tj-5M
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 10:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1og4qb-0005k9-P0
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1og4qY-000184-Ad
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664978041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ux4ls32Mbt+B6kCEp0HNpcmO/7XCFPQ3rd8nlDr2/74=;
 b=GgqeDhEfGw5BzhvFTL8rdl3hIAUXQT6UollArm1c+ahrH6QCcdNFjvVz3Tl8XptbFsYKCg
 BehMmGhN7ASXqG0NkJTZuL0qNJEDD/rygtJbgQJwfz9vCep4iiIOmmxvcUqwMRwVwfEIRe
 LcpHooZz9WVMGM8mdRfkDvm99V71dFk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-hyG9bKvTN0qDCzyxtqZGeQ-1; Wed, 05 Oct 2022 09:54:00 -0400
X-MC-Unique: hyG9bKvTN0qDCzyxtqZGeQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 u6-20020a05620a430600b006e47fa02576so68102qko.22
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 06:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Ux4ls32Mbt+B6kCEp0HNpcmO/7XCFPQ3rd8nlDr2/74=;
 b=iphpJLHxjeqQSWglH3FkpVhvqkp7YS72r3Dg7TD1RwmunCraI7jeX1Cdwxhm7P4LOX
 +C6gL0dKgnwIHpiD+XYXz6aggh0CXKNlugmhebJgUofSDPrEZ6Y2nrekRKFN50YwW5D6
 hOu9hqqpMsMylH/Umk18cDwF0RmVUQ3uS0j5hRbYvHVV1ESBSC1OMf7LQZEvQSjzvcdj
 6zcLB5cSDmunTxxdWutbPZE1wRWyyDGL7b5+eoy7R/b3UIojlIV1LY92XuyV67x9spSe
 2cTSfR0W5O2IlN33E2Pzy4O7QB/FgpNpaGQ26HYPoMz3uwyFrKCLr4sQ8umv5QDyymJd
 Mxkw==
X-Gm-Message-State: ACrzQf0cykWxEzZflfZb6uIpJfSI835WNqYjBqwiaRQG5MAksQnZgUdB
 CoXW6bBmUTjyPrBb2RCUzWicwVTMMR6yZmeWYyMddKD2FQNyaHfhTyjclEq2yjJ4iLjeVJWXoZZ
 JX/cB1PmsaRu3m9E=
X-Received: by 2002:a05:6214:21c9:b0:4b1:bd8e:7235 with SMTP id
 d9-20020a05621421c900b004b1bd8e7235mr4790450qvh.82.1664978039529; 
 Wed, 05 Oct 2022 06:53:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7y8GAhIe8JgzOWhCrNrF3sGg91mzPHe5I0f2w/IaK04Vauco0e+rCsGWPiOjcc3tliy3D+iw==
X-Received: by 2002:a05:6214:21c9:b0:4b1:bd8e:7235 with SMTP id
 d9-20020a05621421c900b004b1bd8e7235mr4790430qvh.82.1664978039340; 
 Wed, 05 Oct 2022 06:53:59 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a40c900b006bbe6e89bdcsm17567187qko.31.2022.10.05.06.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 06:53:58 -0700 (PDT)
Date: Wed, 5 Oct 2022 09:53:57 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 06/14] migration: Use atomic ops properly for page
 accountings
Message-ID: <Yz2MdboZUHujXcEa@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225212.48785-1-peterx@redhat.com>
 <YzxmeMMEq52IDGit@work-vm> <YzyITnjOH63AbK2h@x1n>
 <Yz1snQobPKt8nGRD@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yz1snQobPKt8nGRD@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 05, 2022 at 12:38:05PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Oct 04, 2022 at 05:59:36PM +0100, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > To prepare for thread-safety on page accountings, at least below counters
> > > > need to be accessed only atomically, they are:
> > > > 
> > > >         ram_counters.transferred
> > > >         ram_counters.duplicate
> > > >         ram_counters.normal
> > > >         ram_counters.postcopy_bytes
> > > > 
> > > > There are a lot of other counters but they won't be accessed outside
> > > > migration thread, then they're still safe to be accessed without atomic
> > > > ops.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > I think this is OK; I'm not sure whether the memset 0's of ram_counters
> > > technically need changing.
> > 
> > IMHO they're fine - what we need there should be thing like WRITE_ONCE()
> > just to make sure no register caches (actually atomic_write() is normally
> > implemented with WRITE_ONCE afaik).  But I think that's already guaranteed
> > by memset() as the function call does, so we should be 100% safe.
> 
> I agree you're probably OK.
> 
> > > I'd love to put a comment somewhere saying these fields need to be
> > > atomically read, but their qapi defined so I don't think we can.
> > 
> > How about I add a comment above ram_counters declarations in ram.c?
> 
> Yeh.
> 
> > > 
> > > Finally, we probably need to check these are happy on 32 bit builds,
> > > sometimes it's a bit funny with atomic adds.
> > 
> > Yeah.. I hope using qatomic_*() APIs can help me avoid any issues.  Or
> > anything concerning?  I'd be happy to test on specific things if there are.
> 
> I just remember hitting problems in the past; especially if we end up
> with trying to do a 64 bit atomic on a platofmr that can only do 32???

I see what you meant... when I was looking in the existing callers of
qatomic_add(), I do find that we seem to have Stat64 just for that
!CONFIG_ATOMIC64 problem.

I'll dig a bit on whether and how we can do that; the thing is these
counters are in the qapi so I need to make sure it can support Stat64
somehow.  Hmm..

-- 
Peter Xu


