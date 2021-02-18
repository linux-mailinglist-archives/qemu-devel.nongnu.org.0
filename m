Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF931EA64
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 14:25:28 +0100 (CET)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCjJ9-0002Aq-Qw
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 08:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rosbrookn@gmail.com>)
 id 1lCjHV-0001he-5z
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:23:45 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:46204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rosbrookn@gmail.com>)
 id 1lCjHT-0002V7-HN
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:23:44 -0500
Received: by mail-qk1-x733.google.com with SMTP id w19so1932753qki.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 05:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mTaKbUCPMI8pEmpUH7xFKnqYvEUHTTNlJ1sBAW5ap6A=;
 b=f00lXv5nHIEhSTZCyygrk0AbfHar9O41wXUMdLOZWcI04YbtmfVYCQhxl+qPnW+Yd6
 9dKvovPBmw9STO/PVAvDp+jEoVsAjWnnStJjvSBeZS2vsfLow7oK8XRkeXwONw8qZltE
 iUFDanKgNzrOsuEjfDZbrxcIG/FvY4IKcb2T6wgTBgVIJ6Gk54zMWh3j0xGHH7bHHv2C
 sn3aMQSAoHshGksYO2tghKKnxcCeg2R+W12e3R+3MTrkds2M8jYH10ep/KyBICzII93p
 eOtX8YL1cKVnFzGwW6o/LpZaCe6I4rXXpIrk2mW50dClaF3Zol9Gjc2kXt1Gj4wgEtQe
 ZwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mTaKbUCPMI8pEmpUH7xFKnqYvEUHTTNlJ1sBAW5ap6A=;
 b=dtZv+TkV0cfFKEGasDNNPobhfPsNqj4Yr35yVjgrkS7UTnluZw1XknO0V/AKtqzxU7
 P1pRFx0+L/4sU7H99kKOhoLq09pFrmIi+R6fEMlwOSYdIrWY5q8+ciz8lz8SVKgfOoFI
 Lt7CMGSOR3PgnFJdNz5ksLgT4B6xdW3KI0mVz+Y9iWxFxpPHhk2fAo9fQT1q3XCBKQwM
 QVIxf2vwZjBE2zMmYC8xMfde9lAe2077WUPRNByX8h0EMTeJNgV3meA6/57HWpqCvSNz
 nuNmgbVdw5O+7JDxCB7U91TSR5KIeV0ImbEh8piBaJNuz8DwOWSnEsg9Xj1q+tiY96vV
 GVng==
X-Gm-Message-State: AOAM5306/FuKsdkTjqqS118ib5CNnXHpqCRUSF49KqflpKnkxxNQ93m8
 n8U7aPV41yH11bVmyzyNizU=
X-Google-Smtp-Source: ABdhPJxOVVvBCpxQitZyGdfXBIR4HCJUCD1MlgbGEsyf76IAaZ4L6NOoSzqc+WVyZLdrGPDNz7xZLQ==
X-Received: by 2002:a37:9b07:: with SMTP id d7mr3957677qke.497.1613654622194; 
 Thu, 18 Feb 2021 05:23:42 -0800 (PST)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id c191sm942079qke.1.2021.02.18.05.23.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Feb 2021 05:23:41 -0800 (PST)
Date: Thu, 18 Feb 2021 08:23:39 -0500
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] usb-host: use correct altsetting in usb_host_ep_update
Message-ID: <YC5qW21CDU38YtZ5@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20210201213021.500277-1-rosbrookn@ainfosec.com>
 <CAEBZRScKAU3PdbiZQvXou41J+5cFXcOj=KUB0dYnC2y1BCbH-w@mail.gmail.com>
 <20210218115251.c7lgkkcu2hsngvkz@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218115251.c7lgkkcu2hsngvkz@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=rosbrookn@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 12:52:51PM +0100, Gerd Hoffmann wrote:
> On Thu, Feb 11, 2021 at 11:05:41AM -0500, Nick Rosbrook wrote:
> > Hi,
> > 
> > Just wanted to ping this. Patchwork link is here:
> > https://patchwork.kernel.org/project/qemu-devel/patch/20210201213021.500277-1-rosbrookn@ainfosec.com/.
> 
> Pull request sent now.
> Not much usb activity these days ...

Thanks!

NR

