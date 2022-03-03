Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350094CC834
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:41:11 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPtC9-00062i-QC
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtBF-0004k6-ML
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:40:13 -0500
Received: from [2607:f8b0:4864:20::42c] (port=46774
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtBE-00042M-2J
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:40:13 -0500
Received: by mail-pf1-x42c.google.com with SMTP id s11so5842403pfu.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=SBbkMHnDuStOEbXV2jJLAi+044uIA9KOnw/YWtpU+4s=;
 b=nGGcMJteIqZHRUYOgzSDzxSp6lorIwAaq/hGTqepMNTkF7ucFzc7Y2yNhvZCdsraPY
 zeP3Y+4c89su92UMW/WspG6UGpg/Z28pgXNl+GIdVLtu0Q4rRB+SzUtlJ7PWeAzQI2j0
 j5+MzjJgUvSoUA8lcXwK5I6ZuPLmCYeyG5SqrneAJYyIWh115VvzaQoV9p0pm+r3ItlI
 lo4MtwN9ItFtEOGN6rJE1ODr+sUSqDa2p7V/AA7Ab8a0ck+s/AejTyNyQh45toPVIUPB
 YNLEXH+2f91cUN9biRplTnkZi3gS5/4DABX3l+Hqsk3GH35S3D/35rt2a1CM5lfk0pOM
 cRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SBbkMHnDuStOEbXV2jJLAi+044uIA9KOnw/YWtpU+4s=;
 b=q3crnPaMIf/MWk89CtlLJ+b+mpLPcSltK/rxZJxf9Ct/gRIZvokzVtGNG55sLSQhLG
 6uw7u3c8RjHbl+BMgrXSx1F4v1s2TS2yXCwFNFkmuLvTTzrYEsqOdNLQIIx4r/NNc/go
 FWLqh4/9lDgVVvouVHvQ65OuXmvzGeVmBUF752otUIu3bVyUfsne6GhSfA6rZUdze3pY
 T6aS3+4xBvIjoOrHYOpIWXiU6nU5FtKBkJWpeTw20XFmt8+HiuQG/pQXI+5PltdXxCdw
 40ZCl2ZabpgAp7jcapviMA3KG9X3ThzyxfE2DEBGN+/qM3gKbij8MgxrpYyv1MR209xT
 bZpw==
X-Gm-Message-State: AOAM5320DTBrldZ82qXAdW1/rp5XvlLxRmDogh+YbSubZNLNF8oDXRlv
 hTbV2pkC4wTb1e8f2GPgOshq4Q==
X-Google-Smtp-Source: ABdhPJxYqqE18gPfobndykLZSG+BMOGjS2W/FhPZb+SYjRpiVwJV8ree2CaasJoVk+chskFuaWmt1Q==
X-Received: by 2002:a05:6a00:1744:b0:4c4:4bd:dc17 with SMTP id
 j4-20020a056a00174400b004c404bddc17mr40354611pfc.57.1646343610321; 
 Thu, 03 Mar 2022 13:40:10 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a056a00159300b004e1590f88c1sm3524545pfk.220.2022.03.03.13.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:40:09 -0800 (PST)
Message-ID: <835773ab-91d8-49de-7ab5-d2e2e528c6b8@linaro.org>
Date: Thu, 3 Mar 2022 11:40:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] hw/intc/arm_gicv3_its: Add trace events for commands
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 10:23, Peter Maydell wrote:
> When debugging code that's using the ITS, it's helpful to
> see tracing of the ITS commands that the guest executes. Add
> suitable trace events.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 28 ++++++++++++++++++++++++++--
>   hw/intc/trace-events    | 12 ++++++++++++
>   2 files changed, 38 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

