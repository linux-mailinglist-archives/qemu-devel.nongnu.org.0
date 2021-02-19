Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49431F742
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:23:03 +0100 (CET)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2wA-0006RD-HE
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD2ul-0005Ey-TW
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:21:35 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD2uj-0007Al-Dj
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:21:35 -0500
Received: by mail-ed1-x533.google.com with SMTP id p2so8844817edm.12
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MyurctJcYNwei3l37yYr+W4iajst+2WIIz6R+a1StOE=;
 b=SS9yzFxKRBvHR49NG3GaNLboWgxkFKVpYnUN1gov8tVfpxQv9koznW6Lzspfl1Za1S
 qNrQhZAaJUf/wOiYXm1i0Z8P8RhZ15fRTl4z5ZgisOX/omVe+28zRmMSvWVxUXY0LBiT
 mHioEat/wyuMxQFPuGSfemDnqgQlsj91Cn4PJP+GKZbdrMhLcWInYGonbw/yNNHTpljC
 61WuofNLjEwDrCHYojUloMmOpaYW4Zv2S3fXA//1sayll4OjFM7rftc+KizbVLGpvzWg
 +7qLsLEX3Y7wLYLSpq7vZzcdfbAw/7vMq823rC70SsqsFPowH0Gg1EPwOednAJGYp78g
 sPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MyurctJcYNwei3l37yYr+W4iajst+2WIIz6R+a1StOE=;
 b=homa1Jcjh0pg+HqjLh3QoAhX+ygjhizQKZAM1bi73f1wDKoPUKY6xjmn5uIKYb42Go
 uUe2e4FUIgFOEeIAv1zT1cwoIiPheAxo0DPDQ3FQFqHZg8nogkyLvJkZs+pG6O1KDbSJ
 NJih7+CGBQ+6n5/5jRtcXd34iUwJ7vRhWIND56C/xkhYpR8NHYUvAsJfg7+zZ17OMxWj
 0qnXt87zIA2a4MZQ74anCmGnxAXlDvkU4QXmlZe98+GP4V/h/kXqncwKkcaKkJLqQsOd
 MFFaBq4v/c6QFwvzGvjT4TvRYyzOiyd8/StFb/1sjceBLrqCgpaVsImwH1aA3RbK8c6P
 V5Hw==
X-Gm-Message-State: AOAM533Q+PkMsPbatqHdt9o/yajlFvJmMFt229IOEdNCC+eCAeTgDjwG
 Bwgx9HHimi39IQMob+KHnuIRbOp0omEKi4zVV2p9yg==
X-Google-Smtp-Source: ABdhPJyCsK+M6quhvVF/LYPmmh8fZXgPBCB6QPmNrru0O5UXRfdSBBtPxKlJwpIl4W0WA5lq2K9+21TglYUOZdFAHAM=
X-Received: by 2002:a05:6402:545:: with SMTP id
 i5mr4964814edx.44.1613730090791; 
 Fri, 19 Feb 2021 02:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20210219084618.90311-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210219084618.90311-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 10:21:19 +0000
Message-ID: <CAFEAcA_eKtZ--p=S9P7_9cEDxfvBVsb_aP4p6Luc+9XutGDxYA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not exit immediately after shutdown
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 08:46, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> ui/cocoa used to call exit immediately after calling
> qemu_system_shutdown_request, which prevents QEMU from actually
> perfoming system shutdown. Just sleep forever, and wait QEMU to call
> exit and kill the Cocoa thread.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  ui/cocoa.m | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 13fba8103e1..65bb74134ca 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1121,7 +1121,7 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
>      COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
>
>      qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> -    exit(0);
> +    [NSThread sleepForTimeInterval:INFINITY];

I think that as it stands this change is probably a bit risky,
because the QEMU action for "what do I do on a shutdown request"
is not necessarily "exit" -- the QMP 'set-action' command allows
a user to configure QEMU to just pause on a shutdown, which will
result in this loop going forever (or until OSX gets bored and
forcibly terminates the process).

It would also be useful to have a comment, something like:
 /*
  * Sleep here, because returning will cause OSX to kill us
  * immediately; the QEMU main loop will handle the shutdown
  * request and terminate the process.
  */

?

>  }

Gerd: I notice that the only ui frontends that try to do this
SHUTDOWN_CAUSE_HOST_UI thing are the Cocoa UI and the SDL2 UI.
The GTK UI does
        qmp_quit()
instead; the SDL2 UI does
        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
(presumably to avoid the "maybe the user told us to 'pause'"
issue I mention above). None of the other UI frontends have
any shutdown related handling. Shouldn't we be consistent
about how we do this ?

thanks
-- PMM

