Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E2578525
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:17:04 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRYU-0005hL-Ul
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRCk-0000k1-Bv
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRCh-0002WD-0u
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658152469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Abuj6VRUhfhIoZIR3p754X/sBGrlb4yKa/V/FVLnntc=;
 b=DVyo/8E2ZVYsYvQ6a8IhH8xileHZYN4cnMGwdE5MmKKy78IcgLKD+DpJ1coYtcvC2g3chz
 IfskBF7ekToKCDS0eP9lPFF20clG5LNT1KW2pnMWDvTrGy5SZ2L0fap5E40EsF1lP/jvaM
 p4tsW6yZtyBFNFkkFYRKHnTQAJXnZoM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-kHo_ICXoNr-aOBEdQhyF8g-1; Mon, 18 Jul 2022 09:54:28 -0400
X-MC-Unique: kHo_ICXoNr-aOBEdQhyF8g-1
Received: by mail-ed1-f72.google.com with SMTP id
 y21-20020a056402359500b0043adf65d1a0so7936728edc.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Abuj6VRUhfhIoZIR3p754X/sBGrlb4yKa/V/FVLnntc=;
 b=l8oS4DNVCaOxhnZLsjo+17wFVJyGLn38t0tyzix+phuk7cUwZeM0tvxh/rXUuMYwBD
 1biym4+6Ikm8+g2wSxTHFyPhdVKrOyHAIPmLlCmxaSIlB0yvuyoTZgHJ8Q5mptsxFLi/
 hlG/9esmLRr09oiybm91wuROC1OFYp06rdftZsakzE8pj2iDq54+lVBIQqGok59J/rCl
 /pWRJsDQmfEkegtYg7GFWgcraNtHaiDUiMQxI/kS94Kn7CxhO0U29FJT8JPnstLiai0e
 jlH5QCJWdcmcNAFeng1SqIYXKFVbkl/jGZ20oVO3PgmGwOa7G4XRcGwjUaLfaNkHMIq6
 CqZg==
X-Gm-Message-State: AJIora8QS6BkeR81IC8S7kmSadnZOE53+A69tbDl0lNFPjvnu54uAnE4
 ib11BeJLe/ZCf7kRURE76n9IevxaRJIZ8tGVY+Plu+Iecug4Kl/WUhf8UnJwxnlHjJdpOnDjXRE
 D3lJZYPoYN0A4NdI=
X-Received: by 2002:a17:907:2855:b0:72b:700e:21eb with SMTP id
 el21-20020a170907285500b0072b700e21ebmr26007381ejc.270.1658152467515; 
 Mon, 18 Jul 2022 06:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1toYfIKRSS8/Lyze+TmBmHmR8+kZ8me4XmKxgpXWXZGzI1xMY/+nW3Mi1HTsMylNuf2BIyNzA==
X-Received: by 2002:a17:907:2855:b0:72b:700e:21eb with SMTP id
 el21-20020a170907285500b0072b700e21ebmr26007349ejc.270.1658152467281; 
 Mon, 18 Jul 2022 06:54:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a170906305900b0072f42ca292bsm567820ejd.129.2022.07.18.06.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:54:26 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:54:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 1/8] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220718155425.6975f812@redhat.com>
In-Reply-To: <20220711104436.8363-2-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-2-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 11:44:29 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> From: Brice Goglin <Brice.Goglin@inria.fr>
> 
> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires an initiator=X value
> when hmat=on. Unsetting this flag allows to create more complex
> memory topologies by having multiple best initiators for a single
> memory target.
> 
> This patch allows -numa without initiator=X when hmat=on by keeping
> the default value MAX_NODES in numa_state->nodes[i].initiator.
> All places reading numa_state->nodes[i].initiator already check
> whether it's different from MAX_NODES before using it.
[...]
> 

> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
when re-posting patches from someone else, I think one is supposed to add
his/her own SoB at the end


> ---
>  hw/core/machine.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..d4d7e77401 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa_state)
>  
>      for (i = 0; i < numa_state->num_nodes; i++) {
>          if (numa_info[i].initiator == MAX_NODES) {
> -            error_report("The initiator of NUMA node %d is missing, use "
> -                         "'-numa node,initiator' option to declare it", i);
> -            exit(1);
> +            continue;
>          }
>  
>          if (!numa_info[numa_info[i].initiator].present) {


