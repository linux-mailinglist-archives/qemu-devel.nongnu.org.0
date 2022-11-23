Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316BC635085
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 07:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxjLJ-0000mg-JU; Wed, 23 Nov 2022 01:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjLA-0000mQ-41
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 01:34:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjL7-0006qP-J6
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 01:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669185266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sozmvI1IdGG9fyOtAV8kcum75oxg7bOEog02c7JsMzM=;
 b=K8bu0wW8/Tn36ZbMhq9oM4rYKaHiIz8M80ra9pW+/1IBJioUsAuoTqvBxeP5VrXaRP1wMy
 H/DO/PS/yYG7fPp+Ds9so23Ag8cVKxyWO6yWg9M1t0sVgxdVXrWz56Abn+T13xIFcYfw/U
 6ltfF0e1UDKdJH5y6qcvqGPaLaTqQng=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-GptRzc_0MsOVfY9tqu0omQ-1; Wed, 23 Nov 2022 01:34:24 -0500
X-MC-Unique: GptRzc_0MsOVfY9tqu0omQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso637522wms.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 22:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sozmvI1IdGG9fyOtAV8kcum75oxg7bOEog02c7JsMzM=;
 b=lC9FRBeGtDAZofl1VogvS39YuIQGot+LXW+yqbLrCy0uKKAbnPud+g3aoElSVT6Y1n
 t8wVGRMioxEsaOokOJBDGTdYfpjAGNW5rqdFZElyX3y+ZVEDxgBFb/95/njxrOmCHLzp
 /JwV3nzPraVBSXX6rEq5NERWMAtDrp9CK/3iMcfzarr40dw/KbooJ1onkD0J3/tr8lt4
 39qgeoFlPw032Fr+CtWiWL7ExrFSME4ZMLU+QkMbxOhQ0iFnO++ne/u2XR1Nj5K4nAGg
 eaPyrR+NpDQhH1kB9D9ItsNYwV9rblV1rIu32IFqRTVQyzIhQXfHMIUiT6FZStUnb/14
 hR/Q==
X-Gm-Message-State: ANoB5pluXwNiBDiP6oEoG0xdJok7cI4y77/dFC966rGxA77+CTFor9SX
 pjNOmIcRrTxNvltqlO0pY+AAt/E21LLkIxjPoDDMMNoLHZyjIV0gki+c04Yxlj2zxiFZPjQ5540
 T55kC4QiWQXUmdvE=
X-Received: by 2002:a1c:e917:0:b0:3cf:681a:43e1 with SMTP id
 q23-20020a1ce917000000b003cf681a43e1mr5539787wmc.126.1669185262941; 
 Tue, 22 Nov 2022 22:34:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6wcTcihf8Ze/MP/Erd3PKK69Ihq2s0BPUZ0dY/ERzsi0C/2zjJmtaEIIQFTawNMs7gMt8TiQ==
X-Received: by 2002:a1c:e917:0:b0:3cf:681a:43e1 with SMTP id
 q23-20020a1ce917000000b003cf681a43e1mr5539772wmc.126.1669185262735; 
 Tue, 22 Nov 2022 22:34:22 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 x10-20020a5d54ca000000b00238df11940fsm15673355wrv.16.2022.11.22.22.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 22:34:22 -0800 (PST)
Date: Wed, 23 Nov 2022 01:34:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, stefanb@linux.vnet.ibm.com,
 cohuck@redhat.com, f4bug@amsat.org
Subject: Re: [PATCH v5 0/2] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Message-ID: <20221123013304-mutt-send-email-mst@kernel.org>
References: <20220506132510.1847942-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506132510.1847942-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 06, 2022 at 03:25:08PM +0200, Eric Auger wrote:
> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This region could have been a RAM device
> region, easing the detection of such safe situation but this option
> was not well received.

Eric could you point me at this discussion please?
We are now asked to proliferate stuff like this into vdpa
as well, this just doesn't scale. I'd like to see whether we
can make it a RAM device region after all - was a patch
like that posted?

> So let's add a helper function that uses the
> memory region owner type to detect the situation is safe wrt
> the assignment. Other device types can be checked here if such kind
> of problem occurs again.
> 
> As TPM devices can be compiled out we need to introduce a stub
> for TPM_IS_CRB.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/tpm-crb-vfio-v5
> 
> History:
> 
> v4 -> v5:
> - Add sysemu: tpm: Add a stub function for TPM_IS_CRB to fix
>   compilation error if CONFIG_TPM is unset
> 
> Eric Auger (2):
>   sysemu: tpm: Add a stub function for TPM_IS_CRB
>   vfio/common: remove spurious tpm-crb-cmd misalignment warning
> 
>  hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  include/sysemu/tpm.h |  6 ++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> -- 
> 2.35.1
> 
> 
> 


