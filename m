Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7353E45F2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 14:54:02 +0200 (CEST)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD4n2-0002wX-Ek
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 08:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD4la-00029g-8f
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 08:52:30 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD4lY-0004bS-2t
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 08:52:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id u3so28795016ejz.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 05:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylNlx1iTYZURTJnJFQ/l+a5Bs25gia8/nNGhAgdrgmM=;
 b=oDnUG7G4+4Qq7o4SIwD3LN5BA8CP+5Lfs9ueWgA1C2njnrQ972aRJmMXp2an/zyqJ5
 CCr5BYnvTCNmm6FjTy/XhTQcp9ISdMiFUO8QoMNmoWldMTWwThwiwCdhxozcBtQKWSCw
 j5ZqRGr+F9iT6EvkRokUtVoEMIC3peMqF8XFLVcjDGV8IXstppvXgAvSe/I3sndCW5gs
 0raUdl4iVgMiu+jqFnKYNq7FKyjJxJg+yt035CswtpJ+GzUOwbJVupZKosjTHVaamDvl
 AXRU0mRYp/+ZkZF5CGenL9OtHrLyYSpKZT3xCXYrkwhn3bFdPNOq8mKLSanp5OSuuetX
 A4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylNlx1iTYZURTJnJFQ/l+a5Bs25gia8/nNGhAgdrgmM=;
 b=l7aYofkoo/X0gkYfTbjgdkg04W63F+OBPDcrdOAaR4EhW9y3YQyxkbChwdqCp86M7w
 iQ2dP+98FQlKrTxzbb6/9Xp7jh9+Wn9EE0A+0LJcx9HJL2fqa/RCgzKl/cPTuFOYFyU3
 5mxl1dxnbEe7mAsuHXtF8kT6ifbGuEgOglU1dFWNJOTeDeMF1t+LtEursud2DT+/LdNH
 ululIW5DfpIz35nBBw05gEVFRA6sgAA6GwvBelMOJ3lz2GFQozNNweFe1hJtaVodeU4T
 l86BLm17fRJlgMvhbF9RpKYFZYVbF70w23k1754pPEVosIe89umOojWtDCjaBTyfnh3G
 xCPw==
X-Gm-Message-State: AOAM533XIQp1dI/UL7/Gkf/avfMZG77BtujU+aGJ2jvlY7mp5CZosSb5
 z/vXf6xwWtMXBxq03f+6QEsxVZJXvWCw3MaQ2iI4VQ==
X-Google-Smtp-Source: ABdhPJyhtIgKePkD76HWdgD/P0HPtD7sGrLuRjKjRuhGOx9hjJozOXUQTvy3kOioX/0hTLwzONsn4KTyk1ivxDQnl5U=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr22089826ejb.382.1628513546337; 
 Mon, 09 Aug 2021 05:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <1450457600-19865-1-git-send-email-berrange@redhat.com>
 <1450457600-19865-4-git-send-email-berrange@redhat.com>
In-Reply-To: <1450457600-19865-4-git-send-email-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 13:51:41 +0100
Message-ID: <CAFEAcA-up+A8iG2eVhHmHPpFeZiLy=kUHTvye2Uz-+4W9sFuCQ@mail.gmail.com>
Subject: Re: [PULL v1 3/5] qga: convert to use error checked base64 decode
To: "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2015 at 16:53, Daniel P. Berrange <berrange@redhat.com> wrote:
>
> Switch from using g_base64_decode over to qbase64_decode
> in order to get error checking of the base64 input data.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  qga/commands-posix.c | 11 +++++++++--
>  qga/commands-win32.c | 11 +++++++++--
>  qga/commands.c       | 13 ++++++++++++-
>  3 files changed, 30 insertions(+), 5 deletions(-)

Hi; this is an old commit, but Coverity has just noticed that
it introduced a resource leak on an error-exit codepath (CID 1460005):

> @@ -393,10 +394,19 @@ GuestExec *qmp_guest_exec(const char *path,
>      GIOChannel *in_ch, *out_ch, *err_ch;
>      GSpawnFlags flags;
>      bool has_output = (has_capture_output && capture_output);
> +    uint8_t *input = NULL;
> +    size_t ninput = 0;
>
>      arglist.value = (char *)path;
>      arglist.next = has_arg ? arg : NULL;
>
> +    if (has_input_data) {
> +        input = qbase64_decode(input_data, -1, &ninput, err);
> +        if (!input) {
> +            return NULL;
> +        }

qbase64_decode() allocates memory. We free this in the
guest_exec_child_watch callback, but moving the call to
the base64 decode function up here has put it above the call
to g_spawn_async_with_pipes(), which can fail and whose
error-exit codepath doesn't free 'input'.

> +    }
> +
>      argv = guest_exec_get_args(&arglist, true);
>      envp = has_env ? guest_exec_get_args(env, false) : NULL;
>
> @@ -425,7 +435,8 @@ GuestExec *qmp_guest_exec(const char *path,
>      g_child_watch_add(pid, guest_exec_child_watch, gei);
>
>      if (has_input_data) {
> -        gei->in.data = g_base64_decode(input_data, &gei->in.size);
> +        gei->in.data = input;
> +        gei->in.size = ninput;

The old callsite for the decode function was below the call
to g_child_watch_add(), so it could rely on the watch function
being called to free the data.

-- PMM

