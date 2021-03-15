Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1433B292
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:25:43 +0100 (CET)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmI2-0000w8-EW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lLm4q-0001WG-4H; Mon, 15 Mar 2021 08:12:04 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:44638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lLm4o-0003KZ-9S; Mon, 15 Mar 2021 08:12:03 -0400
Received: by mail-qv1-xf33.google.com with SMTP id by2so7597018qvb.11;
 Mon, 15 Mar 2021 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DlBDKxvOZ/yOVp8YSMmNFfEdYEYo36Z0ZURVfF4nTX8=;
 b=o9GSJYrWi3WNT7jJHAZrjQmkvq09N6KR0Lswl0s/KSdw1Wg7G4h0i/hPt8bByDyY5o
 Bw5rNWSAyygxPO1q6fXEP3xK5o1Jq8y6okBpVFFAyn/cblospIfThY1xDmQHfZCCO6UA
 w6nnkZSP3MPtRSFl13DE/ttQm26CLlWFrJz7iJB0e+dichCtt3oTWPlDtDo1wmuito5B
 qb1Qt0EPJB6naWGZUt/xx9WU2tzCjGuJbReD6y5ZM06VfXSuhm6r3O1yGj93Jvr/jIlY
 ze+qTHAM18nu8HMOgJTM7iB/IGwH0kQGlcolP/oB+lezeZiRzLm4ogPb5P7CWsFrBEQP
 An1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DlBDKxvOZ/yOVp8YSMmNFfEdYEYo36Z0ZURVfF4nTX8=;
 b=ooZev0yFqHXR0q/srzd5VQTsvnm0ewdkvVSaI9P0UuYg2gOw3gCZ7CZWLjYAUN/NY7
 s9yG4Du2ulwugL462cUtXzYffmsJBzstoJtpW63IDV3V926IjEl1qFEf1A29mSTmpSFX
 Gj45Xj/wW1SJG0wIiok+t5KVusyi6XJNhvKgDbiKZZkuHeqW9TuwZahezv/7amIVMCHV
 uYj2R+tzK3Z9WSc1igxj3PK3OC7JW861zo3TySHb+7A9KUmlKnGw2arEbTbxApUxxYoK
 yrbIUVPjacOFxZ6+TbctWhIoRK04xKOQMMicr2+mGBVgi/onmAYN5iOND50le4opLAzO
 uM9w==
X-Gm-Message-State: AOAM531vjEwB/Ce8ryu6ech+kvWZ7ol4nAME7M0ckErms313P4Dv7t3m
 /CNb9hJ+nPBwRGzK6r3bBvZujBbKSJs=
X-Google-Smtp-Source: ABdhPJzhrwWYDkYvG9UDDaEzpU/ui7vEaBjlc6SbMUMFjB0jcEUemM4PO1kkFJcqzGhbOoBOUrBRjg==
X-Received: by 2002:ad4:584a:: with SMTP id de10mr10422848qvb.50.1615810319763; 
 Mon, 15 Mar 2021 05:11:59 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id j18sm9206374qtl.83.2021.03.15.05.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 05:11:59 -0700 (PDT)
Subject: Re: [PATCH] spapr: Assert DIMM unplug state in spapr_memory_unplug()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <161562021166.948373.15092876234470478331.stgit@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <81d177d2-9582-d9f2-974e-900dc229af13@gmail.com>
Date: Mon, 15 Mar 2021 09:11:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161562021166.948373.15092876234470478331.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/13/21 4:23 AM, Greg Kurz wrote:
> spapr_memory_unplug() is the last step of the hot unplug sequence.
> It is indirectly called by:
> 
>   spapr_lmb_release()
>    hotplug_handler_unplug()
> 
> and spapr_lmb_release() already buys us that DIMM unplug state is
> present : it gets restored with spapr_recover_pending_dimm_state()
> if missing.
> 
> g_assert() that spapr_pending_dimm_unplugs_find() cannot return NULL
> in spapr_memory_unplug() to make this clear and silence Coverity.
> 
> Fixes: Coverity CID 1450767
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr.c |    3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d56418ca2942..73a06df3b1b1 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3660,6 +3660,9 @@ static void spapr_memory_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
>       SpaprMachineState *spapr = SPAPR_MACHINE(hotplug_dev);
>       SpaprDimmState *ds = spapr_pending_dimm_unplugs_find(spapr, PC_DIMM(dev));
>   
> +    /* We really shouldn't get this far without anything to unplug */
> +    g_assert(ds);
> +
>       pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
>       qdev_unrealize(dev);
>       spapr_pending_dimm_unplugs_remove(spapr, ds);
> 
> 

