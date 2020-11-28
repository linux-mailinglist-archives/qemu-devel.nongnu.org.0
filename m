Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B192C70DC
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 22:00:34 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kj7Ka-0003pS-Qn
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 16:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kj7JO-0002xV-Gm
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 15:59:18 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kj7JN-0007gC-2c
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 15:59:18 -0500
Received: by mail-ed1-x529.google.com with SMTP id c7so1848246edv.6
 for <qemu-devel@nongnu.org>; Sat, 28 Nov 2020 12:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3k2dnUujf/J7aCCveXHKbnReXhCc85LZ2sr3SofDNB4=;
 b=gfN7UlCRUWLtDhm3CxCLyxWlWuB54pr0PLpFStNodkDGaW+Gbc++CK/j0PTDZYbeyz
 IsVw3SiSP3aR98A82N0SBQ0Uuc6GT8U1uILDfn7IATs9Nzm1XxGM+i16UgvInURexPcu
 +MG7hqkK76ufZ7aapEwlCz9INTBcq0Hg93qELRQ2glMbrq6cEnaZIT/L8NKOl+yP39gU
 qpy2NU9lJqHG/C12lQjliZhr8QVfUFATKR76xg2yDl/U1jQ6/l4V2dRdWD046lhj8qb/
 ajRJFl+UnVj8CdbOG+xFyUCyeBJotiMpRehxoqwBIuuCx0YBPAgWZ1uea2zIwx2SdSKG
 9frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3k2dnUujf/J7aCCveXHKbnReXhCc85LZ2sr3SofDNB4=;
 b=XgN8w8DwCYj6bBEez/D17rBnifxBMhlprO3zaVLEwXs/gepP0cJgV6E7XBH4SHAT91
 +2RW6bY1tu8G3z6bDXVfGeH8bv9FGlbh6ja6bXk/M3TIC7EoFFgCK9tPBLk0ElZI5raV
 WBd/vZp0G15bFPdTj7UTW74PoUvBwgiWFPNZZ81YDYbzAmTmx6K6jgmyhGeo6egujDql
 +L2NKEQ9pNzTd2Me0+xTw0BkR5xF4KpUYMayC63CLiMNnZs4YxsZLRjL9NrCRPOo+esF
 OtFYR8ESuT3dMPh6YLH8I0qqDk+uiXgDoSacxaZh5n6PwbZiLZw5mS17+ut6BpHNcxLI
 TMtQ==
X-Gm-Message-State: AOAM532diOLyzfUGgjUUZEucvfR4LsmSSQJH8Ey4Mh/aQUfFsMJyClFN
 yLJbJUKTS17dpNpLgAp/oZR6YtVm3jX2+nv8rO5pcA==
X-Google-Smtp-Source: ABdhPJxigKW/tM8Y9Ogsz7b6JMarUJsm8p+tLwUlYulKjnKLaPqzoS/x/q08+k+mLanYuRFVi10b8HVrWvIjbhZyniI=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr14434356edb.100.1606597155217; 
 Sat, 28 Nov 2020 12:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20201127154524.1902024-1-philmd@redhat.com>
In-Reply-To: <20201127154524.1902024-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 Nov 2020 20:59:03 +0000
Message-ID: <CAFEAcA-4hLY16ud+B2MRKM6RFSNM4zKRhzMb7Zm+_zDOhNwA9g@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2 0/2] net: Do not accept packets with invalid
 huge size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 at 15:45, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi,
>
> This is a simple attempt to avoid the following pattern:
>
>   ssize_t pkt_size =3D get_pkt_size(); // returns errno
>
>   // no check
>
>   send_packet(size_t size=3Dpkt_size); // size casted to unsigned
>                                      // -> overflow

"RFC" and "for-5.2" are not a great combination at this point :-(
What are the consequences if we don't put this patchset in 5.2?

thanks
-- PMM

