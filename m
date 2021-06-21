Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EDB3AE73D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:37:36 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHJ9-0004t9-EP
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGoB-00083t-Cz
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGo9-0002MD-D7
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCOVVwEnIcNRVrXndx+qc/xkcbKkcnQKpkfO5jJrBTw=;
 b=hVtSbmpprUIMF/0ReaiUSDQnHAsVyJvzzO9YmlkNx/5mee7HrhYAPbbP4nAvpXXfRzdLu9
 lHxioRT0W/Gtu8ozGaCn+a/2fAWcuCHUbw3r1LY+5IzC29oIUURbXhgV37ZfRCP+zWcoC1
 yFMl6metYVrD2XZlDdr3sjo4uCm9OCo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-PrGVtUZoPzG02ZKDWMbplA-1; Mon, 21 Jun 2021 06:05:31 -0400
X-MC-Unique: PrGVtUZoPzG02ZKDWMbplA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so5712767wmq.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 03:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PCOVVwEnIcNRVrXndx+qc/xkcbKkcnQKpkfO5jJrBTw=;
 b=qh43oizG4WgxVX8q3M4fQl1K+IZ7616bZh88azb6orgdZa81pSvjHEjgR3oVSshoYH
 jVdITLjxselbiP2bVIRVb8d98N9IDb9c+Oq1LInCoo142u9vn/FOGM5nIYC+FqdOmiZB
 pFe2EcH9dS8fQc6Iz7KTwJvvt0kQes4Oqhche4yjMKW5L7gQafQ3uWpBhW7MqKwnMFe6
 aEYseNrTkgsRpARpZeNI/d8WtK0AL1SaMDvVcXRAwOH8/xQUYtDYe2uvLZAFXoeKiFgm
 k1uyeH/tiuu+/dmneghHzCBHRoy5xnagaUQa1u7zDB1ynwBfbwbJlHOZtMbsIi2FZZfM
 vz8w==
X-Gm-Message-State: AOAM533yRUsXpvZ3iac32aCj2cygMctTz96kaSNnkgGkop5AVXs60vZR
 5buaDuLnQUGoyFRluZ1hpai70pTGeGah6m5F+7yriP1f3OE6N4wbxdLJCtbtxDbxcJpEBuFxb+c
 ljJuQCyhoz9kw2t0=
X-Received: by 2002:adf:f445:: with SMTP id f5mr21252712wrp.264.1624269929846; 
 Mon, 21 Jun 2021 03:05:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7WVH64+WccWfRA+IQW2u+XUskSJ6Yi0NnCG/PNGRR67f1u8/95mVlq3SCCeBePm6WfXHZig==
X-Received: by 2002:adf:f445:: with SMTP id f5mr21252702wrp.264.1624269929734; 
 Mon, 21 Jun 2021 03:05:29 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h46sm19246608wrh.44.2021.06.21.03.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:05:29 -0700 (PDT)
Subject: Re: [PATCH v7 0/6] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: qemu-devel@nongnu.org
References: <20210614193220.2007159-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <51b632a9-5dec-1b2e-6440-db783a7ebf0b@redhat.com>
Date: Mon, 21 Jun 2021 12:05:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614193220.2007159-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 6/14/21 9:32 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The floppy disc controllers pulls in irrelevant devices (sysbus in
> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
> 
> This series clean that by extracting each device in its own file,
> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
> Since v6:
> - Rebased
> - Added A-b/R-b tags
> - Removed stub (thuth)
> 
> Since v5:
> - Added stub (thuth)
> 
> Since v4:
> - Dropped machine patches for later due to DMA jazz issue
> 
> Since v3:
> - Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)
> 
> Since v2:
> - rebased
> 
> Since v1:
> - added missing "hw/block/block.h" header (jsnow)
> - inlined hardware specific calls (Mark)
> - added R-b/A-b tags
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (6):
>   hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC
>   hw/block/fdc: Replace disabled fprintf() by trace event
>   hw/block/fdc: Declare shared prototypes in fdc-internal.h
>   hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>   hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
>   hw/block/fdc: Add description to floppy controllers
> 
>  hw/block/fdc-internal.h | 158 ++++++++++
>  hw/block/fdc-isa.c      | 320 +++++++++++++++++++++
>  hw/block/fdc-sysbus.c   | 251 ++++++++++++++++
>  hw/block/fdc.c          | 621 +---------------------------------------
>  MAINTAINERS             |   3 +
>  hw/block/Kconfig        |  12 +-
>  hw/block/meson.build    |   2 +
>  hw/block/trace-events   |   3 +
>  hw/i386/Kconfig         |   2 +-
>  hw/isa/Kconfig          |   7 +-
>  hw/mips/Kconfig         |   2 +-
>  hw/sparc/Kconfig        |   2 +-
>  hw/sparc64/Kconfig      |   2 +-
>  13 files changed, 763 insertions(+), 622 deletions(-)
>  create mode 100644 hw/block/fdc-internal.h
>  create mode 100644 hw/block/fdc-isa.c
>  create mode 100644 hw/block/fdc-sysbus.c
> 


