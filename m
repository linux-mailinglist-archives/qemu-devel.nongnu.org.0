Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97E35F6F8C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:43:22 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXiD-00039v-KV
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogXfI-0000fE-6D
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:40:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogXfE-0006oD-Rv
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665088812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pPJ36IUiOXzpVHY7EhDOQBq2+GKNCQQ3zuflTJsV474=;
 b=JyG5cD1HSWUwQSjl025GzPbq95CMX1ZBD/d55O98KnInTSnIPDHfd+047KiNO6yOrcBFXQ
 YutLk4LeEVdfesxdEQwsqrkPNmeYGu3jeLzkyb7NW2Nl9//43whbmVHtiepZavD+zpzIqY
 gF4U3FU04WelXpsaJSfx9/NB5zM9804=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-7EEcs74UPcG5xErg_EC1RA-1; Thu, 06 Oct 2022 16:40:11 -0400
X-MC-Unique: 7EEcs74UPcG5xErg_EC1RA-1
Received: by mail-qk1-f198.google.com with SMTP id
 bp17-20020a05620a459100b006ce7f4bb0b7so2370572qkb.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 13:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPJ36IUiOXzpVHY7EhDOQBq2+GKNCQQ3zuflTJsV474=;
 b=PnNoQgeP9WuNEzQAk9S2vTJ+4YCpGLVVonDPZcglFWrHd/POJL4GRHf1P4CHdOICAN
 eeqouVfSDFZXNTscVuTMcUOACOL1wd60fUgao3Ov0tlsb01bL8/Bt3QljWpJfThvTghM
 x1KShqveRZMtoKZxYyeMMCJCiVfOQBubWr3Qk5fAEraABUpNJBYXAfB9CcqEKXy9f72t
 vTKiwyWg1DwfQ2KicqSt4PJVwgN216A18tuq+lM2WeGXRntM3IAutvExVhW1uUk/j2fP
 rM6a42LHaxRSO3s9DFkWOoHNTwjd/3q2O6JjOYymKThPV4QM/hevn+WJcVDZJ9VoLZSp
 2oaw==
X-Gm-Message-State: ACrzQf1SayDBhrH5fkET8qMuFBwqEcpE7+KOpYv4VQnQzLnte2qD0Vmb
 5Sp2Y3xngGUo0OHtR9jvEG7qht+oOIX3YcAjf9A9dmxzdBYHFffrHCSyGmLLA7hjIgt4319zsyM
 4XbkNlatKWweRhrU=
X-Received: by 2002:a05:6214:e64:b0:4b1:b3ed:8fd7 with SMTP id
 jz4-20020a0562140e6400b004b1b3ed8fd7mr1831771qvb.95.1665088810865; 
 Thu, 06 Oct 2022 13:40:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6b7doQonsvRKHYFyfFyV00oRVqNbIJ6HLPTZjW5uQaV/DiOhc3B5oO3gtiM/jtdht3QOKYmA==
X-Received: by 2002:a05:6214:e64:b0:4b1:b3ed:8fd7 with SMTP id
 jz4-20020a0562140e6400b004b1b3ed8fd7mr1831755qvb.95.1665088810607; 
 Thu, 06 Oct 2022 13:40:10 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05620a298900b006ce3cffa2c8sm88316qkp.43.2022.10.06.13.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 13:40:09 -0700 (PDT)
Date: Thu, 6 Oct 2022 16:40:08 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 06/14] migration: Use atomic ops properly for page
 accountings
Message-ID: <Yz89KMXz+eBGGAs4@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225212.48785-1-peterx@redhat.com>
 <YzxmeMMEq52IDGit@work-vm> <YzyITnjOH63AbK2h@x1n>
 <Yz1snQobPKt8nGRD@work-vm> <Yz2MdboZUHujXcEa@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yz2MdboZUHujXcEa@x1n>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Oct 05, 2022 at 09:53:57AM -0400, Peter Xu wrote:
> On Wed, Oct 05, 2022 at 12:38:05PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > On Tue, Oct 04, 2022 at 05:59:36PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Peter Xu (peterx@redhat.com) wrote:
> > > > > To prepare for thread-safety on page accountings, at least below counters
> > > > > need to be accessed only atomically, they are:
> > > > > 
> > > > >         ram_counters.transferred
> > > > >         ram_counters.duplicate
> > > > >         ram_counters.normal
> > > > >         ram_counters.postcopy_bytes
> > > > > 
> > > > > There are a lot of other counters but they won't be accessed outside
> > > > > migration thread, then they're still safe to be accessed without atomic
> > > > > ops.
> > > > > 
> > > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > 
> > > > I think this is OK; I'm not sure whether the memset 0's of ram_counters
> > > > technically need changing.
> > > 
> > > IMHO they're fine - what we need there should be thing like WRITE_ONCE()
> > > just to make sure no register caches (actually atomic_write() is normally
> > > implemented with WRITE_ONCE afaik).  But I think that's already guaranteed
> > > by memset() as the function call does, so we should be 100% safe.
> > 
> > I agree you're probably OK.
> > 
> > > > I'd love to put a comment somewhere saying these fields need to be
> > > > atomically read, but their qapi defined so I don't think we can.
> > > 
> > > How about I add a comment above ram_counters declarations in ram.c?
> > 
> > Yeh.
> > 
> > > > 
> > > > Finally, we probably need to check these are happy on 32 bit builds,
> > > > sometimes it's a bit funny with atomic adds.
> > > 
> > > Yeah.. I hope using qatomic_*() APIs can help me avoid any issues.  Or
> > > anything concerning?  I'd be happy to test on specific things if there are.
> > 
> > I just remember hitting problems in the past; especially if we end up
> > with trying to do a 64 bit atomic on a platofmr that can only do 32???
> 
> I see what you meant... when I was looking in the existing callers of
> qatomic_add(), I do find that we seem to have Stat64 just for that
> !CONFIG_ATOMIC64 problem.
> 
> I'll dig a bit on whether and how we can do that; the thing is these
> counters are in the qapi so I need to make sure it can support Stat64
> somehow.  Hmm..

I think I can't directly change the qapi MigrationStats to make some of
them to Stat64 since for !ATOMIC_64 systems Stat64 actually takes more than
64 bits space (since we'll need to do the locking with Stat64.lock), so
it'll definitely break the ABI no matter what..

I don't have a better option but introduce another ram_counters_internal to
maintain the fields that need atomic access, declaring as a Stat64 array.
Then we only mirror those values to MigrationStats in QMP queries when
needed.  The mirror will not contain the lock itself so it'll keep the ABI.

Let me know if there's early comment for that, or I'll go with it.  I'll
definitely add some comment for ram_counters to explain the mirror counters
in that case.

Thanks,

-- 
Peter Xu


