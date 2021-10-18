Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EF431156
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 09:21:20 +0200 (CEST)
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcMxT-0001pt-8y
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 03:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcMvf-00014h-KW
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 03:19:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcMvb-0006We-RN
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 03:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634541560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=47RP6bCHxyS+3P5Ivx8UF//3Viw7VsEYnK8PjdlJCPw=;
 b=gWWa1EhX9dYMmJUG9VxRZOXVO4L0BhmSc0y8iATgmZL2mmxLA1kgYr705bOCxgJQ9QusrJ
 xwkmbqyyBm80UJdNNG068UeNdctAzUuSr0DS4KpNn6TQk8vXJeda7q0m3WXH1vtNeAwp1D
 JTFSSTNP0Is9NjPIgohuIpzpCePBYNw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-3E4UjBtVPwuJAN22RC6Zfw-1; Mon, 18 Oct 2021 03:19:19 -0400
X-MC-Unique: 3E4UjBtVPwuJAN22RC6Zfw-1
Received: by mail-wr1-f70.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso1484275wrj.20
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 00:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=47RP6bCHxyS+3P5Ivx8UF//3Viw7VsEYnK8PjdlJCPw=;
 b=b8bX8XDgzMGyVAZnko8HZwUliP/idHQF5VxDd2AomlM5hqu8yBE7vp/QhGp3p4Ng9E
 cR2ZnyjqNdKTgMg6Koy1bMAMPBwSKCrKgdvsmzKJPd79PVLICWDC5trMDA/VLfFqbNE+
 PYPEF1RTkdI5OigXtsYoIWhDi4Ekj+8ZFOgT2mMN5YrTmTf9Vs/eEvZwsWlJlYtw4rqi
 +dSR4pPavamNLjfoqToiZkTPGuD4AJTQ6/eDuLYtPHTwcuv+3Xg+5GtdcD606g1D+hP3
 vtW7u0jLWZ6CeBsuzUABF/VvuIbXvJlj1UWKoiI7J/6g2803sR8U0LAlWuX1GtFN2spB
 xiVQ==
X-Gm-Message-State: AOAM532qyZjVGYSi/IFXKC4rJ1NLyaWKe8LtTrwBL2/xu3iMLd4X1tS/
 XT6T5GxunT/fq1J/+edHIv5TXfFlP+Cm1qOdy5ZSi4qx+88nrJlMdHT4C4kujnEIoyhnngVGf5V
 1EKQg2bPoH8cysv5MAv/BpQsHGCl5kAwVFQwWL2pyEUIbybsXKOSm5wZp/39OrU93Lg==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr33149911wrs.110.1634541558174; 
 Mon, 18 Oct 2021 00:19:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwng7xkQO2kGcCXGqplWibHb5fqanxhHF3CGAY+ZUYeVrRkwAEehjP6O7fFnpSDf9qBh1cGsg==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr33149873wrs.110.1634541557752; 
 Mon, 18 Oct 2021 00:19:17 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.24.54])
 by smtp.gmail.com with ESMTPSA id l2sm2177885wrs.90.2021.10.18.00.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 00:19:17 -0700 (PDT)
Message-ID: <187a516b-9989-954a-4cab-834379d2a1d8@redhat.com>
Date: Mon, 18 Oct 2021 09:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] failover: fix unplug pending detection
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
References: <20211001082502.1342878-1-lvivier@redhat.com>
In-Reply-To: <20211001082502.1342878-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I don't understand if there are some issues to address to have this patch merged?

Thanks,
Laurent

On 01/10/2021 10:25, Laurent Vivier wrote:
> Failover needs to detect the end of the PCI unplug to start migration
> after the VFIO card has been unplugged.
> 
> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> pcie_unplug_device().
> 
> But since
>      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
> we have switched to ACPI unplug and these functions are not called anymore
> and the flag not set. So failover migration is not able to detect if card
> is really unplugged and acts as it's done as soon as it's started. So it
> doesn't wait the end of the unplug to start the migration. We don't see any
> problem when we test that because ACPI unplug is faster than PCIe native
> hotplug and when the migration really starts the unplug operation is
> already done.
> 
> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>      a99c4da9fc2a ("pci: mark devices partially unplugged")
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> ---
> 
> Notes:
>      v3: add some inlined comments to explain partially_hotplugged and
>          pending_deleted_event
>      v2: move partially_hotplugged to acpi_pcihp_eject_slot()
> 
>   hw/acpi/pcihp.c | 30 +++++++++++++++++++++++++++---
>   1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f610a25d2ef9..30405b5113d7 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -222,9 +222,27 @@ static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slo
>           PCIDevice *dev = PCI_DEVICE(qdev);
>           if (PCI_SLOT(dev->devfn) == slot) {
>               if (!acpi_pcihp_pc_no_hotplug(s, dev)) {
> -                hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> -                hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> -                object_unparent(OBJECT(qdev));
> +                /*
> +                 * partially_hotplugged is used by virtio-net failover:
> +                 * failover has asked the guest OS to unplug the device
> +                 * but we need to keep some references to the device
> +                 * to be able to plug it back in case of failure so
> +                 * we don't execute hotplug_handler_unplug().
> +                 */
> +                if (dev->partially_hotplugged) {
> +                    /*
> +                     * pending_deleted_event is set to true when
> +                     * virtio-net failover asks to unplug the device,
> +                     * and set to false here when the operation is done
> +                     * This is used by the migration loop to detect the
> +                     * end of the operation and really start the migration.
> +                     */
> +                    qdev->pending_deleted_event = false;
> +                } else {
> +                    hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> +                    hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> +                    object_unparent(OBJECT(qdev));
> +                }
>               }
>           }
>       }
> @@ -396,6 +414,12 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>           return;
>       }
>   
> +    /*
> +     * pending_deleted_event is used by virtio-net failover to detect the
> +     * end of the unplug operation, the flag is set to false in
> +     * acpi_pcihp_eject_slot() when the operation is completed.
> +     */
> +    pdev->qdev.pending_deleted_event = true;
>       s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>       acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>   }
> 


