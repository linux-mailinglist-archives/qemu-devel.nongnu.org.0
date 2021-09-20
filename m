Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0B412927
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:01:32 +0200 (CEST)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSHz-0004UT-Hl
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSGB-0003EF-Bm
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:59:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSG9-0002om-Tk
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:59:39 -0400
Received: by mail-pl1-x62a.google.com with SMTP id a7so3442924plm.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 15:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8i2EobBx21C31bfEEyvho6Uyicvbpd7vdYglsI1doSs=;
 b=B1ThtvroBSgXkqN3H+LRQF5xSmXmou2iprcNha11T9pYEL6eyrc3PTrIhp20CFOXpf
 mjElKbVknJURhWrXESJbuYtg2YYnkZ+tw+ssVZBkj0WU++ARLJ/X8NRDsmhUmY4HJAG2
 fQqHTeQoim+wUvVydGmoM4OI9dzeRd9twMQYJ0eMJQuqvvb3A/VLrnfqJaD/02SGUyAj
 tEwzXFA5B8LILxFdI3OtjcwztyU54vNNzaoyJyCw22iko4AKMCpcnCCdrv0hysB2Vybd
 NC1yymy5lCr45jv0DEc1FKNBOvr1msQF6ITpP99aHIbRT1bH5/dwaL9+/A1AkRxa09Mv
 pBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8i2EobBx21C31bfEEyvho6Uyicvbpd7vdYglsI1doSs=;
 b=eHZG1rYcipyZwlby9FiUIM7p5zpmvBZpv1S+543udJ20yFzVrxQwhjGba3WoBO2Xj8
 94ql1kx+tp+FxjRXCZDVODQ7pfmWYHTyHczdMUwslSrAxh05mg7mOsoDTo9R07/QechV
 yGG0pxgGsTZpgu5BLojssw8U7UnEpUMBJItnl/Y/mhQdxmGlSpJ4f9gmDciATwWKlU6i
 l3v3dlCmLQWaoIRmisHlcJqBcYnS6n29Jxa26lB+3kqhLnvfZF6wUMBi1zsSC8ntAMJB
 saPI/YRGOt72o+txysE+Ie4JlD8ZepFxMHfe21PzrDPOBUFaaw8ua2rzvhvZFmnf+eTz
 Lluw==
X-Gm-Message-State: AOAM532OpaupeFkmOkp9sID711Y6RDFXm0P4UzVg/CPaKizgyNfD1Wcm
 daIP8Hv7xvb52iV+l/YIpNaaAg==
X-Google-Smtp-Source: ABdhPJwIeduw8Tsgxyr+CHvVoamVr6meSZtQvJ4LcBSdzO+NTlCWHZYBH3LXvbmb0VWQiGuUVbcpUw==
X-Received: by 2002:a17:902:da88:b0:13b:76f3:5263 with SMTP id
 j8-20020a170902da8800b0013b76f35263mr24699554plx.47.1632178776223; 
 Mon, 20 Sep 2021 15:59:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o8sm430019pjh.19.2021.09.20.15.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 15:59:35 -0700 (PDT)
Subject: Re: [PATCH v3 07/30] Hexagon HVX (target/hexagon) semantics generator
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-8-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <710f90a6-cff2-2d22-449c-bd51b6d1c2e9@linaro.org>
Date: Mon, 20 Sep 2021 15:59:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-8-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Add HVX support to the semantics generator
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_semantics.c | 33 +++++++++++++++++++++++++++++++++
>   target/hexagon/hex_common.py   | 13 +++++++++++++
>   2 files changed, 46 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

