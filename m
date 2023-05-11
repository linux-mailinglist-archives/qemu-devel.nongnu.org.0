Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D26FEB14
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 07:20:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwyhJ-00005g-CU; Thu, 11 May 2023 01:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwyhG-00005I-6U
 for qemu-devel@nongnu.org; Thu, 11 May 2023 01:18:34 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwyhE-0004P8-EG
 for qemu-devel@nongnu.org; Thu, 11 May 2023 01:18:33 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so75653356a12.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 22:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683782310; x=1686374310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jmatq43D6nIaatqSUDEjO0oPYOpfsFNsigFjDyYI1Bg=;
 b=a7JlUA3bKwOced8TWv5Lwk89WE4ampEJNqJi3o5uhW93b41xPMlX62wUnVAWguOUL7
 Yc5ZEXG5+jK9ZDDgsF30tXU1ZB4FkBEYS8x/GbG7FpbMqOWB3iDFnjwNvPDP3Igx3Bqs
 bwAVS9e5S9qpMBTFz8JaO7drJUkmjkzDveoukIJOOrTfJEIk0TVGViwqOkspUNB3CORI
 h4KIf9WFbnYcyBSODYk6b4u8x4Sbum09qwuHfMYWY0IQUcrhBKrbPLKJqmJ4c9+TKksN
 WWDbmv1dzqjzTGqZYhP0eoNbuP9iUGwhGR1RxtOOSrGV6flHXytx6a9n4Hx+PeE+0Frm
 0euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683782310; x=1686374310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jmatq43D6nIaatqSUDEjO0oPYOpfsFNsigFjDyYI1Bg=;
 b=gWfnhkS/NT6RI91oJGmXn8cVCAZj8NN37UGBBB7cVTN4IKDIqwZiwRI+YIt+s7ADfI
 Awqot33i//Mubd7DVOL6fY8Dt8CaoQUusSouZsJ1qIetGMnLXFzb2mtzQUhKilCX/X6n
 JqDWIV5fzDO6fszMFFxKTmASpZYL9nnwxzv4lm/G/IeTJYibBGePjt4vmqhDYJPIihSX
 AwJI/xtqpobFwXoeoeUpptHIMYP8xKXkP3YzZoUv885mquKLsZJ1nXzjxGm27zz/9X60
 3uS5tE7KNridthK+5gq2psUkiK50ec2PfoZFi1KHPaCvDDcGE2gTCykmUaeiOiTn2Dzz
 zKjg==
X-Gm-Message-State: AC+VfDyrsXIRA/8x+86wLGKe6my9xvv/cqjOgj7/qZCSo4eFxRmga3Ue
 UbPYmgL4zaugUJROx9me7yE14LQKUcMexfJUDdlETQ==
X-Google-Smtp-Source: ACHHUZ7axCsQ2sE1h3V1lJoxaavIAvlL57dFsmmJ7oO4tSLJRE2GhXQPqJZC31uWtiEkTHOeC3aTbw==
X-Received: by 2002:a17:907:8694:b0:966:2aab:ae51 with SMTP id
 qa20-20020a170907869400b009662aabae51mr13290681ejc.11.1683782309747; 
 Wed, 10 May 2023 22:18:29 -0700 (PDT)
Received: from [192.168.4.241] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a170906381000b009545230e682sm3500744ejc.91.2023.05.10.22.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 22:18:29 -0700 (PDT)
Message-ID: <1fabc98c-527b-784b-e504-a82294771808@linaro.org>
Date: Thu, 11 May 2023 06:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/9] Hexagon (target/hexagon) New architecture support
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
References: <20230427224057.3766963-1-tsimpson@quicinc.com>
 <3ee5308b-b25e-813b-4223-78aef99e93de@linaro.org>
 <SN4PR0201MB88084AF677C669CA50E08E12DE689@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB8808854605274990EC367E01DE779@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB8808854605274990EC367E01DE779@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 5/10/23 21:58, Taylor Simpson wrote:
>>> Where can one find docs for this?
>>> The latest Hexagon SDK I can find is 3.5, which still ends at v67.
>>
>> I guess the folks at developer.qualcomm.com are behind in publishing specs.
>> I'll work on getting these.
> 
> Hi Richard,
> 
> The documents have been posted on this page in the Documentation section.
> https://developer.qualcomm.com/software/hexagon-dsp-sdk/tools
> I'll update the README with the link to the latest versions.
> 
> Are you planning to review these given that Anton Johansson <anjo@rev.ng> has already done a review?  If not, I'll go ahead and do the pull request.

Go ahead with the pull.  But thanks for the documentation update.

r~


