Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA246359BE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 11:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxmwh-00041Z-En; Wed, 23 Nov 2022 05:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxmwb-000419-1X
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxmwR-0004aO-9m
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669199116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mCg9EesVT0fEc3ROiUzyWWpsBSjQ5R+e8M/q8NHXXKw=;
 b=W8kMxviMSETXbeYxWWF0mAtdsZnQUbQbZH/iGZOKSZg442RTqmJFEHgBgvoVS5bAPYi/VE
 8EtKdRCvK0CfExNG+m41OAQk/hnJCjhc6bnj8ioHVftE+/LCeGaR2xf/qN4H188XwjWDC7
 z2/souLslxnQfEPWPnqp1FBBC7o+1uY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-fXMGfs3BNdqrRsR1UHB7lg-1; Wed, 23 Nov 2022 05:25:13 -0500
X-MC-Unique: fXMGfs3BNdqrRsR1UHB7lg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FF6F101AA5B;
 Wed, 23 Nov 2022 10:25:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5CE8492B2D;
 Wed, 23 Nov 2022 10:25:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8198B18003BA; Wed, 23 Nov 2022 11:25:08 +0100 (CET)
Date: Wed, 23 Nov 2022 11:25:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kevin O'Connor <kevin@koconnor.net>
Cc: seabios@seabios.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] be less conservative with the 64bit pci io window
Message-ID: <20221123102508.zagkzmxlk3zdln5c@sirius.home.kraxel.org>
References: <20221121103213.1675568-1-kraxel@redhat.com>
 <20221121103213.1675568-5-kraxel@redhat.com>
 <Y30YREAQZY8twJA/@morn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y30YREAQZY8twJA/@morn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 22, 2022 at 01:43:16PM -0500, Kevin O'Connor wrote:
> On Mon, Nov 21, 2022 at 11:32:13AM +0100, Gerd Hoffmann wrote:
> > Current seabios code will only enable and use the 64bit pci io window in
> > case it runs out of space in the 32bit pci mmio window below 4G.
> > 
> > This patch will also enable the 64bit pci io window when
> >   (a) RAM above 4G is present, and
> >   (b) the physical address space size is known, and
> >   (c) seabios is running on a 64bit capable processor.
> > 
> > This operates with the assumption that guests which are ok with memory
> > above 4G most likely can handle mmio above 4G too.
> 
> Thanks.  In general, the series looks good to me.  Can you elaborate
> on the background to this change though?  It sounds like there is a
> (small) risk of a regression, so I think it would be good to have a
> high level understanding of what is driving this memory reorg.

Well, the idea is to adapt to the world moving forward.  Running a
64-bit capable OS is standard these days, and the resources needed
by devices (especially GPUs) are becoming larger and larger.

Yes, there is the risk that (old) guests are unhappy with their
PCI bars suddenly being mapped above 4G.  Can happen only in case
seabios handles pci initialization (i.e. when running on qemu,
otherwise coreboot initializes the pci bars).  I hope the memory
check handles the 'old guest' case: when the guest can't handle
addresses above 4G it is unlikely that qemu is configured to have
memory mapped above 4G ...

take care,
  Gerd


