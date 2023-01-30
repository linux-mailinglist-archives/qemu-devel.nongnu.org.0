Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D268161A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWlq-0005mM-1J; Mon, 30 Jan 2023 11:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMWlo-0005kg-6a
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:12:36 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMWlm-0006e1-TB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:12:35 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-4fd37a1551cso165705047b3.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 08:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wpSrX/s9TOStVHcGx5Jb4bjLgqV7r0jFGh7V2kckMUg=;
 b=fHpBC4MO31XnGFYQGwVWLe3yRHL9XZ4AzoGuKmsGt8r0hy9EoiCJf9Pengt3xOQKD7
 MnbxEkmXxJeohU7zHRtgFPi+LKlRtWHGVdj/ok1EEIkNlC1qRsLTTirxHrYn7QX5UAcF
 MpvtBIs9jQXPf7V+D4oHo97BiSpuHHU60Nt0oGNQHLEZEh1kcglugH0veeCpgcv4WbUJ
 I7NakT9HQPUX98VVlGNJeqJ4xHX5qxo32xLWEgP+JO50qyRaahc82wM/jkJOcAxrwkIG
 sepkIwcBjez898CIabfPya2VPB+8/Tm33VNCNmOlBAd2zXNkhkmsmujY4gNGM5/5z+O5
 6Rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpSrX/s9TOStVHcGx5Jb4bjLgqV7r0jFGh7V2kckMUg=;
 b=WGLcPZAZv3Y5/l/sZUMXNVHKO8hwyx9uvD3X6R/IQLRlyHV5staIhLB0uOgK9kPk+q
 0XRPjX22zZpEBt4OhsWMaYRlGLHeskkxyEgOMEZYUnhc63uizp4M1zdML38jnVCessyB
 Vf9RcVL0NEfnogQWf1MSs2Rchsihs0BkMozZPd+SIwmkTaRLJEJHRhzuWz62vUv14Sqk
 ldjTNoXMcV3ticlG+D6IYxAelIEgsZ2sKNg+3dhsi2rSt6uX5tLPTPY3e3W3i2KNJyKG
 ikrXCquQHD4qtZbV30/o2JwlP4/dLCrRIhuWSwcaKK2DVg+HaQATfwF3aPPNg5GDz2Af
 MIzQ==
X-Gm-Message-State: AO0yUKUEb/medbpM88bd+1feSBAvzdiQBliYVgRFT6t5dpyJ4Lf8zo+s
 QuKlhRZXilN7tqPX+xbj8U2Q9wqJ3DOCrO9qwyg=
X-Google-Smtp-Source: AK7set+9seSY0SCYL9PthfzB7cH3uchMdggURX1oJ9F+yb5jKQAiz/Tbpjg66FcifAttUuNMhBlQo/PtwJ1ZbD69Sec=
X-Received: by 2002:a81:4882:0:b0:50e:79ff:776e with SMTP id
 v124-20020a814882000000b0050e79ff776emr1437253ywa.206.1675095153733; Mon, 30
 Jan 2023 08:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20230130140225.77964-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230130140225.77964-1-akihiko.odaki@daynix.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 30 Jan 2023 11:12:21 -0500
Message-ID: <CAJSP0QX02UCc2oZmz_ZQdxd1sdpQxZGmk4LOhjx1P0G3rN8VzQ@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-fs: Back up vqs before cleaning up vhost_dev
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, virtio-fs@redhat.com,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 30 Jan 2023 at 09:03, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> vhost_dev_cleanup() clears vhost_dev so back up its vqs member to free
> the memory pointed by the member.
>
> Fixes: 98fc1ada4c ("virtio: add vhost-user-fs base device")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/virtio/vhost-user-fs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Merged into my block tree, thank you!

Stefan

