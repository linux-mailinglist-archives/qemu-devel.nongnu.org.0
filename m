Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3A37278E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:49:19 +0200 (CEST)
Received: from localhost ([::1]:40904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqk3-0001un-1H
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldqi6-0000AN-5u
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:47:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldqi3-0001ke-V9
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:47:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so8459227wrr.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 01:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=D5ho5zt9009XfL3Zp21wvb/mHS8wW6MtglcIb6crBxo=;
 b=WybGwhP8B/4X82FCpAvOEaSFaWB615rP7+wOqGZwU5GbuMuQV/URIxmGpnJIqrlcAw
 fOt2l6Ffvkt2MmLGmk5Q2WfIx0CpLCn7cCPY7Ps4I+EfdrnGQQUnZuA1JKpRpbKyhpv3
 zdh/yzu+v4KfKn+5pWS85XLrHuWGf1Y5UcR7EQsTgj8E++LSJB/NES/L/J8CXhpYNu55
 SBM0WEq3B2OZLKpQ3p+Bdi8nPWL3OYMKzeA/gD6fkHu/YvUJV2SzK1FlE+ozmky7gj/f
 xNHjPXNyr6i4rYTnqsGQ5JWDkrJ3KnKr+0IEHLb3E31R/MtT5mEnowiHHyUIfHTAxcq+
 sHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=D5ho5zt9009XfL3Zp21wvb/mHS8wW6MtglcIb6crBxo=;
 b=lgyXQ275pFvPVE/+BA7oPFNMkGC6fA2PnN7sRl2+Z55ISDY4OYFKc4hUBHeLIXS2wn
 E+D5QX2NaNS46yf+tz5pma5qE5fUEbLDSP9fU2sLWAEthtfD9ylxB/0yrfL5Mt44A2ri
 sdvEUzdYYRb8JIYgTI7fViERoDZ//80FEh6BO4m0NGzjr9evzRDluQKGjlsf1DmH0GbN
 H5k2AyZQiTfLiNTtSq5GomMfp5SZdx+YTTgu8T/r32gfRaw+GeLGqLG0gAOKuWZRDgHt
 h17dWqJEz1/p15GDqmpVxP5rNjcE33PD5KTNJFjwDUFU01lF8dihOFY3BMOgqPCFZdxi
 wpCg==
X-Gm-Message-State: AOAM533u/doRcM9uSA3heCB9IqDWM3rkfi/SvPbFmOD6aaMXaBQzILSK
 Mc7gw2Tq8vnCghZUTiP69EMGTA==
X-Google-Smtp-Source: ABdhPJxdUR9/iEexq0/cQtrxYGfXN49emQ57it9tBNXg239LG1ADnDUIk8mLzIcP/bA4QKHRkTLEjA==
X-Received: by 2002:a5d:4145:: with SMTP id c5mr30225677wrq.252.1620118033873; 
 Tue, 04 May 2021 01:47:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h5sm1764461wmq.23.2021.05.04.01.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:47:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26EA01FF7E;
 Tue,  4 May 2021 09:47:12 +0100 (BST)
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-3-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/3] tests/qtest/rtc-test: Remove pointless NULL check
Date: Tue, 04 May 2021 09:47:05 +0100
In-reply-to: <20210503165525.26221-3-peter.maydell@linaro.org>
Message-ID: <87zgxaopgv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <minyard@acm.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In rtc-test.c we know that s is non-NULL because qtest_start()
> will return a non-NULL value, and we assume this when we
> pass s to qtest_irq_intercept_in(). So we can drop the
> initial assignment of NULL and the "if (s)" condition at
> the end of the function.
>
> Fixes: Coverity CID 1432353
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

