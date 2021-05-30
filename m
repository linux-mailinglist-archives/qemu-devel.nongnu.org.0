Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CD839529B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 21:10:03 +0200 (CEST)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnQp0-0007uI-OS
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 15:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQlV-00072r-8q
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:06:26 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnQlP-0004vZ-BE
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:06:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id r11so10890410edt.13
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZS/OF5CgMIk0JZ7vzqHEQH3g/I5JVQY87/X8AeeCqo=;
 b=nfKBShOSbEqDYDzRJ3jWiXe0vpHy82ekHmwe08njbFZQYEXSPINGfsSuZlLBknU+pt
 kwiSnmPtLYQGFkfFEO1vwJ2OKUOKqxc2cLuAMdaU54cttBodOPB7MBn3Z7EgTSlYE5pg
 L1CWDMQo+tWamXYBrZ9xVPB7hICDLCigV2I9tN0IQ85lt5X+mlrzmpqsJXkV2VwD3J3I
 +Qe6arBxR7eyNmfSyoW0Vr/jbzt2JX2zZ9iXtmsOQ5kQ+mtmGCEho5Uc3zQAx7cwiXYS
 Kp6xg6cuDae+PGiqids5ZsBnzKNC+I6uFhdUUkfjNA/NY2h6RMCjQDlIL3itpsDZ7uol
 e4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZS/OF5CgMIk0JZ7vzqHEQH3g/I5JVQY87/X8AeeCqo=;
 b=h0MTFLQOX1rGRf2fiNeSff+RRy16DT0+vjc4yq5EDHAVpo1qAzYMwhHdbeZHz9Emwd
 u1J6krD44MeYhaEMEhDPZkWBUmRY8BwqY6nWSKysrGxEOVEOaB+9riC1iizCfuJxiSV6
 eZqTbW/JODsYgRdZXUyavAYG8BqbrlvkcCqhHEozwOCaxpM37WzPxvgBPKxjPVyDnF1B
 V5p7csqCXL5qobLXVcUPFKW33KXIJcLZTUlOjQXgAc20YIuU3XjWhYp9vdC+XzBOpGlp
 jgvE27UiL00rZGiK8c0jxhLd+r56Wf/ARF4aehDtL5+fWx3Gaqxd2G3Oy2NMejIDH/eW
 3Fow==
X-Gm-Message-State: AOAM533RtXSJ+7W/q6O5E6a+kBNVfTE4ou2qTVm6sax1kJG9uz5kCIA0
 G7Avxht90t5TLFMKRzQcOTXWqhJydjbLvhF6wNzveTV4IUA=
X-Google-Smtp-Source: ABdhPJyklWO252aYNjN4EPmbU1x9cD37ahxTOuzeVQ/DJHTQhDkK3+MhLN380sYCgUI0QmC8MI1IDXJ0gvqPrQ/cV44=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr21239288edd.251.1622401577693; 
 Sun, 30 May 2021 12:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210526091248.434459-1-stefanha@redhat.com>
 <20210526091248.434459-2-stefanha@redhat.com>
In-Reply-To: <20210526091248.434459-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 20:05:49 +0100
Message-ID: <CAFEAcA9pDJghSDEkugtA9m_OA3ov799hJyDEdQNitj+ddf3iow@mail.gmail.com>
Subject: Re: [PATCH 1/3] vhost-user-blk-test: fix Coverity open(2) false
 positives
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 at 10:16, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Coverity checks that the file descriptor return value of open(2) is
> checked and used. Normally this is helpful in identifying real bugs but
> vhost-user-blk-test opens /dev/null as stdin and stdout after fork.
>
> In this case we don't need to look at the return value because these
> open(2) calls cannot fail in any reasonable environment. We already know
> their return values ahead of time since we closed stdin and stdout
> previously. open(2) is guaranteed to pick the lowest available fd
> number.
>
> Silence Coverity by introducing code that checks what we already know to
> be true.

> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 8796c74ca4..581e283a03 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -910,14 +910,18 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
>                     storage_daemon_command->str);
>      pid_t pid = fork();
>      if (pid == 0) {
> +        int fd;
> +
>          /*
>           * Close standard file descriptors so tap-driver.pl pipe detects when
>           * our parent terminates.
>           */
>          close(0);
> +        fd = open("/dev/null", O_RDONLY);
> +        g_assert_cmpint(fd, ==, 0);
>          close(1);
> -        open("/dev/null", O_RDONLY);
> -        open("/dev/null", O_WRONLY);
> +        fd = open("/dev/null", O_WRONLY);
> +        assert(fd == 1);


Why use a different assert type for the two asserts?

thanks
-- PMM

