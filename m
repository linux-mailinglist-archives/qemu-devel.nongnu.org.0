Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E5C6EAEB2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:08:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptHv-0001k2-8O; Fri, 21 Apr 2023 12:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1pptHl-0001cE-M9
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:06:58 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1pptHj-0005Zc-H6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:06:57 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94e53ef6815so258209366b.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamhpc-com.20221208.gappssmtp.com; s=20221208; t=1682093212; x=1684685212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOFm5K+uSjDqW1/ttKtwOawVLRKTXNDBWXzE9dFCCqw=;
 b=CB0dmh1iWdJ2xfTVuZrmQgCMFAE5uHmeOtugakPQdhH0YEWQfEcH6jJInG1BnHDo3H
 S78oE8E/ld7BqGZG0wE/wnMWieMO/lAOEk68Ewl/dKnaImFVeKBdwveP1crwmMub5RgF
 SsF6AL0gg6+2bl0XYFxUOe+ZgYa76T8LbtLG/txMhdm1+N/FpynjWRNyflmOsoN9T+tM
 3HLgsS7a/bw+E5OKYZvZPe2IH6WrzOlMMVnwKJvRGY+jrnqdhMw2ZaclkF+hqaDDspJl
 xB5olB5CVCNzx3SrJbOHj4Z2rozjzaA/rerySHXJuEEXe5FaKApffr3hiOsy0Pv/O6dA
 Qr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682093212; x=1684685212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOFm5K+uSjDqW1/ttKtwOawVLRKTXNDBWXzE9dFCCqw=;
 b=ZKX+S6GXcKn2au8eDCaQ60kMMbrC0h4O7Ed3yOdw6C3AzaE6Z51cBQLFbkigJWWrcu
 t1avYCuFvMn50JBclvwZ7rIjMMPqnPOXwVrUnocVEZGrbtIZn+KFMPt64icrVxSz77d1
 mbpgayG2/MIW+8K43gXzF4h+ighJLj2rf4cfGMHvHn1Pa0KqbgLadIwyThfVdodp6qeX
 Q1pHw7NZSt2YaNfUOp46hkS9WiDAl/OsUOalvR031Sm3E2TYe/NOK701P44LEZBnoL1E
 cjZ9Cva3UaYofXZscu41dyNsbaLLDs+qlexsHwM0Aja0Z7D9BWVYJ9a5WluoPmNFbZ/I
 9Dsg==
X-Gm-Message-State: AAQBX9f8/6K5qz18Ze8fk7J8BsApGfO6ceGL1vFE9Ub+izAlXBq92Cah
 F64NC68ymrcnf5af6+gWCmsbKQ==
X-Google-Smtp-Source: AKy350YTarOaaJpbA9VW6kZbSzHFuYwXCXrJmQtW99cQK7/aIy3f+frM4Uxig6a7lfgyWH3qgZVyWg==
X-Received: by 2002:a17:906:6d51:b0:94e:cf72:8147 with SMTP id
 a17-20020a1709066d5100b0094ecf728147mr3071079ejt.48.1682093212546; 
 Fri, 21 Apr 2023 09:06:52 -0700 (PDT)
Received: from [192.168.178.121] (dhcp-077-251-030-138.chello.nl.
 [77.251.30.138]) by smtp.gmail.com with ESMTPSA id
 lh21-20020a170906f8d500b0094eeab34ad5sm2175870ejb.124.2023.04.21.09.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:06:52 -0700 (PDT)
Message-ID: <5330c419-bcdb-8577-4ed0-88a483f461e8@streamhpc.com>
Date: Fri, 21 Apr 2023 18:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/1] pcie: Allow atomic completion on PCIE root port
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20230420153839.167418-1-robin@streamhpc.com>
 <20230421042013-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Robin Voetter <robin@streamhpc.com>
In-Reply-To: <20230421042013-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=robin@streamhpc.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/21/23 10:22, Michael S. Tsirkin wrote:
> On Thu, Apr 20, 2023 at 05:38:39PM +0200, robin@streamhpc.com wrote:
>> From: Robin Voetter <robin@streamhpc.com>
>>
>> The ROCm driver for Linux uses PCIe atomics to schedule work and
>> generally communicate between the host and the device.  This does not
>> currently work in QEMU with regular vfio-pci passthrough, because the
>> pcie-root-port does not advertise the PCIe atomic completer
>> capabilities.  When initializing the GPU from the Linux driver, it
>> queries whether the PCIe connection from the CPU to GPU supports the
>> required capabilities[1] in the pci_enable_atomic_ops_to_root
>> function[2].  Currently the only part where this fails is checking the
>> atomic completer capabilities (32 and 64 bits) on the root port[3].  In
>> this case, the driver determines that PCIe atomics are not supported at
>> all, and this causes ROCm programs to misbehave.  (While AMD advertises
>> that there is some support for ROCm without PCIe atomics, I have never
>> actually gotten that working...)
>>
>> This patch allows ROCm to properly function by introducing an
>> additional experimental property to the pcie-root-port,
>> x-atomic-completion.
> 
> so what exactly makes it experimental? from this description
> it looks like it actually has to be enabled for things to work?

I was not sure which would be appropriate, but I'm fine with making it a
non-experimental option.

