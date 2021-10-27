Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DACC43CE24
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:59:12 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflKZ-0007uv-69
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mfkor-00042y-Td
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:26:25 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1mfkop-0002SD-Ph
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:26:25 -0400
Received: by mail-lf1-x12b.google.com with SMTP id bp15so6986863lfb.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahZU4k0J/U5sRPBLSiZHxJ4JUNXjhmGoq7Cv288rrxc=;
 b=Kd/wZkjQXRrs1vKZ3N70DUu1XD+WJfwNYwf8rOFeEinIalaqwv8oApTWUPQFfvwu44
 nafcHJLFzE1mBeLBFrR/ruEAI5aq8Ac9QQXpsvmf5mnQMUvb/JF8umGBEr8Fx+HQxt/i
 gL55jHw3nKcoPhUSo3z8W7OHobRYYpbWdox9ZMxfqdKao3JqHeMmYPGC1+yD2xghQA7F
 kqfTskkf8iwFyU/eh9cRc3HQGPyR8vWxHxOc/hID4rqSpZgzpQhDay2X99/aZ31AHniZ
 3MXTwhMV1kZnHnOiVe/LL35/QTwCZJch4hHGJw/YKlyhuXHVBWp/3BjiJmwOgwahY7+a
 9lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahZU4k0J/U5sRPBLSiZHxJ4JUNXjhmGoq7Cv288rrxc=;
 b=gAAssUF8BdpCP441z4g5JfjeYrcTFapSWKX7mRnzVJWp65+qFk3CIxzcZ1ZpAk/vhB
 In82zZoFh1HAINODymal/5pli/fp4GyjdUl97AjpvywdCCkw6yofENvurabN7w0BLBp/
 mcyIQxuHB2GZDxb581cjrk41GPlh3hyNO0F6tXzynhhEIvbRon/h7ENuaYscFwDXb3H2
 oy3k0+hAWXnoEjXB3B9CbHLdzxzrk3h73/v8GoTzdEuVHWOIH6QCSzli7RcnmDQg+JVO
 x97kcn4SvOzmkQShmCpPEIKaLZU5V4UwRScdTkCFn3G4MDoctptmrHaACBBqGXgr1jlr
 9KDQ==
X-Gm-Message-State: AOAM531Ifp2Qc0IaFziX92GkGPaczQWOEQ9/bH+9ptb/wLdDnrZCQG3x
 U6NpsbqNyBU5xg4ZO6tAmycGlbpCXf4h8iTgTpw=
X-Google-Smtp-Source: ABdhPJyGYj6FPzSsWdIkYbesHZ65/Nk0Aw10Fxf/0PCOWKxCPYWIiHEx46odEdo0A4605p5nh2byEruljPxw++eeLkk=
X-Received: by 2002:a05:6512:3ca3:: with SMTP id
 h35mr17503500lfv.128.1635348381246; 
 Wed, 27 Oct 2021 08:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211027151012.2639284-1-imammedo@redhat.com>
In-Reply-To: <20211027151012.2639284-1-imammedo@redhat.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 27 Oct 2021 11:26:09 -0400
Message-ID: <CAKf6xpvKQmof7Khfb4d59dsNEQY-YFUoAo40ocoL=5qcrbWK9g@mail.gmail.com>
Subject: Re: [PATCH v2] qtest: fix 'expression is always false' build failure
 in qtest_has_accel()
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=jandryuk@gmail.com; helo=mail-lf1-x12b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 11:10 AM Igor Mammedov <imammedo@redhat.com> wrote:
>
> If KVM is disabled or not present, qtest library build
> may fail with:
>    libqtest.c: In function 'qtest_has_accel':
>       comparison of unsigned expression < 0 is always false
>       [-Werror=type-limits]
>          for (i = 0; i < ARRAY_SIZE(targets); i++) {
>
> due to empty 'targets' array.
> Fix it by making sure that CONFIG_KVM_TARGETS isn't empty.
>
> Fixes: e741aff0f43343 ("tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator")
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Suggested-by: "Michael S. Tsirkin" <mst@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

