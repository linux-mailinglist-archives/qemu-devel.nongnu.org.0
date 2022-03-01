Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C096F4C9304
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:27:13 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP7DM-0006lc-Jd
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:27:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP7As-0005Hi-3n
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:24:39 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:38398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP7Ap-0004r2-0j
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:24:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 091A4B81BF4
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 18:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EED8C340F0
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 18:24:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cPsu+Pfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646159066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UhSvaSxnuwVg8z+lYMrcVY0V6HOk087dwrWAJX+wvNg=;
 b=cPsu+PfpQ1E+NfY2QM+mqL0MsGFB6uJQhrXq/ZPOpHqQ46Hg0jj++Y00wshljoHRmFIYXF
 sqrIz3aaStaOBaArIsWgtnsz0z2qiM7Ia9Q+X4rzhx+BpZAoD3c//ILGPSnO780HScVlDv
 ioajV2t4PXvamB22Q/Mq+I0CvJu0Avc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id df604b15
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 1 Mar 2022 18:24:26 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso36332957b3.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:24:25 -0800 (PST)
X-Gm-Message-State: AOAM533D/D0aIWTkg4yTtAh5+KseDOqUngcwq3tVDb6lsHE6hMUCkxse
 do6zOg1DvtOpxAd//BYSXAPvTMbnHdznwehv+q0=
X-Google-Smtp-Source: ABdhPJzIw8Ot6KvcnZ9E6xhmQNl/dygRLAw2fnVFuv34JvBJjjinbct/exl35nFBlEkP8cMk/Ry82yLphyC5sa7l+Vc=
X-Received: by 2002:a81:1143:0:b0:2db:ccb4:b0a1 with SMTP id
 64-20020a811143000000b002dbccb4b0a1mr6755248ywr.499.1646159062762; Tue, 01
 Mar 2022 10:24:22 -0800 (PST)
MIME-Version: 1.0
References: <Yh4+9+UpanJWAIyZ@zx2c4.com> <Yh5fbe71BTT6xc8h@kroah.com>
In-Reply-To: <Yh5fbe71BTT6xc8h@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 1 Mar 2022 19:24:11 +0100
X-Gmail-Original-Message-ID: <CAHmME9oGcp7HNLeieptMKztgg7Fq4MnOuAEsiFJxsLbmjSuFCw@mail.gmail.com>
Message-ID: <CAHmME9oGcp7HNLeieptMKztgg7Fq4MnOuAEsiFJxsLbmjSuFCw@mail.gmail.com>
Subject: Re: propagating vmgenid outward and upward
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, adrian@parity.io,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Greg,

On Tue, Mar 1, 2022 at 7:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> A notifier block like this makes sense, but why tie onto the PM_ stuff?
> This isn't power management issues, it's a system-wide change that I am
> sure others will want to know about that doesn't reflect any power
> changes.
>
> As much as I hate adding new notifiers in the kernel, that might be all
> you need here.

You might indeed be right. I guess I was thinking that "resuming from
suspend" and "resuming from a VM fork" are kind of the same thing.
There _is_ a certain kind of similarity between the two. I was hoping
if the similarity was a strong enough one, maybe it'd make sense to do
them together rather than adding another notifier. But I suppose you
disagree, and it sounds like Rafael might too --
<https://lore.kernel.org/lkml/CAJZ5v0g+GihH_b9YvwuHzdrUVNGXOeabOznDC1vK6qLi8gtSTQ@mail.gmail.com/>.
Code-wise for me with WireGuard it's of course appealing to treat them
the same, since it's like a one line change, but if I need to add a
new notifier call there, it's not the end of the world.

Jason

