Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B18418D3C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:08:40 +0200 (CEST)
Received: from localhost ([::1]:35652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUeCF-0003uh-Fv
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe5V-00060F-TV
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:01:41 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:33576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe5U-0004uA-DJ
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:01:41 -0400
Received: by mail-qt1-x832.google.com with SMTP id x9so15261099qtv.0
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ah5eHUQhFS3XXB3NbG39oMTcyn8Bpo3PueLeLDWzqFY=;
 b=sRzXrYV2rp0F4+VSCpgTZT/tprjtRgINzLO2j6fnk/Ys4hFgiywc0ydPdk8p+eY2Dk
 18ZiQ/sTQ08kEYSLuXXuiaDwVVZuijO7FXIQMllj2gsDQJZIpfd4csgiY09cO9q4Zjpi
 JHgFGG6e5LAz7pF1JHI3f4/uhTqZV14TPVbyq/Cl8MeXyGE7qc5yod7WfOf9WaRA7+qq
 V/XNUes+pgdFjv/I6foE6KpyguvHBHNcF1Zu5wVHpr2s72DhnkqACi1UJCqcsPkpaSoS
 aAjoGfrA5QYBW17/EQXqNllGOkVYnU0AKSOItNffYH6qNDd5ZAQLTwesSopjGdVsfWVs
 +dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ah5eHUQhFS3XXB3NbG39oMTcyn8Bpo3PueLeLDWzqFY=;
 b=eLxOe3xX/PmPzP9ezepWHYLlBJYRVp5PzN1jrt56v8JuMEJz3QI2X0QrJwfxWnfAPX
 u4kbp1AopEbbYqa5/0kDY2IoKVtbAg4ubhiGldzA+mG6v7OMpiM37ddkUts8E7y50KKs
 klU4Aip/9h6/e2QYGIT4HlY2MG6sDveaj8X4PSolGuU/F6IQY/ppT8XamtTc26E7WSjx
 UStxx/pecvagw3rWjCGRhmFU9ZnqtUF6wWUHufckDvGYErDETu26YpzTNRHGA3PNF9CT
 rrzqaqpQ5mnL9kTl8lPHyFyolhXVW+yVKD3pREnyvbpEHDMUoEvYq4Fg3TJxl8S88Ad3
 CCqw==
X-Gm-Message-State: AOAM533g8huCPVarM2tVRKMdZk6UdV419/jWzu4Nh9GJOeyaq7CXaR0l
 MxPq2C0yMYOPTLJ4X/FCqJPy4B43n1UU5g==
X-Google-Smtp-Source: ABdhPJwtmIZe98u4vXfJ4+2uHRN4mQEws7dPjhkzarsc1kil3xJ67c95ZEUsPzSU8sIVifT3F3ZGFg==
X-Received: by 2002:ac8:1e10:: with SMTP id n16mr16032974qtl.86.1632700898555; 
 Sun, 26 Sep 2021 17:01:38 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id c26sm8394833qka.33.2021.09.26.17.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 17:01:38 -0700 (PDT)
Subject: Re: [PATCH v8 10/40] accel/hax: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d95f89b3-06ca-6f74-04f1-7c6bcf46cf57@linaro.org>
Date: Sun, 26 Sep 2021 20:01:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Since there is no specific HAX handling for cpu_has_work() in
> cpu_thread_is_idle(), implement HAX has_work() handler as a
> simple 'return false' code.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/hax/hax-accel-ops.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

