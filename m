Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB62B672D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:14:52 +0100 (CET)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1kx-0007s9-QB
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1ib-0006Vi-Tk
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:12:25 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1ia-0001sf-01
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:12:25 -0500
Received: by mail-ed1-x531.google.com with SMTP id k4so5873200edl.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 06:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYZ4Hss8nEz0dfl4Xs8GDB1c2drZEUgYBaWxDjRuOqQ=;
 b=Q6ObUDXSrEzBZaX1USOrhcFJjYd1pNcVjiwninUqNmLWobNxSZKcvNWdsa7KQnikrD
 G8SFDInhp2pAXXPPIT3SgWLJfnrbKZVUxXhLrr4BESlTf8qjGLk6PHM7ViAJtP5SOe2s
 jjISI/8uTEm7F/9RAskk69zeo5yjyJQo3aUFf/VD1/6JZdrhCZ29c5pkkOHCtVDnxNJd
 ogqkVrTqSeUSK1Ndwd4RjVI66kSZls0/u15m63riJ2KbxP4Hrg0A1L/JwbyIFEt2sUmC
 WtBOREhMsWrpbakJiuKoAe2ENTBoDqwbUXf3Iy3jr/Xx5Ohpa8p/I1xc7ItlujaI5oM7
 FqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYZ4Hss8nEz0dfl4Xs8GDB1c2drZEUgYBaWxDjRuOqQ=;
 b=GVCCoeqaLgGEaAarrWikCnyCMdgcKElH6J8kvh1881cbytMcnSrm1Qjr8lAzQa/VrG
 cmlZ+VnlN7n1hq4PSWw1vKdwfhq45kPkNjI9altgJ/Tgdofkn9XLqlRKj39+SaywwjFX
 WqBNCoPeMwakqYS5QAcFzdSAYvz9bOZx1bX9hughdZS0oYixkucPHRv+w4L23l3bZDlc
 FsJ/JY2auB2D7nZZ8TXzJKxn2ZACpNUQWpHAfPEI+doWgrebH1KIHqNcCVx30RFZX/5w
 M888Xb79nWxD6DUyACEVChXsmHja4S7+/3dBZygCln8jfL1Trc7TEz8f/wfEPZRaGe1U
 96qw==
X-Gm-Message-State: AOAM533tTvJG+Dz4IioZjD9NnsSpqsCRR2whibZDVd2pvSXuwr9mUMpf
 1y5GuLyyN22uqlp9DTL9yzUYHb9qhDK/Xsu4czH8tg==
X-Google-Smtp-Source: ABdhPJwiIcFeLAVw2qU1cpbdHmc1EcEwQ4eux/3kF+3p0CYAruQzHWcyWsejFllazVX9pg8xQPloIoj95PZa3+JIFFY=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr20642917edb.146.1605622337810; 
 Tue, 17 Nov 2020 06:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20201117091848.695370-1-mst@redhat.com>
In-Reply-To: <20201117091848.695370-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 14:12:06 +0000
Message-ID: <CAFEAcA-WEmprEY50zAmvjzHawHqTMd-M14=RPU4AwwPnW56m6g@mail.gmail.com>
Subject: Re: [PULL v2 0/7] pc,vhost: fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Tue, 17 Nov 2020 at 09:19, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:
>
>   Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 91010f0407a07caeacb11037bb5b493bab7ce203:
>
>   vhost-user-blk/scsi: Fix broken error handling for socket call (2020-11-17 04:16:55 -0500)
>
> ----------------------------------------------------------------
> pc,vhost: fixes
>
> Fixes all over the place.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

