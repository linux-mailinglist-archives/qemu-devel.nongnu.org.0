Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2603676A8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 03:07:56 +0200 (CEST)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZNow-0001dL-TB
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 21:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZNnc-00010a-RJ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:06:32 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZNnb-0005CY-Ad
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:06:32 -0400
Received: by mail-pg1-x531.google.com with SMTP id p2so16184111pgh.4
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gFMtv0MZqjtWyNTXdRmWHzFD1Pnk4J53YdNpHde6ZFY=;
 b=wKE8QRNdhIOYO+OjKrkamrA7V5pWC6xWZuNz9io/5O6FbO2a13TwRh/wVlKIphxiUp
 A1pGohsGY05yz6A9rLlla80Fd0QfTdSvGcwfegfLdgAM/qVmpIEDT14/aZWjnwwgbRYv
 v1MM/fV90AtFYn/sPUmGgf6ORi4pde2aWYhB1fNxYsPiqLm5CYcWw1BmzmvCqVEmXQJ2
 cY45KpUMqX77/55EWSM91TT3qxhAQqqX/K3nW+89KwULvehjt3/0N/Vj4PEeArDU54pB
 3ENXbN+cKcudhwK1akyS1iQ1pqANJKEpDTTrhG086tZ5uotgSfGBqhJYBljQJ14N+B7+
 PR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gFMtv0MZqjtWyNTXdRmWHzFD1Pnk4J53YdNpHde6ZFY=;
 b=avqnb/kg5M5HGTRZbig2BzrTIWY9R59OUxYXmOhscgzrF6P4X+fra0LD19qaQnFfLe
 vkwFpfEPfOqTgOTtKiL1CSUWSAQhTS3gXaDCk+dD9zqn4iQIJ/o3HZCCr2mBihiMGWnm
 R2GgvZIortoeV0+mrMd8Z4H0QBSbjfr3fOEmSFLZ+D8yJuC4mwerinlulTfTzJGrK3m1
 XEuigZ8f6xwYDq3/vdDqHSNxbj8VNoWhDp6Am69vh47+PR2GN8LlLTRLgO74S1vbq3Gh
 VUI080W31HGv3TbWwuaR2q9qdEyOGAhyYp/WaFQjcBJwm1NT1Tojy0OmoMj8+bUwnqLH
 AfFQ==
X-Gm-Message-State: AOAM530zEieG1aP3V2JRkXkHyBERxjFo85LGqeQmlSzQOA/rsfk23BIv
 tLHhICwFGuwmnQSfNSfNXOLR6Q==
X-Google-Smtp-Source: ABdhPJwrh3FwSkSWRUV9lNW0WrGPprTZgo2pDeyunBQxrFsO8bvKJluEAHzCSzWJsrh7hgNcjVejQQ==
X-Received: by 2002:a05:6a00:856:b029:208:f11c:231f with SMTP id
 q22-20020a056a000856b0290208f11c231fmr687038pfk.25.1619053589721; 
 Wed, 21 Apr 2021 18:06:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m188sm374397pfm.167.2021.04.21.18.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:06:29 -0700 (PDT)
Subject: Re: [PATCH v2] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210420013150.21992-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b6b4967-d9bc-ec4f-4676-cb9df2b4930a@linaro.org>
Date: Wed, 21 Apr 2021 18:06:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420013150.21992-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 6:31 PM, frank.chang@sifive.com wrote:
> +    return 3; /* deafult NaN */

Late notice of spelling error: default.

r~

