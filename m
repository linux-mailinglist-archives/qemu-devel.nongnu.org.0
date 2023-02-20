Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B699469D719
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:31:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFcs-0002w7-Id; Mon, 20 Feb 2023 18:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFcq-0002jh-7G
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:31:16 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFco-0001BE-CA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:31:15 -0500
Received: by mail-pl1-x632.google.com with SMTP id q11so3451892plx.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z4WfDmG+GycnFhNsHkQnhebQ3MP2RsxeLNc7lNelRjs=;
 b=iaJa6/U63SuyO0+6UE9RLSkXI86YSpOa032JPSCCxR3UwB6wK+n6E3BGxpaT+mqqiQ
 vqhwjDN+Sig6N9MYhg1ICShR4w/NDG2/k2ZUt6Fl3ch6NWCRYj6nV4kJCIkU5Zh1gdGR
 00roEhU4bzJl3RNOIhMpS4PRTbuXKNrP5pxkGHCV+ZBNDzLWJ+NlSkeVQMQgutB6zMsk
 WvYIpdvOVLPcB41xaCS5LTUERnGTpopbAeuXerZpkbtBWUWBA4pH2Mz5kRsBQfzaId1x
 xne6uglZf/H3oy+cnilBsqcvp7ejAhu6NgL7Iam1HzSsL+1Regmrc8QGZ2xGg2Qcpv/m
 3r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4WfDmG+GycnFhNsHkQnhebQ3MP2RsxeLNc7lNelRjs=;
 b=bj3NPcam3R78tLk3afK7Mz7yYmWiNZ7MucieKEkRXl6MP4zdJnN0d2V4UVpX5ByNNa
 RWIrUvwzkbny/zTm+o14PbZJAoMH99JTtUxKhqwB/63p0zR7H49qSPTfoC/L0y3buuOI
 tKMSPg51n4SXUToReTlValJk2oXNlK3pTJxYzAXVtbvgW/b4cNPoIg+FOe9AJa/+l+8q
 snpvLwhyvLBvlJ1J/tE8SqjEuK1Oi2kq3OXIBu+rvqJ5E1nSNbmFMXHeVETL8m2P71GI
 3jp7XasQCYuS03jZud/zPFSvhPHTyyoL64ghJwgURdgw4zx+x3zQ0XLfoKxyCJsINKdn
 37xg==
X-Gm-Message-State: AO0yUKWcwmnn6Z3D8WZLpEJg0xPw8gnAeoUxZBTkG43Ipany9/N0/1iy
 YhH1AI8R/V0EU/TclV29vPXjcw==
X-Google-Smtp-Source: AK7set+R8nRbkI87gTO2lLHEvqQBWcBWhpyAwYK0vGAjMGUJcyfPAGHQub3ekBVYFtqpVW5X5shPkg==
X-Received: by 2002:a17:903:230b:b0:198:b945:4108 with SMTP id
 d11-20020a170903230b00b00198b9454108mr4040443plh.0.1676935872812; 
 Mon, 20 Feb 2023 15:31:12 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00196519d8647sm8504966plj.4.2023.02.20.15.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 15:31:12 -0800 (PST)
Message-ID: <44e82a43-648b-79bf-63d6-cfd4475495ca@linaro.org>
Date: Mon, 20 Feb 2023 13:31:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 21/22] target/arm: Enable RME for -cpu max
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-22-richard.henderson@linaro.org>
 <CAFEAcA_NQ=-nS4qQ3QQE6_9fn01YkJgPiwsPq6XDCCpYy4NkjQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_NQ=-nS4qQ3QQE6_9fn01YkJgPiwsPq6XDCCpYy4NkjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/10/23 04:20, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Add a cpu property to set GPCCR_EL3.L0GPTSZ, for testing
>> various possible configurations.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Looks OK, but I think we probably shouldn't enable RME by default
> until we're happy with what we're planning to do at the
> system/board level (eg should it be like MTE where it's only
> turned on if the board has support and turns it on?)

You're probably right about not enabling by default, and certainly right about figuring 
out what firmware actually expects and needs.


r~

