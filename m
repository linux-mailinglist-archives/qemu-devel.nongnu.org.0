Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB099399DB9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:27:37 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojdY-0000l8-Lk
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojac-0006uS-J6
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:24:34 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojaZ-0006MC-2X
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:24:32 -0400
Received: by mail-ej1-x633.google.com with SMTP id k25so2706891eja.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B5JHO1bbYbHiT/mxwuy3uWQ79TeUhSGez5IF1RwiM4U=;
 b=iBOFsIgjpnVVbsuyEY2+KVXwzMQKwxA9nIhdcEcYWtGrBZxj4opWmfI8wJiHdG4foN
 zTtME3yMzVXARB4/Q1S7Jfp3yxK2zv1+WURIaUrVqLzb+X2vbDqoKKiixU0cp6qKZhZ3
 7q6E2B0wi482y8awgdJTNprrhlM1MU3F6BILQSb8sdJ6aEH61CqKZ4ABJTYcOMhHjlW8
 vHwTXzP1C77rD7EBrAd63qBrh3RSIqs0GgT1uRDE6iPVUAOoNKSKLv4KUvJ0iv2xmiic
 iVdvmKFBn1s7ZiOVbWgJwgg8ao2ldYtA6tpF+DLTnZeUyY06kSGerKeKGf2coucNrJia
 zq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B5JHO1bbYbHiT/mxwuy3uWQ79TeUhSGez5IF1RwiM4U=;
 b=EEQR7OZBj4Scn0dWeZp3FCKdGbdpElY8BZLOjHOfXQKCv67B1Nbs2I7AFX3PubxYYr
 fozwjVP7IHyH+zzrZcVe67jRKSAXJ2be/HVpeJuJfDK8H+TXo84nCvoJGbsJfHq36lq6
 jhZ5h4cL2Tu6mCmd7iFLamm+NV35T28Bqn4jAWTFECmGtChC8MAYICYBo3SmTJDf+5/A
 st4j/TRAgyskHM2UO/LEQHm7lQLjjOctqr/YvYdkKlnDxhe0vT4rzDsLJ7egfBVXXU6I
 BtJr/R2sBzRZ7+AIFAOT6/24NzzghYQv32hoJK4QVYWVMZWDGzoPGv6W9jlLMqCkxiva
 SnSA==
X-Gm-Message-State: AOAM533nrHTD6h2dkp00DhMGFncLejN9beZwizy+RInq1EY2GhaXztKm
 /BzCgcaRwhG80cj9ADzZcL6zhpj4XH9VWQ==
X-Google-Smtp-Source: ABdhPJx8ILQbUgtT+zzuNOGvVZelZe5UO+Nvn9upcBZy0FS98S2pzA3EBho7FlcsLJVkWXdyc7nZBw==
X-Received: by 2002:a17:906:a12:: with SMTP id
 w18mr31751781ejf.92.1622712268785; 
 Thu, 03 Jun 2021 02:24:28 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id bc4sm1430225edb.63.2021.06.03.02.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 02:24:27 -0700 (PDT)
Subject: Re: [PATCH 5/8] Fix incorrect initialization of PCI BARs.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-6-thorpej@me.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5df6a368-ad13-77e6-7ebc-cab34b04577f@amsat.org>
Date: Thu, 3 Jun 2021 11:24:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-6-thorpej@me.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On 6/3/21 5:53 AM, Jason Thorpe wrote:
> Only program a BAR as a 64-bit MEM BAR if it really is a 64-bit MEM BAR.
> Fixes an issue with the CMD646 IDE controller under NetBSD.

OK for this fix,

> 
> Improve some debug/info messages.

but I'm not sure why you changed the format.
Better split in 2 patches.

> 
> Signed-off-by: Jason Thorpe <thorpej@me.com>
> ---
>  pci.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/pci.c b/pci.c
> index ba05adb..5e9c906 100644
> --- a/pci.c
> +++ b/pci.c
> @@ -84,7 +84,7 @@ pci_setup_device(int bdf, uint32_t *p_io_base, uint32_t *p_mem_base)
>    device_id = pci_config_readw(bdf, PCI_DEVICE_ID);
>    class_id = pci_config_readw(bdf, PCI_CLASS_DEVICE);
>  
> -  printf("PCI: %02x:%02x:%x class %04x id %04x:%04x\r\n",
> +  printf("PCI: %d:%d:%d class %04x id %04x:%04x\r\n",
>  	 PCI_BUS(bdf), PCI_SLOT(bdf), PCI_FUNC(bdf),
>           class_id, vendor_id, device_id);
>  
> @@ -118,9 +118,10 @@ pci_setup_device(int bdf, uint32_t *p_io_base, uint32_t *p_mem_base)
>  	  *p_base = addr + size;
>  	  pci_config_writel(bdf, ofs, addr);
>  
> -	  printf("PCI:   region %d: %08x\r\n", region, addr);
> +	  printf("PCI:   region %d (BAR %02x): %08x\r\n", region, ofs, addr);
>  
> -	  if ((val & PCI_BASE_ADDRESS_MEM_TYPE_MASK)
> +	  if ((old & PCI_BASE_ADDRESS_SPACE_IO) == 0 &&
> +	      (old & PCI_BASE_ADDRESS_MEM_TYPE_MASK)
>  	      == PCI_BASE_ADDRESS_MEM_TYPE_64)
>  	    {
>  	      pci_config_writel(bdf, ofs + 4, 0);
> 


