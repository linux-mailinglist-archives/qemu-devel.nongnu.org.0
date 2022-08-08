Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4F58D000
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 00:05:44 +0200 (CEST)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLAsZ-00004q-37
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 18:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLAnw-0005Zh-PF
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:00:57 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:37802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLAnv-0005LE-9Z
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:00:56 -0400
Received: by mail-vs1-f46.google.com with SMTP id 66so10214750vse.4
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 15:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=MYMpq50Lj4sB5ioqsEEIpFoxzNwYOht/BPUC/Cuk43I=;
 b=EzcwQHQ96LHtzUtLWyOafpZX5S2D7bTMu5pqkIt8SWb3LRLBvKZcqDLWXzk2/ohn2Y
 38guWJUHB1HjbR36xG6za4ujdl18EEUhgyvVFqwlsTPAnvGK2rpqARCl+1/v2GdUNuFn
 4ovx/Aj4tKJY6KYbuqnTkMQtXznG+rdQTZZmOdTafqPUz/S3UvpFhMMroLQvI3TqBkXM
 j75OXOZYMgGvwmgiXk76W7XZjoLq2P56Rv5WmbZ+iCME6v4vBczRhSFBIkUtdIFzpS16
 ggQZrqvh3RwkchqrvKDyA7rwllEDt7O03O3Wc7kPIXx2Oealn7/Fn9bsHgfNr28N3Ore
 P14A==
X-Gm-Message-State: ACgBeo0PqfeGejmEcZMG2W0mdF+awdc6XuQJb/cy9b3NsyWrL8XnRZIl
 XBMuXHpxahTVQpp8HWap2ONdw+1ma1wMVOLkHEY=
X-Google-Smtp-Source: AA6agR50Od8uv0VWwQC/MgVzdlBYaDNGTm76FCzpOo5nFfNjmPwJx56kCPB6gi8bLoQyasddO/PuBTa27n2jMO549us=
X-Received: by 2002:a67:e08a:0:b0:380:420:3cc1 with SMTP id
 f10-20020a67e08a000000b0038004203cc1mr8296298vsl.45.1659996054219; Mon, 08
 Aug 2022 15:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220805145617.952881-1-bmeng.cn@gmail.com>
 <CAEUhbmVA5RGmyZgW0HXyPAWaA2sqXFz4pkV-i3HSMD4wtUEzDQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVA5RGmyZgW0HXyPAWaA2sqXFz4pkV-i3HSMD4wtUEzDQ@mail.gmail.com>
Date: Tue, 9 Aug 2022 00:00:42 +0200
Message-ID: <CAAdtpL7thhSxTQrxJBGdEfVTkugB_51PCu_tfQj+=-_xt-+4iA@mail.gmail.com>
Subject: Re: [PATCH 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.46;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Mon, Aug 8, 2022 at 5:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> On Fri, Aug 5, 2022 at 10:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The maximum number of wait objects for win32 should be
> > MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  util/main-loop.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
>
> Ping?

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

NB: qemu_del_wait_object() seems dubious in case the same handle is
added more than once with qemu_add_wait_object().

