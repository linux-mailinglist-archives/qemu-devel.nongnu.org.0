Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1830379226
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:10:14 +0200 (CEST)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7Xx-0007Hk-L6
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg7Wt-0006b0-B7
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:09:07 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg7Wr-0001bO-3X
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:09:07 -0400
Received: by mail-ej1-x635.google.com with SMTP id n2so25041127ejy.7
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRK8z9stCSdtC2xIOjMqSHQH1q8esAjO/u3pL+VY+aQ=;
 b=uCo0ErzmX+Nq0Tn6TB1m1eY/KOCCFBuYBgugnFqnQifX4GS4Jubaasx62SBqEvNZH+
 kCrnAXtZ2MBio8wkOjfBcMZ6Cr7MuZeK7LKaJRbNwf3h2AXCMW2urK9HqDAcii4JoCQ9
 uYPunFgh+RjxpvejxU0t012C7WroG0LLTw6IorVw9FjbBK+pM3AlmJrM4k1hBPaxMBT6
 BstLap7JPw5Xe5mGvLp1YQAW1j5113bgOoRBr/f6vwRAhWbyzTb0sSSv9vUOXb7N93fs
 S4ZNU8iamo+QJhdlMdV5DRrVnwwBja+cSag/rLPHMK21NXfL2DWYxqmPNrthyrfrJI5k
 DtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRK8z9stCSdtC2xIOjMqSHQH1q8esAjO/u3pL+VY+aQ=;
 b=qoJwU6O9zYgR6euAQymyOxx4uSgOj80C8IT99s7mFugn81HPfgWSRI3RZtj8ag68eC
 pNiIeRbj2yl/p/fN/rTRqZ7EatK7k8yqDzvzYBQ2Ii/oVQUDAQa9GqdH7IvqfPGkb+/n
 IbhhqpKJXWHg9mqVQ+GYaoExjzzngevQbGcSYpBhH4OBtFUO4o+kFRw1us9vLYGKMb6m
 ikn4vQ/cksLT1FIBK5v+kPGQ58VQzHw+4ydO+m5voyRf8MppMEEpL0wctPW2EAyA/QSV
 wJOCV6M45qippHkYNOnmzAw1fUz5GlkeI6TEmYSSUp5OCCi14rPwObhjD6lXuP6MWDbm
 U7cQ==
X-Gm-Message-State: AOAM533wbYbolUNOMmtgXGQAh0PvZ36OLxApcxI15SIX6Jr6gLCX/2jo
 WI+BoT7O9FfqbEV9mRBrLl7WvGwTXwm8DWaok7TCwQ==
X-Google-Smtp-Source: ABdhPJx+St+H3AIccpkeI5kR2vvRp/iCuHj71JbMHZoIJKaCwPMMZdaarUJeB6YwmqWGbV34d2ldxNEmeQvN5eoNRAA=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr26995852ejb.250.1620659342997; 
 Mon, 10 May 2021 08:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210510141148.3138904-1-wangjie88@huawei.com>
In-Reply-To: <20210510141148.3138904-1-wangjie88@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 16:07:51 +0100
Message-ID: <CAFEAcA9g8XWrvZGSOFdHQEkabGSDbcxQCnD8adfxR=0KLK=GeQ@mail.gmail.com>
Subject: Re: [PATCH v2] util: fix fd leak in qemu_write_pidfile()
To: Jie Wang <wangjie88@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: wangxinxin.wang@huawei.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 May 2021 at 15:15, Jie Wang <wangjie88@huawei.com> wrote:
>
> if execute qemu_open success, have no branch to free the fd,
> so unlink it inadvance, let it free by process exit.
>
> Signed-off-by: Jie Wang <wangjie88@huawei.com>
> ---
>  util/oslib-posix.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 36820fec16..fa881f2ee8 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -131,6 +131,7 @@ bool qemu_write_pidfile(const char *path, Error **errp)
>              error_setg_errno(errp, errno, "Cannot open pid file");
>              return false;
>          }
> +        unlink(path);
>
>          if (fstat(fd, &b) < 0) {
>              error_setg_errno(errp, errno, "Cannot stat file");

This code change doesn't match the commit message -- the commit
message says it's trying to free a filedescriptor, but the code
change is unlinking a file.

Unlinking the file is definitely wrong, because the purpose of the
pidfile is to comminucate the QEMU PID to other processes -- if we
delete the file then those other processes can't find it. (The file
gets deleted when QEMU exits -- see qemu_unlink_pidfile() and the code
that calls it.)

thanks
-- PMM

