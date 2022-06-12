Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385545479DA
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 12:57:04 +0200 (CEST)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0LHC-0000hp-Oq
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 06:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o0LDa-0008GZ-G6
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 06:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o0LDX-0004xi-Fg
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 06:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655031193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w46Lj7wQrboGNaxR2wRV1CMUPHHLDqb83zy1LxlWHss=;
 b=GGFxV18n1iRBC2oHYOkdJKN4SKC29aSovJ2PfwZhA7NIoxTT54MG7QUUEuCqe7I0F4tU3b
 57s+W2NmD53Gk3IX4nBMeLjvkGDaAfMFLHkK2kQOF98Lx753gOa2UyBk9szpNjFN5cTQL0
 vyorU1TasYaI+eIDy85tv4Ep+JL5A9g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-820NOdjONTiyWNwuhZ1rTg-1; Sun, 12 Jun 2022 06:53:06 -0400
X-MC-Unique: 820NOdjONTiyWNwuhZ1rTg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so1152284wmq.5
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 03:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w46Lj7wQrboGNaxR2wRV1CMUPHHLDqb83zy1LxlWHss=;
 b=Yuo3ghSLoNzYyeoh43uxvIY8AubRhydlstOFfFeVgoeBmFqqepq9FSmaF4gCBKD5vb
 L4LGjIFs0XHZYmo+O+faZbXtEb22imr6uCKY/hBLHaiWE1X5RDqsvQAscVvw9Q+uLD6S
 GbUGP8R9pTd6GaKiBh/YIqdbHhDKcsRmOIHf1Vc1HT81eU+18kvgqqq5jekUeb/HNpvo
 661Km+a7FbjTrA7UEi4F8v1ZoUm8O675xrgZ5N+GLyvZaLB30HlXEbNXMp6S91Mo1ANk
 hd7N9lrAPhmQZWkE4tWSSiedxMFF9WpuThVHO78eRXx090GL1MHJ/jnJdrKHLlA3yrMN
 vv0Q==
X-Gm-Message-State: AOAM5307TKXMs85TwKvZiBtgzb2Mowp387rxrCAt/54BRSR+HSHlTMHE
 CrBhuvfuANAUrZcgn+9Iu/4HrpzelIUE2s68xK9v4HENU/2eYMgQKuWY1DrqqPV/dhPBVdfpEbU
 DgKLlnLssLJE+Zr0=
X-Received: by 2002:a05:600c:590:b0:39c:463c:1931 with SMTP id
 o16-20020a05600c059000b0039c463c1931mr8547079wmd.119.1655031183161; 
 Sun, 12 Jun 2022 03:53:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6GXeY351FP7kaEu19HVb9lll2coNHmJ7Ap7jhiqvkVQPDznqvlFj/EpFrqDWjLzNjRGKgqQ==
X-Received: by 2002:a05:600c:590:b0:39c:463c:1931 with SMTP id
 o16-20020a05600c059000b0039c463c1931mr8547045wmd.119.1655031182780; 
 Sun, 12 Jun 2022 03:53:02 -0700 (PDT)
Received: from redhat.com ([2.54.35.243]) by smtp.gmail.com with ESMTPSA id
 r16-20020a056000015000b0021108003596sm5239191wrx.10.2022.06.12.03.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 03:53:01 -0700 (PDT)
Date: Sun, 12 Jun 2022 06:52:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/11] hw/acpi/piix4: remove legacy piix4_pm_init()
 function
Message-ID: <20220612065245-mutt-send-email-mst@kernel.org>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 30, 2022 at 01:27:07PM +0200, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> This series moves the outstanding logic from piix4_pm_init() into
> the relevant instance init() and realize() functions, changes the
> IRQs to use qdev gpios, and then finally removes the now-unused
> piix4_pm_initfn() function.


Looks ok

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> v2:
> - Addressed Ani & Bernhard review comments
> 
> If no further comments I plan to queue this via mips-next end of
> this week.
> 
> Regards,
> 
> Phil.
> 
> Mark Cave-Ayland (11):
>   hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>     piix4_pm_realize()
>   hw/acpi/piix4: change smm_enabled from int to bool
>   hw/acpi/piix4: convert smm_enabled bool to qdev property
>   hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
>   hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>   hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>   hw/acpi/piix4: use qdev gpio to wire up sci_irq
>   hw/acpi/piix4: use qdev gpio to wire up smi_irq
>   hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>     piix4_pm_initfn()
>   hw/isa/piix4.c: create PIIX4_PM device directly instead of using
>     piix4_pm_initfn()
>   hw/acpi/piix4: remove unused piix4_pm_initfn() function
> 
>  hw/acpi/piix4.c               | 77 ++++++-----------------------------
>  hw/i386/acpi-build.c          |  1 +
>  hw/i386/pc_piix.c             | 16 +++++---
>  hw/isa/piix4.c                | 11 +++--
>  include/hw/acpi/piix4.h       | 75 ++++++++++++++++++++++++++++++++++
>  include/hw/southbridge/piix.h |  6 ---
>  6 files changed, 107 insertions(+), 79 deletions(-)
>  create mode 100644 include/hw/acpi/piix4.h
> 
> -- 
> 2.36.1


