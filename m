Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8CB6F55E9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:20:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9am-0000vk-DU; Wed, 03 May 2023 06:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9ak-0000vO-BQ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:20:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9af-0007C8-LI
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:20:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so31163885e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109204; x=1685701204;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Db8fmd9JbDV0+z+JAspz3lFl4saRWDMtVElYoHwUYSI=;
 b=KLHoZ8LQAvV19a8DUZqB9laXHiAJCpKAQZzmjUzHuDfTETJOm1a5VFlaUhRP6EWSDB
 J0MEpvU5HOzzQvIWKI8y24MGhaS/0btid4x+OBWllku68xiGU9NYq/giZMDOgAKTrAtR
 RM25RXA+hfKEbcqgCWCBkEVMM7f94IQzlTeNfK6rBWCrq0upm9W7ZW/uyk2rQtJcCYB/
 x5UnfSN+eAgxUyPr2vW0gGZT9zlPxz87+BZcuWMfvlp/jNNDIA0jEn8QTNDahsxgLCip
 QOpGHzvSY+jynCqbhhrU6z86fY3yegamV8kh1z62skcZ0KzP2muV0/eEPO1W0jz749oP
 xlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109204; x=1685701204;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Db8fmd9JbDV0+z+JAspz3lFl4saRWDMtVElYoHwUYSI=;
 b=R3TE7G/rD60ZQjr6hwBoN33p2edsRyvDEou/ZHRk4YU1pSg5rlIkj9AuxBwsx8+6t0
 kPZhHVM+WW87LlzKwEGygCoQJ92BVwyRWGR0t/zpfZjU5KFba1H7IsnhWv15BgABuQ4+
 +sRr4Wq7Ow5HivxLbxrafKlh/5Aa02YUkB23c8HC2xuDl28nsQ50KmBdokUorKL+qNY3
 wCZQV29gMKhs2ZfRzhbX5BgzOWfqruHhFQJreXhFzNUnxTRkj5Sc9FABN+kpcr/j0U6H
 9ahOhen5/3YW5YwTThGWDgcpZd9J5ciQm5pwCxrHWH/O1kgJkqqqglnYjQ2dHN90lxIv
 HkFg==
X-Gm-Message-State: AC+VfDxA9TUDbHTWWLIY2bGGjPcw+HqKUXL7isdXW7ugq7ZEHn8yjxFu
 DWxCWbBuarwckIEecoY2ePT9xBYl4sF7BCA+plce+w==
X-Google-Smtp-Source: ACHHUZ6NcVmVBxRv1IGAidrzaVTxy/Ys4IUe2tiP6dsQwP6SANlsIxYrEYpO6RBeZtH1VdzxAIJYkQ==
X-Received: by 2002:a5d:5691:0:b0:306:2c47:9736 with SMTP id
 f17-20020a5d5691000000b003062c479736mr7725123wrv.15.1683109204159; 
 Wed, 03 May 2023 03:20:04 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm33503850wrz.75.2023.05.03.03.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:20:03 -0700 (PDT)
Message-ID: <0d85b324-d8d7-919a-70ad-d6544cc9965a@linaro.org>
Date: Wed, 3 May 2023 11:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 09/22] hw/arm: Select e1000e for sbsa-ref machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 10:12, Alex Bennée wrote:
> From: Fabiano Rosas<farosas@suse.de>
> 
> This machine explicitly selects the e1000e network adapter if no other
> option was given in the command line. Make sure e1000e is present in
> the build.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-10-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

