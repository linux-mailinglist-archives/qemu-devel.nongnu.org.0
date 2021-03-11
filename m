Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F114E337985
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:37:23 +0100 (CET)
Received: from localhost ([::1]:43718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOJO-0004Nf-2r
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKO4S-0001Of-Hm
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:21:56 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKO4Q-0004Ft-Kv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:21:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so13619041wml.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Snh2OlaCVFNcJJABeM3DD3IraPGb4OCn2OPy6eZzZ4=;
 b=SJqYlTHV6RqnJCOceokYrM2N2MUs2OmfpEA2JHn4+sk8sNNysgQW6KLhwf/IkTvKD1
 gF3RK6bEnAxHsrulF5mWPbVkmAwOX1TIBb9brLhXBVoPiD47pv/OI41K4G3Lfbw2Ut6u
 CBIIVDWzRb5Rh2168dbkY5dLHHpHjHfU9aqmFwUVeWoLfQpGOxU2//5b4AntoxDPJF0X
 u7BoaNcXW0shJRRDc9jmd1OVoo2MKsnuKXI84v0cNNrMYjqaOXAQVO1LSEBdyGbBRCHz
 +okc+8wRKaBX9+pTe8e0dy87xybYYx/mlPsLs48sfN1Uh2VtFO6po8fgv+nk2UqDDR3f
 2Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Snh2OlaCVFNcJJABeM3DD3IraPGb4OCn2OPy6eZzZ4=;
 b=tASA652y+XBRGJ6/PgmAeSPzkJCvyI/p6U4HZppSJPEF38qC+g1yr0EZKox3WEyF5Q
 CLOcCvXS4CbEzivL/2q6Sv56hZ1HmcOltWiufgU0L7E/PXVxaLkobQpDnlzQ1rE7k9UL
 jaRqkKdU7XiiGl6soBv7AuXtvJLL3px0RzMsMJkXZwyeYvseDFEUXlYOB0CpE5GsbMP+
 JxRV7++FZRx+5ag+a1+38JKNxZHriO+3wfQsnYF0u22el+U0RxJw8FzRV1Pgqs3VxRtR
 RQQS5yyNgyZQYk865Ibkcb93h+lsb6PwK3zoTW9x3+lwpSEJXXiilWutgkhMpGUaQizZ
 uRUg==
X-Gm-Message-State: AOAM531vkcRm/mKOUn1IFkTGx4OHllA+z7gjBLzQ6QuSi7KWpRpAWE4w
 SfuxNo/Sf2WcgqoElkBhCUg=
X-Google-Smtp-Source: ABdhPJyQrjPxFeGI6cjScjsemoddeGeNsaOfVPAbUrZxJ3PATBEhJfONuo0p0S1BRZl2GJ6ZdpGu5w==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr8970017wma.18.1615479711933;
 Thu, 11 Mar 2021 08:21:51 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 7sm4086777wmk.8.2021.03.11.08.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 08:21:51 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Xu <peterx@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org> <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
 <20210310202919.GH6530@xz-x1>
 <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
Message-ID: <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
Date: Thu, 11 Mar 2021 17:21:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Aspeed team

On 3/11/21 1:18 PM, Philippe Mathieu-Daudé wrote:
> On 3/10/21 9:29 PM, Peter Xu wrote:

>> Yeah no worry - it's just that I feel one memory_region_init_alias() call is
>> probably missing in your huge series somewhere, so that you'll take that alias
>> MR as subregion rather than the real MR (which is the root of one AS).
> 
> OK, with your earlier comments start + Mark other comment I start
> to understand better.
> 
> So far:
> 
> (1a) AddressSpace is a physical view, its base address must be zero
> 
> (1b) AddressSpace aperture is fixed (depends on hardware design,
> not changeable at runtime
> 
> Therefore due to (1a):
> (2) AddressSpace root MemoryRegion is a container and must not be
> mmio-mapped anywhere (in particular not on SysBus).
> 
> (3) If hardware has a MMIO view of an AddressSpace, it has to be
> via a MemoryRegion alias. That way the alias handles paddr offset
> adjustment to the zero-based AddressSpace root container MR.
> Aliasing allows resizing the alias size without modifying the AS
> aperture size (1b).
> 
> I'll start adding assertions for (1a) and (2) in the code base and
> see if (3) adjustments are required.

So using:

-- >8 --
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee..8ce2d7f83b9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -713,6 +713,12 @@ static MemoryRegion
*memory_region_get_flatview_root(MemoryRegion *mr)
                 continue;
             }
         }
+        if (mr && mr->addr) {
+            error_report("Detected flatview root memory region '%s' with"
+                         " non-zero base address (0x%"HWADDR_PRIx"):
aborting",
+                         memory_region_name(mr), mr->addr);
+            abort();
+        }

         return mr;
     }
---

I get:

$ ./qemu-system-arm -M ast2600-evb
qemu-system-arm: Detected flatview root memory region
'aspeed.fmc-ast2600.flash' with non-zero base address (0x20000000): aborting
Aborted (core dumped)

Indeed:

$ ./qemu-system-arm -M ast2600-evb -S -monitor stdio
QEMU 5.2.50 monitor - type 'help' for more information
(qemu) info mtree
address-space: dma-dram
  0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
    0000000080000000-00000000bfffffff (prio 0, ram): ram
    00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram

address-space: aspeed.fmc-ast2600-dma-flash
  0000000020000000-000000002fffffff (prio 0, i/o): aspeed.fmc-ast2600.flash
    0000000020000000-0000000027ffffff (prio 0, i/o): aspeed.fmc-ast2600.0
    0000000028000000-000000002fffffff (prio 0, i/o): aspeed.fmc-ast2600.1

address-space: aspeed.fmc-ast2600-dma-dram
  0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
    0000000080000000-00000000bfffffff (prio 0, ram): ram
    00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram

address-space: aspeed.spi1-ast2600-dma-flash
  0000000030000000-000000003fffffff (prio 0, i/o): aspeed.spi1-ast2600.flash
    0000000030000000-0000000037ffffff (prio 0, i/o): aspeed.spi1-ast2600.0

address-space: aspeed.spi1-ast2600-dma-dram
  0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
    0000000080000000-00000000bfffffff (prio 0, ram): ram
    00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram

address-space: aspeed.spi2-ast2600-dma-flash
  0000000050000000-000000005fffffff (prio 0, i/o): aspeed.spi2-ast2600.flash
    0000000050000000-0000000057ffffff (prio 0, i/o): aspeed.spi2-ast2600.0

address-space: aspeed.spi2-ast2600-dma-dram
  0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
    0000000080000000-00000000bfffffff (prio 0, ram): ram
    00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram

Many address spaces not zero-based...

