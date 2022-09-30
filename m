Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2815F0794
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:29:56 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCLD-00064Z-UP
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oeCFQ-0001jU-Kv
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:23:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oeCFO-0005Zx-Mv
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664529833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bopeWtXmg6RzjROBxjbDBB300HisEUI39hRJit7zbT8=;
 b=NbPENgMW0Z8opS2Gr/E8ADzOXMU5c1kcgP6aWg3JaMFncuGIVnZPJwK+2EtLUjxB0cWRly
 bopCexIL+t7FNC63yZUkuu2wDr992TkB1/suleAZmoD8dPEALGE9BS3qtxeCRZoLK/v4ts
 M/PEu6vj2IbaGpL8HuD7teshQnpDQj8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-5I1aLiGsP-m4kAYAma8V_w-1; Fri, 30 Sep 2022 05:23:51 -0400
X-MC-Unique: 5I1aLiGsP-m4kAYAma8V_w-1
Received: by mail-ed1-f71.google.com with SMTP id
 h13-20020a056402280d00b004581108ba90so3186341ede.2
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=bopeWtXmg6RzjROBxjbDBB300HisEUI39hRJit7zbT8=;
 b=Wf+hLjK59tugGOe07DWedKkSyB2+Y/CW9w8vndvN4XOY7tJ+Z9VheKs436/Cqn0r8k
 SvxYkHS4cr4Ya/0D81ev4IR/hZr+O3+WzBkfVAHCWn8Ef1e1QQYZ5e6yoMDL3M9T2HXu
 H2BWzCk+HfAlUIr4ZopsbG9/4cIfQxNXDcrXLZbDg2gz+9w12Eb2FDuLi4kUY7kkl4h/
 uAgJwZnFTCNMn1pXSHyc3TWIKCAZ3NViEXQNt9aKKgs1I/01wgfe5laVgBJUQdmOTnQ4
 BQHKYdEocGwRaWN0eMIdF/BUoAMaMUGhStuow2bo9UeqbHeEtG56fPVbeDcn08U7Qs3U
 zaVA==
X-Gm-Message-State: ACrzQf3lN87dbv7PpIekVFKFrfmKEIzC87doCxyIoVInlUlkTwbGiyT9
 3fI6iV6AjilFgWcKLiPt6Af+dg8ztg5PGRaEcFxP6kCj2u1mgdZ+6lYkkC01uIasRIH2Lc433vt
 G44Nr6ed2SCqES/0=
X-Received: by 2002:a05:6402:3582:b0:451:3f7b:a7c5 with SMTP id
 y2-20020a056402358200b004513f7ba7c5mr7310211edc.63.1664529830602; 
 Fri, 30 Sep 2022 02:23:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7d5amNyBGV6AcWVnPvMEaNOiKRPniSEUHMxuduYI9UqrT9MYJu1pTYjYkZZGP4wbvOo+qvlw==
X-Received: by 2002:a05:6402:3582:b0:451:3f7b:a7c5 with SMTP id
 y2-20020a056402358200b004513f7ba7c5mr7310204edc.63.1664529830356; 
 Fri, 30 Sep 2022 02:23:50 -0700 (PDT)
Received: from redhat.com ([147.235.214.102]) by smtp.gmail.com with ESMTPSA id
 g17-20020a170906539100b0073d70df6e56sm880329ejo.138.2022.09.30.02.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 02:23:49 -0700 (PDT)
Date: Fri, 30 Sep 2022 05:22:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 peter.maydell@linaro.org
Subject: Re: [PATCH] pci-ids: sync docs + header
Message-ID: <20220930051235-mutt-send-email-mst@kernel.org>
References: <20220930073553.1626190-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930073553.1626190-1-kraxel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, Sep 30, 2022 at 09:35:53AM +0200, Gerd Hoffmann wrote:
> docs/specs/pci-ids.txt and include/hw/pci/pci.h are out of sync,
> fix that.  Try improve the comment which points to pci-ids.txt.
> 
> Also drop the list of modern virtio devices and explain how they
> are calculated instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/specs/pci-ids.txt | 19 ++++++++++---------
>  include/hw/pci/pci.h   |  7 ++++++-
>  2 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> index dd6859d039d0..6be7bc108d66 100644
> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -22,16 +22,17 @@ maintained as part of the virtio specification.
>  1af4:1004  SCSI host bus adapter device (legacy)
>  1af4:1005  entropy generator device (legacy)
>  1af4:1009  9p filesystem device (legacy)
> +1af4:1012  vsock device (legacy)
> +1af4:1013  pmem device (legacy)
> +1af4:1014  iommu device (legacy)
> +1af4:1015  mem device (legacy)


Wait, how come we have legacy vsock/pmem/iommu/mem?
They were only introduced after 1.0.


>  
> -1af4:1041  network device (modern)
> -1af4:1042  block device (modern)
> -1af4:1043  console device (modern)
> -1af4:1044  entropy generator device (modern)
> -1af4:1045  balloon device (modern)
> -1af4:1048  SCSI host bus adapter device (modern)
> -1af4:1049  9p filesystem device (modern)
> -1af4:1050  virtio gpu device (modern)
> -1af4:1052  virtio input device (modern)
> +1af4:1040  Start of id range for modern virtio devices.  The pci device
> +           id is is calculated from the virtio device id by adding the
> +           0x1040 offset.  The virtio ids are defined in the virtio
> +           specification.  The linux kernel has a header file with
> +           defines for all virtio ids (linux/virtio_ids.h), qemu has a
> +           copy in include/standard-headers/.
>  
>  1af4:10f0  Available for experimental usage without registration.  Must get
>     to      official ID when the code leaves the test lab (i.e. when seeking
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index b54b6ef88fc3..3b852199660c 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -71,7 +71,12 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_INTEL_82557        0x1229
>  #define PCI_DEVICE_ID_INTEL_82801IR      0x2922
>  
> -/* Red Hat / Qumranet (for QEMU) -- see pci-ids.txt */
> +/*
> + * Red Hat / Qumranet (for QEMU)
> + *
> + * These are documented in docs/specs/pci-ids.txt
> + * PLEASE KEEP HEADER + DOCS IN SYNC
> + */
>  #define PCI_VENDOR_ID_REDHAT_QUMRANET    0x1af4
>  #define PCI_SUBVENDOR_ID_REDHAT_QUMRANET 0x1af4
>  #define PCI_SUBDEVICE_ID_QEMU            0x1100
> -- 
> 2.37.3


