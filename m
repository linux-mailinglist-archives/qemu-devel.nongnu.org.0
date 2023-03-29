Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67376CECD5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 17:26:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phXfj-0000f7-15; Wed, 29 Mar 2023 11:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXfg-0000et-Kt
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:25:08 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXfe-0007OP-Ho
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:25:08 -0400
Received: by mail-pl1-x636.google.com with SMTP id z19so15291846plo.2
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680103504;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jiOsuj3fDG78moL1r2MBkq9KWcJQN5/977lCd47u9kQ=;
 b=PpoHIXPFK8e5cCWtZaZfT7s08uxw9upwvWaUYyFhbPTTHKGp+g+LqvEknmp9tpZewQ
 phCbB+eHrXdIRdN57mzJirX1r+Uu89APXCkM2KAX2w3EHJipXz8AqSB9WjoC0xN6Itsk
 wQS2sMUC5mjOUdxf5frZB7AZTff16a5wMCkLm3brdopHG0PHULZZ1jaAXg3XtIrpzXza
 tetkAdBHeGToBs423FNV/KraEYNhR+PLdGxVCCZpwPQ3mSAqqJF/ALAPUMNxPbiS4ewL
 6Ti45/KUXsfAujU7TW5XBjmZYY7OQyUSrsBIYm8nhOlwwSOQCNUoNImxWf0MmpHll3CH
 mWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103504;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jiOsuj3fDG78moL1r2MBkq9KWcJQN5/977lCd47u9kQ=;
 b=DAZ69pfFAOTyGuB2fmzAhz1uJounr5rkUM5/4HrQzM2DW80ZqAsuvYAdLaKPjuW3gQ
 DxRDx8A5nmIEEqv68EuEWS+KQuHCRDR2l8VE7214sUfQXiTkm8DVIE42xgWHBCJzxpI8
 KhMnLDjeiMF492cPHMN4NoPcBKuIYUfCVXNp63dUwpoBIIGFBHZTpRK8z6/dG+euQuVN
 MXoQhH48B8UCaEP7CyzWi5t96y4j+MQsnsRWAxS4JapnmUwyUrEbDxNIg2Itt2Tuxm+8
 wOtkmID35oepDoHTyWPk4HdlFBFBdlYPit0R3rPk3XE9e7olMNO1GbokBaDO53Xtt9gr
 GSgQ==
X-Gm-Message-State: AAQBX9cBBy+SQ2DShgyveFvPnrVLqAvn83oFua+ft6TSvkmJLSyDLeA3
 gfD1jPSRmQYiIu71/pw67CqhanAiGuKJQdd9Gng=
X-Google-Smtp-Source: AKy350Z9iH5+Ialpq7GdkUAZQ+TJFTpORqqdrRr7QdtQ8qKZc/dTAt6fMb6txq0mCUz+LCKJ2/5Oug==
X-Received: by 2002:a17:902:fa48:b0:1a0:7508:daf2 with SMTP id
 lb8-20020a170902fa4800b001a07508daf2mr18608022plb.2.1680103504620; 
 Wed, 29 Mar 2023 08:25:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a170902fe8b00b001a21a593008sm10267326plm.306.2023.03.29.08.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:25:04 -0700 (PDT)
Message-ID: <8741c13b-ecb4-8064-f2e7-cecca98d81ab@linaro.org>
Date: Wed, 29 Mar 2023 08:25:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 09/44] target/loongarch: Implement vhaddw/vhsubw
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-10-gaosong@loongson.cn>
 <6c587ced-fcb2-f537-94c7-9612e1499f2e@linaro.org>
 <0536d40a-4784-809f-84fb-09416617c583@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0536d40a-4784-809f-84fb-09416617c583@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/28/23 20:24, gaosong wrote:
>> I also think we could make use of (__typeof(Vd->E1(0))) instead of separately passing 
>> the output type?  It would appear to be less error-prone.
>>
> I will try this on v3.

Consider using local typedefs, e.g.

     typedef __typeof(Vd->E1(0)) TD;


r~


