Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8D33363E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 08:17:57 +0100 (CET)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJt6R-0002UH-Id
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 02:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJt4v-0001wd-EP; Wed, 10 Mar 2021 02:16:21 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:39887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJt4p-0002U0-Ro; Wed, 10 Mar 2021 02:16:21 -0500
Received: by mail-yb1-xb30.google.com with SMTP id u3so16802134ybk.6;
 Tue, 09 Mar 2021 23:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ak6vpPvKkF1trKwhlxL2Uuu8CYOQYA/rgKseL0e/O5U=;
 b=AWdt6QUAz7mXahShMY74YckMFkgtHIVowdt/LC4eSUmjUbZ84ztZHukw6UsBQp6AzK
 L/5a0JUdRs1/BBs/f35x8pNyXzX+40zqJJ2TXDtEeb37qk26Eo6Dv/PihnIAdjph5M7S
 T02gyQD0UCp8rZ0ZwTXfnk5BdJULIATt4yAY5ulcW6WXxVMsVRhnpKbNM1vIFd19lszw
 pxsSOI4oKaZTKU6lP0ombaa8S3hi+Yu9X78+GzR/w8ysLRPBX+nhAHrB9RJhKOrtwpmy
 cl+5D1BmWtAxGjftNb8J+Oo5H65nhnG8Q5HcmHi3F1GVq5/q8z0rolbvBm8ra3vxVZKa
 cg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ak6vpPvKkF1trKwhlxL2Uuu8CYOQYA/rgKseL0e/O5U=;
 b=RoRkdsVqSlUrgKN6NDFnS2/z5zpzMZL3+7XnyZPUMjkGRSzJvcwVFs14QNMARy9Shy
 ltP+yy0w9o6LzPc6gPcqxqjIAGx/KHSDdN5zBOQXxo+YmVyQRp6wsZIYPzHib8moScx+
 vNuKb3MIu9jjKk4tQy0DEVWcTjAggNgt72f4l0EHglNw2vjS+F/aJ50p9VHdhCimE9H4
 sEWdPvv1Z0y9lydn0mS9OmdPrAtYotpHj3gpjHTQav/tyNY0pYx2E8jcZH2qK2VK2Xff
 QL6CaHxWRneg38BdTdXfToX7ZMcMBDLXMmi1QpC2CpyPVEk5VlGb7S2MSzo3CeRbW7XA
 zfNQ==
X-Gm-Message-State: AOAM5307XlYyOMXEFpPXAAjOyU8mnc81M1m68s0/lyEpajIcCcARE+iW
 HMpEBzIdJg9VGF0y9ZVKilagzCbXKesCNdHOe0Q=
X-Google-Smtp-Source: ABdhPJy2KbWdt6NhRQ01Rk6DL/1HQBOjRHCqNV+wAsSxjD+bGMWNbq0a/mbEF7VIyIb0qi+e0OheYus+qbnUgK7Ds28=
X-Received: by 2002:a25:d744:: with SMTP id o65mr2443388ybg.387.1615360573073; 
 Tue, 09 Mar 2021 23:16:13 -0800 (PST)
MIME-Version: 1.0
References: <1613811493-58815-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1613811493-58815-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 15:16:01 +0800
Message-ID: <CAEUhbmW-D9fCnu8jeKb-9VicdG81nCPysyX0M6uPxVTZgbZaqQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/sd: sd: Actually perform the erase operation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Sat, Feb 20, 2021 at 4:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present the sd_erase() does not erase the requested range of card
> data to 0xFFs. Let's make the erase operation actually happen.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v3:
> - fix the skip erase logic for SDSC cards
>

Any comments for v3?

Regards,
Bin

