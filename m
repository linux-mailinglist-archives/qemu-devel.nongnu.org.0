Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1FB68CACB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:47:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPBCc-0006mI-Bw; Mon, 06 Feb 2023 18:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1pPBCZ-0006m2-Ne
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:47:11 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1pPBCY-00009I-4S
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:47:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so10206716wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vRRO6m1OSUl30UiVydTCm/txaY5nuYW+gGUPdw0BbVI=;
 b=LJ4vghSqwFs3q2JeNx4/QGBUPXZLgNi7FTZJbxFBZnV9hq+hbhN2WSDKwQ0JE1d4jF
 /Gv1FvBDmmHW/i8O7wflkfISM64ozzon306VK+Y+xxDR4rFtQR5a6b3AAX4h3FmDGqAK
 iRHhezFS/MkMOTON+gSySm5SO6FXNTkler18m1ZIjyQBgRx0qOqbA3WuuPEFQ+z8SHXR
 Mq98ihSn+UDvKtliAPuhLe0NVjQgF95x4PbPXEWQUxgapLWOMlYIbNf60OFePr8DVyxc
 Aq0tOLdEfLZoIQAfzn1hYwnJ9tVaT1bhKUV0OYRUSy3r4iiZ7Yl6RHM8SSzypzCX89ne
 fziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vRRO6m1OSUl30UiVydTCm/txaY5nuYW+gGUPdw0BbVI=;
 b=rcfbOyk5IblZLVNSrbGbfVD8jrvpCUnq5C6RfUPbvYDr9RyUyHxaGoj97gnk7Y21NG
 o8ElrgXSr0SDcXO71Jp0Ug8voNRpp+sp+wNWbI7GAbr1kICVwYAEYyqdymvPMQn/CcGq
 L35U198Q4+DGoQ6VkXiCSCn4wcPEKTGEsPqruKfAXSkYBDv9xNsxu5diuySy6CoTbfc7
 cal90EFK+cZ+39JsTXRpZ/EI4c7zF/DB0JqOXD0yZqu14fnjOk8rD97bsmJ08LvCctEo
 yZfqeX87MHtKcl0Zfh6pIO9VHcXnJ+Nboge0BO9kYKVX/VjEBIVZLXgcMldBCSEjqqhm
 Kb+g==
X-Gm-Message-State: AO0yUKW8K9JV9msOSSjASli+TmRyA80oMHdcUEf5Kzg5Bm8TfDmoDTGQ
 BtrqGrzEtYaw1gXPPLH01HSJoHmbBHxu7yfwGjOTAg==
X-Google-Smtp-Source: AK7set8Imz5BGOdKM/JMe8zYpKoh0mCxQcMLxeBpzF7oDZH+j/INERnb9Es1VV+xw/qjoOcehwr107jEpMAr0+3cq8A=
X-Received: by 2002:a05:600c:a46:b0:3e0:15b:4791 with SMTP id
 c6-20020a05600c0a4600b003e0015b4791mr105835wmq.187.1675727227654; Mon, 06 Feb
 2023 15:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-2-wuhaotsh@google.com>
In-Reply-To: <20230206233428.2772669-2-wuhaotsh@google.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Mon, 6 Feb 2023 15:46:55 -0800
Message-ID: <CAFQmdRbnFFOJbJSLS8c2Nv8JMAdS=xnMrHYO2K6cs2iSZyMmBQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Add myself to maintainers and remove
 Havard
To: Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=hskinnemoen@google.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Mon, Feb 6, 2023 at 3:34 PM Hao Wu <wuhaotsh@google.com> wrote:
>
> Havard is no longer working on the Nuvoton systems for a while
> and won't be able to do any work on it in the future. So I'll
> take over maintaining the Nuvoton system from him.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Acked-by: Havard Skinnemoen <hskinnemoen@google.com>

Just to confirm that I'm no longer on the team that does all the
exciting qemu work, but I love to see all the great work that the team
is doing.

Havard

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa10ecaeb9..347936e41c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -799,8 +799,8 @@ F: include/hw/net/mv88w8618_eth.h
>  F: docs/system/arm/musicpal.rst
>
>  Nuvoton NPCM7xx
> -M: Havard Skinnemoen <hskinnemoen@google.com>
>  M: Tyrone Ting <kfting@nuvoton.com>
> +M: Hao Wu <wuhaotsh@google.com>
>  L: qemu-arm@nongnu.org
>  S: Supported
>  F: hw/*/npcm7xx*
> --
> 2.39.1.519.gcb327c4b5f-goog
>

