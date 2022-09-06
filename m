Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676235AE02B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 08:49:14 +0200 (CEST)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVSOW-0005X3-2v
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 02:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVSKQ-0003vL-Vg
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 02:44:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVSKO-0003WO-UA
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 02:44:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id ay12so6337545wmb.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=dZek6j7pUoP6v9KmCwg/ZlBVD6dTY6Rbt2XUJl6wvBQ=;
 b=So+g8h0y76E0laWrklWXlETjudPUK+deLT8lx/prepHTgCcDnx77XWnzcWs/O0RH41
 JaU0vYgkQ2YuU5SplycXyiTIOxFuJSyHjAvVzD+oNJwHoQO5m3/TpQD+Q4RYI7l/s/IJ
 x9G5pxm6K046jPaQ9lrM+9AzI41pQTfO86bSimSd/Cr96FBHKRQl9jxOfac2jbmN9dkM
 KbH5szyRnXEPb9g18PoTyDkHcN5J1cXWDNnLs6UP/Mdgce+44clCwS2t5v3mGgt+D2iV
 JaCWNoENRmqzZP3vtW+wLKz97pwtk/MdUiI4o4sgWKJ7ACdxIZUPQql5b+tsFW6Oda7B
 Ce2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dZek6j7pUoP6v9KmCwg/ZlBVD6dTY6Rbt2XUJl6wvBQ=;
 b=6IQWve8HxCmtVf7quX1wEU2X3ZQQkD93hLWWGxV9zFMPbdt2E2VKm/uFFg+oRtDv+s
 jQDXdWbkixdEcjCmF9MJ+5wdNdh5v+vvC/bAsPMiW3THizASg9Vd122VM+LU71B2fgTJ
 lhQmErFMwsbVhNPHFrqce44W+Vj0t5xk8WPPpkhEXq1XQLVN/A3cY5pugpOCAsyR+5BL
 J5jB/l48FGyCzFsIhZlvHc79tA07Mm67fyrv6Fyo34eX6wa02Gw1tFhqrOkret/KYlrQ
 KnlOz9KCPIw4BuadXZiCzRP9Moq9uyxQ7M27OUxvL0PDEkd9acpw2Q/r359RTs5rKYFZ
 OOjg==
X-Gm-Message-State: ACgBeo2jy41RysU+aA4Q8JsUwdxV1ZRTn7+XdXF2C1n71mN3PDl3BAtn
 iA0u9Az3lByjaU6/K3z5Zqbpkw==
X-Google-Smtp-Source: AA6agR4OUTLrdgYTaGd8UBrWBqlqzQMVKmkHxsD40fbM+X0k044oJA+l18Au1P87dN0f9qsnWJ21WA==
X-Received: by 2002:a05:600c:3487:b0:3a6:280b:bed1 with SMTP id
 a7-20020a05600c348700b003a6280bbed1mr12399739wmq.111.1662446695213; 
 Mon, 05 Sep 2022 23:44:55 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1?
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a05600c2e4100b003a2cf1ba9e2sm12566385wmf.6.2022.09.05.23.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 23:44:54 -0700 (PDT)
Message-ID: <fc37598c-1a93-9a88-9492-2ba891e48709@linaro.org>
Date: Tue, 6 Sep 2022 07:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL v2 00/20] tcg patch queue
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220904002317.60158-1-richard.henderson@linaro.org>
 <CAJSP0QVBxkF1tQBetg8vtntppn=CduvDFHSGWapjAtq=XObsGA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJSP0QVBxkF1tQBetg8vtntppn=CduvDFHSGWapjAtq=XObsGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 22:58, Stefan Hajnoczi wrote:
> The tsan (clang) build is broken:
> https://gitlab.com/qemu-project/qemu/-/jobs/2982480773
> 
> clang-10 -m64 -mcx16 -Ilibqemu-x86_64-linux-user.fa.p -I. -I..
> -Itarget/i386 -I../target/i386 -I../common-user/host/x86_64
> -I../linux-user/include/host/x86_64 -I../linux-user/include
> -Ilinux-user -I../linux-user -Ilinux-user/x86_64
> -I../linux-user/x86_64 -Iqapi -Itrace -Iui -Iui/shader
> -I/usr/include/capstone -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fcolor-diagnostics -Wall
> -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
> /builds/qemu-project/qemu/linux-headers -isystem linux-headers -iquote
> . -iquote /builds/qemu-project/qemu -iquote
> /builds/qemu-project/qemu/include -iquote
> /builds/qemu-project/qemu/tcg/i386 -pthread -fsanitize=thread
> -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
> -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wno-initializer-overrides
> -Wno-missing-include-dirs -Wno-shift-negative-value
> -Wno-string-plus-int -Wno-typedef-redefinition
> -Wno-tautological-type-limit-compare -fstack-protector-strong -fPIE
> -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
> '-DCONFIG_TARGET="x86_64-linux-user-config-target.h"'
> '-DCONFIG_DEVICES="x86_64-linux-user-config-devices.h"' -MD -MQ
> libqemu-x86_64-linux-user.fa.p/linux-user_elfload.c.o -MF
> libqemu-x86_64-linux-user.fa.p/linux-user_elfload.c.o.d -o
> libqemu-x86_64-linux-user.fa.p/linux-user_elfload.c.o -c
> ../linux-user/elfload.c
> ../linux-user/elfload.c:198:18: error: integer overflow in
> preprocessor expression [-Werror]
> #if ULONG_MAX >= TARGET_VSYSCALL_PAGE
> ^~~~~~~~~~~~~~~~~~~~
> ../target/i386/cpu.h:2386:47: note: expanded from macro 'TARGET_VSYSCALL_PAGE'
> # define TARGET_VSYSCALL_PAGE (UINT64_C(-10) << 20)
> ~~~~~~~~~~~~~ ^ ~~

Arg!  This is a compiler bug.


r~

