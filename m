Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB0408622
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:11:48 +0200 (CEST)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPh47-0001sy-1S
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPh0F-0006qO-Dp
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPh0C-0003gL-Ns
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631520462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MYKYU6cb3Ucab7ZbAB7f6G2EaWRAq5LuR2qkEqDaNs=;
 b=F7csKTvng/nbhfrt3DNk2hTloKF1GLOIbB1qAOT2n216Wdj4XMed7PgdC4OfnzAvtGnAwe
 Mez2YoKBwBSdbprF0ZrFMe5bj+xTTWr9D8WU8KdZ/k7aDkWkMo+nwnG9jY7emhTfHfXJ3d
 L2hH6z5Q5rPdQar4GEr8/9aGo2OtBhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-6BBnIG8yPjWXh1W7yWAZpQ-1; Mon, 13 Sep 2021 04:07:40 -0400
X-MC-Unique: 6BBnIG8yPjWXh1W7yWAZpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC87B1006AA1;
 Mon, 13 Sep 2021 08:07:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AA8619724;
 Mon, 13 Sep 2021 08:07:39 +0000 (UTC)
Date: Mon, 13 Sep 2021 09:07:38 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
Message-ID: <20210913080738.GC26415@redhat.com>
References: <20210912174925.200132-1-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210912174925.200132-1-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 12, 2021 at 10:49:25AM -0700, Richard Henderson wrote:
> With arm32, the ABI gives us 8-byte alignment for the stack.
> While it's possible to realign the stack to provide 16-byte alignment,
> it's far easier to simply not encode 16-byte alignment in the
> VLD1 and VST1 instructions that we emit.
> 
> Remove the assertion in temp_allocate_frame, limit natural alignment
> to the provided stack alignment, and add a comment.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> I haven't seen the assertion with the various arm kernels that I happen
> to have laying about.  I have not taken the time to build the combo
> from the bug report:
> 
> [    0.000000] Linux version 5.14.0-60.fc36.armv7hl (mockbuild@buildvm-a32-12.iad2.fedoraproject.org) (gcc (GCC) 11.2.1 20210728 (Red Hat 11.2.1-1), GNU ld version 2.37-9.fc36) #1 SMP Mon Aug 30 14:08:34 UTC 2021
> 
> I thought about parameterizing this patch further, but I can't think of
> another ISA that would be affected.  (i686 clumsily changed its abi 20
> years ago to avoid faulting on vector spills; other isas so far have
> allowed vectors to be unaligned.)

You should be able to download the Fedora kernel that I am using from
https://koji.fedoraproject.org/koji/packageinfo?packageID=8

I added the patch to Fedora qemu and will do a test build once it
becomes available to build against - currently there's some problem
with new builds not propagating to the new buildroot.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


