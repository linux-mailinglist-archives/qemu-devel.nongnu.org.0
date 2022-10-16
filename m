Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979865FFF8E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 15:24:42 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok3dB-0006S1-71
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 09:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ok3b8-0004oM-Hj; Sun, 16 Oct 2022 09:22:34 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ok3b6-00006u-Uo; Sun, 16 Oct 2022 09:22:34 -0400
Received: by mail-qk1-x72a.google.com with SMTP id f8so5270193qkg.3;
 Sun, 16 Oct 2022 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5e6+J19yS0s9eE8XvMvurRokQ6j8LvLuLf/b+mN2giY=;
 b=AzNOLq7ejY7XKim5t2RtIqxwbZ9LrYznipSg6hc4HP+RrJTBap9m/82RHcWKgaP1J8
 co7um1bpGyfwJsGPJfE6mBJf/o6GboJtBIlI98a3P5Z1AojntlOAVLQoHNAHFNKBwUWA
 dHXqPWchlTVTJcmvZweNp6zyBwXyescVa1zKgoeP3w3dJ2t4req7x85FAxUivhLDqXyW
 GLjnMO1HIIakD24l2gvM7OMpxUrsr+7S9yV4jtZECAVznioL9e1FKzLtyLxmeqBjfPH1
 poi9OGyk5OFge0uh5/M50/DMyLHkmXlTr+WqsuyRiVZXnEIlHvsA3lQEtd+/54YrZ98+
 0lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5e6+J19yS0s9eE8XvMvurRokQ6j8LvLuLf/b+mN2giY=;
 b=NPZ6vH7u/Mxr28U52Yjs/kt+Cn16dgp6De9Z3RwhIaUuM9roY42jf3kS4a0+WK6+Wv
 c/b936L4gIuqc3EH+bzLQD2u3+FZcr2GAN+gUluTS0k99Gfnkbe3jGxGn5/RRhNYpODL
 Yad6VFSDb72JdVkw89diTXebZ9LHKe97JAe8HNT2rA5IAQFfJAMGKUpTIe3dpexGKVfa
 RzgieYqWGNYvfE8QOWh9kjxK4RM2A1YGyUKY1pR6h3zu1/KLbt7bBk0ITsziu8MD0C2m
 x+FFcbZxjeVF4XM+Vzdhl72e+Eb04T8r0yiKMZHMwxkgPzS0cFwIg5OItFvsICig14uI
 f2Hw==
X-Gm-Message-State: ACrzQf1pyi711zYQe4288U2q9LE1/qLcw0XvdNcYnyJ7/Y8skbrbmDZe
 b7ThQ3Po7EjKlP6BSGH9WGLkZTmjSQb8+ziThsE=
X-Google-Smtp-Source: AMsMyM4Vz/e64dcejqg7UL8kAKWByfkmSNw2ten2mrPuMeW8zwMRRKrOEFUmVsF+nDrhBwnz3MSR7coJ6NFMSnGzZuE=
X-Received: by 2002:a05:620a:6ca:b0:6ec:553a:cf33 with SMTP id
 10-20020a05620a06ca00b006ec553acf33mr4468200qky.132.1665926551106; Sun, 16
 Oct 2022 06:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221010040432.3380478-1-bin.meng@windriver.com>
 <20221010040432.3380478-2-bin.meng@windriver.com>
In-Reply-To: <20221010040432.3380478-2-bin.meng@windriver.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 16 Oct 2022 21:22:19 +0800
Message-ID: <CAEUhbmUOCTzg49Dzo24VpFvwkQAeHsXPwd7JTzrra2EjQ+d=ig@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] block: Refactor get_tmp_filename()
To: Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 10, 2022 at 12:05 PM Bin Meng <bin.meng@windriver.com> wrote:
>
> At present there are two callers of get_tmp_filename() and they are
> inconsistent.
>
> One does:
>
>     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>     char *tmp_filename = g_malloc0(PATH_MAX + 1);
>     ...
>     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
>
> while the other does:
>
>     s->qcow_filename = g_malloc(PATH_MAX);
>     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
>
> As we can see different 'size' arguments are passed. There are also
> platform specific implementations inside the function, and the use
> of snprintf is really undesirable.
>
> The function name is also misleading. It creates a temporary file,
> not just a filename.
>
> Refactor this routine by changing its name and signature to:
>
>     char *create_tmp_file(Error **errp)
>
> and use g_get_tmp_dir() / g_mkstemp() for a consistent implementation.
>
> While we are here, add some comments to mention that /var/tmp is
> preferred over /tmp on non-win32 hosts.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v6:
> - use g_mkstemp() and stick to use /var/tmp for non-win32 hosts
>
> Changes in v5:
> - minor change in the commit message
> - add some notes in the function comment block
> - add g_autofree for tmp_filename
>
> Changes in v4:
> - Rename the function to create_tmp_file() and take "Error **errp" as
>   a parameter, so that callers can pass errp all the way down to this
>   routine.
> - Commit message updated to reflect the latest change
>
> Changes in v3:
> - Do not use errno directly, instead still let get_tmp_filename() return
>   a negative number to indicate error
>
> Changes in v2:
> - Use g_autofree and g_steal_pointer
>
>  include/block/block_int-common.h |  2 +-
>  block.c                          | 56 +++++++++++++++++---------------
>  block/vvfat.c                    |  7 ++--
>  3 files changed, 34 insertions(+), 31 deletions(-)
>

Any comments?

