Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886962ED759
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:18:20 +0100 (CET)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxanb-00070j-KP
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxakq-00063i-Oi
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:15:28 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxako-0005Lh-Nb
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:15:28 -0500
Received: by mail-pl1-x631.google.com with SMTP id y8so4050399plp.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+u+33kAXqwf1FELJXoRbrZFp+dO8SiGB/gpeQ9uDHv0=;
 b=E6PCXBwNY/COq7MhOIbVPXZDgyvS8dWfPus7xKbFTiZo8HZQpFG40k2YC296qcTAdU
 FGlv6l6wi7GuybdIUScNBWUqHUxCPncw+5m2tl/9pY5pguHIIKciG8hPBc3F6EOax5b1
 HdrY3du6TIqU1aEbQUC26LP+vBhu4+pawe1ozPNPT+JpBWI+mDfjlrwhzE7V18cRA3X0
 sIVIMBSRXexXUC76m0zCSUFs1Jx8rcZDuG2C9k8wBlzCawDxpFHD8902OzxMxqfDHcQB
 XKcULmoQbyhGycqVG3k5WljQ4NemHE/F+fNR0Su/w1y5izShXISw3kWGdyVpJlp9C/Q/
 KLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+u+33kAXqwf1FELJXoRbrZFp+dO8SiGB/gpeQ9uDHv0=;
 b=TBn6zNRe0EfE2zk8rZWO3/oF1S+4BthLSwDoLwl9knohgagBNL0rwNpkvFJXBurC0V
 EezRWgABeyQzCSSxnlQCdiPRU6xVfLijCYYUslVWJ2tV2L8cUxgFQzMaYahchQW3CaPw
 g7di2Jy+k1idvkW2tYryOX66RH8FSYikoDD4g34bQwLUEdI6rbKqKehB+EzgGMYhCSgo
 iVYyb/FXBL/cjugrkvNPP+ZPEdDOs5lSnAoBpoFmTBRyGkTG7RVJJdjypg5fJsESqSNz
 0td0dUSp4dNDxvUOIdIVz4TsfR1Cz4IsB6wuCQGK9buKrK4L0NUT8Q9v6ZegePpRBwtf
 EG3w==
X-Gm-Message-State: AOAM533UKYvB10e0DaExCOL611QEZjWdS02xbfXqTekKd9KmzOQP0fvp
 SDtfjihe7v2vrBeK83xBbEBtzbPKSbSrEA==
X-Google-Smtp-Source: ABdhPJxoKGzsyAqbx/7obX7YsYJvyz1MRHJN9po8JM5EjhPDGS7DHty652qIXy92VC0l4KNffvUbtQ==
X-Received: by 2002:a17:90a:5303:: with SMTP id x3mr3033pjh.54.1610046924900; 
 Thu, 07 Jan 2021 11:15:24 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h12sm7125635pgs.7.2021.01.07.11.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:15:24 -0800 (PST)
Subject: Re: [PATCH 18/22] tcg/riscv: Convert to tcg-target-conset.h
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-19-richard.henderson@linaro.org>
 <CAFEAcA8UDVsG=5EgwJ3007OXei+BXoJ8pb5y+HNW_+W6ZQk7MA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ded52226-9b0c-bf4b-1dd4-5adaf5fe6901@linaro.org>
Date: Thu, 7 Jan 2021 09:15:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UDVsG=5EgwJ3007OXei+BXoJ8pb5y+HNW_+W6ZQk7MA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 8:08 AM, Peter Maydell wrote:
> (Also "conset.h" looks really like a typo for "const.h" which
> is kinda confusing :-))

Naming suggestions?  :-)

r~


