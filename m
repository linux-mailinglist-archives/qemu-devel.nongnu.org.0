Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C63F726F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:58:38 +0200 (CEST)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpg5-0000gE-Gg
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIpez-0007oU-3c
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIpex-0003yJ-8v
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629885446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h80mFy4DbrWk92fnPdoix8QMOuEBv4CPJ1yjF8cIvgY=;
 b=E6a5vPS2Ec47hJKLcwGlGFMmtaK8NzrYRY2BWmwVSAh7FK8W446bEQ5mx5QuCY6ESoxrmO
 2iHMppQW8/O6qWCzjr1WFjHMpQmOUalAjhYCTJ+WudDmM6kZ+N3YJEUxmsuH4adpWUlfgI
 Zlq1kbyLPyGgg/JX8+/QE2yP/CANIVk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-CyWFPt7sOJ-m4Tp3MG9phw-1; Wed, 25 Aug 2021 05:57:24 -0400
X-MC-Unique: CyWFPt7sOJ-m4Tp3MG9phw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so1608844wmp.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 02:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h80mFy4DbrWk92fnPdoix8QMOuEBv4CPJ1yjF8cIvgY=;
 b=Pxz7P1v9YDHiQRrO7ym1s+g3Ya3pvF5TtM5W9t9KEXRYz9Zde7MXl2MQZBML8yjGVL
 YDidfPA1L0G4fheDpDyrOg98agR8zAWI+qAmGlSoH33BDCKpoL2YLF7dOyys43qyHJ/q
 sTpAEMYRJdGggBGLEoP4vzfF1SYBBwr1Zio5cylf5iKOLsJEOqwN8SrEqSaPu20LrZVH
 tSZoWQDRrBDRRTgBCmO8vsxkckqj9ICuc3quJU+Gmka7Ci1aFJWy+rYW5unBRcGiT7vs
 ZNfzeNBW8jTVYERkvoJGY4zxMQi4MmlZkULl5jRR9WnA7I/Zy47iUDUEapCbzRphAU3Z
 wuug==
X-Gm-Message-State: AOAM530CWf9hikVW+O5hjtvXF4QDRbZCCvnWlOMLUNOxTTWYLt5X5xd5
 rFfamNrl22pk2/pPVF1Ttpta+sWPS8DtquBS6iBAZW2EMKKkQELw2JAqxpSgvgVqZs5AyFHN5ph
 GIdzJbCOE9aDHGHEr3T7O4FmuAFt69GTXxhursH5sjzqqll4pUoIOgAjqB5HvVFRR
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr17750375wrx.293.1629885443184; 
 Wed, 25 Aug 2021 02:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ059vb2zSkn5qzFtRn0wsHqREyfF5ei5mL+nCo/s048Y/AYOuLShk8cAsvsX0iXz/iqZzdA==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr17750347wrx.293.1629885442956; 
 Wed, 25 Aug 2021 02:57:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f2sm20325107wru.31.2021.08.25.02.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 02:57:22 -0700 (PDT)
Subject: Re: [PATCH 3/5] vfio: defer to enable msix in migration resume phase
To: "Longpeng(Mike)" <longpeng2@huawei.com>, alex.williamson@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-4-longpeng2@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5137d6c9-b917-2bed-cdcf-7b7072632c6c@redhat.com>
Date: Wed, 25 Aug 2021 11:57:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825075620.2607-4-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arei.gonglei@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 9:56 AM, Longpeng(Mike) wrote:
> The vf's unmasked msix vectors will be enable one by one in
> migraiton resume phase, VFIO_DEVICE_SET_IRQS will be called

Typo "migration"

> for each vector, it's a bit expensive if the vf has more
> vectors.
> 
> We can call VFIO_DEVICE_SET_IRQS once outside the loop of set
> vector notifiers to reduce the cost.
> 
> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
> we mesure the cost of the vfio_msix_enable for each one, and

Typo "measure"

> we can see 10% costs can be reduced.
> 
>         Origin          Apply this patch
> 1st     8               4
> 2nd     15              11
> 3rd     22              18
> 4th     24              25
> 5th     36              33
> 6th     44              40
> 7th     51              47
> 8th     58              54
> Total   258ms           232ms
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

What about passing defer_add_virq as boolean argument
to vfio_msix_enable()?

> +        vdev->defer_add_virq = false;
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
> 


