Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE45358123
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:51:29 +0200 (CEST)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSG0-0008BU-Ps
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUSEf-0007Xl-FS
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:50:05 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUSEc-0004gG-VT
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:50:05 -0400
Received: by mail-ed1-x532.google.com with SMTP id m3so1837630edv.5
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IelXAYU316cMu5hgyXVwoE+JVAYX9ZG15DCzlzWum7k=;
 b=nt7MvUHgRzVEfl+xiT7tZgd47rOm+U95YSu2scUK2NvF7D9Ys5gC+IkUJFE7+6g6Hj
 l3q2ydbWSD3MsL5hfgEI1VdT+WUuO5ygDmjndaI/OeUy2cyrZ4Ze4JDINxL2004aNfU6
 mh1/txQX0EuJ/GciyBHib2LunCJUxlSKUS9Sx0FC2sYrwhekzE7lWuxmckro0KqqjNH+
 xlnggSia53/RptHjPlQPbGOLxaPPZYlobth569W3+lnE7JQFKAbJYiKK/neLCEZoo/zj
 6MYG48ScEvwgK/1UbLFkSt9bvBwRyB67B+ehiUG49a2kLKksH1lcftPJEF1gsGjpVGQs
 ScXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IelXAYU316cMu5hgyXVwoE+JVAYX9ZG15DCzlzWum7k=;
 b=TdT4uA5Gua8rI6qD1WZP8m4GBQexX2xsGVVz0Q4oVh7vgtd1eXKXMVNv25lk2dcMtO
 fz5jmv2BulIrcDDp9Wr7fLw9ETsk5tdPAN5M0MG05BAyHCxwXSnLM7VR1z4XRQCFE7MH
 PGVZGMRD4vieiQZbt2RtTBhguTqA/QhrCVPXv9tMwKGxUfO/4z32PweOLoyFQU4UqiKT
 uvh5/+A2OCTJYHHKumOxwOVhtFZWnsqNyWmR7boRIuevFBWunSlBowP7s0p5PiUizKFb
 RoOGkm4GpmP2dtB4Skdd11cUPUmiROFOZez4BcV/RjsYN1US1P/YBPLW2AsnhslRdjBh
 2xhg==
X-Gm-Message-State: AOAM5337AcbqoA9RgNUHaU4PhjftwVpd3SjxZQN/FAe/WJ7x60aVqoUV
 vTMABGFozeze5b6Y/LwPJMGTPJau42u/jqRd/Kn0YQ==
X-Google-Smtp-Source: ABdhPJwNHDS+THzuhQ/JB+yKxhwWk+EHg0b1u4xlZygMHHXUxVkFqYTg5T1KgzVPohFMJp2PFLYIBv4w92xvGmSUJ3I=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr10442662edt.36.1617879000901; 
 Thu, 08 Apr 2021 03:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210407104511.343061-1-stefanha@redhat.com>
In-Reply-To: <20210407104511.343061-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 10:49:20 +0000
Message-ID: <CAFEAcA8pnp_m+r8bPs=b5vaO6gxmWPhFRfXZ4LmJLEefN0+M=w@mail.gmail.com>
Subject: Re: [PATCH] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qin Wang <qinwang@rehdat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 11:46, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Some downstreams rename the QEMU binary to "qemu-kvm". This breaks
> qtest_get_arch(), which attempts to parse the target architecture from
> the QTEST_QEMU_BINARY environment variable.
>
> Print an error instead of returning the architecture "kvm". Things fail
> in weird ways when the architecture string is bogus.
>
> Arguably qtests should always be run in a build directory instead of
> against an installed QEMU. In any case, printing a clear error when this
> happens is helpful.
>
> Reported-by: Qin Wang <qinwang@rehdat.com>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/qtest/libqtest.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

This way of figuring out the architecture has always been a bit cheesy.
It makes it awkward for instance if you want to put a wrapper script
around the qemu binary (to enable debug options, for instance) -- you
have to be careful to name the script with the right suffix.

thanks
-- PMM

