Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4113A06F6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 00:36:15 +0200 (CEST)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqkKU-0004qe-AY
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 18:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkJF-0003rq-8X
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:34:57 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkJD-00061e-Sj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:34:57 -0400
Received: by mail-pl1-x631.google.com with SMTP id v13so11486570ple.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 15:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vTNBmhqxmrz6IGGWvnPc7/mszzF+NPNqemICp1vAR88=;
 b=dl3hYyP/SQie84pF858wXyCHbyTgJF804CvVwvFuJqs1bBoIZ6c1gwzJvNqg8c78em
 yH0I1WEsM9YG5l5a2Fx/Z0/5vWoAHin15GFo3E+hoDwlY3DfBc9nw2ZLqLifd8g42JKT
 WLyk4pRu8dlX76ob8cGptCyZ+PIdpSL22AzVtdrnMNjxTjSx4yRJFMfS06PEKholh7Q0
 DKDkYE1tHsX7Eg0hJFSnjLhh5m6pZr1zQ6qSdhHR5xuHTghHKGyJO4gbyD+7a3TSSFkG
 oj+Pk/cZZPGP0uSZdnhXDL9fW2//zIWQ6Tpd95qt8XeILB/5CISRtwU083sJn2N+TUZf
 3Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vTNBmhqxmrz6IGGWvnPc7/mszzF+NPNqemICp1vAR88=;
 b=SecnKQ7ez5QQfRU+FfUTV6nK9A9vjgYzIjFxyabSxHYlaUcElh//yRaD+KBuGB9dHO
 y8FsiOJLgsY0/uhpsexnuPQu3rqVoC/Wl8pVO++m7DK1qhnHnt3i1OO2zK51xji7Gzhm
 meuhGQ0w9iRu0f4/rFp+Q6s3vAPxHaUTH9QQgL4oob4PKG6+EUHT21FPmkCBuNoaXWI3
 tD2hI/a2iV7XFpgKWeZE8N34bnWPFqwEgyptKd1LL0YZzLHgY2LUmsWjz5oPGSZ4eTKp
 IgBiTMBuOQH6oyJNPZdWNBgpohbw/isemwx1272uSpgeK7JezSkSzy6V9RxzVlwE2SHH
 cGXw==
X-Gm-Message-State: AOAM5335COGvAi1VHj7Mpwo3aRcAGVHzbFu98nsFGTmXZRzP3Lk5Qavz
 IrIgtlN5rARNTy6wP12WeMhzwHRxIAiLyg==
X-Google-Smtp-Source: ABdhPJxKNfoTPLue4Y+AtGzlqllbd1Ygg5c8ZExm2SfMGEPAp5ZTOKtHdH0k3MBZUaLdoVkEu3IKBA==
X-Received: by 2002:a17:90a:f48c:: with SMTP id
 bx12mr7223310pjb.200.1623191694329; 
 Tue, 08 Jun 2021 15:34:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t19sm3273149pjq.44.2021.06.08.15.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:34:53 -0700 (PDT)
Subject: Re: [PATCH 18/55] target/arm: Implement MVE VABS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <443b690d-6aba-cbd2-ee42-fe44113df338@linaro.org>
Date: Tue, 8 Jun 2021 15:34:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +DO_1OP(vfabsh, 2, uint16_t, H2, DO_FABS)
> +DO_1OP(vfabss, 4, uint32_t, H4, DO_FABS)

Could just as plausibly be done on uint64_t.

#define DO_FABSH(N)  ((N) & dup_const(MO_16, 0x7fff))
#define DO_FABSS(N)  ((N) & dup_const(MO_32, 0x7fffffff))

> +    MVEGenOneOpFn *fns[] = {

static const


r~

