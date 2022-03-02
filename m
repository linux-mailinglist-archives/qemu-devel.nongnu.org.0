Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F44CAA16
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:25:29 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRn6-0003HT-0L
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:25:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPRkd-00088b-Dp
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:22:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPRkb-0007Go-TF
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646238173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=319HSMClYmc73i4+9cM7jkH73o3HvmVRZnh4aruHeG8=;
 b=XWH0s+u8EdnPiE5tyvXvxkcDTn7AgO5Ylle32beSsUMEXx1DegS4lBj4g/UMfIDf2cl9z+
 x6UWJj2x6DngxiF6BDCOXZzb0GbyxEcm6raYrkYnMKdM4K1aT1/KDbJ17X8oUS0SvxDuvY
 Gy00H9FV0thpqrT24dl6l8TNek7LT/Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-Kt6JezbmME2nvh-iy3tjlA-1; Wed, 02 Mar 2022 11:22:52 -0500
X-MC-Unique: Kt6JezbmME2nvh-iy3tjlA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a26-20020a7bc1da000000b003857205ec7cso549031wmj.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 08:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=319HSMClYmc73i4+9cM7jkH73o3HvmVRZnh4aruHeG8=;
 b=RQDyhVuxbYtg/UUqVlXUVDkAUEQhEi2ssYlo6S40wFfDDMgMxAKUtH4vjYiz/wS9dh
 4QoX/aja1hloo0ZgzEW2zvUQTjJcdFVqmqOcgns8ldoZPA0vt2e689moRyugrhS0oNr0
 DpBsj9FlsejzgV/uGzfRhHuQ3fwnwDSIXjDE4VyMM0hkZkgnGj8IRDBHPxlJ3kczkIV2
 mQvdhH+IqOCjMCLmIe0V7MXmZksWXk9UqH6UVh/DGT6coOQmfK679pxagpnU7QmzBpBA
 3zm9Na/3BmOhpbBUjWq0CQwUMi9wPxle9E2r8rxG9WSuzNYj2hWn1IYkev13kEY5FUGX
 GW3w==
X-Gm-Message-State: AOAM533i7YugFOqz0jUezgCoo/GiIYSB9Zj5Rr+X8h1jQ57YpivXM8Yd
 aymdS0mVBVUo8AJsLgMFym/pbUBpqfzkelRcX4OQ9YFLPtU6p1SMF67ZG4rc/FHsDgvUwfsz7SY
 I2oS8J8DXbKrt28A=
X-Received: by 2002:a05:600c:378b:b0:381:67e7:e20c with SMTP id
 o11-20020a05600c378b00b0038167e7e20cmr479508wmr.32.1646238171028; 
 Wed, 02 Mar 2022 08:22:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS+hgEnn1ZApPqccdMegoD/Y1rBIvh8rKEfDBm0b4Su6FFtEq0p31uoeFi3LW+QoZEiPhhcg==
X-Received: by 2002:a05:600c:378b:b0:381:67e7:e20c with SMTP id
 o11-20020a05600c378b00b0038167e7e20cmr479479wmr.32.1646238170768; 
 Wed, 02 Mar 2022 08:22:50 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a5d49ce000000b001f036a29f42sm2040814wrs.116.2022.03.02.08.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 08:22:50 -0800 (PST)
Date: Wed, 2 Mar 2022 11:22:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302111737-mutt-send-email-mst@kernel.org>
References: <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
 <Yh93UZMQSYCe2LQ7@zx2c4.com>
 <20220302092149-mutt-send-email-mst@kernel.org>
 <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
 <20220302101602-mutt-send-email-mst@kernel.org>
 <Yh+PET49oHNpxn+H@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <Yh+PET49oHNpxn+H@zx2c4.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 04:36:49PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Wed, Mar 02, 2022 at 10:20:25AM -0500, Michael S. Tsirkin wrote:
> > So writing some code:
> > 
> > 1:
> > 	put plaintext in a buffer
> > 	put a key in a buffer
> > 	put the nonce for that encryption in a buffer
> > 
> > 	if vm gen id != stored vm gen id
> > 		stored vm gen id = vm gen id
> > 		goto 1
> > 
> > I think this is race free, but I don't see why does it matter whether we
> > read gen id atomically or not.
> 
> Because that 16 byte read of vmgenid is not atomic. Let's say you read
> the first 8 bytes, and then the VM is forked.

But at this point when VM was forked plaintext key and nonce are all in
buffer, and you previously indicated a fork at this point is harmless.
You wrote "If it changes _after_ that point of check ... it doesn't
matter:"

> In the forked VM, the next
> 8 bytes are the same as last time, but the first 8 bytes, which you
> already read, have changed. In that case, your != becomes a ==, and the
> test fails.

Yes I'm aware what an atomic read is. If the read is not atomic
a part of value can change ;)

-- 
MST


