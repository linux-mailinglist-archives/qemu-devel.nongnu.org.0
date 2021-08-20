Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116523F2BD1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 14:15:10 +0200 (CEST)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH3QT-0004Qp-5X
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 08:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH3Ot-0001qb-8m
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:13:31 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH3Or-0003zf-J8
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:13:30 -0400
Received: by mail-ed1-x52d.google.com with SMTP id b7so13744926edu.3
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UF2rR0VJoLpFV542S7USNYBLqHuUQZXxxs1P5wVvS/o=;
 b=lhuKxgS3HwCLaH0mXeCBwBLLUwD6VJzr9Ym8rG7Yv1W667Qn4xmYXN/h10PgATz09P
 oRFJQis745fCJsQRuP0OkX1yl7D+bwIeCoos2HQDjCZXDD5tZbU3ffbaP32i0JQoXgeA
 O3X5UNeY+MfdJUf6cMgDHxHUtvnOwQ8uV06TmwXJoyx8PH0OePUfYdbe1/6cmSbNT8v3
 qy8uX5dkrECK0lnpA/exsNCb/j8SWCA9dVWt/CqAHXffGen4tgg5SZ8fAGp0azNXugHd
 s5L8JeTwefKKViAc/amBrut6VwAozKrBHWjJPB3ELt8nX7Ff2eevEGWG+qXKWg7VqNak
 L8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UF2rR0VJoLpFV542S7USNYBLqHuUQZXxxs1P5wVvS/o=;
 b=atkZMQPGZO+Q1zMXErO3HJW9ore3rt3loxcL7+wq/HS5GC63bksL45rmr1NVFnkGU9
 BaY977O0pG2P91BzzGkWVBNTgFxzNEXlzwFyruWi+wxnogbSkcq2o4KHNFNm9KmDemt+
 G7S/V4pExxHj/R5FnEzNU4//Y6YIDrTUY66jjB9I6h2sEf1O8+5H5jx60dZTFqXSQeni
 hM5WWH2FEWe92YoT1sDlh418sSbVjk/11YxkSJU61PWoA/sp9VbeFvPfwHmMBphi4W1K
 o6yzeVwP+KFGkRARwZzgM1K0w4NxOhU8nxpZxk2UUy+UWbdThGnHt9+J6l2sB20X+e8n
 XT/Q==
X-Gm-Message-State: AOAM533frXd78NhY+VA8PEWMUtG0cTxWxKcdhlJ1+lh5DrMD8ZImRJhp
 8ZRncqpK/AeY66CXzlWUlJhWPQSl7zECXQUCVtJxHQ==
X-Google-Smtp-Source: ABdhPJw1pdlm9mIa0JFQIB/YwE5eiFbNOm8pA35JJy5Tlkjjcdvx0EbdV8bjUcjb9cVCUoA7FQpJUcV0b84LxEsLe1M=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr10790147edp.146.1629461607884; 
 Fri, 20 Aug 2021 05:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210818120505.1258262-1-kraxel@redhat.com>
In-Reply-To: <20210818120505.1258262-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 13:12:41 +0100
Message-ID: <CAFEAcA_-wCZQv8bSpUoROzJCz5ND6_5DG-FKOXDSOhEcptqF0Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] uas: add stream number sanity checks (maybe 6.1)
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Wed, 18 Aug 2021 at 13:10, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Security fix.  Sorry for the last-minute patch, I had completely
> forgotten this one until the CVE number for it arrived today.
>
> Given that the classic usb storage device is way more popular than
> the uas (usb attached scsi) device the impact should be pretty low
> and we might consider to not screw up our release schedule for this.

What's the impact if the bug is exploited ?

-- PMM

