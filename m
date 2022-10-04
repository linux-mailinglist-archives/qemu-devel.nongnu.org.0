Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90815F49AA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 21:22:23 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofnUk-0001u3-Pb
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 15:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnOM-0005AX-UN
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:15:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnOL-0006nG-0M
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:15:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id 70so13679103pjo.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VGacsHnKKSdgAaTUPkeV4rc52evqQPVpsuPAIqBYkEM=;
 b=Nzaxdh/3Nyav5T4+FclKne6onLKqAp/VdGzDeGlLgTl9wJhBg/lYQOM97AVhOOIrcY
 ya8Gz+vxWWpmMH8u1KUP3ZuRHd5R67EUI0h75m1nPCfBNpsQ9lyg6EmVAWCJZSR4FiiQ
 VYVsbExG3+UWCK0o4hGpOCa4Hel7dHft36sXnVJcoB0u+j+fSomvw4ubJGN8YvLv/gAM
 3TEsISzVO1L2hPsGovKFhipBu+8xekDV+yFvLfNHkV1Av6LsyDvPJEc26U+6u524qnim
 PLX27rioyds8ZUW1eBVj04y/4ZH1rh/WHmyodomrRBNhZv/G2fD2TJxcrPz8euoZlFzI
 rImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VGacsHnKKSdgAaTUPkeV4rc52evqQPVpsuPAIqBYkEM=;
 b=VL1tejQcBiMBC1loHvHo3wYbM0FFlnH0Znq7iwwswWpj8qJrkaXr9l5CtSpaZ9+rGK
 xJmDfocWi98n3MyX7W72Cqdeguiu0JnMev/MxmnHjPqGFOMBbfNBTtyU2eQVxScw2W1L
 rTmr3+9jRtJph7RfneY0nwTi6X8E2QwQc9UyOXZ0Ian8wE5sIlutGjWJSbPwAhs0SKXk
 YiTfcLe63FMR3EQeQ86pRxuAacdWM1ngXXSqFBtkhcird5AATCDnleHxyAF4193MMYzZ
 alGfRb+M7ZMs3ehzWdiSvCsNfQ7UJWBFHuFBLMVsfwKjBXUcpcQtKcXqJeDCJd70buxH
 lDwA==
X-Gm-Message-State: ACrzQf33AleFblqyoO3rnw4Is0eZz7MWqv1rv3BCn9vR7BbM0eqAnL3Q
 gJoZ3oARnzd9bBu7imlC+3RXnw==
X-Google-Smtp-Source: AMsMyM4WpE4XF+paW6t9TzojA2FXyXvQQcVEtKhI9c+cnl9MIbthuflu1u0sPXjjti0MZqehcgIh3A==
X-Received: by 2002:a17:902:b693:b0:178:5fa6:4b3 with SMTP id
 c19-20020a170902b69300b001785fa604b3mr28379479pls.63.1664910943331; 
 Tue, 04 Oct 2022 12:15:43 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:526e:3326:a84e:e5e3?
 ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 b128-20020a62cf86000000b00561c284a5besm1832359pfg.117.2022.10.04.12.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 12:15:42 -0700 (PDT)
Message-ID: <8e393841-bdc9-bf13-d9a5-04fc512bf89d@linaro.org>
Date: Tue, 4 Oct 2022 12:15:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: qemu-devel@nongnu.org, balaton@eik.bme.hu
References: <20220901101509.145758-1-richard.henderson@linaro.org>
 <8735dbcha2.wl-ysato@users.sourceforge.jp>
 <47c53a72-919e-00c6-5cfe-1eb12a2b3593@linaro.org>
 <87y1tw1698.wl-ysato@users.sourceforge.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1tw1698.wl-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 22:56, Yoshinori Sato wrote:
> On Mon, 03 Oct 2022 02:23:51 +0900,
> Richard Henderson wrote:
>>
>> Ping, or should I create a PR myself?
>>
>> r~
> 
> Sorry.
> I can't work this week, so please submit a PR.

Ok, I will fold this into the tcg-next PR that I am preparing now.


r~

