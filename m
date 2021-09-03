Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E64007B5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 00:00:37 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMHEi-0006Xh-Nd
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 18:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHBD-0001Sj-A9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHBB-00065b-Kw
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630706217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1VNjH+WM2xAwI/FTgQJkB7OHmBa+/Rj4l+3kjgXLg3Y=;
 b=idB/hIRTlauId2/00zL4iI1i+xWCbGSx1XymieqVVrDj15+mzK2rwBp9/Qad/C1qMTldGp
 u9CHD1NXo6u3zKFGnMAMDFYcX3keLZra3QUN66dxJwwMrYQ0RvERLfjEkRyoWgaK9wSuan
 3a+7p4dlM4o76caPgQ5wYSgdKrPGCAY=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-ohdsc4ToPeiHN1Nt14cU4Q-1; Fri, 03 Sep 2021 17:56:56 -0400
X-MC-Unique: ohdsc4ToPeiHN1Nt14cU4Q-1
Received: by mail-oi1-f197.google.com with SMTP id
 u23-20020acaab17000000b0026857819b52so374136oie.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=1VNjH+WM2xAwI/FTgQJkB7OHmBa+/Rj4l+3kjgXLg3Y=;
 b=JdOZ70W6ji9B4gxdYmSfHyDrGchnK2l/hvL4iCThnFYrDSm98I5kZX3jaLfbrGWJJt
 kQetuSChrb30HeiL4NNz+Y8fPJGxyXZ3atKTypIyXyAOOMjB3nPB2Rp3L2jCyonNA/rC
 1N/VGB16JfAbx6oOPZZrUh5LFMX+w5WCMuAucmMl5oFsTzUJFTDyMMyN0Wj+swagJ10b
 P+6Ezc9BiAOxrXBrC+ewXthVTdAiAFObKV8LLNp2+CQft6Vk9V6aAaBi+Tx1YOAKLl3g
 Wa/JbuLXNIXf672isweZo3RU239Rl5CpHqqJDBvc7ibkmnXCii07vovEbkyCbBeaddoR
 /wng==
X-Gm-Message-State: AOAM532OWk+JWCe8f+vTQmwKRfvRtsvMRmm/6WrlC02H4ayRoQV69J2p
 V/qXSJwQzDxrDaG0PL4RMR2BiShx74pRYxUsSpRQqrSDRMdZ7+n+N5ShPZmEqYbyxfsqPJfU4qY
 k7V02zm6wch6ctXc=
X-Received: by 2002:a05:6830:12d7:: with SMTP id
 a23mr1004526otq.102.1630706215290; 
 Fri, 03 Sep 2021 14:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnFbD3jS+ol6X94ve13c76yzFrTt1mMyO/HUKL5TG+KfnILmeU3KVakhyNz3Tv6GsJ2+RHnw==
X-Received: by 2002:a05:6830:12d7:: with SMTP id
 a23mr1004513otq.102.1630706215059; 
 Fri, 03 Sep 2021 14:56:55 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id o26sm129523otk.77.2021.09.03.14.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:56:54 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:56:53 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH 3/5] vfio: defer to enable msix in migration resume phase
Message-ID: <20210903155653.789bdeb0.alex.williamson@redhat.com>
In-Reply-To: <20210825075620.2607-4-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-4-longpeng2@huawei.com>
Organization: Red Hat
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 15:56:18 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> The vf's unmasked msix vectors will be enable one by one in
> migraiton resume phase, VFIO_DEVICE_SET_IRQS will be called
> for each vector, it's a bit expensive if the vf has more
> vectors.
> 
> We can call VFIO_DEVICE_SET_IRQS once outside the loop of set
> vector notifiers to reduce the cost.
> 
> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
> we mesure the cost of the vfio_msix_enable for each one, and
> we can see 10% costs can be reduced.
> 
>         Origin          Apply this patch

Original?

> 1st     8               4
> 2nd     15              11
> 3rd     22              18
> 4th     24              25
> 5th     36              33
> 6th     44              40
> 7th     51              47
> 8th     58              54
> Total   258ms           232ms

If the values here are ms for execution of vfio_msix_enable() per VF,
why are the values increasing per VF?  Do we have 65 vectors per VF or
do we have 65 vectors total, weighted towards to higher VFs?
This doesn't make sense without the data from the last patch in the
series.

> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 22 ++++++++++++++++++++++
>  hw/vfio/pci.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7cc43fe..ca37fb7 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -372,6 +372,10 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>      int ret = 0, i, argsz;
>      int32_t *fds;
>  
> +    if (!vdev->nr_vectors) {
> +        return 0;
> +    }

How would this occur?  Via the new call below?  But then we'd leave
vfio_msix_enabled() with MSI-X DISABLED???

> +
>      argsz = sizeof(*irq_set) + (vdev->nr_vectors * sizeof(*fds));
>  
>      irq_set = g_malloc0(argsz);
> @@ -495,6 +499,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>          }
>      }
>  
> +    if (vdev->defer_add_virq) {
> +        vdev->nr_vectors = MAX(vdev->nr_vectors, nr + 1);
> +        goto clear_pending;
> +    }

This is a really ugly use of 'goto' to simply jump around code you'd
like to skip rather than reformat the function with branches to
conditionalize that code.  Gotos for consolidated error paths, retries,
hard to break loops are ok, not this.


> +
>      /*
>       * We don't want to have the host allocate all possible MSI vectors
>       * for a device if they're not in use, so we shutdown and incrementally
> @@ -524,6 +533,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>          }
>      }
>  
> +clear_pending:
>      /* Disable PBA emulation when nothing more is pending. */
>      clear_bit(nr, vdev->msix->pending);
>      if (find_first_bit(vdev->msix->pending,
> @@ -608,6 +618,16 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>      if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
>                                    vfio_msix_vector_release, NULL)) {
>          error_report("vfio: msix_set_vector_notifiers failed");
> +        return;
> +    }
> +
> +    if (!pdev->msix_function_masked && vdev->defer_add_virq) {
> +        int ret;
> +        vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
> +        ret = vfio_enable_vectors(vdev, true);
> +        if (ret) {
> +            error_report("vfio: failed to enable vectors, %d", ret);
> +        }
>      }
>  
>      trace_vfio_msix_enable(vdev->vbasedev.name);
> @@ -2456,7 +2476,9 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>      if (msi_enabled(pdev)) {
>          vfio_msi_enable(vdev);
>      } else if (msix_enabled(pdev)) {
> +        vdev->defer_add_virq = true;
>          vfio_msix_enable(vdev);
> +        vdev->defer_add_virq = false;


Ick.  Why is this a special case for vfio_msix_enable()?  Wouldn't we
prefer to always batch vector-use work while we're in the process of
enabling MSI-X?  

>      }
>  
>      return ret;
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 6477751..4235c83 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -171,6 +171,7 @@ struct VFIOPCIDevice {
>      bool no_kvm_ioeventfd;
>      bool no_vfio_ioeventfd;
>      bool enable_ramfb;
> +    bool defer_add_virq;
>      VFIODisplay *dpy;
>      Notifier irqchip_change_notifier;
>  };


