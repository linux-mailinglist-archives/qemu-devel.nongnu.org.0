Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01FA51A6BC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:55:05 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIHG-0003PF-CG
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIDG-0006ob-4p
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:50:54 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:35005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIDE-0002Ap-MS
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:50:53 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso1767397fac.2
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kGZFPnmGYWWX5dNtY1rNHwGkyO+0Z+b97agVgYQFTZA=;
 b=PB4+FY2mTSpNEcbOC6Yo2TuOA3ZO5/Q13FaO8gqT0E6YBo16gkkbPIskhRSpPY5DWC
 Ykxoaa3rY937zYvRCkN+pmnzGIsY4/YKNIREPkPULNqrU7jGHKh9r2TDPqK6BVxLh1Qo
 SWCrGqKgOo6sI4EroAUmnsuAi1x98Gh8lioUaTTs0okaKrKfN/IFoi/3umwMSJHUSS3c
 RJ5HnXBPUE8hc7IqBuHmLBfaXT67cErdddQ1hy+qEMEeM8v9I5xov4Jf5Yv0LKdWTim+
 7GJETIBjaVUfuYbAWV28k4U99l0RMrM5EwcipeKKlGkejyrG9S/BBg1zP0xV2kx7I7mI
 GcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kGZFPnmGYWWX5dNtY1rNHwGkyO+0Z+b97agVgYQFTZA=;
 b=yzTszi8dW1PJ64zF2qSqGPPkFEgsPNvIlNSukj4m4ZKx+Qj3/56EIFz3S7fvtRMBmA
 RyNxlQYuWMuDnqlXaGdY06n203c2IVk64LNfDPAfcNXAvyjAcc0r3rIvEgpRkvBuNnjM
 +nRrBJlRr75J5LUgD85m2g1XZEBiMY3m3nefke3hRHzIygd+FtP7ghMdquN81XlgOXr6
 He6hWn0s1+opGWzyupnVYh1P2BEvscgHIUe+3NqO8BtkDnvuZ3VIV7piBW2HikVS2o7E
 C2dl2vw2qQWO69pHec8Rlvtu0WpQbzsg9BBwCuMB8WE9NYmND3C/Rqz+U1RYjpC3vdLX
 93KA==
X-Gm-Message-State: AOAM532FtNaxMOEp+ezzUSYKLejka5AmGxtiNbwBbIH8aYLg1zrY82aU
 BfgVg11MqP/+2MOdxhLn21kT6Q==
X-Google-Smtp-Source: ABdhPJyGs+jwviTgrwCDdOqD7/rZXwQ8uBjsUIeyldKi51gg5Y7yInx2NWVszPc2JABuKoSG355kAQ==
X-Received: by 2002:a05:6870:468b:b0:ed:9ec6:4a08 with SMTP id
 a11-20020a056870468b00b000ed9ec64a08mr198126oap.78.1651683051535; 
 Wed, 04 May 2022 09:50:51 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a9d7511000000b0060603221272sm5266814otk.66.2022.05.04.09.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:50:51 -0700 (PDT)
Message-ID: <1a88c899-832a-d608-e5d7-0a80ddc41b9c@linaro.org>
Date: Wed, 4 May 2022 11:50:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 03/50] dino: move PCI bus initialisation to
 dino_pcihost_init()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-4-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

