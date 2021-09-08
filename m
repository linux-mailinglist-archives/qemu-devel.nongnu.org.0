Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946C4033B3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:18:42 +0200 (CEST)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpyr-0003s5-FN
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpx9-0002aa-Oh
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:16:55 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpx8-0005SU-A5
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:16:55 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id a93so1800254ybi.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ziRfD37NVSzBH9JPCezu1qBHN5IVoqg5dfUefL+0iuw=;
 b=JcZqV5/mN2j+TzatQvHGLn3qCZ59U+F6WWmRxuHLmfax/edMaUdJwokKQ0k5We2Gq+
 bcqjyICQGHIJsEbr1tblar0pUq9dPpcgXB0YPTjvUtN3PlfcWW5fhLgfqQi6+aXrsJZ0
 Oo2TTKkUd9uAmZm2Ll07wYAopxnLTnHcdFR9ShEnKmBl7MczphbfR/ZlJd5XuIHILTuu
 bi97UwFRuoIgM/lYNIiNhyYtkOqR6v7PlXYITllKeGFN9yWXpGOaypl5bI3TF0nLVhfm
 tR7XFTDnxVtO02lSS6lfZZadUrFovyh1x1dk5aAiF/pKD1hP4prIONtyt7QRuIqYSL00
 YtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ziRfD37NVSzBH9JPCezu1qBHN5IVoqg5dfUefL+0iuw=;
 b=umBUuyFp0/5E3137DuWEnv/6SXnPaXNS6LUHOTwVcmE5+Gce6wFUYlNBJm3aT7ZcVt
 d+AMDeW4cXbF4auCrApoV/fA1s+zvYoxMCwL/BdF6Ll3OP6XbF6uX30zJ/BUJc8MWh1g
 K/wcJ1kLJeaf3BXjGlynpQb0IDSHqerCYl9ab58WSsZOWWKj1pLbpmkjOYULTPs+206t
 wS91JNMyAU+D53suHkOj+/oKbJ2B+xVniDpZ1W6yYSuj4DhdY9q+1v31pb48Wy2t1S32
 7PJ/juFeSfTef+WN/9HDhAIwsi0oz146G7vit/QRu+vOe4ei+/HPE6d+plVb2oFZ7q5Y
 rO0w==
X-Gm-Message-State: AOAM531l39+Vlhxc9m/XHrjWDiPFdc1h6sSFzDobcCRadjn4mX0Oy0CI
 9/LyRTBDZZl52XaXW14J8p85XwRXBHN4uMToiVp5uXQKAEM=
X-Google-Smtp-Source: ABdhPJzDrvD1u7919v6cbWALTvgflnNae3T5AsMNN96+iwCI2zmEJI0wIE4caQyQSIT7dMx13mCGJQ06uZTnEIhKGrM=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr2553902ybu.293.1631078213298; 
 Tue, 07 Sep 2021 22:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-5-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-5-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:16:43 +0800
Message-ID: <CAEUhbmWwO9GUVJ6EUCX51fKChQjPr8pT_=a5TYqUQUujDNkeJw@mail.gmail.com>
Subject: Re: [PATCH v10 04/16] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 4:35 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> The bitmanipulation ISA extensions will be ratified as individual
> small extension packages instead of a large B-extension.  The first
> new instructions through the door (these have completed public review)
> are Zb[abcs].
>
> This adds new 'x-zba', 'x-zbb', 'x-zbc' and 'x-zbs' properties for
> these in target/riscv/cpu.[ch].
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Split off removal of 'x-b' property and 'ext_b' field into a separate
>   patch to ensure bisectability.
>
>  target/riscv/cpu.c | 4 ++++
>  target/riscv/cpu.h | 4 ++++
>  2 files changed, 8 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

