Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7FF528505
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:10:48 +0200 (CEST)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaUn-0008Ox-Mq
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqa4T-0002e1-L9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 08:43:33 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqa4I-0001XL-DW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 08:43:24 -0400
Received: by mail-yb1-xb36.google.com with SMTP id j2so26826832ybu.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4WBbVJVd82Y4DMQbwteIkuufYQKHoRPLyDXHKwQ+MGw=;
 b=XuCUkcggv68mlY7y0/iwfnRIOF95tYxHQ7+t/YLbxv5PLqqzGW5cJyzex6PVsGWV+G
 yOraIfX0SMcCYxQIF4iK/8HkN7whvXlwcOexdonTHlDspx2gwHxNIyVM1c7btvMcIhI3
 eL4OHqGJJbmNwCmBfcsYQ9VXlI5pC8ef63QqqDvwOwiR8P7RIiX4iIEpwpog6yQx2oyv
 66cGM/USDqTv5aHh1ghzi/HA6bF1AY+9YnLkHWmjqO3o3/bZNjcKPQ4C9V5tf4HFaytc
 iCmD4mjA0hrMYGxnJuvhRk9VYgHRg0tbfqIYgefmkgyhpyqB8/Ki3x2Ec9BuMEFmPmjn
 Ppjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4WBbVJVd82Y4DMQbwteIkuufYQKHoRPLyDXHKwQ+MGw=;
 b=P4TjO0dqUkOp7ZLVAu9sZ9T5bzHx0tTw2D2hGgmIrrhxfNQyIN8beiKid8cuKfcSeA
 rcXfrYE+GO2lboZgLFB0Lb4S9t/laFhqwVEC3KwAJSQI28Wht0KgcYQuvXzG5/TYZAMQ
 pSYwlBLpKLzM3UkGIRXZIC6jNoer8a0vH2NO/ccMkDf832qj55vX2LnPLwMlwSCeKfFs
 LdYIZHsrb9dos0IuMrpgSeigSqEWd0T3OpPqzF2bz1CFItWowF+QZQk3kV6zJ/6eK1oI
 2ipTyvQL4gcs/D32zdeu516UBtUsIVCn5nOiYj6nZ+bWE8SXzApB2MEy3fQ9HwbKIRaP
 0V+w==
X-Gm-Message-State: AOAM531XxPKZcRL1uAkGw8RR4sfSqjD0M9KR5CKwOytlwhv5aan8CmQq
 aSFzBD1e/7fJIYwx960XTJo3mwQA1v/5JLw3APx2hnjQaHQ=
X-Google-Smtp-Source: ABdhPJyTZrNsKWvDDmDV9NaXGHkwwXsYBa0TMDrVx62o04e49q5Of25BrycCopmWz30TFeTxGNzsnbrZsXdrYtNoQkU=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr17109391ybu.39.1652705000873; Mon, 16
 May 2022 05:43:20 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 13:43:09 +0100
Message-ID: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
Subject: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We've made pretty good progress on transitioning our pre-merge CI
from running ad-hoc on machines the person doing the merge has access to
to all CI being driven by the Gitlab CI infrastructure. For this (7.1) release
cycle I think ideally we should try to get rid of the last few bits
of ad-hoc CI so that for 7.2 we are using only the gitlab CI. (This
will help in handing over merge request management to Stefan for 7.2.)

I think the last setups I have been using ad-hoc scripting for are:

(1) PPC64 big-endian Linux
(2) NetBSD (x86)
(3) OpenBSD (x86)

I think we can get away with just dropping ppc64be -- we have
coverage for it as a cross-compile setup, and hopefully the
s390x CI runner will catch the various "fails tests on big-endian host"
issues. (Alternatively if anybody has a ppc64be machine they'd like
to let us run a gitlab CI runner on, we could do that :-))

For the BSDs, the ad-hoc CI is just running the tests/vm
"make vm-build-netbsd" etc. Is there some way we can get
coverage of this into the gitlab CI setup? (I think we
have FreeBSD via Cirrus CI, so I have not listed that one.)

thanks
-- PMM

