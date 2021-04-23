Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DEA368B8F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 05:26:07 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZmSE-0006Xz-AB
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 23:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZmQt-0005s7-Uc
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 23:24:44 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lZmQs-0003x2-GF
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 23:24:43 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id p3so33380087ybk.0
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 20:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26v4rLeSo88LiebjChtSj8JBDH3v+zVvkd/0BCl2prQ=;
 b=D5hYLMKIcJDUzOMEsyzs1+uwgN0T/O4MQnJBbL4dljudS7XkBou9VbBwA8f+hqC2vo
 DikSwczjVRm506Ck3JTvBvbv4JpOuj17cTzbDo3NBo6vfo1wcdKg/4td479XiC0z3IRv
 JrjKdJgUSChkc1xISQJnLzTT3jod4+HinrkL0RNwSD35IZtWfYKkNduY9RCxH5/OLgcN
 iXaNjo8v6AKuS3HwMYcBv903U6ljxzm2NskLsvIuD4K7xXbG5uVeYFCJhMSbacY6Xa45
 cSpAVQNk1S9m/lpehXzArBpBVisXf14jSsnLwMDne/yBgJidfZ8DjRZhFUNlbrI7MhzV
 ZaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26v4rLeSo88LiebjChtSj8JBDH3v+zVvkd/0BCl2prQ=;
 b=kJta9nr5q1sj3RiYqja0oBqyKVFKavHNvVvq8UOrI43aCpMbGoasph4t94FkuZ0Vdg
 ZgRXYSsRqX+68tLPDwiYZMNYwJmx1pd/ez6YmJeqCzaQC+pDq/j90TEkRpVT43dkFOF1
 +dC5BzFe/N0AfawpW+HotU9jr1+ZSYcVesOMbdXR63/VcPY6jHdzCOmVE70Bv9a3yE7w
 JwNeyHtc0S4lX6RASUnQB0TNwDkXJ44ZQOdPXSfQ98WskYWp1J4Vy6HnBXzOfLh8euM9
 qs8QAfXjRF5oOv4Z4IbC1IocczjoTZ9sDn2f78ULfjVkQmQTaaitx1NMtq8lEvABm+I7
 LJdQ==
X-Gm-Message-State: AOAM530f23dn5SgSjTvRHEBZ2VsEDfQ4j5ToRpJIz2N4GFBxkv44NtR6
 leU5/hreLhaNqssTHWfT8qIQIWB6QBWFf0IZvJ8=
X-Google-Smtp-Source: ABdhPJx4jWdiL3Xdt2cxvP8/eoY7C7ou8mnrqQOXmhNk/+0MbCsegaGJT3nXfu50dl3zohJuqvT+9g+FejPTgrfn+B0=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr2401353ybo.517.1619148281283; 
 Thu, 22 Apr 2021 20:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210423031803.1479-1-jasowang@redhat.com>
In-Reply-To: <20210423031803.1479-1-jasowang@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Apr 2021 11:24:28 +0800
Message-ID: <CAEUhbmVGavX-1qoyHu9i3_MZ0cHVbH-KRHXBCQQKokSs7EMMDg@mail.gmail.com>
Subject: Re: [PATCH for 6.0] net: check the existence of peer before trying to
 pad
To: Jason Wang <jasowang@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 11:18 AM Jason Wang <jasowang@redhat.com> wrote:
>
> There could be case that peer is NULL. This can happen when during
> network device hot-add where net device needs to be added first. So
> the patch check the existence of peer before trying to do the pad.
>
> Fixes: 969e50b61a285 ("net: Pad short frames to minimum size before sending from SLiRP/TAP")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  include/net/net.h | 5 +++++
>  net/slirp.c       | 2 +-
>  net/tap-win32.c   | 2 +-
>  net/tap.c         | 2 +-
>  4 files changed, 8 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

