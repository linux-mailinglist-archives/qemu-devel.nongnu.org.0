Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9773020BB66
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 23:24:45 +0200 (CEST)
Received: from localhost ([::1]:38214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jovq0-0002sr-LL
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 17:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jovoo-0002SV-EI
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:23:30 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jovom-0008Up-Rd
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:23:30 -0400
Received: by mail-pf1-x441.google.com with SMTP id 207so4970027pfu.3
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7+3OY6QgjftmxXcfTjujCm0Gk7gfdKL3ohq7mPqxulE=;
 b=G9QUEBKINJ5oPQUnfKDWOT8GQ+SG61jT4wG+1ec2qBWsq4pk4oqToodat02zSgtQti
 j0kIFTv3Y2YWXhpTdoFQlUvQISglGaUa50EjdXHUZ2kryo+bEFjK+VI2xRlw8+sN8JUK
 sFHaHrpZpdu6IvVLJUfUZUxY7/aKBFa/IRDAVsfTOhbAp2w2vL+s/z61zaF05JlHQ82j
 QRE580ECTIR/45/miGVYOb28RpvRPu3cWChxrrgqtmSAxvvELn0vOSGR4su0ZTz6Chm0
 nESVTYQf/0Z0ZLBJoZWOMKTvdrvBKlr/XzXtsf9fAyAZSc+gggQ4Huml1JlX6q6w6iUN
 bPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+3OY6QgjftmxXcfTjujCm0Gk7gfdKL3ohq7mPqxulE=;
 b=A9qhU9IRshXzdt3wqGCIYsWBuPV9TovH31nnElnN4NSL38Xg/zeCnMnSa/VnFBQaUt
 TMk2y2pu8hHkINE/0e6SO+0JVRGRns7OZrGWP48R/RSfA2JPdDWaNf5p7s42NuBQkF/r
 1c+VNvn8mFZ01gaZ5CC7SyxR7m6h1UeWhLSZHCNWCWZiiXfgYLnRRtUi07f2FZExliWt
 AKHURgqvOyYl8lUOIoAQx4uPCUEKgukAsk7aSeZOvYZLFJQ6d09UBMeG0x9ekt0vHz6Q
 SL71rgBMwujWAhtU9iacuHW05r+PIWCdPDjwHYOepR68YJ3e4U2qM9Hc+SxPEEcKLTpB
 Bmiw==
X-Gm-Message-State: AOAM533Z4v81o0qzC+ZHqZWvcSr/hHdUapSKGZN2Ia0hulL3x0N+bT8o
 zgWJYL4S8xUEnD/PVhBwO+y3BA==
X-Google-Smtp-Source: ABdhPJyVaUsHP6cHWCCqkW7ZjXYZSkFUmI6WHwLRjVRKjKKoGAmDLOjHoQqC5luZ8I7HgRyof5VE2w==
X-Received: by 2002:a63:f814:: with SMTP id n20mr638484pgh.92.1593206607254;
 Fri, 26 Jun 2020 14:23:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d18sm11292394pjz.11.2020.06.26.14.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 14:23:26 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] linux-user/sparc64: Translate flushw opcode
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20200625091204.3186186-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <789f369b-a1ad-9416-4a1c-7806cd19a955@linaro.org>
Date: Fri, 26 Jun 2020 14:23:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625091204.3186186-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/20 2:12 AM, Laurent Vivier wrote:
> I send a modified version according to Richard's comments of the original
> series sent by Giuseppe Musacchio <thatlemon@gmail.com> (aka LemonBoy).
> 
> v2: split patch in two patches
>     update comment style
> 
> I didn't really test the new patches (except a build and "make check").
> But there is no code modification so I don't think I can introduce bugs in
> this process. Any "Tested-by:" is welcome.
> 
> LemonBoy (2):
>   target/sparc: Translate flushw opcode
>   linux-user/sparc64: Fix the handling of window spill trap
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

You might want to reset the Author to match the Signed-off-by.


r~

