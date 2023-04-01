Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2876D34E1
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 00:38:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pijqD-0003pG-G0; Sat, 01 Apr 2023 18:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pijqB-0003or-BZ
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 18:36:55 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pijq9-0004L8-Nu
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 18:36:55 -0400
Received: by mail-ed1-x536.google.com with SMTP id eg48so103414608edb.13
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680388611;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mcXjgUWbrap77dni2Kc4rFFZA3pvAccTjwmsDr8bxU=;
 b=mEteHCJVGbFfX6tRGM1s1+VkgCn+hxBW1ZPMXM8bHo1lDikF/amdVWjUftAXcShM8a
 QSUCelFL9ah0+AXtIsc17IFeWQH3I9hozzG5sbBDkZn+ElBcPC9HegHKvD+3vyTOjND3
 ugVPymLueNtOS+uB1+vL9uTzj6FXIW+y9HEhS2zqCKO91NvGVU76xY7V5+tEJG7NKrZj
 Zvoov0pcWYrLUjrLk3iPcEgyiUbVABU0T3DFZfzBGIhRfiIIfV26WtEYaypcV8qu1J8r
 HEWMBS+85UsEL27hFh76IGPqOkyEEeNSgnno6LLxlQm/ygtzQTIaNvuKHJa8j26iRqFv
 04YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680388611;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3mcXjgUWbrap77dni2Kc4rFFZA3pvAccTjwmsDr8bxU=;
 b=wR8xbRHweCuVhvZDTXFS0WJF22+w7yY7uYk49MURGKvBi0+jdwCLWGIeB5ez6zSP6G
 gIJxydmG7ySd794TlpJ/z13uV5b8CkzAlgqT0liXz7ZxBIYEcJ3ayxAgFAbVOhfW1y8x
 q5GF015T9c//A6zSgvHID4z7QGdvmT5rjo07ifDJWDf4n8Etlq8bP/IZ/fkRGJ7dza3O
 uhP4Yt0W9mdgrn1jj/DSMC3PATN6Zh5MPfHajvK3pojH3KuuCtbiQwSHNwbZEzvSWchI
 oF7cFN31MuynClk+6ZBX+az/GrdwTXtMSi20dWBJWLBmx9/tirB1OmdvAIcDz8vkZOkM
 Jd6w==
X-Gm-Message-State: AAQBX9f3Eu5EVHbXjdUR8grghWQXDCpeNi1cKoOpAzCMoedDns6H69+f
 u15qVv+BmWFRsuhEk5L6YkM=
X-Google-Smtp-Source: AKy350ZBAQ0NclZYRHIFZo8U4NApWMVwMHMu7y4terrO7HGjAO6fxbeX8o8y5iqHZuYoEBhpoQdpEA==
X-Received: by 2002:a17:907:2077:b0:92f:fbac:69c4 with SMTP id
 qp23-20020a170907207700b0092ffbac69c4mr30391166ejb.56.1680388611436; 
 Sat, 01 Apr 2023 15:36:51 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-027-219.77.13.pool.telefonica.de.
 [77.13.27.219]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b00501c2a9e16dsm2525599edb.74.2023.04.01.15.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 15:36:51 -0700 (PDT)
Date: Sat, 01 Apr 2023 22:36:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_hw/isa/piix3=3A_Reuse?=
 =?US-ASCII?Q?_piix3=5Frealize=28=29_in_piix3=5Fxen=5Frealize=28=29?=
In-Reply-To: <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
Message-ID: <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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



Am 30=2E M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony=2Eper=
ard@citrix=2Ecom>:
>On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>> This is a preparational patch for the next one to make the following
>> more obvious:
>>=20
>> First, pci_bus_irqs() is now called twice in case of Xen where the
>> second call overrides the pci_set_irq_fn with the Xen variant=2E
>
>pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
>piix3_xen_realize() will leak `pci_bus->irq_count`=2E Could you look if
>pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
>call, or maybe some other way to avoid the leak?

Thanks for catching this! I'll post a v4=2E

I think the most fool-proof way to fix this is to free irq_count just befo=
re the assignment=2E pci_bus_irqs_cleanup() would then have to NULL the att=
ribute such that pci_bus_irqs() can be called afterwards=2E

BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as Xe=
n guest with my pc-piix4 branch without success=2E This branch essentially =
just provides slightly different PCI IDs for PIIX=2E Does xl or something e=
lse in Xen check these? If not then this means I'm still missing something=
=2E Under KVM this branch works just fine=2E Any idea?

Thanks,
Bernhard

>
>> Second, pci_bus_set_route_irq_fn() is now also called in Xen mode=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>
>Beside the leak which I think can happen only once, patch is fine:
>Reviewed-by: Anthony PERARD <anthony=2Eperard@citrix=2Ecom>
>
>Thanks,
>

