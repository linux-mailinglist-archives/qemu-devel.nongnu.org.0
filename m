Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9F69E3B4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUjz-0002r5-TI; Tue, 21 Feb 2023 10:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pUUjy-0002qs-BL
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:39:38 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pUUjw-000292-AL
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:39:37 -0500
Received: by mail-ed1-x529.google.com with SMTP id da10so20071605edb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N8iFB14rIT57GeeWTnCCVONi0x8amonzZ1FBCqa/x/4=;
 b=MbqXgUBkzeb62j2LS1c86lhdNHOI+zmelqUKiy5uWFbwsmzKjtlIKMDfjlRreAxfVb
 zKkl1hHLMPtZVbobUNljGd+1m+GoHg4AluZ3cmbNe/L4D6yMTfNQbm95kjxcADzVts8u
 uMM0u6HlXz/R9noUnFq5MZstgqLjJAlMY6Dh5vVcC3DSxvqYDU7F/JGbL+hjgew+Hdjo
 s1xFCrHu3xKDwarkMjxFGIf6Vyr6I0BGNohzOWWhND2p1KvGG8bdgyEwLhXIuqbQF7Gl
 S2FAnfpCsrT+Ts+UNf9mlOoWuyTqHs5gdvpc0U6/FGz4BOahPViCGEkyQvIizPfXy0Pa
 LF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N8iFB14rIT57GeeWTnCCVONi0x8amonzZ1FBCqa/x/4=;
 b=D3A6W2dWELpnTypKQgv+d2j/lrQQj4qd7d6QY9sWx7a7VkDLeyuQxX2qblClJujfNt
 4pihx3/y/8alOE6y5AidZ+vj62SfO5AP2i0s+BoYdNUy7u1uG92fZ9EEnWpFtJl0h5Sn
 sAMwq6j/LhJkSfo9hEnH6ZazW4Xh4JvWZ63auh0XMbN7TOskCnbudMZhB5kHysFHVtV+
 bvtlJ4TXP4w2FxnXqU7zMlT4X06EmXO3L/cmCkWA8o9Q9+yi7tUXnEsGekuyb69a7Hhn
 gbhb4dIP8To02jxIQ8vsCho/+pbMLa0ZKrbQratF0FMxwniwtyf1FoNl/UrLzkMHV+XF
 QqlQ==
X-Gm-Message-State: AO0yUKWoS/uvapKMHRl/wyM3MhOnQKDrK0yDDVa/h+w8ldRffFS2oSTM
 1Ei1mkH/9eJjYI8vLE9mCPPKTlTiJdg=
X-Google-Smtp-Source: AK7set/tMmMCr8Q8HzvxjkTWuAdtdFr27Pk+qDxDb63fpWstz9XfMuskkemEc4RxqvDCTnxuDCe8Nw==
X-Received: by 2002:a17:907:ea2:b0:8aa:f2f2:7543 with SMTP id
 ho34-20020a1709070ea200b008aaf2f27543mr18390637ejc.29.1676993974416; 
 Tue, 21 Feb 2023 07:39:34 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee000cdc023a29c679bc.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:cdc:23a:29c6:79bc])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a170906494600b008e240be0bddsm540881ejt.140.2023.02.21.07.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 07:39:34 -0800 (PST)
Date: Tue, 21 Feb 2023 15:39:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 00/12] Q35 PCI host fixes and QOM cleanup
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
Message-ID: <A090A42F-D368-4671-9C91-716DD2D7CA64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 14=2E Februar 2023 13:14:29 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>This series mostly cleans up QOM-related initialization code=2E It also p=
erforms
>
>some modernization and fixing=2E
>
>
>
>The first patch originates from "PC and ICH9 clanups" series [1] which ha=
s been
>
>dropped in v3 in favor of another series [2]=2E Review comments in [2] su=
ggest it
>
>needs more work, so bring the patch back here=2E
>
>
>
>Patch 2 fixes a clangd warning and patch 3 modernizes usage of the memory=
 API=2E
>
>
>
>Patches 4-9 clean up initialization code=2E
>
>
>
>The last four patches also clean up initialization code with the last pat=
ch
>
>doing the actual cleanup=2E
>

Ping

>
>
>Based-on: <20230213162004=2E2797-1-shentey@gmail=2Ecom>
>
>         "[PATCH v4 0/9] PC cleanups"
>
>
>
>Testing done:
>
>* `make check`
>
>* `make check-avocado`
>
>* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>
>     manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>
>
>
>[1] https://lore=2Ekernel=2Eorg/qemu-devel/20230131115326=2E12454-1-shent=
ey@gmail=2Ecom/
>
>[2] https://lore=2Ekernel=2Eorg/qemu-devel/20230203180914=2E49112-1-philm=
d@linaro=2Eorg/
>
>
>
>Bernhard Beschow (12):
>
>  hw/i386/pc_q35: Resolve redundant q35_host variable
>
>  hw/pci-host/q35: Fix contradicting =2Eendianness assignment
>
>  hw/pci-host/q35: Use memory_region_set_address() also for
>
>    tseg_blackhole
>
>  hw/pci-host/q35: Initialize PCMachineState::bus in board code
>
>  hw/pci-host/q35: Initialize "bypass-iommu" property from board code
>
>  hw/pci-host/q35: Initialize properties just once
>
>  hw/pci-host/q35: Initialize PCI hole boundaries just once
>
>  hw/pci-host/q35: Turn PCI hole properties into class properties
>
>  hw/pci-host/q35: Rename local variable to more idiomatic "phb"
>
>  hw/pci-host/q35: Propagate to errp rather than doing error_fatal
>
>  hw/pci-host/q35: Merge mch_realize() into q35_host_realize()
>
>  hw/pci-host/q35: Move MemoryRegion pointers to host device
>
>
>
> include/hw/pci-host/q35=2Eh |  17 +-
>
> hw/i386/pc_q35=2Ec          |  33 ++--
>
> hw/pci-host/q35=2Ec         | 325 ++++++++++++++++++--------------------=

>
> 3 files changed, 178 insertions(+), 197 deletions(-)
>
>
>
>-- >
>2=2E39=2E1
>
>
>

