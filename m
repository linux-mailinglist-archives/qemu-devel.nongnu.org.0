Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050DB62673A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:52:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjRK-0006Zk-Qs; Sat, 12 Nov 2022 00:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjRI-0006V3-Gg
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:52:24 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjRG-00063g-VS
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:52:24 -0500
Received: by mail-pf1-x435.google.com with SMTP id g62so6575261pfb.10
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pbkUag5pYVsvIB/7NJcShngqlJbeYhXJZQFRqWsYufQ=;
 b=czjCUQqsPJ1N32UjV72IDBUfk/dLldjy6JXPMnw5WKxvS49Cw+G8xC5TW5joWOteDx
 QuKgXv/SfMI5p1Tusb0V+Z8Wo32gaqhYdSMv2ArV7af0hup8ApIxzz7umEK1VBnjkdM9
 ozDzNWjmEY1+eYinV/2bkhfm0hfNQ8sYMGE4gEGV9qt8pQNLu7Pfac0teuJJF9hRZYch
 Y54dIbH62taJb2Bo3HGY3ALKHh7cTeisojsWlYlgU5lvA6mji5g9tuIizWD54OiRKi/v
 ldUw3m7Y+Nu/F99zGkpbWfwdwsOE0Q1vIDk4cy6/4Y3T+0zOFWCU1koDoI30rfo8LqEO
 2K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pbkUag5pYVsvIB/7NJcShngqlJbeYhXJZQFRqWsYufQ=;
 b=q78L4DSsgy4+1ebM7ob90L8MOv/ktl+wyCyZ8U7HzlnniOOErzt5MOV2Of35nfrAO+
 Q/zDelkbpb+z/fsb1+0RrP8nZzRos5zbBoeCa+48q0gO0Ng8fmWkduFt9Yh5oLmniHuV
 wqWhkdU4COLw6KFfkD8HmvYOJkFY0E8fDui2J9TY6ReGVpnIinHYXuaf5nzc37HpA4pJ
 XfukUH+rEuAt338PAaFDiMKi8tyYOMsrdpMMaF5UqDeQAJfEN7QYRl2bz0la9CF67kIY
 XqK0pxIx+irTsmvlBI3cqBUlL0k+9ZX2korxG2MYYDhWHWH3Wg5pz/p7PnAjAPdqCihB
 lLOg==
X-Gm-Message-State: ANoB5pkYQWDitOb//53eMEi0YOTBJHzdCLdxmhORDJy9EJ8mcJYfriLN
 Xp+FiyB7xVroafHvnQlbYki9f3/Fl6Fx5U1+
X-Google-Smtp-Source: AA0mqf6+Q7F/9QSWb0Gg9wyWXi89VYV3cE+9kV4QvfImKMiNRdnCewEHvFoyx5eI/UDIe0610KJoDw==
X-Received: by 2002:a62:b511:0:b0:56b:801b:5618 with SMTP id
 y17-20020a62b511000000b0056b801b5618mr5779951pfe.62.1668232341451; 
 Fri, 11 Nov 2022 21:52:21 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a17090ad59400b00217ce8a9178sm2457345pju.57.2022.11.11.21.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:52:20 -0800 (PST)
Message-ID: <78522f8c-8471-1f49-6a23-c9fb751bed08@linaro.org>
Date: Sat, 12 Nov 2022 15:52:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 16/20] include: add MEMTXATTRS_MACHINE helper
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/12/22 04:25, Alex Bennée wrote:
> We will need this shortly for machine specific transactions for the PC
> IOAPIC.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/exec/memattrs.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Fold into patch 1?  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

