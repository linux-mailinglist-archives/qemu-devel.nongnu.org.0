Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B15F49BD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 21:30:03 +0200 (CEST)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofncA-000858-1H
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 15:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofnWY-0003lf-SQ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofnWU-0007py-OD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664911441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oQPXAILovMvV858LKsnqFpdVjmSYJ8koKGroxlKR/v0=;
 b=BJ1iT5Jv47lQvhrKFJuZ8MiIhKNy1Kj+pC0pNww9HFrUt+ws7YeYqHEFnOVHv4KTE3iDeD
 wloEWuA+qq6jgGqpPEWXZyWIQ4wbJNk94tatOmjLJdrQSnajBjQoFS2DllCS1j7K+2+SdH
 y6Wl7LPnKUqau6zcXmbthb4iHXtAD/k=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-C6QIWcKjMZC9pUcGq4ogRg-1; Tue, 04 Oct 2022 15:24:00 -0400
X-MC-Unique: C6QIWcKjMZC9pUcGq4ogRg-1
Received: by mail-qt1-f197.google.com with SMTP id
 n16-20020ac85b50000000b0035ce9e26eb1so9869150qtw.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=oQPXAILovMvV858LKsnqFpdVjmSYJ8koKGroxlKR/v0=;
 b=FLh3lUo9XunKHyk5Wsv+IdxmcRvMHhBSm2TcBCmO4kFPI0xIxb7kGgbSOX4UTpH9x6
 K54OZzJPWdGaiu/ryrm7/s1VKkye+bX8R/bM8Ko7+U0KkTLsz5W5bYYfU27KMnoqUB+8
 StFcg3uqNByh0M0RnlAwgFZ6aMAkOjyYr77x78J7l28xgVfoTg2DFy2fndB0BLtJOY62
 MFnfTtmZr14CRXraKmmeo49x5+vIVKkIfQsTrKsyaWGLimZWRfXuYNk2CwEdDB0t/Xy/
 gbus+KsXE5E93XyumLgahJjoRCkg4psX6twWSysgzVu45l/8SdSmiXOQO/VEeE/iS9dL
 Hj4g==
X-Gm-Message-State: ACrzQf0J9dYqrQ3ad5fHFw+Kru+7wN+TwmFA+2PwE4r7HhjjkMhrQQhR
 NJ6ccbw3oTgQ+PUTbXKeGumSfigcxKzVYtB607dlZ+uvxFZErPk7mKjS8Qt/xd1M82yNPSBIiLn
 fvNK9OqcjZVMId70=
X-Received: by 2002:ac8:5a86:0:b0:35c:d85f:915e with SMTP id
 c6-20020ac85a86000000b0035cd85f915emr20998682qtc.19.1664911440096; 
 Tue, 04 Oct 2022 12:24:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gD+z2UTtQwMu9eBdjWEksuHBUL1Nf3jbTcAoHxC1f9j2/1dIdoH5Ef4bZnRixPYfkjKuFOA==
X-Received: by 2002:ac8:5a86:0:b0:35c:d85f:915e with SMTP id
 c6-20020ac85a86000000b0035cd85f915emr20998669qtc.19.1664911439854; 
 Tue, 04 Oct 2022 12:23:59 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05620a24cd00b006cbcdc6efedsm14855138qkn.41.2022.10.04.12.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:23:59 -0700 (PDT)
Date: Tue, 4 Oct 2022 15:23:58 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 06/14] migration: Use atomic ops properly for page
 accountings
Message-ID: <YzyITnjOH63AbK2h@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225212.48785-1-peterx@redhat.com>
 <YzxmeMMEq52IDGit@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzxmeMMEq52IDGit@work-vm>
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

On Tue, Oct 04, 2022 at 05:59:36PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > To prepare for thread-safety on page accountings, at least below counters
> > need to be accessed only atomically, they are:
> > 
> >         ram_counters.transferred
> >         ram_counters.duplicate
> >         ram_counters.normal
> >         ram_counters.postcopy_bytes
> > 
> > There are a lot of other counters but they won't be accessed outside
> > migration thread, then they're still safe to be accessed without atomic
> > ops.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> I think this is OK; I'm not sure whether the memset 0's of ram_counters
> technically need changing.

IMHO they're fine - what we need there should be thing like WRITE_ONCE()
just to make sure no register caches (actually atomic_write() is normally
implemented with WRITE_ONCE afaik).  But I think that's already guaranteed
by memset() as the function call does, so we should be 100% safe.

> I'd love to put a comment somewhere saying these fields need to be
> atomically read, but their qapi defined so I don't think we can.

How about I add a comment above ram_counters declarations in ram.c?

> 
> Finally, we probably need to check these are happy on 32 bit builds,
> sometimes it's a bit funny with atomic adds.

Yeah.. I hope using qatomic_*() APIs can help me avoid any issues.  Or
anything concerning?  I'd be happy to test on specific things if there are.

> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!

-- 
Peter Xu


