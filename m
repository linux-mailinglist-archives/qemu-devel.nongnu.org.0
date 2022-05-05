Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31051C6E7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:16:09 +0200 (CEST)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmg1I-0004wm-MN
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfUD-0005iS-8h
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:41:57 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:45093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfUB-0007hs-Gv
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:41:56 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so4897372fac.12
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=SYUR+rLKY240Y2rrt+8CfLXAolOW4u14d2qOGxoLpIo=;
 b=y6cm6mLlZPt2Pcj+4pfG2LyWMVRYuPkkMlYnWaaeUPyLuGPOOW+78D/WH2EF2UKuUi
 xRDvRZwluyOO2FFRNwmPZkQpSupqhMGT4LPGSgMw0Byx63fepVRcHW99ML1uDYhJp6wx
 L93YrRmuH++k/8I0k9eQSof7T+csmm4D9inUSrhaMZ5LubqeC3bpZsG1dv3WiDHX+36j
 TJJf+BYCAB0IJYuGbtfHZ/E4THtGO1UeudMy4sC8uJYK7hoaXdu6GO/Ydxlp6JdzSH9I
 vYPn6ZknYHtH5b8TYoCpPWucdwm3++I7g8W2zyMx+tY5INfa/3fDIV8PnxVaaXrQIZAp
 yCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SYUR+rLKY240Y2rrt+8CfLXAolOW4u14d2qOGxoLpIo=;
 b=a3A0CTrczAQyOjakpDf9NVSPNqavdqBtCcKtnsVSZSjsMB/8SE/sp7u1VD+YwZH6h5
 oOqxQGc0owGyRxQsh0Jq8SwFQegEouPknIuM8fwapNlFiBOi3QRhS1vDoDJEWbnoL2O/
 bOc91D7QqedeHx70ZgxOBm4nwAfDQXYNPbLqbj2tUNPSA2CqY+sst7jAOdXqiK4IJBIq
 eBV1ONZNyjh/aBIhSS0ySxJwOLyGDL7I9B/9J+ZHjU82RYVUZE3ps64W8xJp/7LjMsqp
 WGq1D+RvrvKoy6IoekYeQ3lTh9iUNKcEYsh7MuuhYNI0bPnoYQl03Xko8ALovKyfO00d
 nglw==
X-Gm-Message-State: AOAM533ixbPdqz4LOhnZYEPcZsVaeUI3pFpbkiX75IWFXx4fHOGPobjN
 z/JzNxh/+JPUUwQ53qj5bhVehA==
X-Google-Smtp-Source: ABdhPJzCFmPNGUXYOB8fffUYh8gTULr7fsR7qChRml637nobV5H/o7YLftIUVSwgmaZFh6mpkrzeUw==
X-Received: by 2002:a05:6870:f149:b0:de:e873:4a46 with SMTP id
 l9-20020a056870f14900b000dee8734a46mr2763316oac.286.1651772514025; 
 Thu, 05 May 2022 10:41:54 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 bk22-20020a0568081a1600b00325cda1ff8asm882983oib.9.2022.05.05.10.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:41:53 -0700 (PDT)
Message-ID: <0b45f9fa-e92f-c7fd-145f-d835b080774e@linaro.org>
Date: Thu, 5 May 2022 12:41:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 13/50] dino: change dino_init() to return the DINO
 device instead of PCIBus
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-14-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-14-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> This is in preparation for using more qdev APIs during the configuration of the
> HPPA generic machine.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c     | 8 +++-----
>   hw/hppa/hppa_sys.h | 3 ++-
>   hw/hppa/machine.c  | 6 ++++--
>   3 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

