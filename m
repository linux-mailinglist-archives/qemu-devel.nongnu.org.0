Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFDD3822A5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 04:16:04 +0200 (CEST)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liSnb-0007Da-Ke
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 22:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSm2-0005zb-5V
 for qemu-devel@nongnu.org; Sun, 16 May 2021 22:14:26 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSm0-0004Lv-Kj
 for qemu-devel@nongnu.org; Sun, 16 May 2021 22:14:25 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id h202so6469012ybg.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 19:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AEBWnloMQ+VKqAqIZRZrNHaoTLZYErvLSFK5rGEC/UU=;
 b=CcQVfKVdyw3Op3ifoIYhxQ4BfKOAnvJI+xbJ6Mvu2JK7Jl8HLQwrtGAfAKi6GBsmIB
 YNjBu/BKDHB3vXOWuJraNnFi01/t6UftYJ0xiSg6t6kMfq6VQ0jXHvhwuKjLXedCKEh4
 mNajZCyl8aUvZmbwLhEADjx3fUXxhLtuCgbKVhOjVtcbi2LnzGs95nlAKTAcWDlSuCSn
 86oNH9Jkjh2DdvBhxumMYnSbf22wgYa4kqLdW+06AVzY7u4G6X96gVxExEANr6KF4BLh
 3+UaXcDJiNjGlI/WfX8ox2TAiQn/pPsrmrWoSPfmNi0KTrFGU6fmdFYvlleT+QThBKts
 XO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AEBWnloMQ+VKqAqIZRZrNHaoTLZYErvLSFK5rGEC/UU=;
 b=q9rilOzuZuI84yImBgJnxQbFW6W0WNz4iCJta53PK4T3SsmeGNKWuYuTfhJk3MkY1m
 j2jUwToMzcLbBKpAKDjgL/mjPdMgb0JBLZAJ/+SGT8PJIjHngsICNcSfRVHaFoLmjzdE
 6X5ktrCPmI7u8PocODT/8wRmOcOJ6+MDR1B2qq26QwJ7kr+cALQNPZOL8jOTZQFbLKuf
 hau2hBBUp0t/rWD92aaJIJ2BqeQuXd+f70qDP2VngRW0LatvR2AcPkXzeblLlfuG+/I3
 sysakpgDqNcSCvH08Y7jeHucxF+5aKUKR6/keWyqcESNLFVM+mcfU+5XdD4/uUYlv75l
 sxXA==
X-Gm-Message-State: AOAM530T4v40jxmc97A6PXWLkKhAoBWdov79R9AH/FqaNVMvAvdv9NwS
 oWeHc1H/rAZsGH0S63mRW2yReBM/EIB+dmk99pk=
X-Google-Smtp-Source: ABdhPJx1jXFpPcXi6GPZMs6jcUlZzZ/NWFSmjxex3N/MgEvqvng6ob6dj92XPM5N1livbpG29g/2Xjy90JgAwaDbGmQ=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr76282693ybo.517.1621217663450; 
 Sun, 16 May 2021 19:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210511103502.2875844-1-f4bug@amsat.org>
In-Reply-To: <20210511103502.2875844-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 10:14:12 +0800
Message-ID: <CAEUhbmVj-zmdXQYQ_HvPjt=apWw0sYwj5G0uXte16AuVzrmmQQ@mail.gmail.com>
Subject: Re: [PATCH] Constify bitmask_transtbl fcntl/mmap flags_tlb[]
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 6:51 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Keep bitmask_transtbl in .rodata by marking the arrays const.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

