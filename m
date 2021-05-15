Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7C381714
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:05:17 +0200 (CEST)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqEW-0003xF-Bb
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqB0-0001uW-A2
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:01:38 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqAy-0001bc-Ru
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:01:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso2476481wmn.3
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J46gQNpJ0BIPgR5mkE0WGXqZ8YyEMxFUdi6EVK9tpoo=;
 b=smeJcHcJPHyFDZKVQeVdoMs8hlpcnol/zLSAyIxaapy6AwowFPhVddX2KIO0ZVmIi5
 pioeinc2y4AzDouxCEh8PSJ2TJptHbnebB8Cq/XBGhOo0cAi+T09GctV3jxQ3X6AA0iX
 Mk2u7Q92NYtYw+0DKqot1Z+axQuzkaHMhFqJViTMcrrmTI+sQBc3VpqNpxEdcX2DxLO6
 Lq6o3G7JAA94XxhUHvxyaBUDviS+9H3aLuQmxYBlMolKMbg4sh5Xn5/TzTJ0rueAuuyP
 GKKshubuiv7ikXy+G7eBc3j9LF924xBpiO3gvNHrz93PdOBD24/eU9GzmTNlsx9Rm+tD
 F1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J46gQNpJ0BIPgR5mkE0WGXqZ8YyEMxFUdi6EVK9tpoo=;
 b=XE3o7a/aDuNRvciSpx+AodluxUuS2uXOQVwgjY0N5qMoQL1s1MyvxNXb5X1ltxJ0t5
 rVGqTAHi5OVKjiWkXM5pn1a41XGqDg/hiHNlspTG2dopMpcFwNRxqKb0F6VCeRpU3iVD
 Vp2Z2/uG0qENSZOe2jwn5i8ksCMvt4rye6kpAOm3CTAcbb4RdV2DbtzF0GQATzYch+7W
 59zSz/i85or844lYZ8AXospBikEDW+D4epYkwXwqJMf1QZzmDW0M+WX7SJOaCMbe+IY/
 nocY16uPi9RObIr7vwOI5Fyv2bVkypJqe3orE1OVm4X1cUv+D3jmldNpVqHIv4LCpfux
 Yvjg==
X-Gm-Message-State: AOAM533/ZiJxqz9NqMQagVamyZhj32yzfxamDklop7GTt9cGLt1GMvv9
 D9PL2I3EN4r4op5pcwSEkM65zxMrhWCfHQ==
X-Google-Smtp-Source: ABdhPJwTkQMOeK7aO0+A+cVqRhv8+/wNPLWCOF5bfFa/95043quwUGX3rp/ubRkRrNIEX4wlzO9X6Q==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr55008538wmb.155.1621069294533; 
 Sat, 15 May 2021 02:01:34 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j7sm7340691wmi.21.2021.05.15.02.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 02:01:33 -0700 (PDT)
Subject: Re: [PATCH v6 10/26] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <859e5403-c176-56c9-988d-d7901c4c9313@amsat.org>
Date: Sat, 15 May 2021 11:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> As the only call-clobbered regs for TCI, these should
> receive the least priority.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

