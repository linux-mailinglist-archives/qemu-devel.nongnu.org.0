Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E942022D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:25:37 +0200 (CEST)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3Mu-0000EV-4q
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Jv-0006qv-RT
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:22:31 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:41529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Jt-0004e0-TN
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:22:31 -0400
Received: by mail-qt1-x82e.google.com with SMTP id t2so13721185qtx.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yV69+B10xQIGNZjRP7OM8a1xz761Rf1yyiCIuFcFvZY=;
 b=nRee04KY1BKP15Q0mQwpoSHJSAqvnc6OkoPWJQOx5AgB2XnNmOg8HN+DgeSFJInpXK
 Vg7vOtVwCHB6gamcvy1T0HC5Co/PIx+zbCR99wvtAChMTsYcbu5zno8/WbA9/uOJ/9Ji
 xyhnE9uLDO6NoAlqsjhp3fd8Zl2LBu9WcJbekp+5NkFCnfwRIiMxVjLtYkAX4eh8UGnS
 +N46ZRo1yNMHsBF8jfnnxgfGvP82jtQ3IzDQnvbjKFN0AnRJsvQPFzxzBIqGV3Z3+5pe
 5tsgPZ74yZx1sVUhOmX3ODF6NqyYtrmxhdXwSHRynieGidpPcvCQ9j97LZ5kup0NugDu
 Np9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yV69+B10xQIGNZjRP7OM8a1xz761Rf1yyiCIuFcFvZY=;
 b=FOLEYTOX44N17GLaPZZK0zGfurdrHwpmXCC9i1CFbZ7foIq1TwjYAwgbwqptxnemmT
 sz1wh0dlzg5Nf+QWJtdkxUOtiJCi1UYl9ANt+dlvE2i5Nj7ciatGc0NgtN7ToP/s2FM1
 9mESW3NgL4JhB/xBNuOf4ak/OrWCg+InQEnh5zRf+qBpn7CfaMhg4nWykuAA/nLZcGaW
 wn6ZmvBYzBKqZYKaz0I367ISUQ1XQ8hb8FeCdkF+jhtbfRM3JYOkkvUTDEGaOV2DuFY0
 /fTap4eB8HJq6Ztvv2D7t3cwOTHYQwozFu8vFKiG5pw27mO1TYkF2vAd2+dB/5MMzIPj
 GDsA==
X-Gm-Message-State: AOAM5304BxCOMy6Lp9cH+m1zIVdqUYmw8rvk9B0lEHvTrtxEs7JSPStw
 YqYJ2quPuCxpYV9sxvsT72Np8Q==
X-Google-Smtp-Source: ABdhPJzTUwX3Zob867IEP3BvkIGw4xNP874mN/jHGbkharhg8gKYKm8kM9mjX1kkgJXNjK0ZmrWADw==
X-Received: by 2002:a05:622a:188e:: with SMTP id
 v14mr9068781qtc.62.1633274549011; 
 Sun, 03 Oct 2021 08:22:29 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id az10sm6540461qkb.70.2021.10.03.08.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:22:28 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/ppc: Use tcg_constant_i64() in gen_brh()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003141711.3673181-1-f4bug@amsat.org>
 <20211003141711.3673181-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2691b37b-ff39-4321-fd3c-d3e9fd185a6a@linaro.org>
Date: Sun, 3 Oct 2021 11:22:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003141711.3673181-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:17 AM, Philippe Mathieu-Daudé wrote:
> The mask of the Byte-Reverse Halfword opcode is a read-only
> constant. We can avoid using a TCG temporary by moving the
> mask to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/translate.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

