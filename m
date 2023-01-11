Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D526667CF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:37:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlZx-0007Or-N3; Wed, 11 Jan 2023 19:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlZw-0007Od-5P
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:24 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlZu-0001dV-HR
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:23 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso21909888pjt.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VQAcl5qzbvA+J+Qxk2U4GQC98qpkOQ2b+sF/9jCwzrM=;
 b=A6GkY7JKAyd4BZqCrGwcT2/gVToyBwHpNkPJrDDP98fahvoD2/wQukDAZcOuvWLn3/
 Pr/gh9v+JTZ0EuPn6rlJ4rBFK/q4hb5cGL0GsscLgb/qbGRRoGmhn21NPnY2k4NeyTmK
 6UYOoYlQlKDNMta611M7p5/wayitoboxf/gKnN4eCsxPuhBKbGiPJqUfNrV3WqC5D33F
 rMZ6kRstQF4UMx2pM/WjS2GF4dRxY2bcFzrbp4gfoPSIvRqgXCVT2DbVWIFgLaS88G3C
 RlRKTdAfbQn4DPtwLBDbF3AXbI14fHbawa12iZigu5kpyxDBwsxQUDDJwSDS4vpuTRly
 br6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQAcl5qzbvA+J+Qxk2U4GQC98qpkOQ2b+sF/9jCwzrM=;
 b=DDrVEZJkBHL+lHZW4/oS/2bvT9sjC4ahhjLjLXKKxMacmAC/C85pqgoFDbO3/eFmjW
 FOtKcXfG2uZsLwOJIbAdYPJnXfoEzKqy4WqLFMTyn1lSPUWBJcS/a69Aid6KmNdAAlDM
 nKCsLlm5F2Fgb7yjLuaBIe4yh029MCzIPMfcxSOc5CCeZYuLeCExQhu3QkhML9q1bJEQ
 r3PRF0Zc7SMIc63TzKD4Bixs2uQJkwmsUnPOZivC3QJRTJepw8bKRQc2W5VyeTUXQVqV
 7TRKCJCUUnaT1q37KWK5JoBXjxV9Bef5y4gsOyauvhROflrTw01GZgc3eo+ug1/BX/XE
 IbsA==
X-Gm-Message-State: AFqh2kqIbesLChSSwK/AXb2oIGeEaa9IcRBQl845/so4h9OJPNVxDP/t
 ONtg10rb1GmZQ76zZXgNcalBmQ==
X-Google-Smtp-Source: AMrXdXvoT9Wyxdb9daa1xAz8f+ZNleueSCDso5aY/XEV6lDPACC850edpf4CWUxP6C0AJXIGwX19IA==
X-Received: by 2002:a17:90a:d686:b0:229:2e7:920 with SMTP id
 x6-20020a17090ad68600b0022902e70920mr12299pju.35.1673483780253; 
 Wed, 11 Jan 2023 16:36:20 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d4-20020a17090a8d8400b001fd6066284dsm9560146pjo.6.2023.01.11.16.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:19 -0800 (PST)
Message-ID: <525d562c-fe33-66f4-b9fa-896ec6e51636@linaro.org>
Date: Wed, 11 Jan 2023 10:50:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/26] gitlab: just use plain --cc=clang for custom runner
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 09:38, Alex Bennée wrote:
> I think this was because older Ubuntu's didn't alias clang to whatever
> the latest version was. They do now so lets use that and not break.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

