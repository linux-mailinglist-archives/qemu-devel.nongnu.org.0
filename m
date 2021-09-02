Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722EF3FEA1E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:40:16 +0200 (CEST)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhKZ-00073q-Hg
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhJF-0005hy-Bs
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:38:53 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLhJC-0006EN-L1
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:38:53 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso683842wmr.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JH9AewDq5chRphAik16Q62xANbmtqPTase7vmgshc98=;
 b=mJegesJhxoqCiZn2Xdmoz75PGz1yk6l939CffV4SerWmFIAhLk/p6Tol+RglqVCRg9
 oLiyvP84zQaXZRVEI/wCkOOuPpmY1P1GVCKGWfp1KmOaaDdO3FLRG8LdgoR/aVpNwO0Q
 RBEYjJpGhbHXSzsUyn/ycH5NR5eIMQvZREPgAEhRogGXq0Cm3exSifAWhW8cc9TZ8Hk+
 dU8jQWffJF9IAR9BxU0T3WVBXTSBprYBZfdTsqkpPND7KWrIEG6E1x5/oKGTBr5xBvuQ
 VhQyqjNQeKcYpa6BTpmVe502evDCdZ02mvutS6rLtjTKNR6XBkTHOORO6/ck2luCPgEi
 4PaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JH9AewDq5chRphAik16Q62xANbmtqPTase7vmgshc98=;
 b=UEiF42DGhVjrA9CLMx8OjCZkfNRxAYGeQsWOIbiQ8GoxhHQSq3Qpm9fForHw8DS++b
 hUfAyMD0vN+ZLF93rg8+hj7ijXXWvUlkhv+xgLjXeEJSFNLzbxs2wNmYKIq3Em675oLd
 5BPQSve8FSvPeFkMsUDl/4Ez2/9uwtdZv/aMPjby1gNDGzoD9z3lD/bFCWg3+PjzTffB
 wZcia/lXYdmFg3cIsfbn3m3RHDouyELbh01u8Z+V+KR7IHfK/bEIH9iit26+0cGSayGr
 ZE1T9S9wo9uk7zevfn354eWRfj7tCG5G7MLQ2LyqsgnobbtW6uuo4CxX12/XlQjGP4V3
 5HLg==
X-Gm-Message-State: AOAM532khSZMNw4m71jFkWTp7+rCRi+QrpJEQ27gpMDe6xkf1ljnXQEj
 5FUAzR1i9Kx3doAn4lofrww4/RMYDMrFKxTSkYLyng==
X-Google-Smtp-Source: ABdhPJyGdlyrVFUxqFpYnY0KtEeiOM2B2/rFU9rDOIMTecQOhxPcCZK++csegsFtC05B89pvggkrpQFmYWugylSvZgs=
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr1676826wmg.108.1630568329015; 
 Thu, 02 Sep 2021 00:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210901213426.360748-1-johannes.stoelp@gmail.com>
In-Reply-To: <20210901213426.360748-1-johannes.stoelp@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 08:38:00 +0100
Message-ID: <CAFEAcA8c1ad_Mkqtv3pH1WuZaOyyyV_7Ug6vf22=yXsxR5ndsw@mail.gmail.com>
Subject: Re: [PATCH v1] kvm: unsigned datatype in ioctl wrapper
To: Johannes Stoelp <johannes.stoelp@googlemail.com>,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: johannst <johannes.stoelp@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 22:34, Johannes Stoelp
<johannes.stoelp@googlemail.com> wrote:
>
> Change the data type of the ioctl _request_ argument from 'int' to
> 'unsigned long' for the kvm ioctl wrappers.
>
> POSIX defines the request argument as 'int' but the glibc defines the ioctl
> call as follows
>     int ioctl (int fd, unsigned long int request, ...);
>
> Requests with the 0x8000_0000 bit set will be sign-extended.
> Fortunately the Linux Kernel truncates the upper 32bit of the request on
> 64bit machines [1].
>
> On x86_64 one such example is the KVM_IRQ_LINE_STATUS request.
> But requests with the _IOC_READ direction bit set, will have the high
> bit set.
>
> [1]: https://sourceware.org/bugzilla/show_bug.cgi?id=14362
>
> Signed-off-by: Johannes Stoelp <johannes.stoelp@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

