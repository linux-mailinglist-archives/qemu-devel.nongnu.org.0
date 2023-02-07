Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718068CB9B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 02:01:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCMK-0005E6-8f; Mon, 06 Feb 2023 20:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPCLx-0004py-3w
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 20:01:04 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPCLv-0004Ux-6Q
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 20:00:56 -0500
Received: by mail-yb1-xb36.google.com with SMTP id x4so16681766ybp.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 17:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PzNcsW8Hrl9l8KBKQzAZFcbFKkmOsrZjBk1wjPQHcEo=;
 b=BoZzkC/W4ciY44+B9zgXN3T71rr8TEjOxVb3EoQhy3wacA4e05IMlKqC9jA0zGjWMc
 qMf1kjForSwZpv3ZNmGVOFZhdmgKLAzZXjkQRV5mulqj6AyCtpCX4+uW5vG0jD0OEQUQ
 8Ozp4Y0zb19QH9JlQc0+meWyZpLkOcP0ZzHbzbEzILOuMTmcj6b3NsBZM8HhALTfozpr
 8HKZ66hyYdWAm7EqsrO8W64rt28Y8QYMW0Bu1pgJd6BBtrsLEFAFGk4aXDJ0f2i1yj6D
 pcgetaxLQupIn1oiVDEiwD5YbeehlSEprRBBhVyMIsFo0yFGsfLJFEMD9itK6jk5iovU
 59Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PzNcsW8Hrl9l8KBKQzAZFcbFKkmOsrZjBk1wjPQHcEo=;
 b=y1UN02EPwasbo2jEhEDX0zlocgmXJ/goNhmHdpqoQo0ZlUmgXgdLWLCNpM2uHiq8Mz
 zkYgGhUSfKLID+pV3F4tsJkc0XFNytW1wtg91gOsG2LYW7tD4GvXifbfajjb5rfoMfzL
 iDWrC+uK+U3RvgLyAUJmhlFtzJd9K90fjyI+lSWTTVJq8A1PEpx/obppcY7QRngupJ4F
 Z9dGxabuqJ1DhIHdT/Zg1cqBLpAF1HQjuYnZeTO2rfEEHbGIVy/e7irWxVBNA/q8MlaG
 jAWub+p4M5Rkx1qJ498TzK4joYQL/W08+k5K3QmnmeJHsJugGGQd+hlsJedeMR24QVi9
 UfgQ==
X-Gm-Message-State: AO0yUKU9hIVRsastew6tf+XSRauVp2T8GH3T1ob30qA/yQO0YwGJEERQ
 PRB1NUon+PqfjqnBzX9u0TIPtZ38VUaE6J55cuQ=
X-Google-Smtp-Source: AK7set/CL+ULWvMubc53ftoGDLBY5BEaWXiCB0xjXYoQvo2L7HQ26E5d5w/pbEPWGcJ4uhzWMBPzPNLGZSDOt+WySoQ=
X-Received: by 2002:a5b:ec4:0:b0:880:9ae0:2728 with SMTP id
 a4-20020a5b0ec4000000b008809ae02728mr164743ybs.366.1675731653914; Mon, 06 Feb
 2023 17:00:53 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CAJaqyWd+g5fso6AEGKwj0ByxFVc8EpCS9+ezoMpnjyMo5tbj8Q@mail.gmail.com>
 <CAJSP0QXyO4qXJseMzbgsVdXK-4-W4U9DxPcxr6wX45d6VBTeWQ@mail.gmail.com>
 <CAJaqyWczFwbxNWrZ8dcFHvYrV2=tH7Tv0Apf=qORT+gzDpBN4Q@mail.gmail.com>
 <CAJSP0QX+mpmdVE-13L9p=02_XbmPFT-mFAbz-JJjqB5V-2ON6Q@mail.gmail.com>
 <CAJaqyWd8EhfDmTtmLNzuoVDoF641Tq3LL1jvvdXK+DDbAfjccQ@mail.gmail.com>
 <CAJSP0QUFR_Nhd2dDkXJ_NjSo=+GNHFswztuGLLJ1QuokqOMUqA@mail.gmail.com>
 <CAJaqyWcBLOi5dggqVwhbNTFRRV24SOcHMUEDa6UDwN0RqXVMSA@mail.gmail.com>
In-Reply-To: <CAJaqyWcBLOi5dggqVwhbNTFRRV24SOcHMUEDa6UDwN0RqXVMSA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Feb 2023 20:00:42 -0500
Message-ID: <CAJSP0QU5eu+9_0gSamE_TvgN6roRzCWMprtiQ2GQnumXi1iskw@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Florescu,
 Andreea" <fandree@amazon.com>, Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
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

On Mon, 6 Feb 2023 at 13:48, Eugenio Perez Martin <eperezma@redhat.com> wrote:>
> Thanks for all the feedback, it makes the proposal way clearer. I add
> the updated proposals here, please let me know if you think they need
> further modifications.

Thanks, I have added them to the wiki:
https://wiki.qemu.org/Google_Summer_of_Code_2023

I edited them more (e.g. specifically mentioned vhost_svq_kick() and
vhost_vdpa_host_notifier_init() so it's clear which functions need to
be tweaked for the mmap Queue Notify address support). Please feel
free to make changes.

Stefan

