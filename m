Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AF42026C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:49:07 +0200 (CEST)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3jf-00043T-0o
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3dm-0007zS-W9
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:43:03 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3dh-0002s3-SY
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:43:02 -0400
Received: by mail-qk1-x72b.google.com with SMTP id i132so14165717qke.1
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qm5JAsyx0o1NDeWlRQcQtvlTyQZ8BatY9Ij4Ng68XDY=;
 b=J+y2kkyRZeBsCwAmXFBfjxR+XZccpOgIOkGdX7ZuPKfdVXjJ6dxMrW+DUPbKA2XcHA
 2jESTubC80BOe79jpcyFPcqJysI1BciTSNfdjme8RW0nVXVcOQzikbSHoaUJM1yzQIIO
 tcLQFOQUMy5Dm/JDwuoQa/fbYth2d+rPUnDCLxTYj/gCtajITXX+gJoAZj1HQSRUBG0s
 A3eUOygurqH1YHK/1tG6U32BKFMpybXGX/oe6fGgKxyw/p96BkrRhoN4+MkAPMaQKURE
 IvuQe2d1CBHLEmzcjzBevwu46XOwp0QLd4hfbJ9e7yz/cMC8E78LywkiSDxrpWu5A6Yt
 CDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qm5JAsyx0o1NDeWlRQcQtvlTyQZ8BatY9Ij4Ng68XDY=;
 b=TdAPvO/8CQhuGwyURwzRVoU2NpiRQQCpj29q+/XD9ByoEMgD3tueZhsW7lw9E1sWBc
 BjJYfL3uhpS8Nb6fdwXKriCh2jmZM3L+pQcHmHJgxkXEY7J9185BWdUXSbusNlngQ91p
 Hmfe1ZqZ2e2lUjuFrwdrwuTBpfUyfxVp/Op/IRt75+eVlPIY+Z9Plue+/d1c0HbQJTVS
 JYPbqJTLIpylsW4m8CZgrHpFAm/a5mPp+Kf3sBgKivBUr3jzegsakaAl/zco9wp9g4r9
 Wy/UoZcl0ez2BHFGlLgzDt0OkbXCQn7ivHgCpwiwC987QHpFp0DcXwMP+vIfJ3uRkKQB
 Yzgw==
X-Gm-Message-State: AOAM530LodvldXnBtSbFaiTo8YkzDl+DLEN/UME8Uz3h+XcQtkL1g+rL
 bRTVm5iHFdB2px//9WbLBpvCcw==
X-Google-Smtp-Source: ABdhPJyCXwKPv7gpdc3GtSfWn5MGwUCQ7zy6y5NIj5Whfy6DO2WSSt25/TWjAvFaGGbr/LiJ2Kfttw==
X-Received: by 2002:a37:68c8:: with SMTP id d191mr6208621qkc.446.1633275776673; 
 Sun, 03 Oct 2021 08:42:56 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id 75sm6260367qkh.121.2021.10.03.08.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:42:56 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/arm: Use the constant variant of
 store_cpu_field() when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003143901.3681356-1-f4bug@amsat.org>
 <20211003143901.3681356-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c5c2991-e209-8321-9d98-c57027ade894@linaro.org>
Date: Sun, 3 Oct 2021 11:40:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003143901.3681356-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> When using a constant variable, we can replace the store_cpu_field()
> call by store_cpu_field_constant() which avoid using TCG temporaries.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

