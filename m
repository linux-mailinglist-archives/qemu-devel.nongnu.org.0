Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25B55BFB41
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:42:44 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oawFg-0006WL-4J
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaw9O-00009U-Pn
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaw9D-0001nf-OS
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663752961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZFTW0r6UUot2dE8h26vsyHrFSDXKwCu2Pv0MB1TZl18=;
 b=H5gIYr53oBmKthIxVnS1ZWbJ2NR7pNu9XYkIe0R1cfzZFlS0I9ySqXn4+ZF+xh8Gc8X9cq
 ZHwSI6eOA76oOkMKKXEgsYxtmXsAjPPwMLxGF7ypOsGtnwBJKmqHMQJfbvfgNOi406afFr
 MYrKhKNSDko4mNU15FRoDb73gdPApI0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-P2II_J5QOCaugcNmPP-P1A-1; Wed, 21 Sep 2022 05:35:54 -0400
X-MC-Unique: P2II_J5QOCaugcNmPP-P1A-1
Received: by mail-qt1-f200.google.com with SMTP id
 j25-20020ac84c99000000b0035bb13ed4ffso3760491qtv.23
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 02:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZFTW0r6UUot2dE8h26vsyHrFSDXKwCu2Pv0MB1TZl18=;
 b=pyywTXrpF6np+Q9hKoOoKl7asz2T8z4UtQUrNPAABM/wdfKHBcBxdkoCWbY453++JT
 OiGDuAKP4aEKcUtne+IDM6Tobxd9ZQzGgvyvvn5Lc9gndDlQIJAJfFytUmydpqWc4Qla
 cZdYWIPFR/J2oj2c4uqgenWqKppNU0c43Xb6hTOZy4OnoyuwMZQGnV4jgGVo3Hpkn4e/
 6LBbKyXPQB6pAncq/eYLcqEWJvOXU3CtLVPqjDiEMUu3Cj2k+xFmcY3MVlCam7a9wWog
 Nqshwkq2OZ/HEvleEs69S5zzx3IW6V3ENSXgKQba/t0nj5Lh3wVq3EhmAIy96R4bqx0T
 PqCw==
X-Gm-Message-State: ACrzQf3l1T1xqegeixvyhh/jBGgrdNtgG50pOSWanfbPR8+F03lL1TDH
 PQyXZcbgIPeHr1BnS8mKI2Ni/k426TZcWWPa3a/5dXUc6/9cEhRbgwuXVNlrxQYvgyeR+pyE+I8
 nTI7yaEvGZZKLKGM6QYsAlu2bLXJ2hNI=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr12968350qkb.144.1663752954220; 
 Wed, 21 Sep 2022 02:35:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6tjdnPfaVcoTtuTmZvVW7d6LQNmsWniVW3laCY0iXyKbaEvUl9Ogk/hRN0JoTINV7Nvi9IfUdoNOvmyXhbsn8=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr12968344qkb.144.1663752953982; Wed, 21
 Sep 2022 02:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220913234135.255426-1-Jason@zx2c4.com>
 <CABgObfbUEPGshiy4_658E2_sNNGFJYnJq34Qvx9G60OAvHm0Bg@mail.gmail.com>
 <CAHmME9qv=fXCu81fLhnRN4V07hSeuMP2L-9mLPHuNkGWjqD6jw@mail.gmail.com>
In-Reply-To: <CAHmME9qv=fXCu81fLhnRN4V07hSeuMP2L-9mLPHuNkGWjqD6jw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 11:35:42 +0200
Message-ID: <CABgObfbjeE0wiFVsNQ64LMaeL0MXMZrqN2yWmhhyzCRSVuH7Bw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86: return modified setup_data only if read as
 memory, not as file
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 21, 2022 at 11:12 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > Also I think it's cleaner if a reset callback puts the value back to
> > zero. fw_cfg already has fw_cfg_machine_reset, so perhaps the easiest
> > way is to add a FWCfgCallback reset_cb argument to just
> > fw_cfg_add_bytes_callback. If I am missing something and it's not
> > necessary I can do the cpu_to_le32 change myself or wait for you; in
> > any case I'll wait for either your ack or a v5.
>
> Actually, the idea is for the change to be permanent, since that
> represents how the system has actually been booted. Are there
> substantial changes possible to the firmware configuration on
> fw_cfg_machine_reset() that setting this back how it was would make a
> difference? Or do we benefit from having some consistency?

It's not a very practical thing to happen but I guess you could boot
UEFI twice, but the second time go to a CSM which could use the
setup_data. But really as you say it's just more consistent if reset
brings everything back to the pristine state, unless there's a good
reason to do so (which you agreed in the next message there isn't).

I'll queue v5, thanks!

Paolo


