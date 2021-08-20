Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DFD3F2948
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:36:16 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0wh-0002E2-TB
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0vM-0001QH-Mh
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:34:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0vK-0008GE-Tr
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:34:52 -0400
Received: by mail-ej1-x62f.google.com with SMTP id gr13so18943890ejb.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=81vRd7z3FXbh6DTFbrouJbyTo6bDKK1+aEaGwJIZHgY=;
 b=o/AA5J2qt+2dblrhCEdemQ4xLkWYUrHs7ynw4XSDWqs4aA0X6WUZP7Bq7Rs1McXOJV
 KLiBbRVOEUS07sRxtOn7KJbdPVLFtwt8sdLZLGbQkELUb8lvBr1TQsiIvq+LlBJUsgIA
 5REbJs9YH4ld3tIlwY4TSByPN47cB3gS/lzQCwSZ6YamEN4K2Y9KNRJfXPht6zxe1qWE
 FQgUO16kXxSrzOIy4VcyXjrN148MkUEsypAHfxQZXjPvvAuWMbd+1zfvGGQUgOQJm9Gl
 wLgPL869hV6F7J9dAQb139OhxTTJ549vx66EEF90aai0RLvZ8kA4b+LSIHeHtvNPje1b
 RSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81vRd7z3FXbh6DTFbrouJbyTo6bDKK1+aEaGwJIZHgY=;
 b=f48QoU3dq8uTQ2aSm5YuzATQvO+3xTxrD3SxIA+YVR+7xa5MRuPHXeRcP//5bkgkAP
 plcYfchBPX2ovPjzsbu+gbv8W5kZ1ZGtO9fnpHqYtl9e3uBlJ+YGmdyTaIR26tVMLEVG
 w5tcJvIYVnpLeoYay2dXiN2OGGwEkrde9X59tFw/jkDVRcXrFoL8ukFNOAXISZPqyPMM
 YYWEqL6pREKHT5UCfyE3jimskHxZZVcIexv8RPMZLMgi1OtRZGbK+cM/vVMR/0h1i9DG
 XVg/AM/aUaPVFOqrWykWXeo7v6PVuyW4TN/lEVoz3vIQy8b3cZtsYJGE+BHIYtFhNT0C
 /Wkg==
X-Gm-Message-State: AOAM533EYYh8RCOkjCDIP7YgCUIsYE+Ok9PLJ7XZ+Qs+ezzGQuFF0sP4
 q6AkdL54/IkPykrp2LcpZmnddQfycegx79Saa3Gtbg==
X-Google-Smtp-Source: ABdhPJyxElR/zmDxJB5HT94YqSJNJpIpRi9SAebfi8iG5r9V40osUnuRvjqt1v70/d4ITA0ddxjpA/Y3iSTlrI8KqRo=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr20176237ejb.382.1629452089344; 
 Fri, 20 Aug 2021 02:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-60-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:34:03 +0100
Message-ID: <CAFEAcA-dFoksfoZ0Ngr9xjyAsTyHq+NzaRjiY-2LTZBs9QMSsQ@mail.gmail.com>
Subject: Re: [PATCH v3 59/66] accel/tcg: Handle SIGBUS in handle_cpu_signal
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 21:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We've been registering host SIGBUS, but then treating it
> exactly like SIGSEGV.
>
> Handle BUS_ADRALN via cpu_unaligned_access, but allow other
> SIGBUS si_codes to continue into the host-to-guest signal
> coversion code in host_signal_handler.  Unwind the guest
> state so that we report the correct guest PC for the fault.

You can't rely on alignment faults being marked by BUS_ADRALN:
eg MIPS doesn't give you that si_code. How much does that matter
for our use of it here ?

-- PMM

