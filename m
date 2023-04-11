Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5E6DD85C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:53:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBcK-0003qZ-Fl; Tue, 11 Apr 2023 06:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBcI-0003pi-I2
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:52:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBcG-0003Vu-Re
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:52:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso713168wmo.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681210367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FtFD8kN6FO+NAIzupOIHkLMGBKmYVksTR+1coo89Y7Q=;
 b=jGuSNbAzl708El34fzHQrKn0aK+Vv48Yl0Zt1Gx05xMkK+QzlIVqFa+Q136mRGAw+5
 4iEcoZNaRH52ZvDW+dC/Ii2lhMj8yz+KUC7O/FtXLXeoQvSf1QMDfmj09Aqbp+pkCg2t
 DLagwKGzgTjiEyDYYB6YUetJLvBQv1oLDalH3im/ngKXKemhcdpKCKnBcL45S2g/0uLq
 YRGmz4pkV11hCRkPqJuMQeVsnG2x2KdfUy2aB3FpUBrfv3iv0fLITwD72HIXURt857+T
 pddKDCyRSHXAPcJ6A4888JPCGrRk+BdqabjPETiRY2ytosQnpdee7oIZ2B70fEI8PXxd
 oKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681210367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FtFD8kN6FO+NAIzupOIHkLMGBKmYVksTR+1coo89Y7Q=;
 b=qOB9+DjFcQ/QZth7JxVf6ApT8aBLZ8NITTwdmSoG1Ms9B4v/500rXwEJelpfJCrlzi
 c01au2euG+PbLZ/pya76dyoX/wN9cTaBRBHxgFNU7OLRyhUgbr8k/4OwSlWHPAE3bdFd
 g6WVPC88yABIoV8zHCBx0t1SWmdOZzu8MgWDZp8WtQbY9Hy0/1gwmTDLGFo+y/i/oLvx
 +jAQwTlgsAheuyIAOh74YjkK74GibAjTMSFTkEEKvyx/qW0gErwnE3RzoLiw/xUWFblO
 +rh8R6pZqRUbEmkpMGWHGlccyEbz+sxtroGbICbFu/F9m7SGyh8RZkBRcYAX4gja97GH
 FKWw==
X-Gm-Message-State: AAQBX9eIRSOqAp/r1nNPbyfPKJAzHHLeLTRn/soyHXkJwtyibN23zrCU
 Efw+Lxrpng/QiSiyiNipUor8KA==
X-Google-Smtp-Source: AKy350aDw65lyg1aenDZGotKExz4Y5Xrhi3E4QvjcbMTPdiDurhMdsCr71ACXeGURZ5mrEJ6vqnksg==
X-Received: by 2002:a05:600c:2cd8:b0:3ee:9652:932 with SMTP id
 l24-20020a05600c2cd800b003ee96520932mr8680972wmc.12.1681210367128; 
 Tue, 11 Apr 2023 03:52:47 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a7bc389000000b003ef64affec7sm16561508wmj.22.2023.04.11.03.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:52:46 -0700 (PDT)
Message-ID: <8d4f291a-9b16-ce84-4f52-de625f1abe4f@linaro.org>
Date: Tue, 11 Apr 2023 12:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 01/42] tcg: Replace if + tcg_abort with tcg_debug_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/4/23 04:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                 | 4 +---
>   tcg/i386/tcg-target.c.inc | 8 +++-----
>   2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


