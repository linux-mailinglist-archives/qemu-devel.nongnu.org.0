Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A683F481B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:01:47 +0200 (CEST)
Received: from localhost ([::1]:36510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6m2-000310-EQ
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mI6jl-0001qf-1c
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mI6jh-0000DK-Ka
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629712760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYZBzX1W/bVZOxenehJUAlFfxU2B/H4ByJg9uUgV3MQ=;
 b=aYIp1ZPTINRtPWq7PgsqWNDdnrn+xxAnEPsACPMcposHEt/rE76KfRXNuDg3/yuLjbcDIZ
 YRbTTH0oJQEqnwpw9j714GKQmaTfdCsxj68pZdMlP3/Iqm5trO463vlHSvsvsh+sGDyYiO
 9P2MqfzVEau5RSSNzZILeZG6pviiuY4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-H9m7NaqdNAe7PZDw4nX8rg-1; Mon, 23 Aug 2021 05:59:19 -0400
X-MC-Unique: H9m7NaqdNAe7PZDw4nX8rg-1
Received: by mail-pl1-f197.google.com with SMTP id
 p21-20020a1709028a95b029012c31764588so4095186plo.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zYZBzX1W/bVZOxenehJUAlFfxU2B/H4ByJg9uUgV3MQ=;
 b=W+nb7RzwOgz2bErGTVvL+WjeLU0KOinBuzMI/9HSaXFsboNFSZ81Y1F3qjS0BFSYlc
 4uN2iiJSDFts6sQp2M/siT/0xX/gBzE4WKt+Fg+PufE+1Uz4a2kszVrkMXSGQ6iR5Mh4
 2tHtw/8y9BuSSd/T0sOxGRgmR/G7xRdKOXN91G9drV0hID/B+l9uTEoP6EP1XF7Xfljg
 uFeu10rYGQ9KNXLoYz7EhLAeYKwSJYd8r/M9jyVE0znIevKq4BSv7cBpvlrbIsCK01cD
 RayfBZxjCrs3zezkD+8zuNLjXcH21v4wmN4YFjRdox/q8EurUx4xrq2eWlmk6hQnKCi8
 Ta0Q==
X-Gm-Message-State: AOAM531rp+UX/sIAUVkG5fWObiMoEM7a3pgBA4N6+yfw/If6EGLnBpgW
 ZWqS/hOPoMmm2mXiAqw420FruIbczaH96TmCoQ9H45UcSwYFAHZyJUlH4QE+SStTIH8sVhrHIAY
 8w9GleuTNdRbhfjjOP55PHjKMPmdy6a4=
X-Received: by 2002:a17:902:ecca:b029:12d:1a3b:571f with SMTP id
 a10-20020a170902eccab029012d1a3b571fmr27572833plh.37.1629712758307; 
 Mon, 23 Aug 2021 02:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsyd+9TZ1+PriaZnqHT9WSyOIZOgsmsj8EnI8QdmAx8qofmfn2WtinQiLJ169TyzhYesfk5NoeRZDEztoBUNw=
X-Received: by 2002:a17:902:ecca:b029:12d:1a3b:571f with SMTP id
 a10-20020a170902eccab029012d1a3b571fmr27572823plh.37.1629712758043; Mon, 23
 Aug 2021 02:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210818120505.1258262-1-kraxel@redhat.com>
 <CAFEAcA_-wCZQv8bSpUoROzJCz5ND6_5DG-FKOXDSOhEcptqF0Q@mail.gmail.com>
 <de938d0f-7de6-d34e-5f48-c4b6346545f4@redhat.com>
In-Reply-To: <de938d0f-7de6-d34e-5f48-c4b6346545f4@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 23 Aug 2021 11:59:07 +0200
Message-ID: <CAA8xKjXQOKGAQ3Lkrw4TDWd1wPyUOCZ9PzPc_fdw2uC6S62eRg@mail.gmail.com>
Subject: Re: [PATCH 0/1] uas: add stream number sanity checks (maybe 6.1)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Fri, Aug 20, 2021 at 3:07 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Cc'ing Mauro to double-check.
>
> On 8/20/21 2:12 PM, Peter Maydell wrote:
> > On Wed, 18 Aug 2021 at 13:10, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>
> >> Security fix.  Sorry for the last-minute patch, I had completely
> >> forgotten this one until the CVE number for it arrived today.
> >>
> >> Given that the classic usb storage device is way more popular than
> >> the uas (usb attached scsi) device the impact should be pretty low
> >> and we might consider to not screw up our release schedule for this.
> >
> > What's the impact if the bug is exploited ?
>
> Bug class: "guest-triggered user-after-free".
>
> Being privileged (root) in the guest, you can leak some data from
> the host process then DoS the host or potentially exploit the
> use-after-free to execute code on the host.
>

This is actually an out-of-bounds access issue (not UAF). It's still
potentially bad, but I agree with Gerd the impact is low. Plus there's
an assert right before [1] that makes it a DoS if the accessed memory
is not NULL.

[1] https://gitlab.com/qemu-project/qemu/-/blob/master/hw/usb/dev-uas.c#L85=
0

Regards.
--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


