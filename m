Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053483F3BBA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 19:28:29 +0200 (CEST)
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHUnD-0006Ci-TO
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 13:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mHUmI-0005XN-N7
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 13:27:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mHUmH-0002oV-5S
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 13:27:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso11105723wmg.4
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 10:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AZkeJtvwpwuNqgWZdnVQ60HhXACzmkXEOYg09K7kF/o=;
 b=Mb0BhYzn9rafarvGVk0jECww7U7zloUXbCF+UJ3iQ83Ge3SUflkUyBZqJAU3bT6Rmc
 VhDuTBSJeht61dDhMps2USmt9KqnAent1u9uXI4hurgXUuC8MVERcLv0dYD2ndYCEaRW
 I0QE3yNIi9XmG+fLkhhe1iuY0+mvVwbsvcXPAvyvkYZrx+C6DHZVoZc0c4xKq4d2/O36
 LXXhbVaVrRHuImv+bwAvbST3T4xDg+aUm09euEDt7XWZMx/qxxYCm5qKrdLhq60p82+U
 uDELxFj5cbsyul8fBv0Hnmsl9jM1R4gSNLtDQMUxLi1E/tLvG1ayH2D4MIdZlHCC6sOk
 ezxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AZkeJtvwpwuNqgWZdnVQ60HhXACzmkXEOYg09K7kF/o=;
 b=a3bTrDWSSINmpnKWtpmOTBCwOJSErdar9fxLFvfphSOay8RktTXgZuNu2cbdAQZNDw
 VqcidW3GOnpzOU4Y7n5mNLUvLgn3MUD/UEpT3uhrh8MdemPieQyLX+E/2dQqxPTSFkf6
 e/PYAV53ytETft8Nx6fWJgU2vymENzRkAGaDOCpoLkGUj+RfV4aeYsb7DkrPPZDHBVH8
 TN361w4BiEOZGLJC+CwNaJ/NEuL6Bkr8W0U/RQw8h1LdPZgxBUeiITkoHJ3LLuYIyT65
 YKBrf8fgFXGAanlUJBDAHTKFvKaoViG6sUmn60JbOTC1t3O7BIodw29u4z6/3m4RuS8k
 22Ag==
X-Gm-Message-State: AOAM531npiftBGk7sHWz1N1kte+5+vFhvkoJosvUyoQ26GCWUcU2zFws
 Xmk4iuT2z8uIaRp8fUspnKc=
X-Google-Smtp-Source: ABdhPJwQia6OKcc1Gw96zy/FkZ+Evyx7ck/iVO7rOljLFfPFepNUwze6hAzs+Uj31NgWOjGrOXPVaQ==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr8970086wmj.88.1629566847467; 
 Sat, 21 Aug 2021 10:27:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b4sm9039588wro.97.2021.08.21.10.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 10:27:26 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] target/mips: Replace TARGET_WORDS_BIGENDIAN by
 cpu_is_bigendian()
To: qemu-devel@nongnu.org
References: <20210818215517.2560994-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bf0956bc-26be-f3e6-0067-4f39824ff2e1@amsat.org>
Date: Sat, 21 Aug 2021 19:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818215517.2560994-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.49,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:55 PM, Philippe Mathieu-Daudé wrote:
> MIPS CPU store its endianess in the CP0 Config0 register.
> Use that runtime information instead of #ifdef'ry checking
> TARGET_WORDS_BIGENDIAN by introducing the cpu_is_bigendian()
> helper.
> 
> Philippe Mathieu-Daudé (5):
>   target/mips: Call cpu_is_bigendian & inline GET_OFFSET in ld/st
>     helpers
>   target/mips: Replace GET_LMASK() macro by get_lmask(32) function
>   target/mips: Replace GET_LMASK64() macro by get_lmask(64) function
>   target/mips: Store CP0_Config0 in DisasContext
>   target/mips: Replace TARGET_WORDS_BIGENDIAN by cpu_is_bigendian()

Thanks, applied to mips-next.


