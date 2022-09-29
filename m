Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7D5EFC04
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:29:16 +0200 (CEST)
Received: from localhost ([::1]:45888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxLX-0002ID-Ob
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1odwXT-0002EC-IT
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:37:31 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:43550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1odwXR-0004FJ-CW
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:37:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24C4161E6D;
 Thu, 29 Sep 2022 16:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50188C433C1;
 Thu, 29 Sep 2022 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664469446;
 bh=hzaL69lrZXN9qsUmhHjQ061m+bkJjCOUB4MV0xP7wCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NF0XqcwGK/lIgQ/kE2OUjjjes4BzMsQnCzlQ5YRZcpgFvi0brjsfadZ7Hq/r7EtaW
 heDcFKfzGdZmNan1XFC1csss5Ht7wzgbAWAarPn/phu38MbsE/nuVQf8h8PvzKW/tI
 Pi68pDwViXBSctMYtvHBsFKAy/2TmP6UuIJ5KCbZp0IkBiCMWAVYIDVJcRX9hwCeor
 s8HkEsNaUSugaZdfNa/4xZ4nY9W4K+CmQYD6vtmlJpYDwGsoY2wXqbHBnKc2CUdB28
 kHMSri3CwFUrS5Wm7mmnzJ0mRNL6thMrkm+Q9iWSbhqxXISE/VL743etQ7SAGxYSwT
 AOyvtOIvp26LQ==
Date: Thu, 29 Sep 2022 10:37:22 -0600
From: Keith Busch <kbusch@kernel.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Kevin Wolf <kwolf@redhat.com>
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
Message-ID: <YzXJwmP8pa3WABEG@kbusch-mbp.dhcp.thefacebook.com>
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
 <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
 <a2825beac032fd6a76838164d4e2753d30305897.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2825beac032fd6a76838164d4e2753d30305897.camel@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Thu, Sep 29, 2022 at 07:16:29PM +0300, Maxim Levitsky wrote:
> On Thu, 2022-09-29 at 09:48 -0600, Keith Busch wrote:
> > I am aware, and I've submitted the fix to qemu here:
> > 
> >   https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00398.html
> > 
> 
> 
> Thanks for quick response!
> 
> Question is though, isn't this an kernel ABI breakage?

I don't think so. Memory alignment and length granularity are two completely
different concepts. If anything, the kernel's ABI had been that the length
requirement was also required for the memory alignment, not the other way
around. That usage will continue working with this kernel patch.

