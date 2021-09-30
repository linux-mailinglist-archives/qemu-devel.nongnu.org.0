Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EF441D2C6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:41:34 +0200 (CEST)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVop2-0008R8-IC
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mVon6-0007cZ-Nm
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:39:33 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:41828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mVon5-0007at-3B
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:39:32 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id az15so5854566vsb.8
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 22:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hndyxmOIvIvIW4GQrfYlOlsVXxQKzxZ+JKOz1HL/7bo=;
 b=O0Gy976DcN4rMddg5SeWd/1Sw9PmQ+QeFNy/DHOKKvMexsW7UbHOFmwj529S9cTKIa
 X1mWQ2SJL4QgUMc23KHoKtPdjGjNOq5Cn/XmnGzSBsGqTFlKX4NO1VXO32vM6hZ6S98H
 zJ4m5CNgP0SyYK558M5OgnIl6Qs6JKw7uSkOPnDLcIFe4AdIsGM9N5QIlEoCWolU/iz3
 8g/k16bZm+FqFVxdD5TMermgWrT7wqIymB99uTqAREvfNW4adyOrRmsrs1iDNMjlu484
 LEG+7eNmfv5TzvtFi8z9MQNiWHbID6PIi1X4wtGqXTfSovS1XvlD5PxWgRTc+6xmQM3o
 /WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hndyxmOIvIvIW4GQrfYlOlsVXxQKzxZ+JKOz1HL/7bo=;
 b=kNMe9MzsMX0AeHyoDvHN508nZM8kzXpYWbZRAiur8Z0FjBNQDJTYMzax8zo/raxYv1
 9s6TF4gDCIwc6Jbqlyplqe5eRUfh68cdu0EB9uEFx83LJ365FztdeyKYj9xE10RtUAmR
 nG84k5z7jfO9imwxrJJgsZafBhK22+Dt63Wwcr8SJOCCjA0TYRJRw+4rZ+uJOi4L7wYO
 2wkiFVfClbHqVb0epqt2vQy1BCPH7DbysFC1RepJyKTNrzWqfphYzR9wNeS0+DcRknH5
 Xt7jNJJep1CYhIGXxbapioBuf3mPhzn2QiWWzGLs2t4mUn3jzRsSWqXwUx86BRRCg7w1
 Vv2g==
X-Gm-Message-State: AOAM5325Myr+55oe5q+yGioeD3OmNxpAMx0Ui11gprdWZfCP+TLNLjkg
 UaiYqwl9nH3mgFdlgr3UUPklONqC/bcL1ohOjY2ZhLPiyz4=
X-Google-Smtp-Source: ABdhPJxAUW+bt3eihpct+lxy4SKTMXATJVxbVnr+5Y5MU9F6Vevjw9/1fp9qRj+c/9NeBbq0pnVXQQJ5O3yPHCdVGa8=
X-Received: by 2002:a67:b304:: with SMTP id a4mr3435013vsm.49.1632980366747;
 Wed, 29 Sep 2021 22:39:26 -0700 (PDT)
MIME-Version: 1.0
From: Matt <mborgerson@gmail.com>
Date: Wed, 29 Sep 2021 22:39:16 -0700
Message-ID: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
Subject: TCG Floating Point Support (Work in Progress)
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=mborgerson@gmail.com; helo=mail-vs1-xe2f.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello--

I'm excited to share that I have been developing support for TCG
floating point operations; specifically, to accelerate emulation of
x86 guest code which heavily exercises the x87 FPU for a game console
emulator project based on QEMU. So far, this work has shown great
promise, demonstrating some dramatic performance improvements in
emulation of x87 heavy code.

The feature works in concert with unaccelerated x87 FPU helpers, and
also allows total soft float helper fallback if the user discovers
some issue with the hard float implementation. For the TCG target,
I've opted to implement it for x86-64 hosts using SSE2, although this
could be extended to support full 80b double extended precision with
host x87 support. I'm also in early development of an implementation
for AArch64 hosts.

There are still some significant tasks to be done, like proper
handling of exception flags, edge cases, and testing, to name a few.
Once in a slightly more mature state, I do think this feature would
make a natural addition to upstream QEMU and plan to submit it for
consideration.

I'm writing to the mailing list now to inform FPU maintainers and any
other interested parties that this work is happening, to solicit any
early feedback, and to extend an invitation to anyone interested in
collaborating to expedite its upstreaming.

My initial TCG FP work can be found here:
https://github.com/mborgerson/xemu/pull/464/commits

Thanks,
Matt

