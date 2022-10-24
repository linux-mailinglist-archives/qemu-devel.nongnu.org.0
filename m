Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11360B0DA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:11:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy26-0005Gw-9z; Mon, 24 Oct 2022 10:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy1u-00059v-4d
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:02:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy1i-00023I-Uw
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:02:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bs21so529888wrb.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Yt4zSTz1Q7SXlJFljS77hX1v8WuS8lHV25BUMs+CX4=;
 b=jzjvwQ2xlO/ltXqA63PJ2OdhydHgLRxF2P938Bsi+j26MAPtS3+AuVdZb+z9hfpNFu
 Vb2RTEgpPD6sB8LPisk7fEB46PoOmT6/BTzdLqfmpq+5C1+WABHrqiqDPMMvtr166rdZ
 uXHtarI4lxq2yYZfPkTAYhLu2G7kfLaqMe7BKeh2clM7uaz3uv0Wr1PwkYY+I4suFTw2
 LMcQEAfDqI7I5J7uqmbzOuN2cQN46XS01By1KgtmVVAaJqw1zVeb/0iiqe5Kxk4Z7Hj9
 WO2upGj4Lb21mEsq+02mH+TcvJAhdXskxCoR7+rMVdJ+ic+RRELbKre5LIu3CBynlxhr
 ggTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Yt4zSTz1Q7SXlJFljS77hX1v8WuS8lHV25BUMs+CX4=;
 b=beB7yi5+YwPPjvu6J/DX7xyJ29Xc1/ps7tJ0pmVBX21ePrYv6k/+FdJVInMs+yiV1t
 J4aTNVbDvfXEyT5LPkLwNvp8dAP5N2xXvGt/6dxzrm+6fPKBNEW//x95RdL54iISzV04
 dwobzF8ckomPIrdM0SqZxyPycZ+RaaK6SuaMjK77EUvAv+dJYr23ivzKZUc/fRE2uwjg
 FUGrZPXCdqWJ5lMZYn+/s3uqWHCy/AbV2BEVT3XWxb2EBg5rjA9sv0skIdaz5110QOLn
 1sAit91F4xCP9vBVE93Lg3Rl3zfJn6Bxy1PtEFhoahdaEqadMVVBbHR4BUFGWK4s5bZ7
 TYog==
X-Gm-Message-State: ACrzQf3dE2Mxled+Z7l1U8kJnIYcc0Nl6DTa/W0uE3tXsOKyl9sd9R2k
 wg3x76K2UwFyAJ/Ga/y1yNZOTA==
X-Google-Smtp-Source: AMsMyM7tBrzZTIalzpJcli43/u8XNHARV1Sti8caMc4WHlPyzb2r+DhhvraYZBbfLKN+wNr8TW8LpA==
X-Received: by 2002:a05:6000:61c:b0:22e:5e08:43e7 with SMTP id
 bn28-20020a056000061c00b0022e5e0843e7mr22079424wrb.176.1666620118980; 
 Mon, 24 Oct 2022 07:01:58 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6c1686b10sm8595668wmq.7.2022.10.24.07.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:01:58 -0700 (PDT)
Message-ID: <4b0e2de2-7241-7f26-baae-96a7b0339240@linaro.org>
Date: Mon, 24 Oct 2022 16:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 04/29] target/avr: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/avr/cpu.c       | 11 +++++++++++
>   target/avr/translate.c |  6 ------
>   2 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


