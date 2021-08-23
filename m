Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C37C3F4DE0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:57:24 +0200 (CEST)
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICKB-0007aS-GR
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mICIn-0006Jq-7F
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mICIk-0001HN-Dc
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCsT/ERhBtPd8RPO+dR7p/UQkj4/U3jUp7ZEXSXSOAM=;
 b=URiMg+TLPjEzTa1ToSE4j90EZb8gXdA8yvZpHH+4KoymDd7BS5e/Zx6JgfO7FZci1TK0Dd
 Jd4XJ20Uv7FTxUOFJzzX7ghYLp1CA+Ap3hdouEbUzJCmsNoSiLm2UuEEE2AkGEalcsHIx+
 7xAjlVNARx2w5dwOuwZrRQAO4gYY2sk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-FtVC28hpPMmBxGc05uCRwQ-1; Mon, 23 Aug 2021 11:55:51 -0400
X-MC-Unique: FtVC28hpPMmBxGc05uCRwQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 z26-20020a0565120c1a00b003cf39d5ed62so5123319lfu.16
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 08:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NCsT/ERhBtPd8RPO+dR7p/UQkj4/U3jUp7ZEXSXSOAM=;
 b=L3fzmv6nKHMQCZPjkvtOcwDvA+nOjM6yymjldedge+VpPcBLi5jWmwmcjXub89pe7i
 kNVyBAFVqoWfqXnpVjOgYGUF55CoI18g6OdXcqCoe8VftnD8jXiroWSi8WLb881zUCqw
 fxesmoWAOnZ02f6mm4XEKmsGVuneeUstkmF5PyhJg7bIyisd2Y27V97uuEO0PEW9zW/z
 KHf6EulECIlTzE+gHa60AUS61BTj9nfzzMx3nWKYdwzVup3fhvjtRkxY/tzZeg95z49F
 IGUpGtScP6kpMuFxpZp9Jj/nafWaZOKAKRLad3EmNf7pXjUvT2G8XG09EhQJFhAIF0ir
 GiGQ==
X-Gm-Message-State: AOAM533WIHDahDbrVMwEczxoAVrMti9hYsaaZgTvGRIjmB7FB3T+tz27
 m8AhWGWEOycyvlnYyYR3bRSh9XzFaf86L32tSj17ThqoLKTVBZGwozOrOwqFA/h6FAyJY9WNaJU
 64bbb8Of7dFxvYeU5ugsDQ/64yleN8OE=
X-Received: by 2002:ac2:4c2a:: with SMTP id u10mr25748497lfq.631.1629734150256; 
 Mon, 23 Aug 2021 08:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaEu2459oQ0qgL3zjgnaCDU+gxi547Y71iNO6fJF/OumgH+wwWeGpFh/SG9NYpSVd2510HRrDf5qcbG1yIYeA=
X-Received: by 2002:ac2:4c2a:: with SMTP id u10mr25748482lfq.631.1629734149909; 
 Mon, 23 Aug 2021 08:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
 <87eeb59vwt.fsf@dusky.pond.sub.org>
 <20210810185644.iyqt3iao2qdqd5jk@habkost.net>
 <2191952f-6989-771a-1f0a-ece58262d141@redhat.com>
 <CAOpTY_qbsqh9Tf8LB3EOOi_gkREotdpUyuF3-d_sBFsof3-9KQ@mail.gmail.com>
 <97ce9800-ff69-46cd-b6ab-c7645ee10d2c@redhat.com>
 <CAOpTY_rv4nZib1Eymm9ZVcLf=v=-QjpUm24U7FtS-1pUqS_6VQ@mail.gmail.com>
 <87lf4scmi5.fsf@dusky.pond.sub.org>
In-Reply-To: <87lf4scmi5.fsf@dusky.pond.sub.org>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Mon, 23 Aug 2021 11:55:34 -0400
Message-ID: <CAOpTY_p3vxv8dM54sLQ1WkEHesJ9w-famusHPw040e=HiZj9pw@mail.gmail.com>
Subject: Re: [PATCH v12] qapi: introduce 'query-x86-cpuid' QMP command.
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 9:35 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Eduardo Habkost <ehabkost@redhat.com> writes:
>
> > On Wed, Aug 11, 2021 at 9:44 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 11/08/2021 15.40, Eduardo Habkost wrote:
> >> > On Wed, Aug 11, 2021 at 2:10 AM Thomas Huth <thuth@redhat.com> wrote=
:
> >> >>
> >> >> On 10/08/2021 20.56, Eduardo Habkost wrote:
> >> >>> On Sat, Aug 07, 2021 at 04:22:42PM +0200, Markus Armbruster wrote:
> >> >>>> Is this intended to be a stable interface?  Interfaces intended j=
ust for
> >> >>>> debugging usually aren't.
> >> >>>
> >> >>> I don't think we need to make it a stable interface, but I won't
> >> >>> mind if we declare it stable.
> >> >>
> >> >> If we don't feel 100% certain yet, it's maybe better to introduce t=
his with
> >> >> a "x-" prefix first, isn't it? I.e. "x-query-x86-cpuid" ... then it=
's clear
> >> >> that this is only experimental/debugging/not-stable yet. Just my 0.=
02 =E2=82=AC.
> >> >
> >> > That would be my expectation. Is this a documented policy?
> >> >
> >>
> >> According to docs/interop/qmp-spec.txt :
> >>
> >>   Any command or member name beginning with "x-" is deemed
> >>   experimental, and may be withdrawn or changed in an incompatible
> >>   manner in a future release.
> >
> > Thanks! I had looked at other QMP docs, but not qmp-spec.txt.
> >
> > In my reply above, please read "make it a stable interface" as
> > "declare it as supported by not using the 'x-' prefix".
> >
> > I don't think we have to make it stable, but I won't argue against it
> > if the current proposal is deemed acceptable by other maintainers.
> >
> > Personally, I'm still frustrated by the complexity of the current
> > proposal, but I don't want to block it just because of my frustration.
>
> Is this a case of "there must be a simpler way", or did you actually
> propose a simpler way?  I don't remember...
>

I did propose a simpler way at
https://lore.kernel.org/qemu-devel/20210810195053.6vsjadglrexf6jwy@habkost.=
net/

--
Eduardo


