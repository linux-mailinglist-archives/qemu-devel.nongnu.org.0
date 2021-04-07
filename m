Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7635783E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 01:06:34 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUHFo-0004pH-TB
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 19:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUHEA-0004Fv-U7; Wed, 07 Apr 2021 19:04:51 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUHE9-0004L1-9c; Wed, 07 Apr 2021 19:04:50 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so30319316ejc.10;
 Wed, 07 Apr 2021 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qfWBAQxtgs5YQr0TggdTVFrwZN5E0NiwJxEZqWwajV0=;
 b=Y2AFexp1hYRoW/4QyKa0CBgdktlXGefx5SOf2/yawmpvtx9g8kuBXUVlkKI/P8yZTm
 kSt0TaZtc8GI0UO3APMY4oiq50C+VaL9RMs4+h9b6qyEJV0Hzl1Bg6kAs/N6xnN6d20j
 2yxJFfAns3tDzwED+OlxDDbrN89m41Blemr8OpbI0J7zBxklruIpCWdyeOqHhtUh6How
 GYV1JNWP1peNsTgOtjDmy1H0suLD+szmLswwbBsKXIqDC3h0kYqjxjj/uWvRXOOkzhu6
 HG4iMwxyoxnn4GRbbBS6Dc718xDARZilRlSau3oCcx9QLfVr2JoErLdzNqTl3TNmHMQb
 hAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qfWBAQxtgs5YQr0TggdTVFrwZN5E0NiwJxEZqWwajV0=;
 b=JrM+27K7I7kHTp1fVCwAqq0+f6JrxP1Eet+CGejyJ54ro8SFWEBjA+qOCKwWSh7Ru1
 Lb0WG9Hd4vd/gWgoDMrG7E7B5Xkwm/ceTW9Dp/gEa4K87fKiiqf36vDXQLBWsbhhIgsa
 XRBr8CKSXoWUp0p5YCH/LTxCDMw2Q3GSNH1571xyZvSDsxvcTAIvjj0M7q6zH9Bv6FNs
 yOp5iY7KDvRa46cb9xNkfRbEG3sMF9S0xvkKMAnHo3HsRe/N0mOj3SCN1jwURkn3GYN2
 x9wjSeaExUbi4p5N4L3K4RBveozxDWUNLaCkrVEgxvM+uzVFRaJSzHcQ6lH2Fi38z+GB
 qo7A==
X-Gm-Message-State: AOAM532KXe/WfeoYwCOaYxUI1G2pQ+YpOd87ixbexTfvBiBWwwa1mhmZ
 K+srje9Sg2uhTw7L5U1hdAY=
X-Google-Smtp-Source: ABdhPJy9Goa+dsZZVmQLLfMNPjIj7ew/e4gxkj2lAMPjHPfBLo8s0Q/2WyuBV2nPst0JBGkjrYSOrg==
X-Received: by 2002:a17:906:9511:: with SMTP id
 u17mr4918778ejx.504.1617836685886; 
 Wed, 07 Apr 2021 16:04:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id hd8sm13174053ejc.92.2021.04.07.16.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:04:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] decodetree: Add support for 64-bit instructions
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <CP2PR80MB3668E123E2EFDB0ACD3A46F1DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <60b492c8-a0d6-0977-5adf-87c1f3cf3c2f@amsat.org>
Date: Thu, 8 Apr 2021 01:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668E123E2EFDB0ACD3A46F1DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 12:18 AM, Luis Fernando Fujita Pires wrote:
> Allow '64' to be specified for the instruction width command line params
> and use the appropriate insn/field data types, mask, extract and deposit
> functions in that case.
> 
> This will be used to implement the new 64-bit Power ISA 3.1 instructions.
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  docs/devel/decodetree.rst |  5 +++--
>  scripts/decodetree.py     | 25 ++++++++++++++++++++-----
>  2 files changed, 23 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

