Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F14C2C48D6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 21:07:20 +0100 (CET)
Received: from localhost ([::1]:48374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki14O-0007dC-SY
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 15:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1ki0yy-0006Kp-JD
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:01:40 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1ki0yx-0007wU-0s
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:01:40 -0500
Received: by mail-lf1-x141.google.com with SMTP id r24so4820383lfm.8
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 12:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=orwCovy0ImC1MhuqL1IR6Rp3bmHckVCHPQTZU9Co5Tc=;
 b=uYD0qiR+UGQ7fviBxCUhL6P0aOmqjPqLD0xryYHHVqKvyxplUaVvhEf1Ma0vmuy3K8
 nyunXo3p/rQZId90kIjkm/gsob08+b+WOxXJu7sdyyE8lHzQhPMWws+u9wIgA/P+H/mQ
 AxUDYapd7gBG3Nz7ZXxWI7PrqCYW2j24ymblCdr3jkTMUPOJ61arPnz1+KEBkGVln8A8
 3JqCFqyzoZDOQ+2DPayteytiLrus3ZaxRnLeTWeuH7NVFCoHaqhd2YqhOdIFte1v8Oz1
 LvaD3ukoLTUqyvtGz2BCg1YijM4GS3fU15dkp8O/S9zU1FyLewLPAgdM6J+YtvVh9eCI
 r2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=orwCovy0ImC1MhuqL1IR6Rp3bmHckVCHPQTZU9Co5Tc=;
 b=ocWSGxPmYGAhr/WJ9x5R6ISPLHdc7fql95TKcJ4gCt5o5ygofDcYzfdL0MmBG3cglO
 w1mtUlLPgkj2A8L0DVyJdZ2RAGGqEAap+uybil/LOXG0q2QKVVHpn6WOrMsIXEmx82xz
 cs0XHkQKIkZ7+vpIZHN0VBk00lctF2AIpX/Jmv9c+o261sFrUFGYjvTibG5SUugDl47E
 EVpItBzwmdOh9gMSPNjlUdKqfyRTss62KV2/zshmKNK6c5LUUX1EugP69qiZCGP9223p
 8kC+rSQDJnGQxZA+clykzZdvaUJ7L6UGrX6/NLqBZJoNwFNhCQ1npFCFYF9LT1SKp1Nw
 j6Hg==
X-Gm-Message-State: AOAM531kEnlDWdaQTqeDMMGH5dqASP0VYSqhDLvDTc830SIX0FSFQcKC
 e4JSQYclwB5du/9QDUXUvUsh1CGxmCuYK97IntM=
X-Google-Smtp-Source: ABdhPJzgqM8dB2RNAeSQKuyYlBA6BFZMxYoxI8G2PLwAlgnlWAFXOrWQ6Xm6xwtIgKis9RsaxLpAe0Lg+QCkmbyPn3A=
X-Received: by 2002:a19:3c5:: with SMTP id 188mr199020lfd.202.1606334493186;
 Wed, 25 Nov 2020 12:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20201118203824.1624924-1-fontaine.fabrice@gmail.com>
 <20201125120630.oey76zk2kfyr5epa@sirius.home.kraxel.org>
In-Reply-To: <20201125120630.oey76zk2kfyr5epa@sirius.home.kraxel.org>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Nov 2020 20:59:00 +0100
Message-ID: <CAPi7W83GXdMH4UrQRMBwaYTTTowKtDo_6ZbkMsY89qamd-jNNQ@mail.gmail.com>
Subject: Re: [PATCH v2] Fix build with 64 bits time_t
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le mer. 25 nov. 2020 =C3=A0 13:06, Gerd Hoffmann <kraxel@redhat.com> a =C3=
=A9crit :
>
> On Wed, Nov 18, 2020 at 09:38:24PM +0100, Fabrice Fontaine wrote:
> > time element is deprecated on new input_event structure in kernel's
> > input.h [1]
> >
> > This will avoid the following build failure:
> >
> > hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_sta=
tus':
> > hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no=
 member named 'time'
> >   198 |     if (gettimeofday(&evdev.time, NULL)) {
> >       |                            ^
>
> Fails to build (rhel-7).
>
> >  - Drop define of input_event_{sec,usec} as it is already done in
> >    include/standard-headers/linux/input.h
>
> Maybe these are not used?  So it breaks with old system headers?
contrib/vhost-user-input/main.c is including <linux/input.h> instead
of ./include/standard-headers/linux/input.h, this could be the root
cause. I'll send a v3.
>
> take care,
>   Gerd
>
Best Regards,

Fabrice

