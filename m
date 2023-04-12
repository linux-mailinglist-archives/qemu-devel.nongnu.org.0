Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD416DEC02
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 08:43:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmUB2-0006U8-NW; Wed, 12 Apr 2023 02:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmUAu-0006Tk-Fn
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:41:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmUAs-0003Kp-Nv
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:41:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso16493057wms.5
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 23:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681281702; x=1683873702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2A06oM01/ekGWjCtn7d9VJVTiWFedTFjXJ6yW47nm30=;
 b=Vr/nysT1v1x6IBps1UCLviDlsc+Nkr2JbSCD6hv59EOoQcIg4+sf0BYstxbDR50he+
 ta9kG6rUN5e1CY3DsFRjaq2AKnIylAYIP9Ig97WRpVqSOwL9ngqzonHXI5Gu2xOwkbkR
 KnBxUqIXOz5rMP8s2WXFs8YAB3QkLq207U7RaJq2+rZvL64sQuObm4CoiQX5eMHrkxFM
 Jsi6SqJEgHrG83eGh2st62cAb2CuYnLZH5UHa33kjRHkdzzw2du5vIV19GHAE5g9kH23
 iURuk5yFLtDXNnO6514sZS2Rf6fD2NZQsO8OVJIQS0uvCWkQOWE3LX9nVIF8nHFjlZ66
 bc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681281702; x=1683873702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2A06oM01/ekGWjCtn7d9VJVTiWFedTFjXJ6yW47nm30=;
 b=tWNLT9RMbykZjDwd/558L6GO4NBrPAEIEB1ls/dE0B5MHw7Ua4U4+Oyv2b+/HQWRe5
 9E5sTawkkPVLl2sCg+sLGVTPByxlTJDefEnBr03mBmqXOgUE0V7PuJ2aQr5W4PWsXS+y
 DlvNuUBpwQ9QfbdkuYH9CHvkJb/SEcY6qOJsmObkZwH8MBgZ/NBli2tDhwkYUhBFcwcM
 ly/ZJ8p+t6Hcn7VuHByDkf/hnnDTISmq3YJdilmnKusXaCjVVL9fPqdkLAoojLCVPrpA
 b8ABZBwIvqxJ98IlVDNkboxtPpybyT+QbW7i7fLhFjwdl+PAinpn+DjOsRKDkHA3/nQH
 l+7Q==
X-Gm-Message-State: AAQBX9foVF80REFronk4WGw5YRzuTvuLG4tfP5itELpvnQ+/DLM7mvv8
 mr9BgUwqOZLI229vlmSLbBG9Yw==
X-Google-Smtp-Source: AKy350Z0/dD3gd45FF99AC3R0GMEeMb6v25hoyg+JlBtAScLqBw/HlT8WFv2pwVU4MvtGh+DLr84Cg==
X-Received: by 2002:a7b:cb18:0:b0:3eb:2de8:b739 with SMTP id
 u24-20020a7bcb18000000b003eb2de8b739mr960595wmj.37.1681281702542; 
 Tue, 11 Apr 2023 23:41:42 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b003f09e294d5esm903560wmb.6.2023.04.11.23.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 23:41:42 -0700 (PDT)
Message-ID: <115fd30e-71ce-aa80-0391-63fbba7899b9@linaro.org>
Date: Wed, 12 Apr 2023 08:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] Hexagon (target/hexagon) Add overrides for
 cache/sync/barrier instructions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
References: <20230410202402.2856852-1-tsimpson@quicinc.com>
 <0d07641e-f37d-3589-58c9-d992ab70a985@linaro.org>
 <SN4PR0201MB88080603B7D90240DB17C2C3DE9A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB88080603B7D90240DB17C2C3DE9A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 4/11/23 04:29, Taylor Simpson wrote:
>> These variables could be moved to DisasContext and allocated on demand.
>> Even recently this was tedious, because of TCG temporary lifetime issues,
>> but no longer.
> 
> I'll work on this.  The obvious advantage is to allow the TCG optimizer more opportunity to fold copies and propagate constants.
> 
> Any other advantage?

Once the packet is complete, the value is discarded, rather than written back to env.


r~

