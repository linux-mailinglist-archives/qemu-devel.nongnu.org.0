Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0A61E781
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 00:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orop5-0007SL-I2; Sun, 06 Nov 2022 18:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orop3-0007S8-TG
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 18:13:01 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orooz-0002op-Sh
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 18:13:01 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso8815966pjc.2
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 15:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYBgtyWYp4fv874Y8zi/5mKm5eVa4anNvTScnW7oppU=;
 b=QL5151bqA0SfDJrW8Y5MWr6hW3qY18kPa1fXlpglvcjnUMOxd0nFj9twWuyLX5+uDc
 HsnFgYVsbsGAkoYMgbbtGIAL1k0BjNG678I0mvWI0DAXrHwlKPUvS5KYoLnLvkqJA/Zo
 wPC7GTUSs/RjYLeFDy4nOxj9ur/PrUr0EsgH6qd3Ep3CwfXjOaba/BpKuJ84o0A8ds7T
 jFCx44dl0PXgpf6BGez3JJyWnlgXzR1IdAUvGJpkezhszCmouipF2iIy6o5hNqPOfC9v
 Y/YqsCJXAy6s0fdK4joeiIF15uZGipJ0mObakWurHSfvnmKHn+mOaNtsf8cHd5eVMFNu
 vZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYBgtyWYp4fv874Y8zi/5mKm5eVa4anNvTScnW7oppU=;
 b=i01cGDMdpp7TH2JxlLsYyiz89MnNBRLVYqg2UVRhjlWd6S4iDuPFP/2B87uDr6ES9g
 r0ZtKJSfMqjAZtY8RgOyziV1X79M7VA90YjjRAH+lYplSuIPflMk8OesoOTdSMIuL0rr
 +ij3KNe2G9MMng4nL65Awp+GHtonLiPlnNQUBhVV2h55mB4HMLzTkGr8kLB10+Vipa1u
 cgIvEYimQM6ywdtvlUMwBcdykFbExGWnogAzzpqNtIeK+4kwM3yOGALk9HUcWz0AHeEF
 nkrSg37wTzw8SkrHBEz0M5bdmFjZRtJ6VQBe4TTQbHii74HKqHMVjl5tpHIVcxZUy0UZ
 aVMw==
X-Gm-Message-State: ACrzQf3fvg/rgjk/NEcsf8IYG3jl6IOPC85FSpI9iikmVCUKvpIYsW5+
 OGkjKFrNX1rnCVXYmxVVw+cyAg==
X-Google-Smtp-Source: AMsMyM4lIkI4y7eqnLYyf5vfke3arXZAXlx5hCK4dvsFUPYNrFvs/f+Nux6yBSdvgjSi9/lljd6NZA==
X-Received: by 2002:a17:90a:6588:b0:213:c5ad:fffb with SMTP id
 k8-20020a17090a658800b00213c5adfffbmr43917506pjj.242.1667776375837; 
 Sun, 06 Nov 2022 15:12:55 -0800 (PST)
Received: from ?IPV6:2001:8003:d918:7a00:f28:fa55:3b51:3624?
 ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170902ce8700b00186f0f59c85sm3598956plg.235.2022.11.06.15.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 15:12:54 -0800 (PST)
Message-ID: <b4b867ff-3ed6-c45e-0694-6a8df4761af3@linaro.org>
Date: Mon, 7 Nov 2022 10:12:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 11/11] Hexagon (target/hexagon) Use direct block
 chaining for tight loops
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-12-tsimpson@quicinc.com>
 <a13e4232-dea1-3050-b0c8-a6cd0cec3137@linaro.org>
 <SN4PR0201MB88089D42B56DD5455E2DC70CDE3D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB88089D42B56DD5455E2DC70CDE3D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/7/22 08:52, Taylor Simpson wrote:
> I coded this originally with manual handling but decided this would be easier to read/understand/maintain - especially as we add more flags and some have more than 1 bit.
> 
> I haven't noticed the flags in any of the logs.  Where are they printed?

Third field of -d exec, e.g.

Trace 0: 0x7f09a40004c0 [0000000000000000/fffffc0000000044/01000001/ff000000] __start
                                                            ^^^^^^^^


r~

