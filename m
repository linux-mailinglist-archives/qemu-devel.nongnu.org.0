Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422465AD24A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:23:59 +0200 (CEST)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVB8w-0007tM-8v
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAio-0003Zo-2f
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:56:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAim-00069W-DR
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:56:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so7666766wmk.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=orC9jEznR6UoY3MA+oF2OX6lGSUCjVKc1KhsDuX9pVw=;
 b=OpdSEfvtPJVBtZJrYgFXwppis4cWHbFLUFEjUrkyMET3Jv7aXRMr3aCBgv9hnCak9O
 pQoMR8WtaEQRgU2WHxS4fC0ZT0Rr0KYO8d1OAmrCZZndrT4arfNJGxVAe2UwDFvSYbxX
 3/kL7dNdOfJuGWhnpeZjEBgS/3V3ZUl1pF3CfmDU5nvKdnYR+WJDX99eVSW14jzAUeRh
 KeAFyLChXHGdl0L9SlbRISjAL3hvjXQQ8IOZ+lgYsTSKH47o1pqZ3uxCBhBkxBYBxpWq
 0Zk4c8oQbfTRlCs4CQ7dmpVaP+ulQuKRJtDCnLaAuw7Sxs7poodOpjFypBsqVHO6zNDJ
 34Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=orC9jEznR6UoY3MA+oF2OX6lGSUCjVKc1KhsDuX9pVw=;
 b=72CAOboo3Q1yAnPURquo11si7yU52QdsoLvhBBB5aqpOqPSob4kckiYuo6t+WxuLQK
 MqGBrjywM/95gwTFyTZPoflK6Jf11GYV6U22X0Jb2anRShQ8L0DBl0Yu13boPxya3PEG
 Vji84eATiZhl0G17dLhjJDYwDiZ6BrOuADRtzvYVoLkbtZaH8OESCg7OkQCcOvQvCu+q
 N5UVijTrQkUShRhlRre7F1wPrRLSQuxSa0y4Hei7ied6tlae76TCzq2GxsS4LFgMy0IJ
 4G1GgKVc0nGijoixVpu/VO9yTtBhPTwTG0zp7/bAgBLQ4UGcOI8gWd3NajxBOrjf9Xxy
 iKgQ==
X-Gm-Message-State: ACgBeo2miUM+9pulQVWkqPs+0CQ5OBP6Y+1F1SxYjRog+Nwyx1NOVFD8
 cX53HKdnL1NCnxNpGi/a1vMp0A==
X-Google-Smtp-Source: AA6agR5MYfOf8fE7yaaRol+IDthXQUu8K4ltNoDkmHA+7aGjkubNVsSHciac57s4wBasyYEbp6mQlA==
X-Received: by 2002:a05:600c:4ece:b0:3a6:28:bc59 with SMTP id
 g14-20020a05600c4ece00b003a60028bc59mr10442254wmq.154.1662379014833; 
 Mon, 05 Sep 2022 04:56:54 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 bu3-20020a056000078300b0022863395912sm5270188wrb.53.2022.09.05.04.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:56:54 -0700 (PDT)
Message-ID: <82770e13-5de5-c7b2-c1c0-00e907810992@linaro.org>
Date: Mon, 5 Sep 2022 12:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 18/20] disas/nanomips: Remove argument passing by ref
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-19-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-19-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> Replaced argument passing by reference with passing by address.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   disas/nanomips.cpp | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

