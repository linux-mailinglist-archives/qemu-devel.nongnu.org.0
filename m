Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E048DE9D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:05:55 +0100 (CET)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86M6-0006vK-Mc
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:05:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85rH-00019z-2u
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:34:03 -0500
Received: from [2a00:1450:4864:20::42c] (port=33357
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85r2-0005Y8-Dp
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:34:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d19so12131592wrb.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91r+4fZ1ofQVxXj3hiQGT210A4+lM3OoqiyPnRQywHc=;
 b=RF2I8Av4eQRxf0LVlREXQmzwjFO/AH58WI6GZkVgwzJXrpn0rYsjcvCohcxbZljq4b
 vHKUPFz05ee++/4iuaHWG5o0NQHQeHpFJ2prb53HZUeiQsI0ZHikYkQ9qhoSkCWq9EAR
 VcknZZYKAnS41Vw9dMONUXogvM9pGlToIJGUd+YXT4TZ78tgUjOjyCke0QfK5J3fhKVT
 bV5Z2AIXSrGyNgFpReS+WAqqrSb6xLcZf7li1e3+0BHK/tCvODrXhsD54gdGv5oH9q3T
 lMNIqebZmzA0oNAnjptUCv4s92zglpdx6wz+jItHxEcsDJ1E/8nhngEHea4dSg8vwU9u
 2Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91r+4fZ1ofQVxXj3hiQGT210A4+lM3OoqiyPnRQywHc=;
 b=Q0PNCOHKdqjhdBXbJSTF0pjs20fBI/KFQE9ELue57JLc9G/21d7+PO3MQHcQYoZM1t
 Fe+o+fFeWwUuUOnq2ydzBRjKV2HS+jHxJjepUilUCFdeOpFFtSZbpsJZukehtdtuRvMB
 wBRikitDr5moZky6c57LbNmj89cpPROujN0bNCEspaLDWWptI1MoWy4T3QPeH771wOp9
 4nAMlsK184TEQY96z5jyETuAwGQ6dF94Zd5Gxih5wEqOlQYO9UE2rsK3W+UpKrqZ3nvz
 8JzbF9HaDSZDgNGxWSv43XqJBEuO84ngWTssn2548gFeS7O0yMsikDOVQpyABkjFWF96
 D9Sg==
X-Gm-Message-State: AOAM533OVqW5VF0KqYvlAocI6gjAzjuFLkm1JubEYuAS5ZT1V7s+Se9v
 PGjC5DINfzWnxkXjwMmpU8iLZczoZXAiC1Q9Din6zQ==
X-Google-Smtp-Source: ABdhPJygZ2ux/cERlOI3IffTMsXi1gqIS2PvCxQgRcwxfdnkW1PAo/WME9a0WwQ+Bcb1Cah5NoawnZxNfYTmnD4qBXk=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr5451275wrn.172.1642102415561; 
 Thu, 13 Jan 2022 11:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-13-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-13-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:33:24 +0000
Message-ID: <CAFEAcA8w7WKsHjENs0aNBW2AsCkCTZH3R=LnDctZphGKdacjCw@mail.gmail.com>
Subject: Re: [PATCH 12/30] bsd-user/host/i386/host-signal.h: Implement
 host_signal_*
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement host_signal_pc, host_signal_set_pc and host_signal_write for
> i386.
>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

