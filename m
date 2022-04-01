Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E544EEE17
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:27:53 +0200 (CEST)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHJg-0001mR-9O
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:27:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1naH9Z-0000Rw-40; Fri, 01 Apr 2022 09:17:26 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1naH9U-0006Dq-Gu; Fri, 01 Apr 2022 09:17:24 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2760C20777;
 Fri,  1 Apr 2022 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648819037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwXuC1smwhhROcpwAgQUnJnlG+qR4By2v5jfnqOjKOM=;
 b=jMURKNX43E6tp9vEYCjG2Vta2rLQr9+MwJmpighT5Z6NnDn3C4CkodHyglxj9xH1WrOpey
 NiA1sZrnShC4fSI3qJnh7jobBLVteN52cXb043BE71Q3EiPleOsQdFH7ahnSyUwc+llYx+
 eUyuCcHBwwWsDe24eifj5WWr2TBZ0vc=
Message-ID: <77de88b4-9fb7-d1c6-4f2a-55b7b5cbc9b4@greensocs.com>
Date: Fri, 1 Apr 2022 15:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
Content-Language: en-US-large
To: Zongyuan Li <zongyuan.li@smartx.com>, qemu-devel@nongnu.org
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220324181557.203805-4-zongyuan.li@smartx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/24/22 19:15, Zongyuan Li wrote:
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>   hw/arm/exynos4210.c           | 26 +++++++++++
>   hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
>   hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
>   include/hw/arm/exynos4210.h   | 11 ++---
>   include/hw/core/split-irq.h   |  5 +--
>   5 files changed, 126 insertions(+), 33 deletions(-)
> 
> diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> index ff8852f407..eb485dd7a6 100644
> --- a/include/hw/core/split-irq.h
> +++ b/include/hw/core/split-irq.h
> @@ -42,9 +42,6 @@
>   
>   #define MAX_SPLIT_LINES 16
>   
> -
> -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> -
>   struct SplitIRQ {
>       DeviceState parent_obj;
>   
> @@ -52,4 +49,6 @@ struct SplitIRQ {
>       uint16_t num_lines;
>   };
>   
> +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> +
>   #endif

Is there a reason to move the OBJECT_DECLARE_SIMPLE_TYPE line ?

--
Damien

