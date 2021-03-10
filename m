Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE08334851
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:50:41 +0100 (CET)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4qp-0003HV-PO
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK4pp-0002oo-NO
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:49:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK4pn-0005qU-39
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615405769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3XeOqv5cQlGl0eO/t8LydGU0sf4eNI306PXpoBttp4=;
 b=TRIfzBKp8qeAcKD+RB8vICpX7VKQd87YKr4UWAkLA7WmR0ySe6Y+re+9RCtk4HT2jB3PI7
 vWmHfqQBMZdWwvWZKp3VniJ9CeymdPfmpSHiToZG/sz2CetVfR96ULpyso+Sih94v8C1HU
 aQ8x+SXfYEqpOK70yfUzONxgnvsObAs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-YfHpVsP6MbO5iJ3eVHAnPA-1; Wed, 10 Mar 2021 14:49:27 -0500
X-MC-Unique: YfHpVsP6MbO5iJ3eVHAnPA-1
Received: by mail-qk1-f200.google.com with SMTP id i11so13596811qkn.21
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=j3XeOqv5cQlGl0eO/t8LydGU0sf4eNI306PXpoBttp4=;
 b=C2ywqMY0s/h5vxTiRI9pJOKFlcT5DVpnnXBw6m4DW9uXUSPI2NPBcYtD98BTanO3kj
 TkZCF8tzd8l2AamLensxY33eWc5ungXHItgZfP/V66nZpbkR8mDathyeChLGBE8KUCoU
 RmQd9SPrCZ5YSs7KIiTKRhemI0UmecD6bgg8WRkaYzRnluMbUc8iaa54+Cjz5drrn5wj
 Q5Kw6fxtT+Zh20CEXSd3+axkfpy+W2IK1kYpPna58kckFS77C7Nv6/ukrhOiSehAoM63
 HQFg55R/KN/GJA2I52xlUmK1RFfnPHTbNr+4FRhN2vkemU7Y/YWa4Tx143DzhoM+iE5Y
 BS+A==
X-Gm-Message-State: AOAM530Y5nSuxyw2aV8nyFqaVp6+pB/QSO9IwyE87IxD2ayIN3yI33/k
 cVsMak8P2cx3ITxKj7Wt3ASA8QhX5oWR1Ug8GOFBzu9E9Z0uVizlXEdT+Ld8eAStpIKgXnu06v0
 O12wyT0yVCZNlMdM=
X-Received: by 2002:ac8:5c83:: with SMTP id r3mr4247576qta.247.1615405767053; 
 Wed, 10 Mar 2021 11:49:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvdKzYNViVhNAu9g3zodWrqKvlXyDTvSFXZPE05/1MlImmHLmkdERMaTwRKTiyDo9OLYRnRw==
X-Received: by 2002:ac8:5c83:: with SMTP id r3mr4247559qta.247.1615405766844; 
 Wed, 10 Mar 2021 11:49:26 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id t128sm258929qka.46.2021.03.10.11.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:49:26 -0800 (PST)
Date: Wed, 10 Mar 2021 14:49:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
Message-ID: <20210310194924.GF6530@xz-x1>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210310191255.1229848-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 08:12:54PM +0100, Philippe Mathieu-Daudé wrote:
> No need to create a local ISA I/O MemoryRegion, use get_system_io().
> 
> This partly reverts commit 5c63bcf7501527b844f61624957bdba254d75bfc.

I think it's not a clean revert of that, see below.

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/mips/jazz.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 1a0888a0fd5..9ac9361b7eb 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -158,7 +158,6 @@ static void mips_jazz_init(MachineState *machine,
>      rc4030_dma *dmas;
>      IOMMUMemoryRegion *rc4030_dma_mr;
>      MemoryRegion *isa_mem = g_new(MemoryRegion, 1);
> -    MemoryRegion *isa_io = g_new(MemoryRegion, 1);
>      MemoryRegion *rtc = g_new(MemoryRegion, 1);
>      MemoryRegion *i8042 = g_new(MemoryRegion, 1);
>      MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
> @@ -259,11 +258,10 @@ static void mips_jazz_init(MachineState *machine,
>      memory_region_add_subregion(address_space, 0x8000d000, dma_dummy);
>  
>      /* ISA bus: IO space at 0x90000000, mem space at 0x91000000 */
> -    memory_region_init(isa_io, NULL, "isa-io", 0x00010000);
>      memory_region_init(isa_mem, NULL, "isa-mem", 0x01000000);
> -    memory_region_add_subregion(address_space, 0x90000000, isa_io);
> +    memory_region_add_subregion(address_space, 0x90000000, get_system_io());

The old code has an alias created just for adding subregion into address_space:

-    /* ISA IO space at 0x90000000 */
-    memory_region_init_alias(isa, NULL, "isa_mmio",
-                             get_system_io(), 0, 0x01000000);
-    memory_region_add_subregion(address_space, 0x90000000, isa);
-    isa_mem_base = 0x11000000;

While you didn't revert that part.  Maybe that's the issue?

-- 
Peter Xu


