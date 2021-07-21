Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA423D0D3D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:13:41 +0200 (CEST)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6AAW-0004Ka-GF
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6A7F-00012F-Vx
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6A79-0001hs-7q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626865810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/pY2x1kXn9qTEd6Yz+9ElSPiFgpQeDHFBf0cy7o/81k=;
 b=fKOiGg5MJhrk9jmNGWgIpSUF14GoIGdRDuu5ZxF9EeqIdAESovSXzeM8HrfHXenF6dJONz
 bD1riW4TVL+8nRC+5E76xLVbcSsVevBllz+PuVfKq4Z+4dxiR+LS8TDppW/TcEiBxgrVux
 hPDRbcGHL532YtB+g7MOveK9m7FRLis=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Ua2ZELpAN4GOq2Gi25mLjQ-1; Wed, 21 Jul 2021 07:10:09 -0400
X-MC-Unique: Ua2ZELpAN4GOq2Gi25mLjQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n12-20020a05600c4f8cb0290241f054d92aso147508wmq.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 04:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/pY2x1kXn9qTEd6Yz+9ElSPiFgpQeDHFBf0cy7o/81k=;
 b=Y71U6O5hXg5Dg/9oeVMlt2PwPIbBDJZJcH9U0Ticp1UCVSCgpVKogQVxCrgpDklbwf
 62ACa5qfEw0j6PTbR5jvhZb/DXDovyN8CvXISa/D2MShihTwls02Ec+LwV1kHc3ILgpK
 imPWkT7bWuotQEQk0/nptAJ8C0ubicj/drsYZV/c46qLXlKlOuGS8HFZykXofp3asXKY
 Wsk64xwAb9WlYUikMbR24dmrN56/yT1WXIbmgZPXqHUWybojSwS37SkqYQxdh6POHQgx
 NI+bAwsMtdSi2j9f5fFdMzrd9r45vAke3kWczj6tjntg/9hUDPbsPuB4xHYY67NTAZRg
 W02g==
X-Gm-Message-State: AOAM531amrn5RVd6OdrabcDehV1J2XHBbsR3skAP0SROG5pgIxiRD37J
 oMjbmBNDiO8kUWdGim/sB2fBMI0cyfV0m34zZgsL/fmgXxzOAJl+Cc0k1j3e9lMm1gRKU3BeT2S
 N9H64XRYLiyziOGs=
X-Received: by 2002:a5d:5703:: with SMTP id a3mr7136787wrv.208.1626865807886; 
 Wed, 21 Jul 2021 04:10:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiDJlcScZgi3sThvea6pxTlQcgc/PvYIfVwK6U2Av9JWNivKfgah7B/z3YrUNyuWbMYjLzng==
X-Received: by 2002:a5d:5703:: with SMTP id a3mr7136761wrv.208.1626865807698; 
 Wed, 21 Jul 2021 04:10:07 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r18sm26895322wrt.96.2021.07.21.04.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:10:06 -0700 (PDT)
Date: Wed, 21 Jul 2021 12:10:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3] failover: unregister ROM on unplug
Message-ID: <YPgAjFzE/hq+tSIS@work-vm>
References: <20210721093955.225759-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721093955.225759-1-lvivier@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> The intend of failover is to allow to migrate a VM with a VFIO
> networking card without disrupting the network operation by switching
> to a virtio-net device during the migration.
> 
> This simple change allows to test failover with a simulated device
> like e1000e rather than a vfio device, even if it's useless in real
> life it can help to debug failover.
> 
> This is interesting to developers that want to test failover on
> a system with no vfio device. Moreover it simplifies host networking
> configuration as we can use the same bridge for virtio-net and
> the other failover networking device.
> 
> Without this change the migration of a system configured with failover
> fails with:
> 
>   ...
>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>   -device e1000,failover_pair_id=virtionet0,... \
>   ...
> 
>   (qemu) migrate ...
> 
>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>   error while loading state for instance 0x0 of device 'ram'
>   load of migration failed: Invalid argument
> 
> This happens because QEMU correctly unregisters the interface vmstate but
> not the ROM one. This patch fixes that.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> 
> Notes:
>     v3:
>       remove useless space before comma
>     
>     v2:
>       reset has_rom to false
>       update commit log message
> 
>  hw/net/virtio-net.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee52a..c0c2ec1ebb98 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3256,6 +3256,10 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>      if (migration_in_setup(s) && !should_be_hidden) {
>          if (failover_unplug_primary(n, dev)) {
>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
> +            if (PCI_DEVICE(dev)->has_rom) {
> +                PCI_DEVICE(dev)->has_rom = false;
> +                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom, dev);
> +            }

Not actually originated by your fix, but....

Why doesn't failover_replug_primary re-add the vmstates?

(I did wonder if passing rom-file="" to the e1000 would help in your
testing case, but it still creates the RAM image).

Dave

>              qapi_event_send_unplug_primary(dev->id);
>              qatomic_set(&n->failover_primary_hidden, true);
>          } else {
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


