Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0BB619EF7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0f7-0004Ip-P6; Fri, 04 Nov 2022 13:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0f0-0004HA-9J
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:39:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0ey-00049f-JL
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:39:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n39-20020a05600c3ba700b003cf71011cddso5583217wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IUfV6+Bu/QQSe68z3gGtXqBoJyyF7RGefOP5PdOd2To=;
 b=hpv5qhu44K60PiuIBaWKKARjWiAXh7x4+07qgTJfOESpUdGCW9Am9xpKnPdb40jf1B
 CxDKnqkLv4xtkFtjJ4WB3bShkwTZVNpQsQsZRV3dUcG8RvP/qkC+BVHJTLVTpFYreplt
 3IBtmVy9w6P9jmwJ6I0V69GHvzPCKHHO9e0/ADHeD2iPfS6eJjUNXfusq/IyMQMmPKzB
 uGRkxvh4CQDE/MHIuOQhw7+Z0zs4lbByNHHBreFvlh+SnV03GjbpBER3anjeB4UP0XC+
 5VW1ZAr4FnrcqUDlobdbIR2/9ooB+7h/kf9KofPUrDUJF0Kp8bYwnvJfKqY6SYl7qlEx
 NuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IUfV6+Bu/QQSe68z3gGtXqBoJyyF7RGefOP5PdOd2To=;
 b=16IrJcLW1BZyWCx/aMQtapqUUJ+O0w7i/UNVmsYTR6M1Nq+12TkXiVm15R07E6j5O4
 k703+m0dvmunyGB+GmMuLvZVheUp+uD3jE84hz9k+SMfYksHXTxMScLaRsxuRli53qJ+
 HbamhKi4fsuaF3GQJ2jUwdkaCXU5n4XvQGof9ulVNuvUyVJQMTtxO0uBU7rQNcAyuRWk
 jEhWAiUc4cybtfrjkYaNWAI4Nuf0dr2h7RLitbRnhA+Z3L+fDD2T6//vD9tK9AiB74ur
 HTkIVPte6aEzUUCV1fXkBQW1W8lPy4HgMF106DIgeymL8R29iOQQDje9zTtdn845/0mw
 XlJA==
X-Gm-Message-State: ACrzQf3holoujcGzWHM+GU97U+DK05P29CCZ6g9Z8dTpozAMBybXwgH0
 yzzh7DuMqY6AUoe28q+AcmcrCQ==
X-Google-Smtp-Source: AMsMyM5buSkp26QoirrKhE7VKQ9KZMliHpG7ILvFpNAAUVw1sxFX/Hg4CEbep79H7SXDAeWzCOCTZA==
X-Received: by 2002:a1c:ed0b:0:b0:3c1:d16e:a827 with SMTP id
 l11-20020a1ced0b000000b003c1d16ea827mr24348230wmh.127.1667583554780; 
 Fri, 04 Nov 2022 10:39:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ba17-20020a0560001c1100b0023c8026841csm227304wrb.23.2022.11.04.10.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:39:14 -0700 (PDT)
Message-ID: <d8191ade-43ce-815b-6ae4-715bebaf015f@linaro.org>
Date: Fri, 4 Nov 2022 18:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 5/9] pci: Use device_cold_reset() and
 bus_cold_reset()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
 <20221104161513.2455862-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104161513.2455862-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 17:15, Peter Maydell wrote:
> In the PCI subsystem we currently use the legacy function
> qdev_reset_all() and qbus_reset_all().  These perform a recursive
> reset, starting from either a qbus or a qdev.  However they do not
> permit any of the devices in the tree to use three-phase reset,
> because device reset goes through the device_legacy_reset() function
> that only calls the single DeviceClass::reset method.
> 
> Switch to using the device_cold_reset() and bus_cold_reset()
> functions.  These also perform a recursive reset, where first the
> children are reset and then finally the parent, but they use the new
> (...in 2020...) Resettable mechanism, which supports both the old
> style single-reset method and also the new 3-phase reset handling.
> 
> This should be a no-behaviour-change commit which just reduces the
> use of a deprecated API.
> 
> Commit created with:
>   sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/pci/*.c
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/pci/pci.c        | 6 +++---
>   hw/pci/pci_bridge.c | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


