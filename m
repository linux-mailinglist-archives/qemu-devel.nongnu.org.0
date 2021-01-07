Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C32ED74D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:13:46 +0100 (CET)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxajB-0004lc-Sq
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxahr-0004IK-Rx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxahq-0004RC-FY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610046741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2CIy71IVq1uJvvvIt+n5S8SiGDEk5CVoRJ6DUbDmLQ=;
 b=UdVjQJmF5jFM0zpW0TUOUqHJlTdvaRniYZyiWzdsI/LucSkRqMnSSi8vEV8VMoWyuois7f
 A4ElZM7QoI4VqRNDVKgaA00YkLZbVKLmCTbzoG7dPPQqhu6SSVZJx60PtA5xzPAsnlHevw
 kvyo0ASUTMxmavZ4exmhTNaS0j2EiSM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-_7Vg-DqfPnSfe7YjKf0KTg-1; Thu, 07 Jan 2021 14:12:15 -0500
X-MC-Unique: _7Vg-DqfPnSfe7YjKf0KTg-1
Received: by mail-qk1-f197.google.com with SMTP id 189so7032857qko.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S2CIy71IVq1uJvvvIt+n5S8SiGDEk5CVoRJ6DUbDmLQ=;
 b=r6BeThtOJvt6FD5PfpUhYxomJNDItFzFkrCiS0wNbXkgbMcHX3KUbBLRycZOcSPR2f
 TLqIdYZI1/vA/+8wA6k6eiJFWSv17F67/YUNMR99iLwC5XEEV4xM8/bc/mDyLJ3xVtxg
 NHBpr1FaQpC78epEuFhLovXqkEAC1Yz3SjhFAYfunmSlq0wooplpQ+o4O7I9p92wosgb
 wzjSEX2fpNHsLt9dgEva67t5Vy1p9recMsCZ5uIyvu+DBdpiytlara7haRJfIGjvfNBI
 0UTUgO0RLSjEwJvUCM3U8UH9Kaml+i3T5L+B7dvr7K9pCwf5G42IBX1nzkE1Z/1iH3Xc
 Kc1w==
X-Gm-Message-State: AOAM531yc6mxgqavKX4gSNxPTk0EJYuP0+WI27NIbu6YEs5WC1uyDnEr
 5KAZdbD6VFmmNeH0sJL4/GBLxduNplDXUa6hslHqnurqgcYDORPZ50ATEP7mklUr+0a0zM/7dup
 BgVSKG7/0+MmPlJs=
X-Received: by 2002:ac8:5515:: with SMTP id j21mr72864qtq.330.1610046735213;
 Thu, 07 Jan 2021 11:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDIsE+WQOwZ7bbnhSdAYWZjm3EFAP0nJ94ZmYVFd7ubpglXuxqKn/wUrKoRzXNVgVhlrI6nQ==
X-Received: by 2002:ac8:5515:: with SMTP id j21mr72828qtq.330.1610046734962;
 Thu, 07 Jan 2021 11:12:14 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id w33sm3413149qth.34.2021.01.07.11.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 11:12:14 -0800 (PST)
Date: Thu, 7 Jan 2021 14:12:12 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] update-linux-headers: Include const.h
Message-ID: <20210107191212.GB355967@xz-x1>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-2-farman@linux.ibm.com>
 <20210106190345.GJ149908@xz-x1>
 <9fcc99ca-aa60-2249-dfc5-bf0018b3ddb0@linux.ibm.com>
 <CAFEAcA_eeHNBzgUFmYXO3-n8SWeTsM_jJUB=-u-BTu7gqhvDqQ@mail.gmail.com>
 <cfbc49a9-9377-49d6-3c1d-b97c5e3ed2bf@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <cfbc49a9-9377-49d6-3c1d-b97c5e3ed2bf@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 12:50:34PM -0500, Eric Farman wrote:
> 
> 
> On 1/7/21 12:05 PM, Peter Maydell wrote:
> > On Thu, 7 Jan 2021 at 16:52, Eric Farman <farman@linux.ibm.com> wrote:
> > > On 1/6/21 2:03 PM, Peter Xu wrote:
> > > > Could I ask why the const.h is installed into include/standard-headers/linux
> > > > rather than linux-headers/linux?  When I was working on my version I failed to
> > > > figure out the difference.
> > > 
> > > Considering the main difference is whether the header file is copied
> > > directly or edited with a bunch of substitutions, and const.h doesn't
> > > get modified by those substitutions, I suppose it could go in
> > > linux-headers itself.
> > 
> > No, it can't, because linux-headers/ only goes on the include
> > path when on a Linux host and on a CPU architecture with KVM support,
> > whereas include/standard-headers/ headers are available and
> > used on all host OSes/architectures.
> > 
> > Because include/standard-headers/linux/ethtool.h will end up
> > with a line
> >   #include "standard-headers/linux/const.h"
> > we need to provide a const.h in that location so that the #include
> > pulls in the file correctly.
> 
> Ah, today I learned.  Thanks, Peter.

Yeah.  Peter taught me the rules on IRC after I posted the email, and I didn't
update later.  So I guess my r-b stands. :) Thanks,

-- 
Peter Xu


