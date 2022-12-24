Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C31655A82
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 16:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p96ct-0004lr-94; Sat, 24 Dec 2022 10:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96cq-0004lL-Td
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:39:53 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96cp-000167-FH
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:39:52 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 65so4999340pfx.9
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qt3HoJ0JkIRXF7MWETUccW9suKyD90k4qjvf84DRZ5g=;
 b=QuMrE5k6HdHMcx/uQuY1MeWWymB0DyClicvcE9aJG8WTsvew1JcJ4U5Nn9re4BshxQ
 8KyVzgnqlx+oXPbfsy9Hb4tN4igeJx7psZbPsXeOppqxdbV629v0oUdIhI8N1N6PoskG
 YgjrXjq7CV+4IiM5EKpK2xipDDmYZprd8AVRg2upTTCp+5iHvaqLToLRB3+O5/+elvXj
 StceSscony2wNxsfv+YHHuOUPYoTBOHN8r54PeXiQLsMsVv2pba3K+F4xcE6sKuaBKua
 TsDzKRDC3e5aD9COSIEbH8mXyNmEOC3NndVvralGBmvqFPIk2bNiHDS4olQKcFgGl56O
 n0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qt3HoJ0JkIRXF7MWETUccW9suKyD90k4qjvf84DRZ5g=;
 b=6FlAhODYB92ByAkVIitMWliTetzzkLuXQbgSLSNvNNmBogwCXxM8IoS3pL/VQLoD0e
 F8y11jUzvo4cr6BJrenLbbI/ImMPZFlEuwm6QsDd2ImIxCfZSpcAAZMLADdyCNFs/iwo
 5Hx1r3JvE2y7G/P7k9AzfNw3y2CKCg5yEP0xJqD14D36sOoObJZS4fqNiBVBf2ySRfM4
 Qw4uqvip2jQ+b8KnHK36RsE8JEpSmpXKpDpK6h0m7O1Di/T3EQDQ9wUhVefwaEdnAidH
 5BKoLE8OHSlBkAZfkghRCiNJMet/OUH1fOTd+iXb/o0q99Bex96BbBATjHsNqdXLb0db
 4IUQ==
X-Gm-Message-State: AFqh2kqVoo0nbCiA46RiYAPRTo41vdiwlbCwstgSXxS3ij+HxzsR2iPd
 DkZKMIWe+xrqgw8gMzRvj9zFuA==
X-Google-Smtp-Source: AMrXdXtm3KCwxTGP2mel6TrwY7QLOEqk+JuppIlgWC9jcfuK34VUHI0k1U+1a/+mtI6HpPAm0t4fsA==
X-Received: by 2002:a62:65c4:0:b0:576:3005:bb4d with SMTP id
 z187-20020a6265c4000000b005763005bb4dmr14973398pfb.31.1671896389631; 
 Sat, 24 Dec 2022 07:39:49 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 9-20020a621709000000b00580e07cc338sm1336392pfx.175.2022.12.24.07.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 07:39:48 -0800 (PST)
Message-ID: <c3e01454-00fc-b71b-521f-d582731edc2f@linaro.org>
Date: Sat, 24 Dec 2022 07:39:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/43] Add LoongArch LSX instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:15, Song Gao wrote:
> Hi, Merry Christmas!
> 
> This series adds LoongArch LSX instructions, Since the LoongArch
> Vol2 is not open, So we use 'RFC' title.

That is unfortunate, as it makes reviewing this difficult.
Is there a timeline for this being published?

In the meantime, I can at least point out some general issues.


r~

