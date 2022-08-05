Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B724958ACE9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:06:00 +0200 (CEST)
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJytj-0005N6-Qz
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJyr7-0003Zg-IZ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:03:17 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJyr5-0004k5-Ry
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:03:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id 13so1448595plo.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ElcBoqTV+QVi0HAEHQOdz70IL/1US3lSEGJeHuCV3cg=;
 b=YZRMBVsRfSSy127KScDoXS2piXJxMYTEa4bUugLLHGbDHrWtfdx8iQ5NSErLdNb3k2
 110T9AUMZsRHUadr9zU1/Q6c+biBQYHJolavf1hUImvKoet1p4NM3K0OWBEVA8BqMoFi
 q9KNfVv336TzN4RxjjK5J5OuMke76A5/s4G29dYep5XBtOzrRK3sMC5xbBbWtvqo7/TE
 tTPN/uFE33MG00lhOkV6dwk9tFNI/tM63alQrmOKuAoDRQHGGJUr2V1Z33S2VUAvkCu4
 azne1F7Wtm+L2+S/RgzdJaqJ0+npfNyO5D/CCzwDV+guV11e2mwGhg4Y5RA/Z+1YHfuG
 8hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ElcBoqTV+QVi0HAEHQOdz70IL/1US3lSEGJeHuCV3cg=;
 b=2gdh5zE317OmJTpZTwbHtCvxD8IwltvouIdKSG/ZFXP9vZowJAqCCsYmw5bh6I74ZF
 nvgaFar8yuMOE/qFdGxMxHxcuIWN8Jvwf/tIBu3jeuiyr2jJoSb95kvxHn1FpEuxB3xh
 rGsu4CbQNDVYee77Em9oY0mYWq1NMZrEnNFI14CiIwYc+TYHS2NI5jZaUc7pNoBz9edr
 erDumXAz68BfiSk/cAfm0wmonTU0YIY52RvVtcGedJ55zzNEB8wL/CRl60n4+9opW7Ku
 twI76V9l5QYSAW0R0beGOxwkfjAmyPHPHiFtc/4G0J3vgzXMJMe7Dukn5xIw0b8kmq3l
 CR1g==
X-Gm-Message-State: ACgBeo0KDS3v8lJ0C/meBHEDMBbk+cj1EDJrPHWTIHRium02npaREslc
 9HEfb0TtCeNEIvg7MjMW03CFFQ==
X-Google-Smtp-Source: AA6agR7zYkIhTDj+JsWSNhs/fRKcmDFxVc2xwrdx/vOYkc5HChtXFZpvxDBVeHX67B61hwsJhM7uvQ==
X-Received: by 2002:a17:90b:4c52:b0:1f6:3a26:9f08 with SMTP id
 np18-20020a17090b4c5200b001f63a269f08mr1365221pjb.206.1659711794412; 
 Fri, 05 Aug 2022 08:03:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6218cd000000b0052a198c2046sm3034545pfy.203.2022.08.05.08.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:03:13 -0700 (PDT)
Message-ID: <69b9d443-1376-f9c9-96fc-8ab773a995d6@linaro.org>
Date: Fri, 5 Aug 2022 08:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 v2 1/5] target/loongarch: Fix GDB get the wrong pc
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220805033523.1416837-1-gaosong@loongson.cn>
 <20220805033523.1416837-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805033523.1416837-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 8/4/22 20:35, Song Gao wrote:
> GDB LoongArch add a register orig_a0, see the base64.xml [1].
> We should add the orig_a0 to match the upstream GDB.
> 
> [1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/base64.xml
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   gdb-xml/loongarch-base64.xml | 1 +
>   target/loongarch/cpu.c       | 2 +-
>   target/loongarch/gdbstub.c   | 7 +++++--
>   3 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

