Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F646A8B44
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:55:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqtR-00049u-C6; Thu, 02 Mar 2023 16:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqtM-00049Z-Lo
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:55:12 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqtK-0006Ts-SP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:55:12 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s11so2734971edy.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677794109;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lytxkTnr4fjC34sOucRRh3zQIb1hcEyEptLsKVSlYs=;
 b=OaxtHedQY93fBPWuELXsDOb/lMEPbMxtCgu23bfEF3Akqufa21t5rfeuf8X8ei5p/s
 K8fauaFm2ZgjQU19A0pJnHZWt+Qj0/Ffieaj9ac+asJyIY7aH4VVCGgAX9yNhIN88NXG
 D41PDLdGWu4AgPZkuOfr7kyR67oMchERP7T1HxAhXToqtoI1cXdzhsMBYdOtnkbsAHsM
 GEJeemUlc6J5RjSkqjBzxam/NwlHZeAIwnziu7ppR4bDWyQgW8fKm8/jtVRNxlWZ3tcs
 zh+HuuvcOA457vYmiVdEFMAHJSvcCLDVv/JbuXGB7NYCQKDR9bDuR6UeyXbWEIsA4tCq
 XGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677794109;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5lytxkTnr4fjC34sOucRRh3zQIb1hcEyEptLsKVSlYs=;
 b=X29Ak7xfRA47dfySYeLEYx78QJQs4jMlAGNn54p+yxWIXqY8JrNNiZQnhItHqp2FF8
 05pA54iwLeFbN2sRbash1TmdYP9aS57XwJqkXvlOoamoH4xpt1XZLC9mKJ5/BcB5JBJu
 9n4UEHy4UVHBIzdPPdRMftQ8QntnjaXIyv8x24QD2U3UzoLSSEUpX3qrQNctrkh6Raas
 4zjv9pcsbQ0mrGNc8xK1fApdkv2/kgVexwGftjILcAl3MjTei7pv+U1sszmDMrpCW0cp
 xqFH7i8Lp5bKpKLOc7W8OImx2LttAp0xWXv2RUkqCqMr6YfHWt1u5ke1ylL0PdzUMX1C
 nA3Q==
X-Gm-Message-State: AO0yUKXY6a2sQ8NOSzIkZG7esjxP37Ej6reB5jNkaMOEvw34QaDcBsVw
 BzVZ/hQRGAwlJSlN76Oa+bw=
X-Google-Smtp-Source: AK7set80BYDn/aB5hImVVq2B+84l7cMIN97IS3PrSrEKb+WzsXCIOxt3QKnTvlnPCLNJoDnJcdpvhw==
X-Received: by 2002:aa7:dd48:0:b0:4ac:c7b3:8c27 with SMTP id
 o8-20020aa7dd48000000b004acc7b38c27mr12646940edw.28.1677794108959; 
 Thu, 02 Mar 2023 13:55:08 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-150-004.92.224.pool.telefonica.de.
 [92.224.150.4]) by smtp.gmail.com with ESMTPSA id
 b30-20020a509f21000000b004a21263bbaasm177513edf.49.2023.03.02.13.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 13:55:08 -0800 (PST)
Date: Thu, 02 Mar 2023 21:54:56 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 00/12] Q35 PCI host fixes and QOM cleanup
In-Reply-To: <20230301164900-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
 <A090A42F-D368-4671-9C91-716DD2D7CA64@gmail.com>
 <20230301164900-mutt-send-email-mst@kernel.org>
Message-ID: <16134200-0C75-4FFE-834D-6E081D7CA96E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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



Am 1=2E M=C3=A4rz 2023 21:49:37 UTC schrieb "Michael S=2E Tsirkin" <mst@re=
dhat=2Ecom>:
>On Tue, Feb 21, 2023 at 03:39:28PM +0000, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 14=2E Februar 2023 13:14:29 UTC schrieb Bernhard Beschow <shentey@gm=
ail=2Ecom>:
>> >This series mostly cleans up QOM-related initialization code=2E It als=
o performs
>> >
>> >some modernization and fixing=2E
>> >
>> >
>> >
>> >The first patch originates from "PC and ICH9 clanups" series [1] which=
 has been
>> >
>> >dropped in v3 in favor of another series [2]=2E Review comments in [2]=
 suggest it
>> >
>> >needs more work, so bring the patch back here=2E
>> >
>> >
>> >
>> >Patch 2 fixes a clangd warning and patch 3 modernizes usage of the mem=
ory API=2E
>> >
>> >
>> >
>> >Patches 4-9 clean up initialization code=2E
>> >
>> >
>> >
>> >The last four patches also clean up initialization code with the last =
patch
>> >
>> >doing the actual cleanup=2E
>> >
>>=20
>> Ping
>
>
>sent some comments=2E

I'll look into it over the weekend=2E I'm quite busy right now=2E

Best regards,
Bernhard

>Philippe was reviewing related patches maybe
>he wants to poke at these too=2E
>
>> >
>> >
>> >Based-on: <20230213162004=2E2797-1-shentey@gmail=2Ecom>
>> >
>> >         "[PATCH v4 0/9] PC cleanups"
>> >
>> >
>> >
>> >Testing done:
>> >
>> >* `make check`
>> >
>> >* `make check-avocado`
>> >
>> >* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>> >
>> >     manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>> >
>> >
>> >
>> >[1] https://lore=2Ekernel=2Eorg/qemu-devel/20230131115326=2E12454-1-sh=
entey@gmail=2Ecom/
>> >
>> >[2] https://lore=2Ekernel=2Eorg/qemu-devel/20230203180914=2E49112-1-ph=
ilmd@linaro=2Eorg/
>> >
>> >
>> >
>> >Bernhard Beschow (12):
>> >
>> >  hw/i386/pc_q35: Resolve redundant q35_host variable
>> >
>> >  hw/pci-host/q35: Fix contradicting =2Eendianness assignment
>> >
>> >  hw/pci-host/q35: Use memory_region_set_address() also for
>> >
>> >    tseg_blackhole
>> >
>> >  hw/pci-host/q35: Initialize PCMachineState::bus in board code
>> >
>> >  hw/pci-host/q35: Initialize "bypass-iommu" property from board code
>> >
>> >  hw/pci-host/q35: Initialize properties just once
>> >
>> >  hw/pci-host/q35: Initialize PCI hole boundaries just once
>> >
>> >  hw/pci-host/q35: Turn PCI hole properties into class properties
>> >
>> >  hw/pci-host/q35: Rename local variable to more idiomatic "phb"
>> >
>> >  hw/pci-host/q35: Propagate to errp rather than doing error_fatal
>> >
>> >  hw/pci-host/q35: Merge mch_realize() into q35_host_realize()
>> >
>> >  hw/pci-host/q35: Move MemoryRegion pointers to host device
>> >
>> >
>> >
>> > include/hw/pci-host/q35=2Eh |  17 +-
>> >
>> > hw/i386/pc_q35=2Ec          |  33 ++--
>> >
>> > hw/pci-host/q35=2Ec         | 325 ++++++++++++++++++-----------------=
---
>> >
>> > 3 files changed, 178 insertions(+), 197 deletions(-)
>> >
>> >
>> >
>> >-- >
>> >2=2E39=2E1
>> >
>> >
>> >
>

