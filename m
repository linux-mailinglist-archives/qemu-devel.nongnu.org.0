Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364614449A3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:38:39 +0100 (CET)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miN1q-00030q-CK
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1miN0H-0001Oo-WE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1miN0F-0003et-MK
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635971818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtigDghF2ssUHtOwYSYkoEecxKtrZExnNE2ZBsAjzuI=;
 b=h+DqWM+2U4PrdkrgI2WcBzHWFHlh+2jVGzGqLnLSZB//aK+jLU1cUSqwiaLeFJtcj7kc7W
 N6YUewcBiYBL6ZsPeqbb60WysSafeW8ZktXWBPVPyQ+QL+Pe+Qbk8gQ/ch++wMr2j3sL/Z
 DUvBFdG5U8cS14AZRAM0aDANDS6ne20=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-9iApBpmfNWSzzqhYesxyig-1; Wed, 03 Nov 2021 16:36:53 -0400
X-MC-Unique: 9iApBpmfNWSzzqhYesxyig-1
Received: by mail-ot1-f69.google.com with SMTP id
 c19-20020a056830001300b00546faa88f0cso2060617otp.13
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtigDghF2ssUHtOwYSYkoEecxKtrZExnNE2ZBsAjzuI=;
 b=GHEuXkGdKccP+0xikcJZL0FgZEXDSugRjJfj2X8KH20vc7c+px6RgexFs0FtGrL9GQ
 BdYOB2Ncf9/BKCpMCHurn+zGCa6J6FHLTEKWmsGd6vTpUkUXDNllnrYNJBrB3HxSqXk6
 e11d+Z3hKa5dY4Fw66OxdozWo0EY9uQxYCL/5K0ZrWu78hMOJtXQxPRaXZqjhuyF0qy1
 BLgvwHTKK52gsxE8ZP3GxNnBG79hHMKtcAx+qyk9LLIgO42SCW2cwhsR4TXlXn5p/WAj
 dpftcGMMKn0Rg3cUccZ+hz3ZS8E3vQV2Bm4bSTJ6X85aQO3gWrhCbupEPlM69MgoNeik
 Q62g==
X-Gm-Message-State: AOAM530xA4VgK6lNPRVL+ushyHPrZ3S9igaEd5tqLW87eqzfGtCpKEEX
 +DWVba2RhFaGAOU/vo9GiJdvkD6i6/UXZBuFk4aVNyKDMi+EVa7AoU+3n56nueGpoKppATsN1FR
 vcKKUu8f1L7JoIUw=
X-Received: by 2002:a54:418a:: with SMTP id 10mr12604203oiy.13.1635971813021; 
 Wed, 03 Nov 2021 13:36:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkoiheVRyD2amwXOB0aCJUs9gQuPxdebH6gcLgvPS6LRbKu+PwVo/AOENO7Oo1oPM99MLXrQ==
X-Received: by 2002:a54:418a:: with SMTP id 10mr12604186oiy.13.1635971812798; 
 Wed, 03 Nov 2021 13:36:52 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id bb33sm840332oob.2.2021.11.03.13.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:36:52 -0700 (PDT)
Date: Wed, 3 Nov 2021 14:36:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v5 0/6] optimize the downtime for vfio migration
Message-ID: <20211103143651.6576c0c4.alex.williamson@redhat.com>
In-Reply-To: <20211103081657.1945-1-longpeng2@huawei.com>
References: <20211103081657.1945-1-longpeng2@huawei.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 16:16:51 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> Hi guys,
>  
> In vfio migration resume phase, the cost would increase if the
> vfio device has more unmasked vectors. We try to optimize it in
> this series.
>  
> You can see the commit message in PATCH 6 for details.
>  
> Patch 1-3 are simple cleanups and fixup.
> Patch 4-5 are the preparations for the optimization.
> Patch 6 optimizes the vfio msix setup path.
> 
> Changes v4->v5:
>  - setup the notifier and irqfd in the same function to makes
>    the code neater.    [Alex]

I wish this was posted a day earlier, QEMU entered soft-freeze for the
6.2 release yesterday[1].  Since vfio migration is still an
experimental feature, let's pick this up when the next development
window opens, and please try to get an ack from Paolo for the deferred
msi route function in the meantime.  Thanks,

Alex

[1]https://wiki.qemu.org/Planning/6.2

> 
> Changes v3->v4:
>  - fix several typos and grammatical errors [Alex]
>  - remove the patches that fix and clean the MSIX common part
>    from this series [Alex]
>  - Patch 6:
>     - use vector->use directly and fill it with -1 on error
>       paths [Alex]
>     - add comment before enable deferring to commit [Alex]
>     - move the code that do_use/release on vector 0 into an
>       "else" branch [Alex]
>     - introduce vfio_prepare_kvm_msi_virq_batch() that enables
>       the 'defer_kvm_irq_routing' flag [Alex]
>     - introduce vfio_commit_kvm_msi_virq_batch() that clears the
>       'defer_kvm_irq_routing' flag and does further work [Alex]
> 
> Changes v2->v3:
>  - fix two errors [Longpeng]
> 
> Changes v1->v2:
>  - fix several typos and grammatical errors [Alex, Philippe]
>  - split fixups and cleanups into separate patches  [Alex, Philippe]
>  - introduce kvm_irqchip_add_deferred_msi_route to
>    minimize code changes    [Alex]
>  - enable the optimization in msi setup path    [Alex]
> 
> Longpeng (Mike) (6):
>   vfio: simplify the conditional statements in vfio_msi_enable
>   vfio: move re-enabling INTX out of the common helper
>   vfio: simplify the failure path in vfio_msi_enable
>   kvm: irqchip: extract kvm_irqchip_add_deferred_msi_route
>   Revert "vfio: Avoid disabling and enabling vectors repeatedly in VFIO
>     migration"
>   vfio: defer to commit kvm irq routing when enable msi/msix
> 
>  accel/kvm/kvm-all.c  |  15 ++++-
>  hw/vfio/pci.c        | 176 ++++++++++++++++++++++++++++++++-------------------
>  hw/vfio/pci.h        |   1 +
>  include/sysemu/kvm.h |   6 ++
>  4 files changed, 130 insertions(+), 68 deletions(-)
> 


