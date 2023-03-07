Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14346AEA6E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbBQ-0001oD-Hy; Tue, 07 Mar 2023 12:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZbBN-0001mh-Ci
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:33:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZbBI-0002OA-8g
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678210363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PFfS3b8gUhw/x+SuVn/LVl9KBtIHPNXODq3xJBA4Wd8=;
 b=Bg8SoCIzZUmX0sXNa8U7xMG1gWvDrkl6KS5AZYQgoFmAwMFa6yZciFHi2EBHxEkSsCtQBV
 aMF+5GYJPlx/odTYBn1Kvl/Kog8uIgjMNmmPh+mXf7AUanySPP1Sh19cdKmkxXsS+A8PDV
 qQF8a9jMeIasVzDcwikTptwHUrXoqOU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-UhryXug2NxmAsZHBOUVmfg-1; Tue, 07 Mar 2023 12:32:42 -0500
X-MC-Unique: UhryXug2NxmAsZHBOUVmfg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020a056000188700b002cdd0562b11so2392458wri.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678210361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFfS3b8gUhw/x+SuVn/LVl9KBtIHPNXODq3xJBA4Wd8=;
 b=0eDPU0f38T5wfrY2yVvJXN5vUriECMzr0SLK4u60SSeVPjcdGdgYBx81dqsBe3620R
 mOaHFdfz7QGTW0VTNDT1+6aJPo6/GcmA5T9x6M3/BnkJd07KFDCy3x3vBmO9LKKlySu9
 EXLu1kqRrWPUhA9DpIV/ThQYZAeuLhuBVoZnskGrCFAUdFncmFQQ3AAmCwl5XJgYwU7Z
 bSXtuvQjl46W/NEdHSLShNZJsERMD/TgBU/nS2cE7ahV6L6eQ12apKJCOGaZWE57QQJC
 crSB6qdkNt6bN9KNQIP1roiY+QhOFXTh/u871amBDLssGCq7WY0J2EG1gWdyxqteHcD6
 MbZA==
X-Gm-Message-State: AO0yUKVUOUKKCWs0BKaPUrAySHn2n7eYscAZENUyyBazQ9PDNyTM1jGg
 2wTmx1Sq70GzbtryGsFNlacm7WOMfE7KEvn6EiwZZ5nbXa18hSZEB2PIZSoh3Xnf8xZK12I5SJt
 Xz1x6gvJ/jLQGS/U=
X-Received: by 2002:a05:600c:1d19:b0:3e2:147f:ac1a with SMTP id
 l25-20020a05600c1d1900b003e2147fac1amr12810403wms.21.1678210361340; 
 Tue, 07 Mar 2023 09:32:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9q6b+9IR4nh/KwrdPN1mmZoBG9dfUTu9sPQ7p9tYOj6V9LF8RAmF+OEhJtgj2j+iHhX5RlXQ==
X-Received: by 2002:a05:600c:1d19:b0:3e2:147f:ac1a with SMTP id
 l25-20020a05600c1d1900b003e2147fac1amr12810385wms.21.1678210361015; 
 Tue, 07 Mar 2023 09:32:41 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b003e4326a6d53sm18826552wmq.35.2023.03.07.09.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:32:40 -0800 (PST)
Date: Tue, 7 Mar 2023 12:32:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
Message-ID: <20230307123129-mutt-send-email-mst@kernel.org>
References: <20230304114043.121024-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Mar 04, 2023 at 12:40:38PM +0100, Bernhard Beschow wrote:
> A recent series [1] attempted to remove some PIC -> CPU interrupt indirections.
> This inadvertantly caused NULL qemu_irqs to be passed to the i8259 because the
> qemu_irqs aren't initialized at that time yet. This series provides a fix by
> initializing the qemu_irq of the respective south bridges before they
> are passed to i2859_init().
> 
> Furthermore -- as an optional extension -- this series also fixes some usability
> issues in the API for creating multifunction PCI devices.
> 
> The series is structured as follows: The first three commits fix the
> regressions, the last two fix the public API for creating multifunction PCI
> devices.
> 
> [1] https://lore.kernel.org/qemu-devel/20230302224058.43315-1-philmd@linaro.org/


Well philmd merged that one so I'll let him untangle it.
However please separate fixes and cleanups.
Cleanups can't go in now, fixes still can.
Thanks!


> Bernhard Beschow (5):
>   hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
>   hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
>   hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
>   hw/pci/pci: Remove multifunction parameter from
>     pci_create_simple_multifunction()
>   hw/pci/pci: Remove multifunction parameter from
>     pci_new_multifunction()
> 
>  include/hw/pci/pci.h |  4 +---
>  hw/alpha/dp264.c     |  8 +++++---
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     | 10 +++++-----
>  hw/isa/vt82c686.c    |  3 ++-
>  hw/mips/boston.c     |  3 +--
>  hw/mips/fuloong2e.c  |  9 +++++----
>  hw/mips/malta.c      |  2 +-
>  hw/pci-host/sabre.c  |  6 ++----
>  hw/pci/pci.c         | 18 ++++++++++++------
>  hw/ppc/pegasos2.c    |  9 +++++----
>  hw/ppc/prep.c        |  4 +++-
>  hw/sparc64/sun4u.c   |  5 ++---
>  13 files changed, 45 insertions(+), 38 deletions(-)
> 
> -- 
> 2.39.2
> 


