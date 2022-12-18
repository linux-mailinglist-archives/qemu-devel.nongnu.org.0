Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE0464FEEF
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 14:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6tME-0002WT-JS; Sun, 18 Dec 2022 08:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p6tMB-0002VQ-Od
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p6tM9-0007k2-81
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671368727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MmwUpEzu2jQZv0ay5Cgna1CDK+fw4siq1KaKp8eo3w=;
 b=YnCEnkHj+wmkYnR4F310gB929WKGs2a2SMSda6Fk9oBHQrdHhdkX9p+2VQj0L7Z33Ch4Ia
 AD7ixt8qJwG/kKYnivFu4QlW85jKh4WDdPH4RbqhXScUBV9ytWaZctxynDMcP8y8WYQv5S
 2Zq9P/KOQGCW8E1TLMlBqDkeX9RdA7s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-s0m8jUbAMxS2zJlc-WKuPQ-1; Sun, 18 Dec 2022 08:05:26 -0500
X-MC-Unique: s0m8jUbAMxS2zJlc-WKuPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so1269491wmj.8
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5MmwUpEzu2jQZv0ay5Cgna1CDK+fw4siq1KaKp8eo3w=;
 b=4uWvo+NgHIOOA/GgfssJDQIt7y6rabxSaL7hKNnxqyz+VSrV3+hxwxfivqYOvWBqtp
 Arq//c18OYjq67YSFE8r0BF8vnhBdWwfO2Kog5eKRMFDl0booCLxbZd6wiKsqbEfR6kI
 GmGaOz0fNyH4VImVspGPzxWofJc43Y+SF6ndksagom3hMdNFFzG7RcEDYYDc1L9ESZ9v
 NaCOfI+YysgI49E2fi8OC99wJYSaL1tBc3pS0U5qOlAxUpEMHdZQ9YGCNjhrD8E6LHuA
 vhBQ3rkBGRVeAWvqpE8ktcarsKPHeSYiPEoXD/jqZA+xnlK7r/M+OlDmG6lpoBUIyfib
 djag==
X-Gm-Message-State: ANoB5pl66VjFQEBP4mYNAEP7ACFNu+yj5Yjn+Tb6G46L9gZadirHaiR/
 y7TIg51MdOzElcnxP392jILHwu/Q3AENtbOa5rvp2k+NiZO/d/OavIvzOUYUYnbKXzShWlBTv1U
 dZ9EibddY7ZRPANg=
X-Received: by 2002:a05:6000:1b04:b0:242:5023:46c7 with SMTP id
 f4-20020a0560001b0400b00242502346c7mr24512680wrz.57.1671368725220; 
 Sun, 18 Dec 2022 05:05:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nIhX1qDZ3kS784aNftWss16YVMWA03NGxtkaywDpp+Vql6V0jAePK1aSUYhGutJyEtHW7AQ==
X-Received: by 2002:a05:6000:1b04:b0:242:5023:46c7 with SMTP id
 f4-20020a0560001b0400b00242502346c7mr24512661wrz.57.1671368724975; 
 Sun, 18 Dec 2022 05:05:24 -0800 (PST)
Received: from redhat.com ([2.52.25.20]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d5283000000b0024206ed539fsm7293990wrv.66.2022.12.18.05.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 05:05:23 -0800 (PST)
Date: Sun, 18 Dec 2022 08:05:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Message-ID: <20221218080511-mutt-send-email-mst@kernel.org>
References: <20221120150550.63059-1-shentey@gmail.com>
 <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
 <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
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

On Sun, Dec 18, 2022 at 10:21:49AM +0000, Bernhard Beschow wrote:
> 
> 
> Am 9. Dezember 2022 15:23:59 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
> >On 20/11/22 16:05, Bernhard Beschow wrote:
> >> v1:
> >> ===
> >> 
> >> During my PIIX consolidation work [1] I've noticed that both PIIX models have
> >> quite different pci_slot_get_pirq() implementations. These functions seem to
> >> map PCI INTx pins to input pins of a programmable interrupt router which is
> >> AFAIU board-specific. IOW, board-specific assumptions are baked into the device
> >> models which prevent e.g. the whole PIIX4 south bridge to be reusable in the PC
> >> machine.
> >> 
> >> This series first factors out pci_bus_map_irqs() from pci_bus_irqs() which
> >> then allowes for moving the two board-specific PIIX pci_slot_get_pirq()
> >> funtions into their respective boards. With these changes, the PIIX4 south
> >> bridge could eventually become an alternative to the PIIX3-Frankenstein
> >> solution in the PC machine.
> >
> >Series:
> >Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Ping
> 
> Who will pull this?

I'll merge this, thanks!


