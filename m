Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5B6688E0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 02:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG8VS-00056n-3X; Thu, 12 Jan 2023 20:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pG8VP-00056Y-61
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 20:05:15 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pG8VJ-0005JF-VR
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 20:05:14 -0500
Received: by mail-pf1-x432.google.com with SMTP id s3so12562700pfd.12
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 17:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOpAvXT1mmjnHt86hplsN3aF+o+Amp/mQCG5UDy4/oo=;
 b=naLcl6GhnsrFXCTh7GWrbZr6gWk56QvhB7o/jzAxcLtRWrUHAsdrQxPw5/7yDvFQBW
 eHDcL/BO+zlxnUWt5eq7cM4/pTenuRtT+PyyCv0xQghLCD32Y3kcOdn4FnVjc3ObP78Q
 WJbcQ+MSiPW06uXQKJdnK2ljNFAlGzhXawkCGsDQadn1QKum03/BPclpJ3dpEjMbPRLF
 OqFSmCVx3gzT4wQvjbeo0z9chWJyxTZRnkcb44bwTH3vHHMGquWxyG5XDvevzmQvKn4S
 4x2qjIRDaNYh64z7acZWtJaa1lj4cj+khh+0bivpLuIMJb3dY4tfroVOtJE7GUtfGic7
 9YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOpAvXT1mmjnHt86hplsN3aF+o+Amp/mQCG5UDy4/oo=;
 b=3ajEuyGyjT/eOvdD11npX8sVv+HQHc8WhyfN+wCljHrK8niOoD8NBkqJgIpN9bO2Yi
 XKYOJ+lTbLVmXPJH0OmA9fjb53YMBqa1RYIlgxxQN41qYH4O95TzysZFofSdIUCkMnp4
 Pc6z/cBVhz2DGzR6lqGr9HeqvA1vpK0NrABQ56XnAZbVAVBh6YapUz9y/RPY+RNE64Ub
 BVkAfWMABIxni0IFJ95/HL5yYn41INWDv338cSE0lDKm7GTY9H/dqR4f6hCFgT7hygzQ
 OHXt2joJzC2GqVXStCVokaXsYtJ2hcwrvmrpFF84uFKpCwMWCek3DhS154ycBoaejsY/
 ljDQ==
X-Gm-Message-State: AFqh2kqwF+VCiuMHv97AtkFygQGRmgj2GAWNBmN5yot4nlBAOCu2KGrX
 n/dyGZPa2qjgWkAC39klFGyJ4Q==
X-Google-Smtp-Source: AMrXdXvKHXER+Hmzjk3cM1J/VYmVZaxDg2vqQHS/gnHHGGEp5PA5bTmMAtIdzXjttaHRZBr8e7NKWQ==
X-Received: by 2002:a62:7bd8:0:b0:580:963d:8064 with SMTP id
 w207-20020a627bd8000000b00580963d8064mr8095528pfc.20.1673571907698; 
 Thu, 12 Jan 2023 17:05:07 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x12-20020aa7940c000000b00588e0d5124asm8151575pfo.160.2023.01.12.17.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 17:05:07 -0800 (PST)
Message-ID: <988c2552-f378-f028-d11f-1261c0be1281@linaro.org>
Date: Thu, 12 Jan 2023 15:05:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/6] qemu/bswap: Use compiler __builtin_bswap()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ira Weiny <ira.weiny@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230111163147.71761-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 1/11/23 08:31, Philippe Mathieu-Daudé wrote:
> Implement Richard's suggestion to use __builtin_bswap().
> 
> Convert to __builtin_bswap() one patch per OS to simplify
> maintainers review.
> 
> Since v2:
> - Rebased adapting ./configure changes to meson
> 
> Since v1:
> - Remove the Haiku/BSD ifdef'ry (Peter)
> - Include the Haiku VM image from Alexander
> 
> Philippe Mathieu-Daudé (6):
>    qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
>    qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
>    qemu/bswap: Remove <byteswap.h> dependency
>    qemu/bswap: Use compiler __builtin_bswap() on Haiku
>    qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
>    qemu/bswap: Use compiler __builtin_bswap() on NetBSD

If this passes on all the odd OS's, great.
Failure on some oddball is what blocked my patch set years ago.


r~


