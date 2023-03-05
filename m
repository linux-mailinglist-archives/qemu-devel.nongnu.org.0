Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47976AB258
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 21:59:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYvQR-0000vp-He; Sun, 05 Mar 2023 15:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pYvQN-0000vJ-9y
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 15:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pYvQL-00083b-DZ
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 15:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678049859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpvrqEtHQRPp0WqSMAKEWF2hKPliqsd1ycTE3IrijxA=;
 b=AwDFP15nTveOhZgPmNfE7OjbRe/b1zoJcG5h0GP85Q4BqTnPiQqCT/N8/DW7YtS3z90Qku
 uQZS2GJkD4Y+0Wf+nWbmCsx/OFyhoPbAqWtZyTAwGD/ywVEj8RtlOvjcVW1SBid1iYPcyD
 syrjJwmhaed0GpRMiVUIBqXpE4q/BqY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-syUQ0MUzNIa1igOH8c_uHw-1; Sun, 05 Mar 2023 15:57:37 -0500
X-MC-Unique: syUQ0MUzNIa1igOH8c_uHw-1
Received: by mail-io1-f72.google.com with SMTP id
 c13-20020a0566022d0d00b0074cc4ed52d9so4362668iow.18
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 12:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OpvrqEtHQRPp0WqSMAKEWF2hKPliqsd1ycTE3IrijxA=;
 b=YpqRmhvpJEl1FsrS575nnWTJJ6+egB6+Y43cSp5aStPIEpvpB6EBWOgj4VaWQDFSe7
 QV3w9oRE4XlCUdBEsyXyEi4e99wCtUMacfo/dzfDmfymmhxk6kpCVhAm05TWIi2cAtgt
 wdEva2D2rM5In4bYeOEvk+7cjaHS4yd2csfSVhiFFk+5renAEFu2sSSUCtDi+Bwpvds6
 OSCfCd1P+ghPo6NGMLm0TRk0Bo0cW3cBfOVkfSJhvjZg4zy6lEoOSKoIW+9cczSDZV25
 ZEr0j5/Y3dCPIfYCTqQa036gm7zfUeRhkHx9Vkx9PeCeWjFA+d0ASuMui9JsF9txNCm2
 nmZA==
X-Gm-Message-State: AO0yUKUAYst1QN7uGTVQofTvmGq90IejHFSZ3GiAtPHtytaB47nM1St/
 BOfFKWtEQErhd/QBJBY/dxXRMRxO4WUAc9fh4O4tz0d7z1cYI+RMAwjnaMcU5FDTlzoGfKZVcGp
 P90huU7caLBIeupA=
X-Received: by 2002:a6b:e70b:0:b0:74c:99e8:5a83 with SMTP id
 b11-20020a6be70b000000b0074c99e85a83mr6299773ioh.9.1678049856698; 
 Sun, 05 Mar 2023 12:57:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8G7qDUL70iptEJyqY+vhrhIrpkEv72TAh7JeU7OKQpL2L0VggCX0JS0drHrxw80EeHVZ6JHA==
X-Received: by 2002:a6b:e70b:0:b0:74c:99e8:5a83 with SMTP id
 b11-20020a6be70b000000b0074c99e85a83mr6299766ioh.9.1678049856393; 
 Sun, 05 Mar 2023 12:57:36 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v4-20020a5ec104000000b0073fe9d412fasm2665550iol.33.2023.03.05.12.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 12:57:35 -0800 (PST)
Date: Sun, 5 Mar 2023 13:57:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
Message-ID: <20230305135734.71d54dd1.alex.williamson@redhat.com>
In-Reply-To: <20230304014343.33646-1-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Sat,  4 Mar 2023 01:43:30 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> Hey,
> 
> Presented herewith a series based on the basic VFIO migration protocol v2
> implementation [1].
> 
> It is split from its parent series[5] to solely focus on device dirty
> page tracking. Device dirty page tracking allows the VFIO device to
> record its DMAs and report them back when needed. This is part of VFIO
> migration and is used during pre-copy phase of migration to track the
> RAM pages that the device has written to and mark those pages dirty, so
> they can later be re-sent to target.
> 
> Device dirty page tracking uses the DMA logging uAPI to discover device
> capabilities, to start and stop tracking, and to get dirty page bitmap
> report. Extra details and uAPI definition can be found here [3].
> 
> Device dirty page tracking operates in VFIOContainer scope. I.e., When
> dirty tracking is started, stopped or dirty page report is queried, all
> devices within a VFIOContainer are iterated and for each of them device
> dirty page tracking is started, stopped or dirty page report is queried,
> respectively.
> 
> Device dirty page tracking is used only if all devices within a
> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
> used, and if that is not supported as well, memory is perpetually marked
> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
> support, the last two usually have the same effect of perpetually
> marking all pages dirty.
> 
> Normally, when asked to start dirty tracking, all the currently DMA
> mapped ranges are tracked by device dirty page tracking. If using a
> vIOMMU we block live migration. It's temporary and a separate series is
> going to add support for it. Thus this series focus on getting the
> ground work first.
> 
> The series is organized as follows:
> 
> - Patches 1-7: Fix bugs and do some preparatory work required prior to
>   adding device dirty page tracking.
> - Patches 8-10: Implement device dirty page tracking.
> - Patch 11: Blocks live migration with vIOMMU.
> - Patches 12-13 enable device dirty page tracking and document it.
> 
> Comments, improvements as usual appreciated.

Still some CI failures:

https://gitlab.com/alex.williamson/qemu/-/pipelines/796657474

The docker failures are normal, afaict the rest are not.  Thanks,

Alex


