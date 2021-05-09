Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D7537774E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:28:16 +0200 (CEST)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflLr-0001oi-02
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflCS-00014J-Jb
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:18:32 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]:38680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflCQ-0006Q0-U0
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:18:32 -0400
Received: by mail-oo1-f47.google.com with SMTP id
 h9-20020a4a94090000b02901f9d4f64172so2973553ooi.5
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UOl5RVJpsz63ELB7ZdfgdmpohZdLKrS0XnaRiNIXdr0=;
 b=QeGnRDb6PT4bffBOFb86ip7/0ZteH/GsecL+40YT3KvZxssrPUjpkiTQi2HPla1zmf
 nfeESe97dY+mfM7e54coonJkQxRoaNA2K7R+V08ND6fHPYA4IjXsFChyysB3FmG8k1pS
 D6u0LqiqNYchmrJV3qnXw5ft0dIpYQiGeH4xAJXHthA0c95dKUB4+EA/NdMGK4Aq1eci
 YMBGRvet8MIB1CZSPCqfLCWLKwz/r7/Py/yp7tT+4npjq4CsUrHEZoJOBzqYui831VXL
 IYkzrEt7hCI1DfT+WbsPM398mJrph/QrrsLs7J0y1voCa706L9FSORjLiNao6FK5JaX2
 QfzA==
X-Gm-Message-State: AOAM532T1Lsa85ypmF6Lnf/QJNNzEDGwftZXMLKrKDji+UyY4KeYwgcp
 qnwACPMomw7MMe7PyphSp3EZ8ME95MGd8S1VP38uRN5ZT2iXEw==
X-Google-Smtp-Source: ABdhPJxb88eOUgyrslk/+Nveupd4BclboN4KjpROJOm45UTM3k87AR+CD/Cj98ClK/Mge+7Fukxlm3DC1Nqy74V1My0=
X-Received: by 2002:a4a:e965:: with SMTP id i5mr15564865ooe.59.1620573509670; 
 Sun, 09 May 2021 08:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210509151618.2331764-1-f4bug@amsat.org>
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 9 May 2021 17:18:18 +0200
Message-ID: <CAAdtpL6u_5AF=H7XaRwfWThTVxM3YvUjUktbmmEenbUL=r2nBQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] accel/tcg: Add tlb_flush interface for a range of
 pages
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.47;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oops, I forgot to add 'v2' in subject line :/

On Sun, May 9, 2021 at 5:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Richard,
>
> I tried to make sense of the multiple changes in your patch
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg805595.html
> by splitting it in multiple trivial changes. At least this way
> it is easier to me to follow / review what you did.
>
> The original patch description was:
>
>   Add tlb_flush interface for a range of pages.
>   Call these tlb_flush_range_by_mmuidx*.
>   Rewrite the_flush_page_bits_by_mmuidx* to use the new
>   functions, passing in TARGET_PAGE_SIZE for length.
>
> If you find it useful, fill free to take / respin / reorder this
> series, improving descriptions.  Last patch certainly deserves a
> better description ;)

