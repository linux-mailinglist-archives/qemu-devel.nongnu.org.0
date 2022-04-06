Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47A4F56F8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 09:55:29 +0200 (CEST)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc0Vk-0001aO-Ow
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 03:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nc0Sy-00087L-VG
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nc0Sx-000821-0b
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649231554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q43LK0MQtpi79vxN8hzDxvM+Iw3jGfOFR50dxoBtj1U=;
 b=fHH2HofgozPc3qN4leZ4l+uCxU1EXUOj73r2fDIk72PCMAZtNBAo4FL2+OE5+DuDvHYpty
 wMuR3WcpCthgOgcWnbZIwW5w7vOmZMcTTkNCD3o1l7ITMRsjrlIXvloHKaTd3pIlWZfIG0
 9IDP9n1yQ4Vn29Ev7+8AoGK1BYYLHLY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-lPWPUICRNfykgxrSsMbBYA-1; Wed, 06 Apr 2022 03:52:33 -0400
X-MC-Unique: lPWPUICRNfykgxrSsMbBYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 a16-20020a05600c349000b0038e6392a346so946446wmq.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 00:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q43LK0MQtpi79vxN8hzDxvM+Iw3jGfOFR50dxoBtj1U=;
 b=borPftWzSn2JWaQvcSCQyol76FtMIdhECRQoxB2bgMuDl8bh/FkrW/WDwLWuXwj/gj
 eif98cZw66lKm+wQ+xJKOrEzJdvnq1Fx+g5RnPbtd5fHJ4E7zZE+GIkNhlhVv4Hi04cQ
 ZifQ95tlDAyQQfz11PvwGvKhHFxpcgc3jeMhfLXeiRCU014/ihxlkv7wKTM01PJErExG
 JLqhdz7sFz0UcQfaiZjL6OzAnoI+sqeoGf+/eqWvYgNr7lcjNOAhkNApLROL53XkLAaq
 BgyP9dY3vXM1lEf5cmPSdlracXSS5tHAlCmBzAhH6sYwC9EmaTg6iDVOTLmYHi4dkAd7
 oQCA==
X-Gm-Message-State: AOAM531IOzQnTmtYI1M3TvElrHE8LOjzjgteiIzehMxXRsqpMLKxX8zs
 aJLqy3c+b39Y0bMqSVnzxiZWKyEv7E1hKi8yBCLIj0VsO+mIJHe9+5jaemFJOJ4ta058nM26936
 XcQDqNc8jOzCPAv0=
X-Received: by 2002:a05:6000:3:b0:206:1215:d7e9 with SMTP id
 h3-20020a056000000300b002061215d7e9mr5350673wrx.386.1649231551862; 
 Wed, 06 Apr 2022 00:52:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1/r4KE2ZEvZ/OY9z6UgMCFp/9G70lQARSUURXzwsVPP+7JW0T9+hxzUHsPRYZuxh6HIG4Jg==
X-Received: by 2002:a05:6000:3:b0:206:1215:d7e9 with SMTP id
 h3-20020a056000000300b002061215d7e9mr5350656wrx.386.1649231551583; 
 Wed, 06 Apr 2022 00:52:31 -0700 (PDT)
Received: from redhat.com ([2.53.144.12]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d53c2000000b0020604b2667asm15378517wrw.81.2022.04.06.00.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:52:30 -0700 (PDT)
Date: Wed, 6 Apr 2022 03:52:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH 0/2] Remove PCIE root bridge LSI on powernv
Message-ID: <20220406035156-mutt-send-email-mst@kernel.org>
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220321153357.165775-1-fbarrat@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 04:33:55PM +0100, Frederic Barrat wrote:
> The powernv8/powernv9/powernv10 machines allocate a LSI for their root
> port bridge, which is not the case on real hardware. The default root
> port implementation in qemu requests a LSI. Since the powernv
> implementation derives from it, that's where the LSI is coming
> from. This series fixes it, so that the model matches the hardware.
> 
> However, the code in hw/pci to handle AER and hotplug events assume a
> LSI is defined. It tends to assert/deassert a LSI if MSI or MSIX is
> not enabled. Since we have hardware where that is not true, this patch
> also fixes a few code paths to check if a LSI is configured before
> trying to trigger it.


Hi Frederic, thanks for the patch!
I assume you will address Daniel's comments and post a new version,
right?

> 
> Frederic Barrat (2):
>   pcie: Don't try triggering a LSI when not defined
>   ppc/pnv: Remove LSI on the PCIE host bridge
> 
>  hw/pci-host/pnv_phb3.c | 1 +
>  hw/pci-host/pnv_phb4.c | 1 +
>  hw/pci/pcie.c          | 8 ++++++--
>  hw/pci/pcie_aer.c      | 4 +++-
>  4 files changed, 11 insertions(+), 3 deletions(-)
> 
> -- 
> 2.35.1


