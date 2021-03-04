Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5F32DAD3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:06:44 +0100 (CET)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuF9-0006qW-Lz
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuB7-00045U-S5
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:02:34 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuB5-0007oq-Gv
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:02:33 -0500
Received: by mail-pf1-x433.google.com with SMTP id w18so19729092pfu.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7PJTgz9t17TaYlQf3nauQo2m2J4YiG9DAFmOW6Rdsss=;
 b=WGbj2fbnN/y+CDtOTPhBKpNmwEdRJwNEqGtDThilBo7r/uyZK56Wfo83oQN3QiDsbm
 Dh+NYss99TtBdFdlg6H0uvB5kY4oXBaPTiFDmiArLQtCt4gCg8kV3aG8Yje+xu0XzEoi
 1eYdR6kaTayvKvmOKLNT430IOwkHankkTQznoIVxFo+XoM3hTC/nHhDUc2RbrgXEwK7D
 1zVgeIQgQM13Lw+/MFch8r2PYf+E6oGgnNeBXqGzKez/Z7Q+E4ei16isBYb2d7dynaRx
 nFkLsxh1QWwp1uQqdp+fPaPZof8FeRvND/JFhOWYwgSoU74DRioSwCW/qFnQEgxDE6co
 gmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7PJTgz9t17TaYlQf3nauQo2m2J4YiG9DAFmOW6Rdsss=;
 b=gZTsd1tzf3TSLjQibt5XWsMCVTmLpbTjggrtHviaIUoWR98Zf7WoRbzc3vHvQXtk3U
 JtnGwnZJZKQJvNPQ31zXlzPDF1n3U1Lw+nrnY/2Q42mm975IW4ILks/YZleU5gxMlYkc
 fHYY1Dxv0dEemTFvBGp4enTy5F75/l1rZMZsKeTDhZZjqXnIOaksliiGzl/s+eomSAqY
 wxdRvYMjc8R21cAh51zGGLuHe/QniiWbJcE1MJ65Ji6uK+9W6b4oj+E9pV0MdP88wXl/
 QlSqPPODPTNV1Mgi3Su1dsSKo9UFKb0gkCDnr9lLt7OBfHzfG22DldOStwbYJJ9zL0m+
 0uNg==
X-Gm-Message-State: AOAM532JHXgNdydPmjEPWAmcrMYUoFPaLMRjy9H1m4o0ZezL3fxRC6LW
 usqwOYYgSXD6uomJ/vzsHHEIqFXcc6Micg==
X-Google-Smtp-Source: ABdhPJzZrFmOCywvSfOwvaUxac5dDktZ4KDoZZIijCbHM+XFW4jSSaCZnjW0avclWtGduf2J5fUR/A==
X-Received: by 2002:a63:c343:: with SMTP id e3mr5120456pgd.8.1614888149469;
 Thu, 04 Mar 2021 12:02:29 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id i7sm107543pjs.1.2021.03.04.12.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:02:28 -0800 (PST)
Subject: Re: [PATCH 20/44] hw/misc/sse-cpu-pwrctrl: Implement SSE-300
 CPU<N>_PWRCTRL register block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c882fadd-1001-0728-5e82-1489ca450ef3@linaro.org>
Date: Thu, 4 Mar 2021 12:02:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300 has a new register block CPU<N>_PWRCTRL.  There is one
> instance of this per CPU in the system (so just one for the SSE-300),
> and as well as the usual CIDR/PIDR ID registers it has just one
> register, CPUPWRCFG.  This register allows the guest to configure
> behaviour of the system in power-down and deep-sleep states.  Since
> QEMU does not model those, we make the register a dummy
> reads-as-written implementation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

