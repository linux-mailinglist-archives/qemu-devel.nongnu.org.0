Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C938069DED4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:28:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQoM-0000UY-LT; Tue, 21 Feb 2023 06:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQoK-0000Rz-PU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:27:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQoJ-0004A3-60
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:27:52 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c1so4900633plg.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0s0VL1YH65ntfDy3fXMBFn+sJNR2U5+/VIiIt1BDbnA=;
 b=KfX1MG39fvihDekAdyC/MuJWWTbn52n4ANHmAjHhLBYUM43/gabfGPRY7iNTd0e8Lx
 zDY+jwvYE8lNEVTVDIsKdoIj9alkFPT8RchHDVh5PEg1RMkYWNrVJUnbeGA4/9ctmCdd
 GdukwL6OkEN8IW3pYnWcO2fTPX2EWy3Ioqk8YB1jde4l1/MSENSZW2mrZ1/zcIAEWcWs
 VGyYQxfI1poouRbMmZYjvLf6GrhqH2PheZbFA9oExmusmQVO8snzJJv6m8qUCWCFZmGr
 MFb4+in2aL4oOBqgKfldUUahVxQedNO8Kj9242v3Pv6S1fmHUZQOGcffqXVXs82vX+Hq
 x1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0s0VL1YH65ntfDy3fXMBFn+sJNR2U5+/VIiIt1BDbnA=;
 b=np9pt7s3iSb6EbIoOGOi/af5umUj29gme93PYfPSz41J3iPS2KlRTLbEZFhHprqNCB
 toO6rDWoZinMzYRIdv3WJ9ajDbFLReXGA9zBru5s+eLQ1p6nPb1l03BSlhIzj80SmYta
 uREj8E7QsXYoyR3zbGkliq3WwgKFsE0325scZX/yC8KLzQm5HaNcVbImYloMqdfkiBjs
 LASoKj6OekRKjy2oKWi4yzKfxsfi0W0XM9JRVJvr9FuNzrvWYqYTF2+8iF8guqW2Y+VG
 LC+1PCe9cMbD0F55jFpdIFAjKBkQrasHohroWOLsOvszDHgvj/gcI6osi6IrMxX6oGaH
 wqWQ==
X-Gm-Message-State: AO0yUKV1Nvu1aBViAtH/zr4eWjmSwNIhov/KArJtEkGyLYTLyvkHV7hG
 C2rESWmugiJK/zdSaPQqRHXJWYF2XH2XHZ8+Qk2tjA==
X-Google-Smtp-Source: AK7set8LO3lfFKhJtSa8p7mahaezHtAY+b6ild7Zj6fHPdhu/tzJZVMSE42KWLvmfmxn2ToL0yAzNK+Qi5yoqePlMK0=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1652488pjb.92.1676978869794; Tue, 21
 Feb 2023 03:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20230216182628.126139-1-dgilbert@redhat.com>
In-Reply-To: <20230216182628.126139-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 11:27:38 +0000
Message-ID: <CAFEAcA-0=iENOFkL5mPeDmkPkfKN0Xc7wEAqBcErT3TRB5jfZQ@mail.gmail.com>
Subject: Re: [PULL 0/4] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com, 
 vgoyal@redhat.com, gmaglione@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 18:27, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:
>
>   Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20230216b
>
> for you to fetch changes up to a6bfdaed4a735a2cf59f265e6955fe2adcc99637:
>
>   virtiofsd: Swing deprecated message to removed-features (2023-02-16 18:15:08 +0000)
>
> ----------------------------------------------------------------
> Remove C virtiofsd
>
> We deprecated the C virtiofsd in commit 34deee7b6a1418f3d62a
> in v7.0 in favour of the Rust implementation at
>
>   https://gitlab.com/virtio-fs/virtiofsd
>
> since then, the Rust version has had more development and
> has held up well.  It's time to say goodbye to the C version
> that got us going.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

