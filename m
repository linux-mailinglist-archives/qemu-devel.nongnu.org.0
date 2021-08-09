Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98863E4D02
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:22:55 +0200 (CEST)
Received: from localhost ([::1]:35312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDArO-0004ut-FC
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDAqJ-0003jN-Ha
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:21:47 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDAqI-0002Ol-3v
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:21:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id j1so29573072pjv.3
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hrt3pVxYW7QDq8oMrl9cVqVRtag3dfi69pku8MvgSAk=;
 b=CDeDK/xYumDnrvUenT6Y9XwqRkST0C9bSeT0ChlzUADhK8otIrQ4KvpkEZB3BaFw/D
 dE7LWamNrbUAUobq+l4exP4yNWTANULDHTHD0HRgUIs4/I/ERCWQ9+/uJ3/eD5ze0957
 fGgGkLxDahUuR+cmqbn9e26FmM7m/dy1jJcIouavN9AZCLK7aPxNEa2hJxh88dv7KqTn
 aLIeFR1Gprha4aKLwMDlExXwGEihKjwvdyXKN8zvkWGhxogPRKYwOC9tIm5qcCwO1it+
 UpogRdz91WMEnC4toS3Gfj68Oiu9Y7GTCA8nV6U9aIYIYomnnIJ8Rj/9qg1IH3B5/edc
 LNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hrt3pVxYW7QDq8oMrl9cVqVRtag3dfi69pku8MvgSAk=;
 b=qv7ex/f6bsC6XXYwoQPbl+sqHNCO12WaYzn56GqIrdW9wymWJIGboxH+rPmcl0mdmH
 BYULbeLQSHwZ52qzvKsOXa/0/FsQU/6Zp+SE2VSIAM8PiVLDmT+jQUf6bI/iasem+z3b
 V32uetDJ+OYtwmnAy/lGZrmuaJ/fDwLMJOrgZr8oTSlnUGHtf2FkcjMPvgI6ZfOyk4TL
 j7q1Q2nE4hKhq/nr+ZRdRkHz5xnNNHJ+xr9H79DyBH3gu+IftsuvtnhFsPhy6gxhesB+
 2bkHkU4acj32CvjWiPJaJ07lhgEoyG9i+LeNL18sAj7xk8b7CmHDgb86ZUk7jhnJ8jFa
 8d1Q==
X-Gm-Message-State: AOAM530sol8EDe7ijLsyNt6O7omcz2o/fFSlDTCRAxhIHI5p428HbVPW
 tjw2x6qze0y0vbtgrKZw/j/Z2g==
X-Google-Smtp-Source: ABdhPJyxqtVgi8j1Px5MojvwYIzuhDJ2ElOSZ18L0b+uSGVhHOCpNRmbsZ7gRyWD/k2QYbwj0JfCyg==
X-Received: by 2002:a65:5b04:: with SMTP id y4mr886024pgq.195.1628536904689;
 Mon, 09 Aug 2021 12:21:44 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id o20sm24363592pgv.80.2021.08.09.12.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 12:21:44 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 1/2] target/mips/tx79: Use tcg_constant_tl()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210808160843.84957-1-f4bug@amsat.org>
 <20210808160843.84957-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <529d393a-a46b-3b3b-5cf1-b6bee07cf91d@linaro.org>
Date: Mon, 9 Aug 2021 09:21:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808160843.84957-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/21 6:08 AM, Philippe Mathieu-Daudé wrote:
> Replace uses of tcg_const_tl() with the allocate and free close together.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/tx79_translate.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

