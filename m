Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E3947E434
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 14:45:32 +0100 (CET)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0OPT-00084A-FL
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 08:45:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n0ONm-0007El-1I
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 08:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n0ONi-0005EG-Jm
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 08:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640267021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6u/Y8dnM8g1Ct4ZKexeby7UXE26h0EJhMaNPVTf1t0=;
 b=hHxo2fG8jQLFj/5k1fTi4CILkiPFs4LiJAdE9Anh1N48FgQQVJn0tcXGaIHrOpMGUbS6RX
 MISgD0peky4l7J2TcRDujOf6QAHi3pLHnsX5TVzLOuQNThi7q3gag6WZW4NL4iZApWdwOP
 UEKw9KAQB4ACEtpzTg4KtZ3a6Y7hu58=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-tQzAntiqNoqij8A2WydkQw-1; Thu, 23 Dec 2021 08:43:38 -0500
X-MC-Unique: tQzAntiqNoqij8A2WydkQw-1
Received: by mail-wm1-f71.google.com with SMTP id
 az11-20020a05600c600b00b00345c4309bccso1862832wmb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 05:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=j6u/Y8dnM8g1Ct4ZKexeby7UXE26h0EJhMaNPVTf1t0=;
 b=MWn/dInRYkEmbaD1T5rfUkxDV5AlgNQWELj8fUiqLaI0NOcd2lwTF5+/7LD8lFCVdr
 eNc1pnzNZiLQBonto/aJ0QXGCgL1OgUJghMxNQ1NiGXsNwl558OXNkz3BES8KiDvVfAX
 9pIqxbtQdOirbwbzq0b73SXrT1aVplOD+Xd/WfWm1ah+B3L6b4pbw4arTRPqUS0UAmDK
 Sp0qI0m33gtJJNa33eWDIvLviEY2vWtyKvwnjqjfq62DkdXcXVLtZ8muSwsMYH55yRcU
 VwTFClJE+HXRlX3/yZRFnyPhZUtr1Q6quGukomCMD2C45hCW8LuNriwnns3m1qyfwcsW
 zsGA==
X-Gm-Message-State: AOAM532t/7IWhbRib+EHzOakIEnxKJXU4yI7pZgPsnhIPsTl5rx/ToLl
 LHZg/r6RxmK9+qlZnd0I+CXIJWRdwoqfuI6GYzEoYy1TgQ5iBCqejYBieX9O+uVwIDIGsW32V9Q
 bQrwq6yebQ9Ln01I=
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr1756574wrv.299.1640267017678; 
 Thu, 23 Dec 2021 05:43:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEznWFeQMnBuA+EBogBTr7ArqvZx41RqrJmfYmNYvWJUD6hZUclaTv7rxrVuzEHEyxCBa/lw==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr1756555wrv.299.1640267017463; 
 Thu, 23 Dec 2021 05:43:37 -0800 (PST)
Received: from redhat.com ([2.55.1.37])
 by smtp.gmail.com with ESMTPSA id e13sm8247649wmq.10.2021.12.23.05.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 05:43:37 -0800 (PST)
Date: Thu, 23 Dec 2021 08:43:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Subject: Re: [PATCH] acpi: validate hotplug selector on access
Message-ID: <20211223083646-mutt-send-email-mst@kernel.org>
References: <20211221144852.589983-1-mst@redhat.com>
 <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
 <20211222151922-mutt-send-email-mst@kernel.org>
 <CAP+75-VaN5SD22ABqKNTC=dHhN4yaN-22Ucfdp=6aeYa+q+83A@mail.gmail.com>
 <20211222154841-mutt-send-email-mst@kernel.org>
 <CAA8xKjWJhXge6_3k-kPc7Y3Z_X1JqbOdZvOCSuAy62ifO4E5gg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA8xKjWJhXge6_3k-kPc7Y3Z_X1JqbOdZvOCSuAy62ifO4E5gg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Prasad Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 23, 2021 at 10:58:14AM +0100, Mauro Matteo Cascella wrote:
> Hi,
> 
> On Wed, Dec 22, 2021 at 9:52 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Dec 22, 2021 at 09:27:51PM +0100, Philippe Mathieu-Daudé wrote:
> > > On Wed, Dec 22, 2021 at 9:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Wed, Dec 22, 2021 at 08:19:41PM +0100, Philippe Mathieu-Daudé wrote:
> > > > > +Mauro & Alex
> > > > >
> > > > > On 12/21/21 15:48, Michael S. Tsirkin wrote:
> > > > > > When bus is looked up on a pci write, we didn't
> > > > > > validate that the lookup succeeded.
> > > > > > Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> > > > > > bus pointer.
> > > > > >
> > > > > > Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
> > > > > > Cc: "Igor Mammedov" <imammedo@redhat.com>
> > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > >
> > > > > It seems this problem is important enough to get a CVE assigned.
> > > >
> > > > Guest root can crash guest.
> > > > I don't see why we would assign a CVE.
> > >
> > > Well thinking about downstream distributions, if there is a CVE assigned,
> > > it helps them to have it written in the commit. Maybe I am mistaken.
> > >
> > > Unrelated but it seems there is a coordination problem with the
> > > qemu-security@ list,
> > > if this isn't a security issue, why was a CVE requested?
> >
> > Right.  I don't think a priveleged user crashing VM warrants a CVE,
> > it can just halt a CPU or whatever. Just cancel the CVE request pls.
> 
> While I agree with you that this is kind of borderline and I expressed
> similar concerns in the past, I was told that:
> 
> 1) root guest users are not necessarily trustworthy (from the host perspective).
> 2) NULL pointer deref and similar issues caused by an
> ill-handled/error condition are CVE worthy, even if triggered by root.
> 3) In other cases, DoS triggered by root is not a security issue
> because it's an expected behavior and not an ill-handled/error
> condition (think of assert failures, for example).
> 
> In other words, "ill-handled condition" is the crucial factor that
> makes a bug CVE worthy or not.

I guess the point is that a downstream might have a slightly different
code path where it would be more serious ...
OK then, not a big deal for me. So what's the CVE # then?

> +Prasad, can you shed some light on this? Is my understanding correct?
> 
> Also, please note that we regularly get CVE requests for bugs like
> this and many CVEs have been assigned in the past. Of course that
> doesn't mean we can't change things going forward, but I think we
> should make it clear (probably here:
> https://www.qemu.org/docs/master/system/security.html) that these
> kinds of bugs are not eligible for CVE assignment.


That would be good, yes.

> > > > > Mauro, please update us when you get the CVE number.
> > > > > Michael, please amend the CVE number before committing the fix.
> > > > >
> > > > > FWIW Paolo asked every fuzzed bug reproducer to be committed
> > > > > as qtest, see tests/qtest/fuzz*c. Alex has a way to generate
> > > > > reproducer in plain C.
> > > > >
> > > > > Regards,
> > > > >
> > > > > Phil.
> > > >
> >
> 
> -- 
> Mauro Matteo Cascella
> Red Hat Product Security
> PGP-Key ID: BB3410B0


