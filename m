Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B16DD792
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:12:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmAyS-0005uW-78; Tue, 11 Apr 2023 06:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmAyQ-0005uI-GX
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:11:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmAyM-0003Iw-Ox
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:11:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id e2so6909553wrc.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681207893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n8f14UeSl8MXM+kyPbHD83J167n1DYfKqRz1fS0ck9c=;
 b=ZOnXitJcIPK9xtTkHGSCpeg6ba3sdRfk8QCcjHqK2gwBWvIJpUQ82j1/h/lYdot3Ep
 n+62tEIyldW+jOD7UMQl1/QZuMmZVqeqNyT6U1pr4ln86pfJM+qsbmhQe/nhH30NoCkU
 PZtakhgTPxLTXDAFgTo4AKWyU1nrzsp71HBT3vspALySgLkLL3du00rWHrX/T+OKxWv6
 yYvUhKQ2Z2FnUJ906x5oKP3zMp90OWzMjbfnq9BUn2t2/CzJX4WyjWlX3l6XdQQ2V7qR
 y76RAail1yRoDezt0D80EdOhb8LwvWSdQdJhgFgUH4v3odL3/aPFDmXnL4i4uAYs6zAZ
 OQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681207893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8f14UeSl8MXM+kyPbHD83J167n1DYfKqRz1fS0ck9c=;
 b=fThKAYUwxRldKFMhwL1uh9sa4msX+0Udc10ud66If9gNK5ZR3pzAgBGbcELBGd7106
 FqKq0mdYmeF5ZQna0EJVVoF1J98QmhVg+Qm7duY8EMWV0GfDRKvQYaOl6vQcgSP2i5gp
 1j28yT4HPHJDIQSxOZPZxcoRz8gqPshT2tnVZFz9/6033BCl5FPmOQ2NhPxL3wf4RPxE
 8XshT5vQzOIOCp0/387fCTmRQ73AOyFzCQGIJRcbo714n7JoRgzZ0Did1E+BKCl6SWiY
 LO9NrWyx8yb8NU+eLNMy1SlETMpAD2/kkWFKK+Gsj8Wq2Pvxh/zbIoQEOdeKV2oJxZXL
 TvQg==
X-Gm-Message-State: AAQBX9fl3G1KwLp/iP67IswGAoNg7XWQr7EjDW3dw4pc/RIIaqHpNVqI
 q1N6i7+bGaXmf/2+9xb95m9hVw==
X-Google-Smtp-Source: AKy350bmQheJiptCgGNXQWtIETRLzBMjwLAfFMKfF0oEA/iOKB1ntYmWo8z1lBc8rXBzEcjvOxromA==
X-Received: by 2002:adf:f9c5:0:b0:2ef:4c83:b78f with SMTP id
 w5-20020adff9c5000000b002ef4c83b78fmr10376213wrr.44.1681207892845; 
 Tue, 11 Apr 2023 03:11:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adff692000000b002f006333c89sm6890424wrp.61.2023.04.11.03.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:11:32 -0700 (PDT)
Message-ID: <44853d32-38cc-eec0-c96f-31c898104e7d@linaro.org>
Date: Tue, 11 Apr 2023 12:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] pcie: Release references of virtual functions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230411090408.48366-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411090408.48366-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 11/4/23 11:04, Akihiko Odaki wrote:
> pci_new() automatically retains a reference to a virtual function when
> registering it so we need to release the reference when unregistering.
> 
> Fixes: 7c0fa8dff8 ("pcie: Add support for Single Root I/O Virtualization (SR/IOV)")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pcie_sriov.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index aa5a757b11..76a3b6917e 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -211,6 +211,7 @@ static void unregister_vfs(PCIDevice *dev)
>               error_free(local_err);
>           }
>           object_unparent(OBJECT(vf));
> +        object_unref(OBJECT(vf));
>       }
>       g_free(dev->exp.sriov_pf.vf);
>       dev->exp.sriov_pf.vf = NULL;

It feels the issue is at the device creation.

[/me looking at the code]

What about:

-- >8 --
diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index aa5a757b11..fca3bf6e72 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -150,7 +150,7 @@ static PCIDevice *register_vf(PCIDevice *pf, int 
devfn, const char *name,
      PCIBus *bus = pci_get_bus(pf);
      Error *local_err = NULL;

-    qdev_realize(&dev->qdev, &bus->qbus, &local_err);
+    pci_realize_and_unref(dev, bus, &local_err);
      if (local_err) {
          error_report_err(local_err);
          return NULL;
---

