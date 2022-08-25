Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820355A163E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:59:49 +0200 (CEST)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRFGm-0005iA-5l
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRFEt-0004E1-2Z
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:57:51 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRFEh-00022z-0b
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:57:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n65-20020a17090a5ac700b001fbb4fad865so2025736pji.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NgecpBpIU+NFcdcYB8LGGqSYAEIQstYyB/ELUWgBhEs=;
 b=ESQoqYhTmo8EOcUZtiHS6rcsI1uQGQZGbEuLNqb/J/5FvthEz2G/b8VpdEffAKZDS0
 kv4djAO6IYER2kPFG2hN5/vRqojAzyM+ZioAecMfnTNj6MdFvx8Jb+AsoMAlVkz/75mZ
 wyoUbZLhoG2KwDjXAYA8eg7BLGt0JZ6WnxuogJ6jd2LWbgPYetVgmLWFd0T0dG/gtLnX
 a50yJ48DlpDKcD6msbaNKaW057dfrnTBGjlSqzN7P36i6KRYULgBCw6KDaR13reNFKPV
 O7I6MZ/Yywu+0AGVxAA42ujOs7cXBIw2VWzuEkCsrvhJBWcf7WpxGKYjTFcN71U/txMR
 bOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NgecpBpIU+NFcdcYB8LGGqSYAEIQstYyB/ELUWgBhEs=;
 b=bQ40rRdsIcSW96fmFEW49iPLIwgHa+FYZKZnEQUnlsCjpfXQdRN/Wa199wXqgAyu/q
 /ebviZY6qaXBgqAbJHq+ImXNAo2/YbzyKRiz3cmDJTXdttlG0gjWIMVN+8YUYYp5VR+r
 al5bwejG3h18OktQAOhRGfi2C+A6YiPjxPkJ062FLoVtNwpZQFJO+RbQg7gX4OqrwNA6
 ytcvugVIavtd3GrdxqvLjIS5XtA6ApmYKUTQBYspf7NCz/WP3yTD+y5tBxJL6Q+VqR2y
 MXK4Vv6YUuG8SbJD0NWYk6os9koH/ooyNCe4JKTpQpoJAbcEBU//qn53jLh+cGmwHe19
 y45A==
X-Gm-Message-State: ACgBeo1IDYOdkcliSKmSjnkDqaDR8ps+jRn4CmpmU/P2NF6Z9JES2FOA
 yphKdSzZjeSY6OOOWAfTtKSNWQ==
X-Google-Smtp-Source: AA6agR79c9WvqFiWZ3C1moDCiEXgpK08f1d4CuFknKysh4XuSqxIDc6SFtVkT/Ro6tcJscFfXEa0NA==
X-Received: by 2002:a17:902:e84c:b0:172:ebff:6107 with SMTP id
 t12-20020a170902e84c00b00172ebff6107mr4463144plg.40.1661443053860; 
 Thu, 25 Aug 2022 08:57:33 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:64be:e7c:2851:ce4b?
 ([2602:47:d49d:ec01:64be:e7c:2851:ce4b])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a170902710500b00172cea5467dsm11224443pll.274.2022.08.25.08.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 08:57:33 -0700 (PDT)
Message-ID: <e56fe701-d95d-44e0-155c-e2fff476651b@linaro.org>
Date: Thu, 25 Aug 2022 08:57:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/i386: fix PHSUB* instructions with dest=src
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220825154847.364806-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825154847.364806-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/25/22 08:48, Paolo Bonzini wrote:
> The computation must not overwrite neither the destination
> nor the source before the last element has been computed.

Too many negatives.  Clearer to use use either/or.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

