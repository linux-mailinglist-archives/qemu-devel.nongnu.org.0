Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358B329641
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 06:44:27 +0100 (CET)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGxpZ-00070N-ST
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 00:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGxoZ-0006bD-5Y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:43:23 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGxoW-0002WZ-0E
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:43:22 -0500
Received: by mail-pj1-x102a.google.com with SMTP id d2so1181303pjs.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 21:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HY74ONpEHpz+SQwrf1k5tx+K+AuI6pzfcUfMNY/Pj9Y=;
 b=HF2yQ91keimQLVQda4cMRYzlqYWE7l2wnDHGFqIAJQoI1nIpueMIBJMDvtr1nCk4YC
 lBhDxHQ3WzvW3tWgD/Zyyqr4QnS1BAU0j/wiSjJMyF7b3qs3lzgdEUsUmGDGCMaPdOxr
 y+ggmtksy6huY+11aM5Xk7vXP2wDRuH+mr88Z2kGfI8ZYORfmtEqbry5wOsRMIV8WKSc
 6DNnVv9EOGICi7yKneosRuv3v3WXqLViH/Ozrl+kXJVTOLQmNttSjnSTBTvUxcLD3pOu
 7JNwDvudW9zf2neimXnMAWV9dq2vY2uWZJIvNGEKp9gXmVA26xF81ejTXzUit67D4kxd
 FpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HY74ONpEHpz+SQwrf1k5tx+K+AuI6pzfcUfMNY/Pj9Y=;
 b=pjH3dYxK1g3onFdh8An2QnLLFVDfjHUoSxjiJSXgsIp5V4n1IG4CoZimrcrmyojGJ5
 2K8tiX1BwlpiinDbVuiXNC/ZAgKPe11JxRpdKP1dRhTMEZOctoF3sf0uoDr4yGyiAzop
 5bgGMnxJbE7x2kDzFeqx/K+Wu6YtwFqX2fOJ8WrfDWQmoSKY888cWQ55RmG1Nme/iwU5
 N3aFF9JLdSDt9jL5DxxnIhWW37L5YYY2JbCEROyq3fHY7zGwnTYj4gWuDpoMfYYbgU7t
 j4HJzG/8eBLAQqmefPcIe9ENXcG4o5ajnq0bH4ctS/VJCP2drTY9qcsZZ502eqZR/pF/
 ZRxA==
X-Gm-Message-State: AOAM531isQY1+Dd4WwhkMb5+OCDLvhtoH6xr+7+qiyVfkaqTyp0zfllw
 7ThR9EfhyNXBPr0X6BLM1I/UpY6YH9sjbQ==
X-Google-Smtp-Source: ABdhPJxwBRihXoCW3cHHC39DoJLLEdYuLYnB3hZ/eWeh8QmdeBXSTdJRfWoXqaYo21+pg6DGjmV0Lw==
X-Received: by 2002:a17:902:6ac7:b029:e4:28f8:b463 with SMTP id
 i7-20020a1709026ac7b02900e428f8b463mr18721896plt.62.1614663798412; 
 Mon, 01 Mar 2021 21:43:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v1sm1417302pjh.29.2021.03.01.21.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 21:43:17 -0800 (PST)
Subject: Re: [RFC v2 18/24] target/arm: move arm_cpu_list to common_cpu
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-19-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c939d944-5a43-4c30-a57f-b74e19667e0a@linaro.org>
Date: Mon, 1 Mar 2021 21:43:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-19-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-common.c | 42 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c | 41 ----------------------------------------
>   2 files changed, 42 insertions(+), 41 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

