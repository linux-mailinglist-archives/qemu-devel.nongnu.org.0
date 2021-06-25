Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC7F3B44C8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:48:04 +0200 (CEST)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmBe-0007gT-U1
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmAb-0006UD-76; Fri, 25 Jun 2021 09:46:57 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmAZ-0004Qw-Lw; Fri, 25 Jun 2021 09:46:56 -0400
Received: by mail-yb1-xb35.google.com with SMTP id c8so4703918ybq.1;
 Fri, 25 Jun 2021 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OTGrfUGA59uTjOGQRqhOFkegkwWbqBqNIuAnQ2jsF/E=;
 b=XGZSyexQ5YTq4GR8XiS/xXrmecNWr8B2soF/SwbjZUGPCjJ5fOMGWj4Yul3IpAjkw8
 1DEsiI0VIz0xr3ZNOFnyB8EGGQZK2uig6kK+ncnCJRD+bDG8oqjXjZZRLt57Yt2IfCBx
 rHvZqDpZ5Tk76AN349ieRHIxOO9OxTzpJ233tDZrIfDw5xkgXwiwLv/j7gbKe2lAZ1SR
 Fz9x8Qkbd2Y7Es+ZUBNSFudC7QFE3HcQQSrMD/iEKaTkQYHabtwtVJQNC7FGbIVWKu5h
 4NUrRw7BauAZdhhMjF2G/xPBkBVp/7B6MvawXihpJYRvAvku5t4tqwrWwpvGuhjhHON3
 4rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OTGrfUGA59uTjOGQRqhOFkegkwWbqBqNIuAnQ2jsF/E=;
 b=W5bLkBxZabrVY5ntlByvBOanAOTn6zhdA4hzsd4gMoO+WUcaFMEH6B5jYHSyO06sVb
 XuPMUE9ne4pXpDDxE9flOeDXa60/ajdy0+LohRzlBb1QZ2yiCZieBHrjb5Ohp5hoW3FK
 bDDzrv8IQCTe09r1lLutaDVfmWP99sSMSwAdYCMTWGpnEex8220nBlUoKV4ndxluAzIz
 usVjNkPorcAGw9j7r41DFwxM0SzTCB0YutdTIZZiKD+GnFMi5REyQDd6laBcczNuDEOX
 +s0zRSNYtIfZgnZY21anwwPno7jGv5jF1WZwHWuv4DZQIFZZuSFp+bsVcMYE9nJYmadX
 0SEQ==
X-Gm-Message-State: AOAM530QxQwuvm14gDW61YyvLDKp0Lc1N6RO8QYsMFuxy+3+IWaGGCUo
 d9yDEwIP6Oob6QQv0LE5ykrmU5QKj9KHzJZNzPI=
X-Google-Smtp-Source: ABdhPJxZZXpX+HQQAkZiQubktFr/gBhRxS28bTF1KE70sXmsWo0fV9kxeiqBrTBrGifHIIvkBGtbZzfgCNl9DMbHxkc=
X-Received: by 2002:a25:b701:: with SMTP id t1mr12063834ybj.517.1624628814420; 
 Fri, 25 Jun 2021 06:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-5-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-5-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 21:46:43 +0800
Message-ID: <CAEUhbmUhhSD57HQP5Ng2GxuS_phy8DoUgqUasDBtxX0gxxGu+g@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] hw/sd: Introduce sd_cmd_handler type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:27 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Add 2 command handler arrays in SDProto, for CMD and ACMD.
> Have sd_normal_command() / sd_app_command() use these arrays:
> if an command handler is registered, call it, otherwise fall

a command

> back to current code base.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

