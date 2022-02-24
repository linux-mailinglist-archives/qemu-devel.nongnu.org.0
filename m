Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846664C3801
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:46:51 +0100 (CET)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLwo-0000tC-AT
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:46:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLvF-00005B-BC
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:45:14 -0500
Received: from [2607:f8b0:4864:20::533] (port=34614
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLvD-0002uO-Ff
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:45:12 -0500
Received: by mail-pg1-x533.google.com with SMTP id 139so2884319pge.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 13:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ChC27Rfwi4zRHIjNDo+TOzn1dCnwlj0X/ahrWFvzjqs=;
 b=jBtyrHqFW0+87tDfuhMPgGQy77Y9uK+k8qwHaNyqp6pEYaKVWGcU2rUyuwONxYGpED
 vzjkBDkHYJmx5evb/02SsqYlsbCiDdkhRXGPIHwyp0Bf1p0+trxnplhEDsRw7oL+o/bF
 fuVkCOtIcxLlHxOzBRL82O9DkF1CA0qUP42qd+vaBhL4MS5oR5P3iy/9Umn79om4Mn/h
 +89glQDAMi8N5SnRpr5N1kY/bxd5CeS0DC9fVSx7VYdWy1sI3BvzAreFEYdbHljg6qxJ
 fVSeJcZpO+8YX1ruW5kMQAL4Jb631z/Uedp+3m2YCi/opRy7Ff0Xroqp1rwoOLOp9Z2s
 wPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ChC27Rfwi4zRHIjNDo+TOzn1dCnwlj0X/ahrWFvzjqs=;
 b=g8oOFxZ+eMzP2j48SXwUiJeOQcFffUyOu6iHOfwQiB8egn7d8ri8hpcasWreqw4Ocl
 h3/KhbzNFsQJr6EvaPwNea0A4QgtxTCaG1RkaGfblrNAayUgL1z9xZE2ujHi69RS2aDL
 qCw1m/0ybggc8BRqQnRNvTGz5oW6W83j3nuJq/4k61+N7BOC6HHkZIMk2XTtcqeZ3uq0
 cEUd6kiaSXAMCccjY4n07BxsP0dkH8C+lAxH17MUrzTPSA90NDtjuQlQmp/CHxhmAjwW
 Tfu77dKL5Be8S9HxH8rn4KqOHDr+Jq6AkDQo8cfjtTRz2mnXj1WDQs1BvzKk1Vnxto4l
 wweQ==
X-Gm-Message-State: AOAM533sXHM8BEop3lTEAoPA4Aqa+PL8Tbu8ZWJNRtuZtYuQrgvwgFhx
 ZkHnJYXOYCJgTF+C0oRgshMbZA==
X-Google-Smtp-Source: ABdhPJxCrUXjqibt6B1rUs+0z1Roa8dTCJFRU0m3RBV42IyiyIS75MnGjnPM6nHo7gJTi6/G4B3qgA==
X-Received: by 2002:a63:f14b:0:b0:374:7b9e:dc8f with SMTP id
 o11-20020a63f14b000000b003747b9edc8fmr3733647pgk.357.1645739109897; 
 Thu, 24 Feb 2022 13:45:09 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p33-20020a056a000a2100b004dff55a7f08sm484429pfh.21.2022.02.24.13.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 13:45:09 -0800 (PST)
Message-ID: <46d03746-80a0-f7c5-54b8-fbdd4b13c132@linaro.org>
Date: Thu, 24 Feb 2022 11:45:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v13 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220224201900.1037465-1-danielhb413@gmail.com>
 <20220224201900.1037465-5-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224201900.1037465-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 10:19, Daniel Henrique Barboza wrote:
> +void helper_ebb_perfm_excp(CPUPPCState *env)

Please reserve the prefix "helper_" for something that is called from tcg generated code, 
which this is not.


r~

