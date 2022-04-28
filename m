Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C915138F2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:47:15 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6MK-0003Lh-R7
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk68w-0001l1-8J
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:33:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk68u-0006pe-EG
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:33:21 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so8019183pjb.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=be7Lz06tNr7x00O6rBpw3pExgeQ6Ww1X0lV01PMOy3s=;
 b=HzHz9Of5K/iijIet7ykxOmw1Br9fJZ5rrNZozUAes17OaLkX6xtnsp07A48PvTVSmj
 i8j5QhOgdMeABiMjw2cOLllM7MBzW/5Z0WHst9MJT2in7Akf1GZpGWDaeYJqU53jCp5N
 70OG91GKaaBuLFNpydqaTS08Bc+wUNsEtT9XCKJW1+5wK1W9Wq+2EVuf5MQBGDJ51HPQ
 ylpIM5EH0Qtiq0emzG8aFaCUDzR817inqleqkwn/WhiRPDUALXIA8RfBy3ldFe8dwkwE
 g0uPHmRJ5zbhxu4g4oiH2w9mRxgR7b6zGvvyYOzepOXkKIWF5ADD35RdSHz1MCvPmJj9
 ZR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=be7Lz06tNr7x00O6rBpw3pExgeQ6Ww1X0lV01PMOy3s=;
 b=bGj62RUvWfmEG1qbxba9yf3awCR3wx0Jvi05CneP8N5/rbGoC9ROECrBQqvEDNuH1i
 9EUEotUm0Q0MhfUta0u5BP3tATQgmN2woWEwj/jMAKx4+yzYxRrf4mK8dmYdLQkUuUmE
 SD+6A7gheVpZ2XsJ3fD7AYxKtyAvtd4z7zdls+oR9UwGvCpAwmn7GxGyRTy8V8c029yb
 bNXmAiHqoty7B4x77wTqyPCH5RlEb1dKzMFQ/1zNQWSN+kWBJp2fZxQ5U864tUSA61Pr
 5fWVUYey8bIr85Knewcy/OoCwk/fgHLFk5wAQofNjI/5sQKghBBSCyb6onvI9cosGPLo
 1NgQ==
X-Gm-Message-State: AOAM530ZhZKD1l29sv/7pLXFJ2P2un2q6/HQ4Iun/gfZOjLgagAphhbr
 R47+iDeZpKoDbTi0KlnF1YR1rg==
X-Google-Smtp-Source: ABdhPJx6AQd05uqlayxo89MefMzFOUnd2Sn72OMlFlL/36WtRQXB2lzEyh8ffltu+qX1S0TjJT1pEw==
X-Received: by 2002:a17:902:e211:b0:15c:f342:2fe6 with SMTP id
 u17-20020a170902e21100b0015cf3422fe6mr26091094plb.18.1651159996459; 
 Thu, 28 Apr 2022 08:33:16 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a62b801000000b0050d5fc2cb7esm230225pfe.1.2022.04.28.08.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:33:15 -0700 (PDT)
Message-ID: <52b52fdb-9419-bf44-8df7-a3a7ef477ab3@linaro.org>
Date: Thu, 28 Apr 2022 08:33:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 03/20] target/ppc: Substitute msr_pr macro with new
 M_MSR_PR macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-4-victor.colombo@eldorado.org.br>
 <fd0087dc-10ec-7867-44df-ba84f8b55aee@linaro.org>
 <c320ef03-0fc2-2a75-cc39-20747888dafb@eldorado.org.br>
 <32cc9b8b-add7-a87c-3bb7-95e5c5707e3e@kaod.org>
 <9978cf74-2c81-98c8-d985-efe47d1519df@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9978cf74-2c81-98c8-d985-efe47d1519df@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: danielhb413@gmail.com, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 07:56, Víctor Colombo wrote:
> A solution I could think that might be easy is: rename PPC_BIT to
> PPC_BIT_ULL (behaves like BIT_ULL but 'inverted'), and create a new
> PPC_BIT macro that just inverts the bit value
> 
> #define PPC_BIT_ULL(bit) (0x8000000000000000ULL >> (bit))
> #define PPC_BIT(bit) (63 - (bit))

There's also room for a big-endian set of registerfield macros.
(Don't forget s390x does the same thing, so "PPC" isn't appropriate generically.)

Something like

#define BE_FIELD_W(reg, field, regwidth, start, length) \
     FIELD(reg, field, regwidth - start - length, length)
#define BE_FIELD32(reg, field, start, length) \
     BE_FIELD_(reg, field, 32, start, length)
#define BE_FIELD64(reg, field, start, length) \
     BE_FIELD_(reg, field, 64, start, length)

at which point the usual FIELD_EX* and FIELD_DP* macros will work.


r~

