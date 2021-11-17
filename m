Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C994546A8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 13:52:44 +0100 (CET)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKQd-0006sm-8l
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 07:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnKNh-0002Od-Rm
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:49:41 -0500
Received: from [2a00:1450:4864:20::435] (port=35596
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnKNg-0006SH-2k
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:49:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id i5so4502678wrb.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 04:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZWX66HVT8m1JJNatyGBRnaCzkpXGwSzhr9FabXnPkxE=;
 b=pBWhJPQDzQV6djyiG++yMEN82wE7XrI2JxZNqJ9i7cYmx4GXJqflGiFJBzY3az/7a0
 b0nzE7Y1qBr0EHeYTy2ruK/1sJhyf2s7d0m0nWtH19SdF2dC7prs/epVAksrzA3zZYqt
 rlVBvDxz5wCMT6q3ZXQmx2Z43Fg3UWj+6FqhP3E+svGoy4rQD8nvZK/DIAjJRa9Nh7b4
 FgzTW2MbWuMIhY/a6ru5wH+kRMgEs1ChZ/H1lpDFmDL+q3WvlEcCeTcytfNO71EX7o8r
 xGjJIpXqTe15+WX2pllwANGjeE54jsYr2wTogG+ekJqs+61G4K/nDE5AguDVM2Ite9nF
 iLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWX66HVT8m1JJNatyGBRnaCzkpXGwSzhr9FabXnPkxE=;
 b=YGe+P/GyRxT6BFk6ktNBHlIePmW1qJFhtkzRTB8nA7nt3syiqr3Z/LxkQUT2eR7F9w
 3W5LOXzsOXvb7/LKxMUJXVURaXmZG5ZfLuohPaICg7P5tJoc/l9rZoqPVd4x/4dArOe/
 WSHv62ZHScbfU1bZ87y5jd/vnS6rzHYovkI3rI6lhOpqSEfNbhc5jNIOL4Ur4VkUj9kZ
 oneRoCmh5P+LFFG2/orpaIgIDJhCYtFZtjZdjwExKc0MVkMUaZRd30doszQgKdIEFbE9
 DuDGrhFrg9dKkY15addSjAESqo3Za0JMcR8NM6vVPoNjLj+WMsYjgo8/5EJX19ZGmUWM
 uopg==
X-Gm-Message-State: AOAM532flZ/epARtg5wmorhgl41Fh5a5VopGOUFNz7vZ+ULc3x39ecW8
 s+GgHpKlT2cg7EVlaHYI1UPj5A==
X-Google-Smtp-Source: ABdhPJzMVzXAXQK5cIs6Jbdw3Sp3JbvDEKaLFmvGkaHnT0/9bdAMeBq5w+0ijKSjZuV9z3c9IW4UNQ==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr19361313wrs.219.1637153378581; 
 Wed, 17 Nov 2021 04:49:38 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id n32sm5758075wms.42.2021.11.17.04.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 04:49:38 -0800 (PST)
Subject: Re: [PATCH v4 3/9] linux-user/safe-syscall.inc.S: Move to common-user
To: Warner Losh <imp@bsdimp.com>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-4-richard.henderson@linaro.org>
 <CANCZdfoaw3X=ArOz2+tdZJ+gLRS7Wizzyc7MFHXrJyGH0nPVww@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13e5e214-ff3d-3f17-27c7-c4dac8f8dc91@linaro.org>
Date: Wed, 17 Nov 2021 13:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfoaw3X=ArOz2+tdZJ+gLRS7Wizzyc7MFHXrJyGH0nPVww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 10:03 PM, Warner Losh wrote:
> I had to add this:
> 
> diff --git a/meson.build b/meson.build
> index 0a88bff8d2..349e7a988f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2880,6 +2880,8 @@ foreach target : target_dirs
>       endif
>       if 'CONFIG_BSD_USER' in config_target
>         base_dir = 'bsd-user'
> +      target_inc += include_directories('bsd-user/host/' / config_host['ARCH'])
> +      target_inc += include_directories('common-user/host/' / config_host['ARCH'])

I get an error for adding bsd-user/host/ at this point, because bsd-user/host/arch does 
not yet exist.  But I can certainly add common-user/host/ now.


r~

