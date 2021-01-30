Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B6309402
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 11:07:46 +0100 (CET)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5nAP-0002HI-C8
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 05:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5n92-0001oD-N6
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 05:06:20 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5n90-0005Vq-Jw
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 05:06:20 -0500
Received: by mail-ed1-x532.google.com with SMTP id d2so13408719edz.3
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 02:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ZQtCcOcfqPlau4FXNpIdP3Qr95YKfsSDeNE1rGzCFU=;
 b=IGLLZv8X5kfid78bkg+PyZHinOexMbxx244zlX3tgybcokwoOkvYzVEjON02wDmP/C
 4Ly/xjYMlD6tJppF+C3/usmwuBMMUKDGnCu0ZnjtOymkTdB/FO/1+kfn21fBYZ/DPTQ3
 rnwumqjhi+G03U9IV0/K2lqKAZJOq+pYL2DO52jzoQTkZM56/EHqqYtokauzhlJZHExO
 wpuLp2ds4joEW5bLpw0/U9+epoh9107Qal5ZwS66/e9NoniViRaYjMOuH/NGK7gketIv
 pxx2+4enJtEBMFzUjFuC3seMfY3s71BUstyT6ZAlQmvjxD3qoGO4wUidIxfmfFQFKS3w
 HTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ZQtCcOcfqPlau4FXNpIdP3Qr95YKfsSDeNE1rGzCFU=;
 b=hS2ZWSp9XNj1oYav4hBlTrFUw96Jsz4bvZZ7c/FnKLs1dtD0dEpZ5Qoxq0eq6NeVpc
 lthYoq7qHJCUynJPNpmoi/TFPxV/+/bLMYkz5pSxxpTm6T5IvpPYL466jtW69TZTO77u
 BdGf/Mm1DanEdpVP6ltkrrNYhHPx2aP0hSm1VvyvFzwqJBDy+Cu1yn++mi8aeZ/NOdzc
 LwhxRuNeO/IRfj5656cvxClSa4JohOxIFQ3AULkLZdSJBwsn7IwXV7bXUBRNEbFg/FUl
 X1MLqdSNB8fgOPhh5jhM2qitG8pYA35mm1RQe89mrZ4rpntriPhZR/L1+/642HT75cQj
 tc0g==
X-Gm-Message-State: AOAM533Xx4v8e3R/P2ovAoKDmB5gDSnoDrZx7Hoao7L6c4cKEtQsFGpG
 iZXa9xD1z1M7P4qN1ETtix3+5zE3Qoc8ffNAExU=
X-Google-Smtp-Source: ABdhPJySQcUwGmHNbiyjJ1ZVtJonmHNcOcx/1G54oSdOTGzfbfh5IDD3CE9cw8WkwOk6vHR2eqnqpwgYkAodibjGRYk=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr9448673edc.164.1612001176337; 
 Sat, 30 Jan 2021 02:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20210129195631.1577922-1-iris@modwiz.com>
In-Reply-To: <20210129195631.1577922-1-iris@modwiz.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 30 Jan 2021 14:06:04 +0400
Message-ID: <CAJ+F1C+KgEqoNXP8mD=Ebbk=gZRHYOccYr_pxQs+HwyKcA6R+Q@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-io: Fix polling by not removing polls when
 buffers are full
To: Iris Johnson <iris@modwiz.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 11:57 PM Iris Johnson <iris@modwiz.com> wrote:
>
> Currently, the chardev backend code will prepare for IO polling to occur
> by potentially adding or removing a watch of the backing channel for the
> chardev. The chardev poll is added if the fd_can_read() function reports
> more than 0 byte of buffer space, if a poll handler is already setup and
> the bufer is now empty, the poll handler is removed.
>
> This causes a bug where the device buffer becomes ready, but the poll is
> blocking on a sleep (potentially forever), because the buffer is small
> and fills up immediately, while the backend channel has more data. This
> leads to a stall condition or potentially a deadlock in the guest.
>
> The guest is looping, waiting for data to be reported as ready to read,
> the host sees that the buffer is ready for reading and adds the poll,
> the poll returns since data is available and data is made available to
> the guest. Before the guest code is able to retrieve the data and clear
> the full buffer, the poll code runs again, sees that the buffer is now
> full, and removes the poll. At this point only a timeout from another
> polled source, or another source having it's poll complete will result
> in the loop running again to see that the buffer is now ready and to
> add the poll again.
>
> We solve this issue by removing the logic that removes the poll, keeping
> the existing logic to only create the poll once there's space for the
> first read.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913341
> Signed-off-by: Iris Johnson <iris@modwiz.com>
> ---
>  chardev/char-io.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/chardev/char-io.c b/chardev/char-io.c
> index 8ced184160..fa9e222f78 100644
> --- a/chardev/char-io.c
> +++ b/chardev/char-io.c
> @@ -50,16 +50,14 @@ static gboolean io_watch_poll_prepare(GSource *source=
,
>          return FALSE;
>      }
>
> -    if (now_active) {
> +    if (now_active && !was_active) {
>          iwp->src =3D qio_channel_create_watch(
>              iwp->ioc, G_IO_IN | G_IO_ERR | G_IO_HUP | G_IO_NVAL);
>          g_source_set_callback(iwp->src, iwp->fd_read, iwp->opaque, NULL)=
;
>          g_source_add_child_source(source, iwp->src);
>          g_source_unref(iwp->src);
> -    } else {
> -        g_source_remove_child_source(source, iwp->src);
> -        iwp->src =3D NULL;
>      }

I don't think this works well enough: if the source isn't removed, but
fd_can_read() returns 0, there is a potential busy loop on the next
fd_read().

My understanding is that if data is read from the frontend, the loop
will be re-entered and io_watch_poll_prepare will set the callback
again.

Could you provide a simple use-case or reproducer where we can
evaluate how your patch improves the situation?

thanks

--=20
Marc-Andr=C3=A9 Lureau

