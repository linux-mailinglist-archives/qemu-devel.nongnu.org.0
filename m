Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBBA64739F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3JDW-0005Z1-JP; Thu, 08 Dec 2022 10:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3JDV-0005Yr-6U
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:53:45 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3JDT-0003UV-Gl
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:53:44 -0500
Received: by mail-oi1-x22d.google.com with SMTP id c129so1835630oia.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qYSmiiSSQE93pQGWiPvHz/XQUGB0aLttxAW6dw1m/9s=;
 b=Szjf3O3HcE410yzYrp+tRh9Bgv0R4xKWWW61xmax1CP1ejlA+cgI24rVY0n3S3iV5F
 M/SDIK3FvO0+8qhNpPldVwLPoukrs6KJOGvVYOIK9yYnoqPNi+Gu7rl7yeiRgpmYX+oE
 oVamMPV9XKWUVoNS5VAXfhl3v+kcTIKEmlzqQwANMG0ahijokfdhtHZ9hAnkEDANjTpx
 wNBmmO9BqEw+DuIT+OjCM/GgzGQMS9SUfuowJuhULS4ZO9jSqCgcPCoQ5f6sNR6TAjSN
 ruOEQVejHMnPF2gD40UY4EnORDI3zYfkokOjMc981gY/hLb6WcYlfrS/q0TzzgaSGXhg
 Ttpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYSmiiSSQE93pQGWiPvHz/XQUGB0aLttxAW6dw1m/9s=;
 b=nABaGDKeHT+/+KnAi5JM6HzH2DdcSOciCs//Ab0eBVjBsCLpAB2gJlbqlyXsDIW8+R
 BYXNyAiTjeA2lT1hT5ayShA541kgFzQ+XeVlsZ3AO87x5nvJkK3xwL+ydVq4w7LLExG5
 /jcyTEvFXgsG0EU3Zqmf+ebg55FF1BIyHkn+AGtWVLVEAjIy98WULKnc9mBeTlPk5JWw
 7obE3imZTvL1Qe8Ryp0XPlqODfBGY4eQ2+ef4Uh43gYkv6KcRFyo1ZaxdSbOSoMZYS3i
 nxc+8BrbczXOaSb257yaf/n31aRtN2DLUNB0O49fRFlRFWUqeKYV6qj3i+0t3QDzC2sZ
 +X/w==
X-Gm-Message-State: ANoB5pnkCIu/Y3MYsW/CS9SWdsqhooPHY+dvNHD89KZsFm2WAorqf0EX
 ogc689z3TJNMwIhM6kwvOqudEQ==
X-Google-Smtp-Source: AA0mqf7EvK7K8gbgqkt2pZ9bRf5qsE0dHfkpGUO5+aphF5UHOlM5F7nSdaIvIohjpDs6+DxYahkVKw==
X-Received: by 2002:a05:6808:682:b0:35b:6fee:8c65 with SMTP id
 k2-20020a056808068200b0035b6fee8c65mr983822oig.32.1670514821454; 
 Thu, 08 Dec 2022 07:53:41 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:30c7:8729:8e86:4d67?
 ([2806:102e:18:2efc:30c7:8729:8e86:4d67])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a9d7f0e000000b0066bb73cce68sm11526027otq.69.2022.12.08.07.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 07:53:40 -0800 (PST)
Message-ID: <2452f2b8-b0a6-f6db-5850-33c319eba004@linaro.org>
Date: Thu, 8 Dec 2022 09:53:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 0/4] target/cpu: System/User cleanups around
 hwaddr/vaddr
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221208153528.27238-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221208153528.27238-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 12/8/22 09:35, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (4):
>    cputlb: Restrict SavedIOTLB to system emulation
>    gdbstub: Use vaddr type for generic insert/remove_breakpoint() API
>    target/cpu: Restrict cpu_get_phys_page_debug() handlers to sysemu
>    target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY guard

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

