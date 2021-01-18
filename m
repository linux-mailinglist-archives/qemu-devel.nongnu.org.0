Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6552FAC32
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 22:05:02 +0100 (CET)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1bht-0002ZS-CM
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 16:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1bg7-000270-1g
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 16:03:11 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1bg4-0002qF-Ag
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 16:03:10 -0500
Received: by mail-pj1-x102c.google.com with SMTP id l23so10667511pjg.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 13:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gla4CH5CHtEE8ft7eGX0206Zw59earUqqgXmuUWwDI0=;
 b=qUocEEslfMrERCDk4KcOXJiOXi3VnBbu1fpt+uKnwiFVCBtPfi0P68fVSbYHk/sjZC
 VIobfsweDQa2yFR/84LgTCzhVw0M6cpFPqKI5Qz9yflc8DyykHJXc5nUkwKF6pGnXF8P
 ERxBnqr5AcAxO/ZbOJW3hDrR8zQSIcGQhddT5QSB5OfsMa1CgQ92Hbt3Peh51Mn4MljS
 pgDqg2QCrX/u6ewCuvYwQ2mKsfg9DRxjKYUt9PRRrtryKAEXQKzINASVhrZEo9lqwan8
 4tdjh58FQhXbppeaqi+/L4YyMH4mL/GTbrj/hrcIFjp7pOld9z4McybknCsY0KEs4UKQ
 nn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gla4CH5CHtEE8ft7eGX0206Zw59earUqqgXmuUWwDI0=;
 b=mp2Y1fMaXPFJJ8X7y2CsUNdIyX3YWLY3NR5jaVHbEjLrkx9gGCRnvAIazqbuU16PqZ
 R+t5H4L740RtvG6QQiT3V3P0v1R4ccW11x5j/TjjoRk78y3zTJ+9HGnJ+d8oitLkBoAZ
 yWHOycwNegBFTScvzi5WDgWQFCmD8YG5TDKZdFzSvfiwfJ1AAwo30noFSwj3r4T9kNxq
 EJyvvfGGnvuyV4EhjbPUrHL8+jiWOwP6jVT+Qfu3rCP2rNXWaHggi2B7M2V1LeLX8xc4
 ymwa4UDvitrxKPDGplwD2F1V+VeuUAp3P/lXvnKcp3xhfDK3KUEwdVly1HFBREP++9Y+
 X8dQ==
X-Gm-Message-State: AOAM532jhWkM8mWKjH0Z98K3I9F24fpkvp/sU0AJ9I9OH1jlwgUO8tfb
 +/otmjYWrjAOPKoWFzwwXZ2TAXqtjzJWjw==
X-Google-Smtp-Source: ABdhPJzuACoB55c6XBY+i6dJrNsH+gcGucyiNtlmYscfvZ+KZEZx9AdjgDaY/OuGhna1/dpHyJ6OOQ==
X-Received: by 2002:a17:902:eb0d:b029:dd:f952:db29 with SMTP id
 l13-20020a170902eb0db02900ddf952db29mr1195991plb.18.1611003786715; 
 Mon, 18 Jan 2021 13:03:06 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id i1sm274609pjl.36.2021.01.18.13.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 13:03:05 -0800 (PST)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
 <20210114021654.647242-12-richard.henderson@linaro.org>
 <CAKmqyKOezdn_bjyjAsAbiXQj_Cz-fphYCezo-tbBAjGR=Emgng@mail.gmail.com>
 <ccc7858f-46e7-0634-cad3-fe5bb0d5e99a@linaro.org>
 <aec0a4e1-31e3-7fde-d8d9-3f81d9a16383@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30371a59-4a0d-5f73-7153-89cbcd61837c@linaro.org>
Date: Mon, 18 Jan 2021 11:03:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aec0a4e1-31e3-7fde-d8d9-3f81d9a16383@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 10:17 AM, Laurent Vivier wrote:
> This commit breaks the build of my hello world test program with mips64el/stretch guest
> (and I guess some others too).
> 
> cat > $CHROOT/tmp/hello.c <<EOF
> #include <stdio.h>
> int main(void)
> {
>     printf("Hello World!\n");
>     return 0;
> }
> EOF
> 
> unshare --time --ipc --uts --pid --fork --kill-child --mount --mount-proc --root \
>         $CHROOT gcc /tmp/hello.c -o /tmp/hello
> /tmp/hello.c:1:0: internal compiler error: Segmentation fault
>  #include <stdio.h>
> 
> executable file is not ELF
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <file:///usr/share/doc/gcc-6/README.Bugs> for instructions.
> 
> # gcc --version
> gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
> Copyright (C) 2016 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> Any idea?

Working on it:

https://bugs.launchpad.net/bugs/1912065

There's a temp hack in there that may work for you.  With no change, you'll see
an assert instead of a segv if you --enable-debug-tcg.


r~

