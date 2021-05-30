Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08D39529A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 21:06:03 +0200 (CEST)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnQl8-00064x-Nr
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 15:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQhA-0004yX-M7
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:01:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQh6-0002d6-Kf
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:01:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id u24so1409114edy.11
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 12:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dX+4pMxShg+0EPhi0fKQ+PiztkhpzMIokV8WuhXuR9o=;
 b=iGybsEqnSOB3F0XDxQ+BWViX8BYRPnyCjwVE/av0W3iwLCVjDVg7sHcXyFGg9d5auY
 ip2CfguOMIYjthko/C4HPaaqFopq8cnyixBbI2gEOOwlPPeGTBFi9LkdyzZwPNAtZLB/
 muiB34r63tWR6P9N4/6spJSV5yGkwqXoV7wHNRTLtqksR/H6rOFwboTWCTselZTV7jAX
 lPLh7j+SwLIN4ooJe/oQatR/nPwKdvLKB3DegBiOuEOpyFqFJ2IJJ0eFfOj05w2mV+aA
 //w4VzYQaYhJUngx8WYOqVGb+BYbnNHpeySZLpevaxgEZ4zGVDA7+L/OYU7e00tFS7iU
 pDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dX+4pMxShg+0EPhi0fKQ+PiztkhpzMIokV8WuhXuR9o=;
 b=P9wUSDJRcQrbx0XojEIngGjZKN0wFJoqM3LjjNv+taxz1zCHiZFhZWYfwN0I080Fe6
 wrx8+FxgUtlTJ2McVeU5oBQkRCeX3Mmuuahcjl6j4RO8yR4Yd58lGe7vwB60AN+9m7uN
 fj9utHi+a+LUxeyemHtZwxuQkfN3MXkQsHUEV0Pn8QLkWJAljbMTF1129pTaxwiimqz4
 w2j2tPNWZE7ELkIz6583AV7ftQddaNv7tA9SlfsyjIXCP4ucQTdLCw9m+s8nf8aSPjGA
 496VCAtWsxmYPwLV9oYzYaXPfQ8akbTl9XNqGgfbCPpppgLXjFyw9xcGhupZeUwAypQN
 jkTw==
X-Gm-Message-State: AOAM532IvGKNsm7wQLkQ3kY3lnxnueiP8qFXTpxr/vLEx6FN70HH/tf6
 ok9bGSkwMwwYjNNkG47s1tT+QV0Wq2JOPHi8OZ8QQw==
X-Google-Smtp-Source: ABdhPJzUNfTGcMJ2Gb5pOdFQMGnovTGA9W2ewaCgC3rHZthUpX4uXsCFY/wCQvmj5Dor9jEZn/aC3YzPDZA4agdFLjY=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr21503284edu.52.1622401310584; 
 Sun, 30 May 2021 12:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210526091248.434459-1-stefanha@redhat.com>
 <20210526091248.434459-3-stefanha@redhat.com>
In-Reply-To: <20210526091248.434459-3-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 20:01:21 +0100
Message-ID: <CAFEAcA8XA=+tL5194oKUkvraKd7ojPj2qdnjhRUsTZMndSbH6Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] vhost-user-blk-test: fix Coverity mkstemp(2) umask
 warning
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 at 10:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The Linux man page for mkstemp(3) states:
>
>   In glibc versions 2.06 and earlier, the file is created with
>   permissions 0666, that is, read and write for all users.  This old
>   behavior may be a security risk, especially  since other UNIX flavors
>   use 0600, and somebody might overlook this detail when porting
>   programs. POSIX.1-2008 adds a requirement that the file be created
>   with mode 0600.
>
>   More generally, the POSIX specification of mkstemp() does not say
>   anything about file modes, so the application should make sure its
>   file mode creation mask (see umask(2)) is set appropriately before
>   calling mkstemp() (and mkostemp()).
>
> glibc 2.0.6 was released in 1997 and POSIX caught up in 2008. macOS and
> FreeBSD also use POSIX-compliant 0600 permissions.
>
> At this point the Coverity warning seems archaic and no longer useful,
> but go ahead and silence it.

We had a lot of these on other uses of mkstemp() in tests/ -- I
have been simply marking them as false-positive on the same grounds
that you cite above. I would suggest we do the same here rather
than having this one test do something different with mkstemp().

(If we really wanted to handle ancient glibc, we should do that
by having a qemu_mkstemp() or something. But it doesn't seem
worthwhile...)

thanks
-- PMM

