Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB62321E7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 17:49:02 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0oKD-0004Ds-QR
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 11:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0oIx-0003cZ-6h
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 11:47:43 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0oIt-00070u-QP
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 11:47:42 -0400
Received: by mail-pf1-x441.google.com with SMTP id 74so4872589pfx.13
 for <qemu-devel@nongnu.org>; Wed, 29 Jul 2020 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FP1w+oKLTunBoG4vmPh2L7ICFoDbhylZltDeU1jfw1A=;
 b=KZa0M2m/qcJXvdvnW86SxwEdVeMZGn2dzC8kvQko9fRnZAAZiJ0jBxDvEdXqBFibpN
 j2K/f8aNXr66Hwydoiy2rzra0V+W5lUO4lUUUN35s3uBqF1XiAP24HtPL7xIKpJ/JYiz
 CwKlQUwPlDBYlLgU31Y1htAHSAf/11YGNd6lcJu80caEWK+XnJ6gaQGsmGzTnMg+Q/gh
 +T9N3NSeLd2jlpZKFJ4lzCoRxISgRTASUCggW/L/9+iBXKS4nPDkrLN5BUsb2GrmhXPo
 QxHKWPbzcvxuKz70tskDzBUudyeTbEQeB1ruL4/mbviwu7O8wO6UEfnxDTxO+00u6qEr
 zS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FP1w+oKLTunBoG4vmPh2L7ICFoDbhylZltDeU1jfw1A=;
 b=iF/qTw/FP54u5EHXoCMTjAdAwdOWMB4u1bD4Xerg7n0sui5V/dpScR1SnpunKbds1u
 f151rxUdPIDkVfGtoQsAf5K0co4BN1ZLY1ARKjQ5NptKNSuvsZrC5+FLIKdhjC7dildd
 NnWOFY9CzWQUEuiqRmCicTW/jS7YI1niS2eBappHVjv6ZG4idYJpqIsJPcfOKtA02nNl
 MAIt/UTio2d+hw3O4zS2DEwJ/UFTe3GL59fFH47apbBgkIsC/18KxnienYitFfAv87DH
 6gKaC8MO4qUuN2u3JvK9EaSWnBwzMd5RpNGPlq3WMZrqEWeegZ8o5v4dVp62kUwapCs1
 8KZw==
X-Gm-Message-State: AOAM533g6IkkPY0ebW3Q6//gujbSQcmXpFudkNzvLN4JS7YJlE8QY9y3
 CxnYoQmmtmaP8y6qd5LBbdNKjgxkyYg=
X-Google-Smtp-Source: ABdhPJyVR7yvGeh9FcnBu/Hu2sqcAQ/ZhYX8/rNbzMn6ZNgkZE+F4BNN3PHpdvJT7cx948yuUts+8g==
X-Received: by 2002:a65:6384:: with SMTP id h4mr29677154pgv.196.1596037656632; 
 Wed, 29 Jul 2020 08:47:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d24sm2540478pjx.36.2020.07.29.08.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 08:47:29 -0700 (PDT)
Subject: Re: [PATCH] linux-user: Correctly start brk after executable
To: Timothy E Baldwin <T.E.Baldwin99@members.leeds.ac.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20200728224615.326675-1-T.E.Baldwin99@members.leeds.ac.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3bb350d-030e-47dd-8c3f-223ddc40914f@linaro.org>
Date: Wed, 29 Jul 2020 08:47:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728224615.326675-1-T.E.Baldwin99@members.leeds.ac.uk>
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

On 7/28/20 3:46 PM, Timothy E Baldwin wrote:
> info->brk was erroneously set to the end of highest addressed
> writable segment which could result it in overlapping the executable.
> 
> As per load_elf_binary in fs/binfmt_elf.c in Linux, it should be
> set to end of highest addressed segment.
> 
> Signed-off-by: Timothy E Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
> ---
>  linux-user/elfload.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

