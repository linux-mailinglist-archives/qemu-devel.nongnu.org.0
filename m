Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7760AF0E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:29:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy6g-0007gE-93; Mon, 24 Oct 2022 10:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy6d-0007fu-OO
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:07:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy6c-0002sY-79
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:07:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id l32so6664676wms.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vWGyrcwlEZzzcxK/+zMeGG4147awb/9TZpZFwZS9aYY=;
 b=JQH8RHUkF4l4RXLRsxskTBQaOqHsY+BCT0OiZxxrczGrYi7bCA1NA9iNvLffDa9nJ9
 e8TRvNSNBZSym7LZyOcuHARjCavIvZy9/FtFV4WwCf3r69av2uKiuOgpddZf/HMjMG0c
 3f/Ez7QcJfan3i6TeOC2vM1Uq2D7Z8XZfZbrntZmxKAZl4a+aBmTQnIS3tKlmwHZu04s
 tvn0aqEQRaRDaeIW+vUZRL8rbj2pv7hrm7A+U+Dc3VmWUDyTTLLCv09FwCYhqSisNZH0
 O9UzYfwGvoAKoV3YhfrwaJDI8J1ktj9HXn02jfqszdA6W366G9reAWwQOhkNkt6HRL8N
 cRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vWGyrcwlEZzzcxK/+zMeGG4147awb/9TZpZFwZS9aYY=;
 b=xeS5SKB8SU+ts6gG/QxUZIFJWQxeI5YrS9unFM4GnIHehBg4Tf1of7hChTAM+KmeQn
 ZhzDHNgy0uSsGrklksmCM8e1NGA+Z4UXssIEypwsHa/qixXDJ1M4q1QzGmbhMBMm37aB
 aXwaWbgMZwEfhpxKlYMhUtLYQu2QVknqy9pRdh8DezzaOogYIQxSYY5s97Vqka2VdfMZ
 hiozuMKDpH6pvLjgyK40LDhYCyv2HMOZ3GqtKwBcpTNF945w+B0KJScTQKIiGsHApBky
 Pxl3NeTREDi8A6r4CvyTcPmo8uuylUcGKcoxFZ4Cb+zNETnFCvrOWhoCiDUkdK+ghR7R
 KGOA==
X-Gm-Message-State: ACrzQf1m83L6Pldl19rSVpaamqB5OgLO8V0Ty8fzkXpBpqHsRst2Tjx9
 1TW3/CJAqvfrRBmXlwVDtvLq9jb4RPMhbA==
X-Google-Smtp-Source: AMsMyM76WhKExs/WGcpNifOwhq/lTIH+L9SPMwwIwgcOt1hUfB8BQz9H1Gcz4VdRLcNnHckChXq/Qw==
X-Received: by 2002:a05:600c:1f08:b0:3c6:75b3:f444 with SMTP id
 bd8-20020a05600c1f0800b003c675b3f444mr12150827wmb.74.1666620422776; 
 Mon, 24 Oct 2022 07:07:02 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05600c1c8e00b003c6bd12ac27sm11583191wms.37.2022.10.24.07.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:07:02 -0700 (PDT)
Message-ID: <4f3d45ca-f827-6b79-8ebe-44a1481ee351@linaro.org>
Date: Mon, 24 Oct 2022 16:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 20/29] target/sparc: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
>   target/sparc/cpu.h       | 3 +++
>   target/sparc/cpu.c       | 1 +
>   target/sparc/translate.c | 7 +++++--
>   3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


