Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97B2B9F08
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 01:11:26 +0100 (CET)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfu1N-0000t1-LO
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 19:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kftzN-0008SA-2y
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:09:22 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kftzL-0007vh-Im
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:09:20 -0500
Received: by mail-pl1-x644.google.com with SMTP id u2so3882037pls.10
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x5sMLoCBk5hsmpRc5SpPCZ5ZOD1n3jOGNSkPWLD7Fdw=;
 b=cVN18ABV8US5sWD83XnVfF021vvz2XY/z0D4GFTIUT61Qhz+pTGPyvEBANysKXnKc5
 xyn3A8RmECB4f1PONl+vTY+ecrosYK5ySP7rdypQLUEn6gAGgezVCoqwgeT2gqgnjNHN
 2T+KD1OcapChnUDHTiizgHVe4bkZoQaDpYZ7sqW1a3l2Bx1/BeUcswH3+At4J/sFpCta
 XywhYTy1Byj/HncjqYtKY5m4703rFoSWSQUUkCdlMuG72Nv/eTYa/YthIFhfFgS6YVvw
 +I6oQFhMWlTUy24ySOaDKcdQk92QFAVwy+yU39QpJ6JylsGL7NhI3Wr8VmVAikTOGoYR
 7avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5sMLoCBk5hsmpRc5SpPCZ5ZOD1n3jOGNSkPWLD7Fdw=;
 b=VisVhoYlVcZozhDwgUpHMeIjMmhjF84hdg14TahUpZsTi8/L5UK52m/ViaH/VEAU8w
 1Lvfap+Cd8vsoWtzIiEObAkHzuEjVmXABqiBlr5+4dVmVU1iDkSdWPXS6QeuxOlDBOT+
 OfIpYq/smp3pR8lcB2gubEfUif+6BNfidBU7t/IEwRC69s5iBV9lrvjxMQ3JuQVsf4mq
 +t1tWxhex3ENx/Y9a3L63gNmbRp3IeFb1c0m4Bp8fmso7nqhitCMp+vlSrGiGxceIP7M
 +DCvIczVz3zThm0DddgeW+mZ8PRMm7Yo/0iNny7VJVm8hwIBG3Ih7566nEXmKlXrGViA
 fYIQ==
X-Gm-Message-State: AOAM531Q4SB5vPgh+Ozk9p9TrxM7J44sEWh43Iqq7HJoSkbgTV8k8241
 GkZelWmyta+MH6eKzdSRXw0hxw==
X-Google-Smtp-Source: ABdhPJzS6u1lSL7bUi8uMvIKVj2ye+9Amf7ngYilTew9UFK7QcUuSpn55hRALCkw0REHMXwIaKIfhw==
X-Received: by 2002:a17:902:7c08:b029:d9:8cb:5775 with SMTP id
 x8-20020a1709027c08b02900d908cb5775mr10862519pll.56.1605830957871; 
 Thu, 19 Nov 2020 16:09:17 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h16sm1107829pfo.185.2020.11.19.16.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 16:09:17 -0800 (PST)
Subject: Re: [PATCH 2/6] configure / meson: Move check for pty.h to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-3-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11bfaa5d-2cfb-f688-3a51-17f4cfe51d85@linaro.org>
Date: Thu, 19 Nov 2020 16:09:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:10 AM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure   | 9 ---------
>  meson.build | 1 +
>  2 files changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

