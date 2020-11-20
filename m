Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5C2BABF6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 15:37:58 +0100 (CET)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg7Xx-0007PD-3M
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 09:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kg7X1-0006wF-55
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 09:36:59 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kg7Wz-0002av-Ho
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 09:36:58 -0500
Received: by mail-pf1-x444.google.com with SMTP id 10so8035931pfp.5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 06:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CGI6z2U+Fd2BPI/51vnR9fkGdPSLVUNcdj1c9UnUYEM=;
 b=t9yJpmaDgtDYO24PfqRmknAqtW7r32v6aCoNc5w221kPCAIE+Itw0Bxprwo8G0siii
 vDR6Tu5As0IoG2wWUvg/Z2WSmlFk9sOzcceRUUdy8jVBJrK7pPI2JpbWRTpnN2ZuDXw8
 UQhnqmGvxnSUirnRkgZyey+C26/QSJmIHD5KBdONXqSC6Y6kXCJuVS3UaJD80CzV3pG6
 hf9fB5M64DqX9JWixNMcxeOzCGKwNbkRafiQLJseVIk4vIWyGyReA0USlKyuFV8EySYa
 61zzeuIP4rmmcK1JDtiwKhitvAblUahcH3pvE8bDiR/CJHhpZnSPaAmMDsQO8y7H2XNR
 AYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CGI6z2U+Fd2BPI/51vnR9fkGdPSLVUNcdj1c9UnUYEM=;
 b=hiX1qsVXPOyelcD6ISyWwPru+ZheE1KuJHEcKqK1xINd/nFd9Kh8FqePuS3Cr5vqrf
 iFVty4cefliDmKpqNO9yVV5nshdkfZ6Yfu/EGd0ZW01RBRfjT/cglF2DagyMEp+W+PRq
 zi5AS4NcT7t1oLZSrtuEinZfMp56kQ18cANyZWKL71FAClUjN3nfruAPi2oMdz3q0qig
 lPNz3KUT2vYE7ry2aHc88vv8gP1C4kY5YnN+fbuGKLiL7l5QqAEYaZr0mO2tst9pJ8/W
 Jhbx6cpiG/yI55ptSU62omwwMHeqRR7PhljdThmzSV4M4dipWmuJwMaGl/UjXC2JqL0o
 dOVw==
X-Gm-Message-State: AOAM530Pbjfgmy6EaSlYtm1yYuTGxTEbwkZ5qqhvA1vvs1PzAMmKaM2F
 XqORBzY35SwVTg8OkhaIy4U7Mg==
X-Google-Smtp-Source: ABdhPJyJXXQOdMFg0WcRRXfTthWuMsSLqAARRlgQF6fm6D2CFePxN01/4zchbsf7TirUIh0FrnW5sw==
X-Received: by 2002:a17:90a:ea92:: with SMTP id
 h18mr10480940pjz.138.1605883015026; 
 Fri, 20 Nov 2020 06:36:55 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m204sm3847597pfd.118.2020.11.20.06.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 06:36:54 -0800 (PST)
Subject: Re: [PATCH v5 6/7] tcg: implement JIT for iOS and Apple Silicon
To: Alexander Graf <agraf@csgraf.de>, Joelle van Dyne <j@getutm.app>,
 qemu-devel@nongnu.org
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-7-j@getutm.app>
 <6fb788c8-ac2b-83b6-8977-24652a05f7c5@csgraf.de>
 <97e9dccf-3c97-fc70-7dbf-6246213098ae@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4001625-873c-5d96-a2b3-7b6f7bba2a6c@linaro.org>
Date: Fri, 20 Nov 2020 06:36:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97e9dccf-3c97-fc70-7dbf-6246213098ae@csgraf.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 6:15 AM, Alexander Graf wrote:
> MAP_JIT is definitely missing to make it work on macos.

As per the cover,

Based-on: 20201106032921.600200-1-richard.henderson@linaro.org
([PATCH v3 00/41] Mirror map JIT memory for TCG)

which contains

https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg01766.html

which sets MAP_JIT.


r~

