Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255775171B1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:37:50 +0200 (CEST)
Received: from localhost ([::1]:39530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXBM-00086y-SP
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nlX9P-0005yk-ID
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nlX9N-0002P6-Tt
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:35:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651502134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjdQuiYKjS053Wo1UTTqsmq3uXaw6/cVnHNM2YfRmPE=;
 b=bklFWADDreqNmVJtRQUUWEnR9h9Jg3OiWfEPf487lMsqwxYqQjR54MGohDDGLPcQpREOp4
 F5YRd72fVKlFXpDdkoYcUdIf/yoycnliCtltkpdffEPV6OnhgICyzmhVgdzhurzrFDdSz/
 niZCktUFKqZN7FPIva603XsDV+sslbw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-MNgp7KMtNNyrWtimTNEjjg-1; Mon, 02 May 2022 10:35:33 -0400
X-MC-Unique: MNgp7KMtNNyrWtimTNEjjg-1
Received: by mail-il1-f197.google.com with SMTP id
 m3-20020a056e02158300b002b6e3d1f97cso7301861ilu.19
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 07:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UjdQuiYKjS053Wo1UTTqsmq3uXaw6/cVnHNM2YfRmPE=;
 b=A7UDBjO3/+JluN3oUuiviETL/nfIq19RDWEw9M/4Dl2ig2J1pcEcCttv22GALJJp5q
 NNyS+ZlNUlSyH8wiWvWP0L3WKkLpSnA9fI0LcI9mqROC+8PP9fLzxwCIVUmrl4GAyfYl
 NHv6DndXvP1wLOcFDRK2RsPCJ/drLKxm6SZ+srze2HkoYarPZ0mfjrlvPYGUJ1Occ4Lw
 BtcS+6Xp1h0OpKLVZm8XZbMFpMhxf3zMvOvEiBYwU6S192rW5IeQ0x4ZYf147Ia5CHqb
 lb1H+AEuzMQMt9WM7tqFNwn81VTT7ZN3lbUbUpFpcc8eckgXoED2lfjotQE44mZB6EyF
 Hb6g==
X-Gm-Message-State: AOAM532ibP9Cp31EQRZmR/V5JvJZWlz+hEvfoCQiG6i+YNfzlFVZmmKd
 cxK2ur6Wx0QfBWzzIAT8czsflTkwO/BScVoD9jWbhaTZL63z7XV6bVoiYAfAzCAbngEqT0/xSTp
 HhWh4QfhmwfXc5Eo=
X-Received: by 2002:a92:6811:0:b0:2cd:994d:7406 with SMTP id
 d17-20020a926811000000b002cd994d7406mr4488698ilc.245.1651502132344; 
 Mon, 02 May 2022 07:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaPIoalchjdcDD4tIIuee+MoUbbODDg1pOgrG6iaIE1mIinZPY2wGDOdTTAweluNE3CEyqTQ==
X-Received: by 2002:a92:6811:0:b0:2cd:994d:7406 with SMTP id
 d17-20020a926811000000b002cd994d7406mr4488689ilc.245.1651502132116; 
 Mon, 02 May 2022 07:35:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i3-20020a056e020d8300b002cde6e352eesm2700803ilj.56.2022.05.02.07.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 07:35:31 -0700 (PDT)
Date: Mon, 2 May 2022 08:35:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [Patch 1/3] hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
Message-ID: <20220502083529.4c2f792b.alex.williamson@redhat.com>
In-Reply-To: <20220502094223.36384-2-yi.l.liu@intel.com>
References: <20220502094223.36384-1-yi.l.liu@intel.com>
 <20220502094223.36384-2-yi.l.liu@intel.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, kevin.tian@intel.com, qemu-devel@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  2 May 2022 02:42:21 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> From: Eric Auger <eric.auger@redhat.com>
> 
> Properly output the errno string.

More explanation please, why is it broken and how does this fix it?
Thanks,

Alex
 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  hw/vfio/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 9fd9faee1d..4a66376be6 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2337,7 +2337,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
>      g_free(reset);
>  
>      trace_vfio_pci_hot_reset_result(vdev->vbasedev.name,
> -                                    ret ? "%m" : "Success");
> +                                    ret ? strerror(errno) : "Success");
>  
>  out:
>      /* Re-enable INTx on affected devices */


