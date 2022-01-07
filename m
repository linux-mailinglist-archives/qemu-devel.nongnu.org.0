Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC2486EB4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:22:10 +0100 (CET)
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5d1F-0002yj-Aa
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:22:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5czZ-00015r-7U
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:20:26 -0500
Received: from [2607:f8b0:4864:20::102f] (port=46861
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5czX-0004U1-9I
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:20:24 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so4819754pjb.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzJZS0xvOcuu4d1oQBNmw9Oy1fORIxzJha2oQqtveLs=;
 b=dieccjeZxE+66qEGt1iT6DWdHtd07L7BWsy7P48kLfuevg2i0mxU55YnhKF2MyZpp+
 W7rdI4AMAvI2P92C/XZw7/SeG05zLw5yY1uDmI3NGQa1pZilHz1fSdlvyAuJWF+CwcVi
 w274g9G7WT5M+fo/UHbkTh+AIWrbCb/+E67EZx470U2klYqcu57uqkHiFUxKk6z3xIdc
 VHqH4CEtjf5rpMLcT0Etows6S6km8Yy/kvGkvUofufjhbGsUxJR5or4SvBehXY2jdXd5
 KxJeocNjHhGEHDaXi0djgWegqvY9i8MRv9gUPV/ynXQf2Bkuqnn/CwcAj7K+THs6D3uC
 eK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzJZS0xvOcuu4d1oQBNmw9Oy1fORIxzJha2oQqtveLs=;
 b=5GhFL140aImRQhqh/C34bYX/XwV6G4Q+c5Wk+7xUOQLnTGtJeSq6/qf+tgRylfXhFx
 sxNRnrBTJ+SIOvUcdo8yaBmAkcsQPBJ+N/NUweXR8WVyOLvR/RLLcKVvJSC7JoyuX5tE
 2sR2sAhl/qJ1dfcJdRN8UJ/fdeKGg6/eG0l3p/8VZWhKVlijiFbKQJBY0EhWrZcr6I9E
 pdmNLQCZ94Mf1aLpspS1Bk2S/CmxrByWxi8dN1QLK0LK93Zp0fAggAzj2QpKNrKaYI6q
 kSzw8/Wpp0vElr83UJ7LTayPQhLek8OQ3TneIJpLcFVyy09aNScce43M2VSq5uo9j2LA
 vZpQ==
X-Gm-Message-State: AOAM530Dtb57mENhPrrdGtWCBFhfzotJGAQArKVGrZ7CQdMuVmPDMsuq
 BVG/3SEkIbFRUk7oyV1BF0zPww==
X-Google-Smtp-Source: ABdhPJwZ9LyRpGvD23najO2flgq6v1MRbGJQqKoU+coqBhRwKh9tzzm78VPkUAciBXQc0phFU75/gQ==
X-Received: by 2002:a17:902:eccb:b0:148:a3f4:1ec5 with SMTP id
 a11-20020a170902eccb00b00148a3f41ec5mr62081996plh.123.1641514821913; 
 Thu, 06 Jan 2022 16:20:21 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e11sm3368373pjh.14.2022.01.06.16.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:20:21 -0800 (PST)
Subject: Re: [PATCH v2 3/9] hw/pci: Document pci_dma_map()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <abdd7baf-fda1-58c1-e899-55adb6698a49@linaro.org>
Date: Thu, 6 Jan 2022 16:20:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/pci/pci.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 5b36334a28a..07f08aa0626 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -876,6 +876,18 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
>   
>   #undef PCI_DMA_DEFINE_LDST
>   
> +/**
> + * pci_dma_map: Map device PCI address space range into host virtual address
> + *
> + * May map a subset of the requested range, given by and returned in @plen.
> + * May return %NULL and set *@plen to zero(0), if resources needed to perform
> + * the mapping are exhausted.
> + *
> + * @dev: #PCIDevice to be accessed
> + * @addr: address within that device's address space
> + * @plen: pointer to length of buffer; updated on return
> + * @dir: indicates the transfer direction
> + */

As Peter recently mentioned, the ** format is off.
The description goes below the arguments.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

