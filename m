Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998A60B1DC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:39:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy3Q-0005rx-EE; Mon, 24 Oct 2022 10:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy2s-0005aS-1L
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:03:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy2q-0002BE-4b
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:03:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id j15so5881731wrq.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=asieHF49RoIjJy6ijkykosfXzJ2CM2pnRF90WSo+dsg=;
 b=Y5W2GHPWTTd4ST1rM8TnHlwxMlV0Kg22rNwxJQHKuBL1HOZL07gfMj8+endyxsXYSo
 pV+LfWpr+Nb2rYCZJq9QxBI7i9p7Ibj5m8gmXG275eAJKqBvR8O6pC1Mm6pBSiJzX7zM
 4Jj92g80vk1A9OqrI5wvFiyYFYYJ6m3xQuNTVfvoPjQO2ZKO9TBYU6JQdz+iV8p1UmGp
 PzKZp/XaJM6iAo7GjW9hp71FtNjj19Yzfri4wj8Hi90DJqC1IB2VkDOalRYScrpYwuKy
 aGOs8z5WBOvIzotdwKDQxVHkqQtNvkZqU6bxs9LIUMMrcXdB2DU9yRVChbLAwRt8mct/
 0YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asieHF49RoIjJy6ijkykosfXzJ2CM2pnRF90WSo+dsg=;
 b=7tk4X3xdfsVcO4Vq8zKOh+znwWbzCLGAQhFfP8ztuPT+nPsmiJowcHWs86Dck1PZS6
 oyc7gNxhHcr4jA2z3IZGWMnp/E0QndTfMlKC4k7AJn2gW9mPF9Mz75osd0zaKM9zvLpp
 KYDElEyg9CbKmcTxgfk3qTmr67XxMyjy5VPswZW9Lfv2xunainWLSxgIyaEa183Rvqz6
 Ur7xAzpD4zJTLqEgJhSsx6oJRUTWhhBHFlF0RAseC2QGEeMn0WUVRSdvjUkmRu4dqi4J
 N7CxH3HyHR+PRXBXgKKbEJvvXEAtq1q6OfzOYWpgHWeMWy1+BZIoEk9bXzKQnjXyf9Og
 tCHA==
X-Gm-Message-State: ACrzQf13BqF8vWmPSIU4swOBHxkmRAHlNn2708qlYHDFcV7nPPed/n6l
 jj9NSJRH33WjKGeYCFIzPNUgTg==
X-Google-Smtp-Source: AMsMyM7TvmnjZ6ZhkXfLPY39dckugEpM2GhZD5vsyyx0VoJlpzH9nRRAxDotn5uQWzQ0KTeqwvMvnQ==
X-Received: by 2002:a5d:4811:0:b0:236:7077:e3c3 with SMTP id
 l17-20020a5d4811000000b002367077e3c3mr3546144wrq.368.1666620190308; 
 Mon, 24 Oct 2022 07:03:10 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b003c6c2ff7f25sm11211wmb.15.2022.10.24.07.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:03:09 -0700 (PDT)
Message-ID: <a2c7ea4d-2447-23c3-d385-c9b0be83dff4@linaro.org>
Date: Mon, 24 Oct 2022 16:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 13/29] target/nios2: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/cpu.c       | 11 +++++++++++
>   target/nios2/translate.c |  6 ------
>   2 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


