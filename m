Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5875147DF65
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 08:15:36 +0100 (CET)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0IK6-0004zL-VW
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 02:15:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n0IGO-0003tf-2u
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n0IGL-0002yf-7F
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640243500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N3Vjs3zpLdVTlTtJIiXX784UvAkAvDg6iQmvzeee0wA=;
 b=WK8wHzidDkt9QaZQsyZnZwQZpM3V7Mmqy93SI93qtXEd8/4ug/9cbxlPUHDMrHZYK5jkZ8
 27dBXRov0kcveGi1R1drBUx7ID2aIZHZNVboGnPvVffA8eazjp+zMGeNNW6HjFDmMD4kyT
 897Mv062ilNnYMLmNgXOIVFk0LoDw8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-cCTv6uLgOEqzdFR6dA-0iw-1; Thu, 23 Dec 2021 02:11:37 -0500
X-MC-Unique: cCTv6uLgOEqzdFR6dA-0iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D99936393;
 Thu, 23 Dec 2021 07:11:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A975D9329;
 Thu, 23 Dec 2021 07:11:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB7D118003B6; Thu, 23 Dec 2021 08:11:32 +0100 (CET)
Date: Thu, 23 Dec 2021 08:11:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20211223071132.fpbyug2afss4jdjd@sirius.home.kraxel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
 <20211220174502-mutt-send-email-mst@kernel.org>
 <20211221093656.0d30644e.alex.williamson@redhat.com>
 <20211221183400-mutt-send-email-mst@kernel.org>
 <20211222120809.3f28f44b.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211222120809.3f28f44b.alex.williamson@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > > So I am not sure how to fix the assignment issues as I'm not sure how do
> > > > they trigger, but here is a wild idea: maybe it should support an API
> > > > for starting reset asynchronously, then if the following access is
> > > > trying to reset again that second reset can just be skipped, while any
> > > > other access will stall.  
> > > 
> > > As above, there's not a concurrency problem, so I don't see how an
> > > async API buys us anything.  
> > 
> > Well unplug resets the device again, right? Why is that reset not
> > problematic and this one is?
> 
> It has the same issue, but there's no log message generated that
> worries QE into marking this as a regression.  Obviously the ideal
> outcome would be that we could reset the device under these conditions,
> but to this point we've only managed to introduce "try" semantics to
> the functions to prevent deadlock.  As this is a condition induced by
> corner case admin device handling, we've so far considered the reset
> failure acceptable.  Thanks,

Maybe it makes sense to move the check for pending removal into the vfio
reset handler then, and either skip logging an error or skip reset
altogether?

take care,
  Gerd


