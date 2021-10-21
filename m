Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DFD436D08
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:48:04 +0200 (CEST)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfut-0003HU-FS
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfOz-0004lV-DD
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:15:05 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfOw-0007Vd-3p
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:15:05 -0400
Received: by mail-pf1-x431.google.com with SMTP id v8so1754062pfu.11
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zwfj4lfvpZfPsARrHzQY1eO0sxZACHBj/4BiMc1vwMU=;
 b=glCZPWDeT3OD+DHplJ/WmgXucU/U0kA4E4e/yGS4MBl3kyR4McE9ypHeXvCC5M22Mi
 82dVixDen6pcxNkPJqFLNZ6cU/WMGzKLPiRDc4qnFqvLdaHa2hXeSUs8LHTkBvcUfTUK
 W3SxVf5HIQQbVR+yHJ5cvfRrWQiMd55cAUe71IfRYFW8IMRycaXJfskJ3iZaULhOtJcv
 LoV2gF/DbnJb2t45EeoJ2kDoBMeGsUkMHy3RJSQFGzkCSz/R09wCLXay0v8/LVp6HWcN
 hiUcB4qWzj9YCQXG/3FGpkIOLJLgLLBy3i6t9QHlzVqYJetLRtmco5JNTfBcgWo4Zi4j
 yrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zwfj4lfvpZfPsARrHzQY1eO0sxZACHBj/4BiMc1vwMU=;
 b=xj5XWgc/gM5hZ6gCy1xF9CoRC++rrrh6g4dqZJv2RwWtm7Kul9fX4wSSmECA3jsXD8
 YC+CckvqHFiT8tcNBdAd/k9YL7y8/T0Y0f0RzrU8UOPw81dvhVdiTnzXgDImHaMZ5o5U
 YUHalWof4zs/qTpq7eWwmu73/QJvzC3nf+qc/xbchoka0/HmoNF2YX5OOlIPp7q0CGQi
 e9rItTm4D9G+WB6PyHpq9eO85+GHcECqzC4QyUD2DXFJBOH1xjju1Gj110hxgG1prwZ/
 Bvgl2l3MhmCxKTMKICw2xD2iD889GvswRi/9kVo9/vGigeamXrYEjziDEg4hmCrbweIT
 qIoA==
X-Gm-Message-State: AOAM5316lxiMNle6v+bDQEHicWwRufFwrxZMUki16mPJC9pHSn6RDo92
 dmIgVZctBHY2DSl87p8do39l4A==
X-Google-Smtp-Source: ABdhPJyiZTAIijE/KbgLGlTzmECyubWpwCTdXNcDANmO9rZ9ohF2rG2e7kMQAgpsg6KfWPYA+NXWYg==
X-Received: by 2002:a62:1c4e:0:b0:44d:76b:de98 with SMTP id
 c75-20020a621c4e000000b0044d076bde98mr8236429pfc.16.1634850900377; 
 Thu, 21 Oct 2021 14:15:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k16sm6179635pgt.57.2021.10.21.14.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 14:14:59 -0700 (PDT)
Subject: Re: [PATCH v3 07/22] host-utils: add 128-bit quotient support to
 divu128/divs128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-8-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c95f226d-9a6f-17f8-b4b0-983e628dad55@linaro.org>
Date: Thu, 21 Oct 2021 14:14:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-8-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> These will be used to implement new decimal floating point
> instructions from Power ISA 3.1.
> 
> A new argument, prem, was added to divu128/divs128 to receive the
> remainder, freeing up phigh to receive the high 64 bits of the
> quotient.
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Why not return the remainder?  That would avoid the need for an extra argument, and the 
need for a conditional vs prem inside the division functions.

Modulo that, the code looks good so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

