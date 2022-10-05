Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275EF5F53DD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 13:44:23 +0200 (CEST)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og2p3-0005uC-QO
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 07:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og2j8-0003zI-HX
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og2j5-00006L-Ab
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664969890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U6EQp7KRECfnFD6ma0Bkic9ExwXSaHB0EMLIMjDMj58=;
 b=aZHjrl8bdNDathyo2oNtRqk22NTqS4D9+neIGz8wxb6mXBuOdv9MiaxgTE5g1PBxCLiysS
 6fzxrvUXct/ru4aiwRdQcoE/ZtE/GlOIxUH26zYZl+I4WoqI2vY4DRbJM2ORJTAz3SiEoZ
 tT97XtXhp0pZjvvg6VApj4owt7DlJYM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-8oMHn2TxPJK4V04LIuH-DQ-1; Wed, 05 Oct 2022 07:38:08 -0400
X-MC-Unique: 8oMHn2TxPJK4V04LIuH-DQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m20-20020adfa3d4000000b0022e2fa93dd1so3183213wrb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 04:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U6EQp7KRECfnFD6ma0Bkic9ExwXSaHB0EMLIMjDMj58=;
 b=eN/q+fXjMxhvJBKkoayvsqMPvabkh964Yo4TC2U85TtYdT34cnOiDJzWMoFt4ZQEBa
 dMyNS2bBlLXrTUWJJNiaYT/PPnsmje+MxJoVP5kGhO3gJILeJA3MVNnIDujNNCB3rtmv
 KiuOed6M5o6jwKhDP1UFsXjb69dCrbmRiz7SGKJ0uK6cKwwDS0JmtpwTwTjsg90o6tMF
 EZvCNfaUKrF601bszCU/eviYSns64T3qVS7lI6e05Mh2ITVdnlkw5adW7L2od/XJJChQ
 ll8exSSJ0c76SWfEg7lLvmcYlAlLRAZgR9O1KsoiSgH9Td9VZhJa7KLLn9NsJjr2cEeC
 AQug==
X-Gm-Message-State: ACrzQf2+PQr6iOZUTlW1+szMSGXtT1vw2qBAxLMaLqWapGogYwsvqhe5
 UZTlUDeLsOkYZAf9rv/IELB6/dmuIqGL0joYIc9CE2gsnf9zPZ33jfP1Kp2lxDYhuw+kaGCJlSK
 Td4foZnpJfO339Y0=
X-Received: by 2002:a05:600c:b47:b0:3b4:8604:410c with SMTP id
 k7-20020a05600c0b4700b003b48604410cmr3032677wmr.51.1664969887794; 
 Wed, 05 Oct 2022 04:38:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4UBU5MRVcOt7f0s/3hdWZbz0R/mptWeV3MKq3S4tek0hfYEF1k/4HYiHu2+DzHeqdtSDkZZg==
X-Received: by 2002:a05:600c:b47:b0:3b4:8604:410c with SMTP id
 k7-20020a05600c0b4700b003b48604410cmr3032669wmr.51.1664969887535; 
 Wed, 05 Oct 2022 04:38:07 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 w17-20020adfd4d1000000b0022b11a27e39sm15108054wrk.1.2022.10.05.04.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 04:38:06 -0700 (PDT)
Date: Wed, 5 Oct 2022 12:38:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 06/14] migration: Use atomic ops properly for page
 accountings
Message-ID: <Yz1snQobPKt8nGRD@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225212.48785-1-peterx@redhat.com>
 <YzxmeMMEq52IDGit@work-vm> <YzyITnjOH63AbK2h@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzyITnjOH63AbK2h@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Oct 04, 2022 at 05:59:36PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > To prepare for thread-safety on page accountings, at least below counters
> > > need to be accessed only atomically, they are:
> > > 
> > >         ram_counters.transferred
> > >         ram_counters.duplicate
> > >         ram_counters.normal
> > >         ram_counters.postcopy_bytes
> > > 
> > > There are a lot of other counters but they won't be accessed outside
> > > migration thread, then they're still safe to be accessed without atomic
> > > ops.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > I think this is OK; I'm not sure whether the memset 0's of ram_counters
> > technically need changing.
> 
> IMHO they're fine - what we need there should be thing like WRITE_ONCE()
> just to make sure no register caches (actually atomic_write() is normally
> implemented with WRITE_ONCE afaik).  But I think that's already guaranteed
> by memset() as the function call does, so we should be 100% safe.

I agree you're probably OK.

> > I'd love to put a comment somewhere saying these fields need to be
> > atomically read, but their qapi defined so I don't think we can.
> 
> How about I add a comment above ram_counters declarations in ram.c?

Yeh.

> > 
> > Finally, we probably need to check these are happy on 32 bit builds,
> > sometimes it's a bit funny with atomic adds.
> 
> Yeah.. I hope using qatomic_*() APIs can help me avoid any issues.  Or
> anything concerning?  I'd be happy to test on specific things if there are.

I just remember hitting problems in the past; especially if we end up
with trying to do a 64 bit atomic on a platofmr that can only do 32???

Dave

> > 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Thanks!
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


