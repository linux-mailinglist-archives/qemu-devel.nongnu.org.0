Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248DF6693D6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 11:15:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGH4B-0006Fc-1s; Fri, 13 Jan 2023 05:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGH48-0006Eu-9A
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:13:40 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGH46-000429-9f
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:13:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso17002240wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 02:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cd6mY6sQ3JKAIiq4jReduNopszqm/a2MRDdyXZj4bvU=;
 b=BYMeyXk4OiZgz7mRSRNGEcPcPU42cQLTaAjiXH3fVGbn9cnUlu7XDqbOHO1GOzLiAS
 7rm3M0P4yoUnal8tkeS89MhjoZq0SnQSiB99MNu2w3YAY0v1GpW1rloT1KlURwpLW+FK
 DOcFdNf0lG8LchnFRTV8ZAPiC9vJzWd2OLX65ydCgtqI8vp4FFs6vqp59Kw2/4JmtLhF
 PWTa1JGkAJk+4qkZkcVgoRK/gAV3upisBH483K9yeIN/0Hx2iGOW/vfwcTKwA2RBeK6/
 SQ4KZ9yvmtQtqg2wamEbi0TO/73DM7Qzt4Y83HvKozT+UPLVDwUg43Sbsl5PgJeYCFcA
 VffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cd6mY6sQ3JKAIiq4jReduNopszqm/a2MRDdyXZj4bvU=;
 b=00E7gB6DhQNrQwwMCpGPofuIxqEwwmFUtFr/2UlNPOl41mVO+G4yFGJPFFuk+AtdQD
 6ozUjrcvkck2wsvMEtIjMMqyucF80sX69I1BOw2f8a/9ex7MjYpYwYSgthy47z90QfH7
 T28VXMoERC6Z/QlBElLVl7zlpyvi7dXK9wzn0LIhKR7Dnsje2uoPxowiKi8rj8hMKRop
 R8buXE5j1l1qVhh94+ZRiqkILM2HMfNLBDLtHIwW1Y6oVAI23Kwmj3rHVjsUaRnaw2m8
 BddNxRDeKxYuL5NgaZmVmOjIz6NsMYKIGmW+OQI8NlGK8dEuFVMNWkYx2pWwXHQncsNB
 PIjQ==
X-Gm-Message-State: AFqh2krvZFpzHCoHHpjwy186A5dlGwq8EB6b1azn4TVA7Nl6b1mPNOVC
 LVjVpFC7q5U3FLoAGab0RckOUQ==
X-Google-Smtp-Source: AMrXdXsKXCkCciR5EkxHQei/AavoHtIfgultkIPCn76bHmPSFzfPC7kFPhVU9hEvC+B+Qe9rg5QtTg==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr58102271wms.36.1673604816603; 
 Fri, 13 Jan 2023 02:13:36 -0800 (PST)
Received: from [192.168.95.175] (13.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.13]) by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003d34faca949sm24416759wmb.39.2023.01.13.02.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 02:13:36 -0800 (PST)
Message-ID: <0b7cf41c-6fca-f8d9-e8c2-0a1cfea2c51e@linaro.org>
Date: Fri, 13 Jan 2023 11:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 04/33] hw/pci/pci: Factor out pci_bus_map_irqs() from
 pci_bus_irqs()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/1/23 18:23, Bernhard Beschow wrote:
> pci_bus_irqs() coupled together the assignment of pci_set_irq_fn and
> pci_map_irq_fn to a PCI bus. This coupling gets in the way when the
> pci_map_irq_fn is board-specific while the pci_set_irq_fn is device-
> specific.
> 
> For example, both of QEMU's PIIX south bridge models have different
> pci_map_irq_fn implementations which are board-specific rather than
> device-specific. These implementations should therefore reside in board
> code. The pci_set_irq_fn's, however, should stay in the device models
> because they access memory internal to the model.
> 
> Factoring out pci_bus_map_irqs() from pci_bus_irqs() allows the
> assignments to be decoupled, resolving the problem described above.
> 
> Note also how pci_vpb_realize() which gets touched in this commit
> assigns different pci_map_irq_fn's depending on the board.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/pci/pci.h    |  3 ++-
>   hw/i386/pc_q35.c        |  4 ++--
>   hw/isa/piix3.c          |  8 ++++----
>   hw/isa/piix4.c          |  3 ++-
>   hw/pci-host/raven.c     |  3 ++-
>   hw/pci-host/versatile.c |  3 ++-
>   hw/pci/pci.c            | 12 +++++++++---
>   hw/remote/machine.c     |  3 ++-
>   8 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 7048a373d1..85ee458cd2 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -282,8 +282,9 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
>                            MemoryRegion *address_space_io,
>                            uint8_t devfn_min, const char *typename);
>   void pci_root_bus_cleanup(PCIBus *bus);
> -void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq, pci_map_irq_fn map_irq,
> +void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
>                     void *irq_opaque, int nirq);
> +void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);

I'm squashing:

-- >8 --
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index fe1fdfb5f7..46171f22f7 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -667,4 +667,4 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)

-    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus,
-                 max_bdf);
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, , pci_bus, max_bdf);
+    pci_bus_map_irqs(pci_bus, vfu_object_map_irq);
  }
---

to fix:

../hw/remote/vfio-user-obj.c: In function ‘vfu_object_set_bus_irq’:
../hw/remote/vfio-user-obj.c:668:67: error: passing argument 4 of 
‘pci_bus_irqs’ makes integer from pointer without a cast 
[-Werror=int-conversion]
      pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus,
                                                                    ^~~~~~~
In file included from include/hw/pci/pci_device.h:4,
                  from include/hw/remote/iohub.h:14,
                  from include/hw/remote/machine.h:18,
                  from ../hw/remote/vfio-user-obj.c:43:
include/hw/pci/pci.h:286:41: note: expected ‘int’ but argument is of 
type ‘PCIBus *’ {aka ‘struct PCIBus *’}
                    void *irq_opaque, int nirq);
                                      ~~~~^~~~
../hw/remote/vfio-user-obj.c:668:5: error: too many arguments to 
function ‘pci_bus_irqs’
      pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus,
      ^~~~~~~~~~~~
In file included from include/hw/pci/pci_device.h:4,
                  from include/hw/remote/iohub.h:14,
                  from include/hw/remote/machine.h:18,
                  from ../hw/remote/vfio-user-obj.c:43:
include/hw/pci/pci.h:285:6: note: declared here
  void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
       ^~~~~~~~~~~~


