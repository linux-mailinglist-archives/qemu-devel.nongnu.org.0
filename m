Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1A324DAA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:11:21 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDc8-0005nQ-Ii
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDag-0004kT-RA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDaf-0005m7-DZ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvXsaw/AILjun77jXKAFt41GdLckWSIpfidPe8nrw9U=;
 b=EIlMdo0EfgOiB6Sqeds+8eIzrEiVRkRk3+jLlaD1gzYVyVR0pkqsxCngn+j3mSmRRYIYbS
 xO9HBO3Bh7e1fVX0oqSNx0PCJygwdz8TSxL/0P2xrkKpEs439g3ARuxG1jDpVzXPWRdihS
 +DKHHU6jsXzEOqyWirpKc2mpBuK6aWY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-l8rZIrW6PjeQzjJEvUz75Q-1; Thu, 25 Feb 2021 05:09:45 -0500
X-MC-Unique: l8rZIrW6PjeQzjJEvUz75Q-1
Received: by mail-ed1-f70.google.com with SMTP id l6so2389344edb.21
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tvXsaw/AILjun77jXKAFt41GdLckWSIpfidPe8nrw9U=;
 b=UIC2saZeYDhMWudQ9e16xBQLd8nV57PEG49mJowuqAXsI7j0ueEOISYXTIZaPDpnGm
 11TKd2ChYyG0E5uAYfufh2aS/YWX/jkinretpF2XrRH945vJ6s0/Dj56ZLI+zzmhbzN1
 6Bdnz6KORX+G//h4Ad2pfTq0XOWBwjC/wh0IHxuzDaKZcKS5A2DhVe96YnhXNaPShvE6
 3KyW58AkFRApiVd+qok1LXEVRrXJWPszrzA6lST7LeP5f7m8eQJUrQVIiAI+fpj/Djmc
 FghQsnhOvzfuJp8F1j5jr7H9v/Zcs7SbGKiRFznHewuSuid2IDRJQB1CFwyrwoQ/UJbJ
 IpCA==
X-Gm-Message-State: AOAM531CtcVJc+DGXmUyWLb6WFOy6Yi7a8puPF9JwKjBaXxAXO+2eTl0
 cs3w9HF8oAacA4ahMw3rHDQQ4lotFA/Li4diHhDdQpfBBZ6UWPE438lwdNdL1z2PVt8fjZwuM2i
 yiiwqLJcSc4t7bWs=
X-Received: by 2002:a17:906:2a01:: with SMTP id
 j1mr1931856eje.416.1614247783796; 
 Thu, 25 Feb 2021 02:09:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNhXEGZ2EDMtnr1qhm7QrO24fmVEYAeTMxG+SZfkTBPJ9Ml+Qjp40Q9YGZ1LXZz9yHkHnBWg==
X-Received: by 2002:a17:906:2a01:: with SMTP id
 j1mr1931838eje.416.1614247783617; 
 Thu, 25 Feb 2021 02:09:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n17sm3256804eds.96.2021.02.25.02.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:09:42 -0800 (PST)
Subject: Re: [PATCH v4 0/8] hw/sh4: Kconfig cleanups
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222141514.2646278-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <468b0b50-c822-6771-fad4-2c3d5bee5277@redhat.com>
Date: Thu, 25 Feb 2021 11:09:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 15:15, Philippe Mathieu-Daudé wrote:
> Missing review: 1 (license)
> 
> Since v3:
> - Include full MIT license text (Peter)
> 
> Since v2:
> - Added missing TC58128/SH_PCI Kconfig entries (Peter)
> 
> Since v1:
> - Addressed Peter Maydell review comments from
> https://www.mail-archive.com/qemu-block@nongnu.org/msg80599.html
> 
> Philippe Mathieu-Daudé (8):
>    hw/sh4: Add missing license
>    hw/sh4: Add missing Kconfig dependency on SH7750 for the R2D board
>    hw/intc: Introduce SH_INTC Kconfig entry
>    hw/char: Introduce SH_SCI Kconfig entry
>    hw/timer: Introduce SH_TIMER Kconfig entry
>    hw/block: Introduce TC58128 eeprom Kconfig entry
>    hw/pci-host: Introduce SH_PCI Kconfig entry
>    hw/sh4: Remove now unused CONFIG_SH4 from Kconfig
> 
>   include/hw/sh4/sh.h           | 31 ++++++++++++++++++++++++++++---
>   hw/block/tc58128.c            | 26 ++++++++++++++++++++++++++
>   hw/{sh4 => pci-host}/sh_pci.c |  0
>   MAINTAINERS                   |  6 ++++++
>   hw/block/Kconfig              |  3 +++
>   hw/block/meson.build          |  2 +-
>   hw/char/Kconfig               |  3 +++
>   hw/char/meson.build           |  2 +-
>   hw/intc/Kconfig               |  3 +++
>   hw/intc/meson.build           |  2 +-
>   hw/pci-host/Kconfig           |  4 ++++
>   hw/pci-host/meson.build       |  1 +
>   hw/sh4/Kconfig                | 12 ++++++------
>   hw/sh4/meson.build            |  1 -
>   hw/timer/Kconfig              |  4 ++++
>   hw/timer/meson.build          |  2 +-
>   16 files changed, 88 insertions(+), 14 deletions(-)
>   rename hw/{sh4 => pci-host}/sh_pci.c (100%)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


