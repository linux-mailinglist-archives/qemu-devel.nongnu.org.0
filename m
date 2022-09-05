Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54135AD12D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:07:44 +0200 (CEST)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9x9-0000cg-7A
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oV95U-0003Z2-5o
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:12:17 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:45600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oV95Q-0004E2-Bh
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:12:15 -0400
Received: by mail-io1-xd2b.google.com with SMTP id z72so6480596iof.12
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=lcIZFyVx4K82gp+OBSRoTLB8tYeWTqWQiUsiGyAdzRU=;
 b=4V0d/G/RzIm7XwLxs7ZEV42MzAiKEPvMIACYuXPRjqtv6xHUXD92R1wMT5mGGA9GWm
 jwWyBYT1vtceN6ZuWvQo3IOzzA5dZKenJul6HbbXaUpaRyBE0mdta+/E9okHx1I/p9YE
 jvLgoebp37AkrhP7Rf4ZxdflPNd/grVo1hryiFguHdODgYp8sxlrS9nveOK8MQDmeN5f
 gbJFgesAar6x8ZE2PfUTH5WsNchMqjFH/adO9RIh5GqM6gJrXgnpznkVEJan/SV17e8C
 I4eb3QGW2WGj/KNvyelZ2r4aiufHokKgEpBsdprljfI30HC4zACzqCYfYXRAfJcURAtk
 KGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lcIZFyVx4K82gp+OBSRoTLB8tYeWTqWQiUsiGyAdzRU=;
 b=qfmrLxq6IZafRAEQqls4wdd+GHQWC+OXI8kpxWSxYNjiDKDTh8RBn4fqun4VW9qYXd
 P26O/gHYz/CcQoKcBS0i+wYxlZQec5N3OOZQGv6O7Of3QrQqwTTtXBKXvh0Y0Izy6mZc
 OIt0gRtiv6tiApFi25x966tERSZmLzgmV+ZhuFMux6I7yAPkHTOveJik9eLQqmT2OyLW
 99vKBnq8fYKFp/CwIcpP4x/h6zj1gkrfm9UTKsSdFEUhIZbqvT3IX83yBbne2sD2//uk
 TIEj54pedr7Rr1wIhFZe1Vmp38Y24XqbP0JMk6tpKBegz70RKjaOLmjmQrWlPyeInGEm
 BZ5Q==
X-Gm-Message-State: ACgBeo11N/pEJ5H0AwwFZFd7XozJ2hLtN5b7njY6mS505E5ay1hioSxI
 DQOhxuFeHu/q/97gThYMdTJ1usuNEI11MEruuONxeA==
X-Google-Smtp-Source: AA6agR72VXtQR6aQGWQdz09MAiD2Oj5b6nRdYrsdsoUkK7Gqij5H2Ijg0rVvgRGW9m3JpkYk8i0Sv/9MKGoXB7n5rdQ=
X-Received: by 2002:a05:6638:2486:b0:352:69df:1576 with SMTP id
 x6-20020a056638248600b0035269df1576mr2695703jat.261.1662372730673; Mon, 05
 Sep 2022 03:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 <875yi2mat1.fsf@pond.sub.org>
In-Reply-To: <875yi2mat1.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 5 Sep 2022 19:11:59 +0900
Message-ID: <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 5, 2022 at 6:26 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>
> > On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> >>
> >> > pci_add_capability appears most PCI devices. Its error handling required
> >> > lots of code, and led to inconsistent behaviors such as:
> >> > - passing error_abort
> >> > - passing error_fatal
> >> > - asserting the returned value
> >> > - propagating the error to the caller
> >> > - skipping the rest of the function
> >> > - just ignoring
> >> >
> >> > The code generating errors in pci_add_capability had a comment which
> >> > says:
> >> >> Verify that capabilities don't overlap.  Note: device assignment
> >> >> depends on this check to verify that the device is not broken.
> >> >> Should never trigger for emulated devices, but it's helpful for
> >> >> debugging these.
> >> >
> >> > Indeed vfio has some code that passes capability offsets and sizes from
> >> > a physical device, but it explicitly pays attention so that the
> >> > capabilities never overlap.
> >>
> >> I can't see that at a glance.  Can you give me a clue?
> >>
> >> >                             Therefore, we can always assert that
> >> > capabilities never overlap when pci_add_capability is called, resolving
> >> > these inconsistencies.
> >> >
> >> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>
> >
> > Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
> > they are clipping the size of capabilities so that they do not
> > overlap, if I read it correctly.
>
> If we want to deal gracefully with buggy physical devices, we need to
> treat pdev->config[] as untrusted input.
>
> As far as I can tell:
>
> * vfio_add_capabilities() replicates the physical device's capabilities
>   (starting at pdev->config[PCI_CAPABILITY_LIST]) in the virtual device.
>
> * vfio_add_std_cap() is a helper to add the tail starting at
>   pdev->config[pos].
>
> Could the physical device's capabilities overlap?  If yes, what would
> happen before and after your series?
>

When the capabilities overlap, vfio_std_cap_max_size() and
vfio_ext_cap_max_size(), called by vfio_add_std_cap(),
vfio_add_ext_cap() should clip the size of capabilities. Comments in
vfio_add_std_cap() and vfio_add_ext_cap() say: "Since QEMU doesn't
actually handle many of the config accesses, exact size doesn't seem
worthwhile."

Regards,
Akihiko Odaki

