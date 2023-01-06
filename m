Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C206606F5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDsBa-0007ij-Bm; Fri, 06 Jan 2023 14:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsBY-0007h0-IB
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:15:24 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsBX-0005oE-27
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:15:24 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c4so2631245plc.5
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zq/ZGgSJL0PTn+1FaF9EmY9bJxwvJoZfGN5UUM4LQfY=;
 b=gyCIeUsu/jCPARU9Peas5z/5bMmIQp48m5lzni/IcCrXdL42Om59oab1xInIldHWzx
 2aujLaVc25iN3Ys/fLZvsBDQhOQGVOflBFOkdL+kBVcqyU3PnI/bvg2P7te/CQ2Us3Ub
 N6pEX7rgLoyyLQAf0GoDtpjTUNLTmC9dcCb/lje7405UPKAPecEhdiYXQ0xsFP+Bo9m6
 4WrJUay5ySsL02in1PdtqDrtAXbK5TVEklvmkBZuF1GU0YvqC5jCqAomY5/ZeUlHpQ8S
 t/qYJ4pI3fEYSx/02lb8gyHLY2qmNCclDHn+9h1fDTdJ1GjbGmCL0nU6u2lzxjGiT3dj
 Jf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zq/ZGgSJL0PTn+1FaF9EmY9bJxwvJoZfGN5UUM4LQfY=;
 b=KMacgZctfDJShimKc9ILQ1w6d/+d8DGjGuEAWaqfSoPxmttWEgSwRh+ciWMtuDAZob
 qsEuVS8S3PY69gK1dtfJoVfIdmzLH76wFh/vTSUDPpTwN7Z8/S4ROG6L1Ha02zZtoFTU
 GHp05iYDYDdc1BHlHibQijsm6inft916MOBK6p6R26Q2mJLrxFMbqn72ApksUR7KwTOr
 FwVf38Jr6zIJx1M/atT5kIoSqIfc8B5kAz1YLmGqvddZY4ar6DTEUuU9sSv7mKiePfrc
 hZomTez07c9ePowALhCC8MU3P811xpZVaKHrkWr4jKldF+uDx8+haV7AJJcnuV1Nd6cd
 792Q==
X-Gm-Message-State: AFqh2kqn6uFz7H1pVAxqTegQeKxffYVe3Qxz0cnm8MphDHSTEgwIW1Ys
 90+ShCVy3iWRxeDXjiK/ILIDt7Pbt+/zCj3X
X-Google-Smtp-Source: AMrXdXtJcZhwf5LOh5egl3uKE3uE2BxDQGi6bx9Jf2xg1l3R/f2NiAy5PutUHxFR8vN4f25QnQUWvw==
X-Received: by 2002:a05:6a20:a027:b0:b4:9a94:af57 with SMTP id
 p39-20020a056a20a02700b000b49a94af57mr27814720pzj.0.1673032521594; 
 Fri, 06 Jan 2023 11:15:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a6555c9000000b004a052e93b77sm1243726pgs.7.2023.01.06.11.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 11:15:21 -0800 (PST)
Message-ID: <88419b67-24ee-224f-4315-36732b91ee61@linaro.org>
Date: Fri, 6 Jan 2023 11:15:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 7/8] hw/pci-host/bonito: Declare
 TYPE_BONITO_PCI_HOST_BRIDGE in header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 05:07, Philippe Mathieu-Daudé wrote:
> Declare the TYPE_BONITO_PCI_HOST_BRIDGE QOM type in a
> header to be able to access it from board code.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS                  |  1 +
>   hw/pci-host/bonito.c         |  4 +---
>   include/hw/pci-host/bonito.h | 18 ++++++++++++++++++
>   3 files changed, 20 insertions(+), 3 deletions(-)
>   create mode 100644 include/hw/pci-host/bonito.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

