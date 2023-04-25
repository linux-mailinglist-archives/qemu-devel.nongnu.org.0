Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB9B6EE472
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 17:07:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prKEn-0006Qh-IE; Tue, 25 Apr 2023 11:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prKEb-0006PW-5a
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:05:41 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prKEZ-0005rV-KK
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:05:36 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so25487350e87.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682435128; x=1685027128;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5gEeM8U0H4MmN/XdilcWPVmjGoSia0iiid5t/C6TjY=;
 b=OF2wR3nTzo6PIjovXLngC9cs6DzMO3ZlAHwIO0zp2hD2NLf11F3v39xNnXOyQCUVKd
 2UkEvF5yyuIUFK0NRdwSAxrONuIeHTil2A0AISISes+JLV6FRTxpLd6Fyw0jHilS0tlc
 y+g3SJLnh0oNWDIkAiDFEi3pgco540K1nxzBkK7B1aW0b+Atpdgvh/OcPqP7mR8OXZm6
 cRzaT6g7Jz0LDbzd9TUfi+sJgp+YNUYHAR+Ut6q5+5N/v2B2bvrjovDYMC3ytQsDKGdu
 vCVaTbTwukiJGOC+TrxGeu/y4U4/R1uUrj5twZppkHYVczOSImUkuZO58UPGadt0Ri6w
 v3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682435128; x=1685027128;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5gEeM8U0H4MmN/XdilcWPVmjGoSia0iiid5t/C6TjY=;
 b=ij+hzlXg4nbXd06eId9Ry7du4hvr6F6AWILgl9zOT7NqnhO/cgPBg50BLKED1oETWN
 L9HAg6eCYoT9eALDyVPP8GEDtN891a3B66hXKUEMTMc9CaCZm3DhvZMi53ovLGPu/w+7
 eac2Iz5L4ddtfPQCbKGO+3jks0zP3mmLb/UMT4liGPpPjWOKe8/H0sOnaiQcaNWkKbet
 jwyjHuWVj+yc6Bq4y51CGjXAxIWypeauF9nmTgkmWZENIuF48w6LiEkodIlKv0qZ9QBc
 DgAt0DzKczWp1JOqyeW5vx0nYU6rumm8PvkASsGCcvntcqntnMGeyaVNXwkeQhB8L68c
 dQ1g==
X-Gm-Message-State: AAQBX9eeJBNs4tcAgHhumB8PUbmEwTyniyLwWlVHK85B2nHE9HrFafHJ
 X8ovvTCfB/1HEnFml+qFg3A=
X-Google-Smtp-Source: AKy350YE7jjNxO+VqS45jc5bs/m1ZsPW9aeVDqMRdx8bVBVNbqah/fUR1/OHeXfnFXqiq2kqe3g9eg==
X-Received: by 2002:a2e:a227:0:b0:2a8:a6b5:2042 with SMTP id
 i7-20020a2ea227000000b002a8a6b52042mr4059021ljm.19.1682435128452; 
 Tue, 25 Apr 2023 08:05:28 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a2e9bd3000000b002a8bc9918d4sm2147803ljj.97.2023.04.25.08.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 08:05:28 -0700 (PDT)
Date: Tue, 25 Apr 2023 17:05:26 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [QEMU][PATCH v4 1/4] MAINTAINERS: Include canfd tests under
 Xilinx CAN
Message-ID: <20230425150526.GA7006@fralle-msi>
References: <20230425063433.25803-1-vikram.garhwal@amd.com>
 <20230425063433.25803-2-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425063433.25803-2-vikram.garhwal@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2023 Apr 24] Mon 23:34:30, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24154f5721..c3dbacb615 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1809,7 +1809,7 @@ M: Francisco Iglesias <francisco.iglesias@amd.com>
>  S: Maintained
>  F: hw/net/can/xlnx-*
>  F: include/hw/net/xlnx-*
> -F: tests/qtest/xlnx-can-test*
> +F: tests/qtest/xlnx-can*-test*
>  
>  EDU
>  M: Jiri Slaby <jslaby@suse.cz>
> -- 
> 2.17.1
> 

