Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7E67A761
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 01:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKTQ8-0003Qu-2b; Tue, 24 Jan 2023 19:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTQ5-0003PQ-Sz
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:13:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTQ3-0002Z8-0p
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:13:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so188958wmc.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 16:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IAanV1cmzpvJ/BO7ybZI1dsSXlZ2W2XaMUYjkULGVBs=;
 b=M8O09S39o0BdB2IT7y6xIXtqPhWOWkVzWbwIqPP7hgQ5QQ9xPgvhY80qgwnFjDp8Jx
 FPi4e3NqWmW7+WMqJqExMirrf7j4/1/hsjNSyxJHFDQWmNvV3psRaSfY4VA06wSPVXa8
 K8kMguUrPTbluO8t4/vTuz/gol0cAC+nhlfGsTp5CqAl2iS7nCkXzJ5rCfrmBYVjD5HI
 0sP6qHFBP7eQW0eVglRumz/Jfxg/oMvkgMQvWQvyfbdzoED8c5BlB699eryjmw/PpLtZ
 oGAvJ5EmpA7V1ze/K9J4hWV4yl8CEuSMZCxVk56m9DgQBRtO16wHKcQRLbmApjIoa3iB
 FKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IAanV1cmzpvJ/BO7ybZI1dsSXlZ2W2XaMUYjkULGVBs=;
 b=n1xWJ+OuT3hT6XfwydhvHbuxK8/Z9RogGbQAa8ptQxgMWhiOKl612adl4PnKUPV/2Y
 4bVupLnP5jtIReEBsOYEqOw5+zdTHzmuYVMu3b3zHIMD23xzfWftbFZG2+iODgCJjrrR
 FQyBZkGkENQIqeNarQlkdeTO/eRxYknulBROi1XBb/lTwPwdVg0jPoOSgFueUXf9K81t
 jz0v/grYwBK5G9f9FkpmfszwZwZVfonMtWDhdHrl/89RdWRB9leCBtcSkpVu0XfyVwBZ
 C+RS3RgDGCFJvNdg2aUjHAe/mdWYzf+4FCMlvna8KUstH/DH+9XnnASOqsaivSX2o9sS
 5TMw==
X-Gm-Message-State: AFqh2koBzwBuPt+ZCw8Kf8faqRWcPJOzQQ3BOTMDKNrRV/wPMIz3U8Gs
 HdmmsIHPa1Nf07JRzEozYncY8Q==
X-Google-Smtp-Source: AMrXdXvmPQ3nNpR5V9uLmWg69b97JjUGFKiN69alS1w1hhkRi4Lotxsfo8+hBN5cYn6cpyOPUTiEOw==
X-Received: by 2002:a05:600c:5488:b0:3da:1e3e:1ce8 with SMTP id
 iv8-20020a05600c548800b003da1e3e1ce8mr29468908wmb.13.1674605617245; 
 Tue, 24 Jan 2023 16:13:37 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c430a00b003dc0d5b4f75sm189261wme.43.2023.01.24.16.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 16:13:36 -0800 (PST)
Message-ID: <a90ac6b8-77b0-7bf0-cef6-00c5bee4fa4a@linaro.org>
Date: Wed, 25 Jan 2023 01:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/36] tcg: Add temp allocation for TCGv_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/1/23 03:36, Richard Henderson wrote:
> This enables allocation of i128.  The type is not yet
> usable, as we have not yet added data movement ops.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 32 +++++++++++++++++++++++++
>   tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
>   2 files changed, 74 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


