Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A641D650
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:27:06 +0200 (CEST)
Received: from localhost ([::1]:38074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsLJ-00059U-4Z
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mVsJM-0004Nf-Oq
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:25:04 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mVsJL-0002LR-0x
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:25:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id r7so3744071pjo.3
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8IwfzeEf+LmGGerYqAqOMUZuItJo9T69cJehetlEMtg=;
 b=6skKT6BQipjfEZ21qC3kVBp0xZZUYcKukwcTHlKbET9oxRrL4eslA/sqBsx5Zbh7UC
 jqVkLiW5bDAE9tfsqYN1CR8r/v/S9Hu+PW5IdP7jFHIafdWW1lpQqvble+MPqB9FOsCX
 BODGjlmf9wuvNCd35WAJgJb0H5uQsRFjIEWkY1GLEd7h+v7PmdqJ6elIjikDtOdfteOu
 sOk9y95mZZDoXCDuFnHIXyiTWAUpy41oE8wUtW5+M6/Pq7pa5AZT5x3OGbViSFi4Hci2
 4bnRaf1Cag/6ebhVl0SBQehpyWwM2m7iJtJQM1vdlvrtNAcStero1u1uRgn9v2y6Y8s2
 mItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8IwfzeEf+LmGGerYqAqOMUZuItJo9T69cJehetlEMtg=;
 b=Qrzdkf9+BRAMppmuky9hm9oliT6xpnTJXWqJ6URmVeZeb9QmlHWLPJuX53lWNtuhux
 a297AaNdBDk5YWHRtmtOcBMQspkFv/dqgtEi6U7s80Yb5HrJTALsxtkXnnH/uoW5icBL
 1fG6WQA0PHep2qU0J7uzaOq8LtWTui8/R4LSg+z7P1No9jCqh1poxW1GdjViHcAMU9/8
 usB9dHeiLK/+yKeGuA1G+OnMqsx87lm32KUsqqUfNo8npAfxD7OWOAuqOinEXb0luAIa
 CJenTFHX1aIfkCOhJMd9VDxBa1YyBrm4p3gbEBrJSVwQJbZYxONclds4+Ag7v+D5gmlz
 pFfA==
X-Gm-Message-State: AOAM533+icNp/lNEZlA+8qRq5aiLEFtsD81AlVbKyMcfcEaeDhPd8NXr
 HG9ZOf3sdyAcYQS3MqYIkJ/2bw==
X-Google-Smtp-Source: ABdhPJwU2jBndivz/kEof3XVo2B62ExZrj5Twl8Zk+5FwX7oJR6NC6/mrC0XFdeNVmc+fqa/WLk/RQ==
X-Received: by 2002:a17:90a:6301:: with SMTP id
 e1mr5308667pjj.245.1632993900823; 
 Thu, 30 Sep 2021 02:25:00 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.130.103])
 by smtp.googlemail.com with ESMTPSA id m11sm2273938pga.27.2021.09.30.02.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 02:25:00 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 30 Sep 2021 14:54:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] failover: fix unplug pending detection
In-Reply-To: <20210930082032.1237812-1-lvivier@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109301450580.579856@anisinha-lenovo>
References: <20210930082032.1237812-1-lvivier@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 30 Sep 2021, Laurent Vivier wrote:

> Failover needs to detect the end of the PCI unplug to start migration
> after the VFIO card has been unplugged.
>
> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> pcie_unplug_device().
>
> But since
>     17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
> we have switched to ACPI unplug and these functions are not called anymore
> and the flag not set. So failover migration is not able to detect if card
> is really unplugged and acts as it's done as soon as it's started. So it
> doesn't wait the end of the unplug to start the migration. We don't see any
> problem when we test that because ACPI unplug is faster than PCIe native
> hotplug and when the migration really starts the unplug operation is
> already done.
>
> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>     a99c4da9fc2a ("pci: mark devices partially unplugged")

Ok so I have a basic question about partially_hotplugged flag in the
device struct (there were no comments added in a99c4da9fc2a39847
explaining it). It seems we return early from pcie_unplug_device() when
this flag is set from failover_unplug_primary() in virtio-net. What is the
purpose of this flag? It seems we are not doing a full unplug of the
primary device?

>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/acpi/pcihp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f610a25d2ef9..a2d27a3c4763 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -366,6 +366,11 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
>      trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
>                            acpi_pcihp_get_bsel(pci_get_bus(pdev)));
>
> +    if (pdev->partially_hotplugged) {
> +        pdev->qdev.pending_deleted_event = false;
> +        return;
> +    }
> +
>      /*
>       * clean up acpi-index so it could reused by another device
>       */
> @@ -396,6 +401,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>          return;
>      }
>
> +    pdev->qdev.pending_deleted_event = true;
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> --
> 2.31.1
>
>

