Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483041F815
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 01:11:26 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWRgb-0003za-2y
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 19:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRZs-0005BG-85
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mWRZq-0001VU-BE
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 19:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633129465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQL7sMSKp3/YqqKBLs898wKtlgiryOFJKUJH6wYBtGo=;
 b=AaPFi+ENYM81H94GBobigRNvHz9AMpDAYf7diGVnZHD+zGVekn7Vxqi+8skFRNcIAYRNr8
 1JAzVNFovMbdXZbPXaCE1EC+8EDRFSSxh54inCdKuk20QwAXQBkukD2RzLQor5ofV336Jo
 uU3K6+YVsbS2oqKGowrK9eQVvOWY1Uk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-WEDygUJlMV2M-Vvbc-Ning-1; Fri, 01 Oct 2021 19:04:24 -0400
X-MC-Unique: WEDygUJlMV2M-Vvbc-Ning-1
Received: by mail-oi1-f200.google.com with SMTP id
 y5-20020aca3205000000b0027644481fe7so7311002oiy.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 16:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQL7sMSKp3/YqqKBLs898wKtlgiryOFJKUJH6wYBtGo=;
 b=mS6BX98WfMg8YFjduUNOKwi7cNYG+GUJ0pGVECmpIgLs6ZjTcokxya6EV6BXojqbSp
 eFrJT/MSbI8kuAu1Tfj8nfW8VFkW/4Di7x/Kj8whiQTKD/A6szqmO6SuJkCnbnBJkPXa
 HStSZQI6VfPc0xbXhso+0zXC/29XPcINd4voBQOsbB+AEQ3ht9WB29Cs2zKcU59Wensj
 1l9Yr494fRPGWbnWzWvPqcYKv+KLBeUQsV4+1LE2eK56SGVTmCPmqoE51rdCdnGT1Iwh
 nAaIaI4XFMvpnPQdyHPbNpfr4xLNzAkKDguQvUC8uZra0t5T75NsVqz/miws/EG5uzxA
 zvzg==
X-Gm-Message-State: AOAM532f1Q/eSiBmOYrRNclfE9y1pZYNo5I3vydmqUt8J7ExbW7Q3sUs
 3o4YDx9BPAKH54L6hApJ+ci8Dz3TIXTazSDmPsRfAPsEUdEunxEf426f8DLEV3sEpQzIeZRoAGf
 rEB45o3ufc1PHaBs=
X-Received: by 2002:a9d:3e5e:: with SMTP id h30mr359009otg.255.1633129463932; 
 Fri, 01 Oct 2021 16:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgqEiLi2zldFhVLAOI6iP3gO2D0Tfra87lrPU2cF1ZgGxt3sqhTwF6SNZh9yM3B4p0icGUyg==
X-Received: by 2002:a9d:3e5e:: with SMTP id h30mr358998otg.255.1633129463751; 
 Fri, 01 Oct 2021 16:04:23 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id g23sm1428570otl.23.2021.10.01.16.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 16:04:23 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:04:22 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v3 8/9] Revert "vfio: Avoid disabling and enabling
 vectors repeatedly in VFIO migration"
Message-ID: <20211001170422.5802c600.alex.williamson@redhat.com>
In-Reply-To: <20210920230202.1439-9-longpeng2@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
 <20210920230202.1439-9-longpeng2@huawei.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sep 2021 07:02:01 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> Commit ecebe53fe993 ("vfio: Avoid disabling and enabling vectors
> repeatedly in VFIO migration") avoid inefficiently disabling and

s/avoid/avoids/

> enabling vectors repeatedly and let the unmasked vectors to be

s/let/lets/  s/to//

> enabled one by one.
> 
> But we want to batch multiple routes and defer the commit, and only
> commit once out side the loop of setting vector notifiers, so we

s/out side/outside/

> cannot to enable the vectors one by one in the loop now.

s/to//

Thanks,
Alex

> 
> Revert that commit and we will take another way in the next patch,
> it can not only avoid disabling/enabling vectors repeatedly, but
> also satisfy our requirement of defer to commit.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 8fe238b11d..2de1cc5425 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -610,9 +610,6 @@ static __attribute__((unused)) void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev
>  
>  static void vfio_msix_enable(VFIOPCIDevice *vdev)
>  {
> -    PCIDevice *pdev = &vdev->pdev;
> -    unsigned int nr, max_vec = 0;
> -
>      vfio_disable_interrupts(vdev);
>  
>      vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
> @@ -631,22 +628,11 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>       * triggering to userspace, then immediately release the vector, leaving
>       * the physical device with no vectors enabled, but MSI-X enabled, just
>       * like the guest view.
> -     * If there are already unmasked vectors (in migration resume phase and
> -     * some guest startups) which will be enabled soon, we can allocate all
> -     * of them here to avoid inefficiently disabling and enabling vectors
> -     * repeatedly later.
>       */
> -    if (!pdev->msix_function_masked) {
> -        for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
> -            if (!msix_is_masked(pdev, nr)) {
> -                max_vec = nr;
> -            }
> -        }
> -    }
> -    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
> -    vfio_msix_vector_release(pdev, max_vec);
> +    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
> +    vfio_msix_vector_release(&vdev->pdev, 0);
>  
> -    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
> +    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
>                                    vfio_msix_vector_release, NULL)) {
>          error_report("vfio: msix_set_vector_notifiers failed");
>      }


