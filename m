Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A01D4CA8F8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:22:01 +0100 (CET)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPQng-0000UL-6L
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPQmM-00088O-QM
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPQmJ-0001A9-1l
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646234433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o+/uKNtMSqxxtp2IKJVl4PtqKh8tUPajkwApvE96v0s=;
 b=iZvlekyAFl5nhUjkv+onEJRQIPyP7cB+kIaFJrHbDQ7pATZiAYE/Tq0qBzlMzuHFHLOmpt
 zdYbNAkNwWffzIUXc6FizFwUuQ3JkC2BEfyNqKWaIKMbuIQkucj75fyBYJ3SbWkm/kJU2a
 6FDxgfebhtt2Dd8xIt8C7EZO8WD/ewA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-tm0uWAdPMkCJCIPxfM6Aeg-1; Wed, 02 Mar 2022 10:20:31 -0500
X-MC-Unique: tm0uWAdPMkCJCIPxfM6Aeg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so636912wms.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o+/uKNtMSqxxtp2IKJVl4PtqKh8tUPajkwApvE96v0s=;
 b=KR+5tBNHZWQvLHyqz++5DCZvtGZ+1uo3DQG36P7KftZu5e8RsVfXQ4Iw1voJvwCY4/
 sGPSUimuBZxI+9kIk0XZjwsz1MrTtb4S+39iQFL0wdWBVeP33323qZrCflRMDTPd9tmD
 118/WnBIAiPAvLRsuUaD7aB024BrG7ksQViXupKxgT6sqScONi1PBF11nIUlDhZVkWaZ
 kxMERELOi2Y6nGEXnAqZjPn5cJbsjUCDY6EnWEoNjTN6SdmSQ59VYizNsHL9w9sjKiCT
 oBbGYw0P3SsSxy4NNJl1DmXgLf45rlLcCFtLze9aQ77Fa8Ie8hBwBG60r0LtKNCf1zf1
 wcUA==
X-Gm-Message-State: AOAM530sE83vo9Wf0N5auwzrSgMboNFJeusDqV0SLuLDrWN6zPDIIcbm
 88MFU7BclOUV7PAl3WssPKgc/xhDCYOO5nqdu+5PSr6Q6kLZe/XGHNTKQF2fOyQPxqkP066yL3p
 GOWGbk+QAt7cmZBI=
X-Received: by 2002:a05:6000:114d:b0:1ee:f251:52c6 with SMTP id
 d13-20020a056000114d00b001eef25152c6mr22351319wrx.618.1646234430701; 
 Wed, 02 Mar 2022 07:20:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaRd2QDCauXRg0Cy1iugecAP23hz+39Lwf58iM9a92otz79fxfMO534ZE5Hi2k0kqltL5FeA==
X-Received: by 2002:a05:6000:114d:b0:1ee:f251:52c6 with SMTP id
 d13-20020a056000114d00b001eef25152c6mr22351286wrx.618.1646234430410; 
 Wed, 02 Mar 2022 07:20:30 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d56d2000000b001edc00dbeeasm16452690wrw.69.2022.03.02.07.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 07:20:29 -0800 (PST)
Date: Wed, 2 Mar 2022 10:20:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302101602-mutt-send-email-mst@kernel.org>
References: <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
 <Yh93UZMQSYCe2LQ7@zx2c4.com>
 <20220302092149-mutt-send-email-mst@kernel.org>
 <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Mar 02, 2022 at 04:14:56PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Wed, Mar 2, 2022 at 3:46 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > I just don't see how "value changed while it was read" is so different
> > from "value changed one clock after it was read".  Since we don't detect
> > the latter I don't see why we should worry about the former.
> 
> The "barrier" is at the point where the plaintext has been chosen AND
> the nonce for a given keypair has been selected. So, if you have
> plaintext in a buffer, and a key in a buffer, and the nonce for that
> encryption in a buffer, and then after those are all selected, you
> check to see if the vmgenid has changed since the birth of that key,
> then you're all set. If it changes _after_ that point of check (your
> "one clock after"), it doesn't matter: you'll just be
> double-transmitting the same ciphertext, which is something that flaky
> wifi sometimes does _anyway_ (and attackers can do intentionally), so
> network protocols already are resilient to replay. This is the same
> case you asked about earlier, and then answered yourself, when you
> were wondering about reaching down into qdiscs.
> 
> Jason

So writing some code:

1:
	put plaintext in a buffer
	put a key in a buffer
	put the nonce for that encryption in a buffer

	if vm gen id != stored vm gen id
		stored vm gen id = vm gen id
		goto 1

I think this is race free, but I don't see why does it matter whether we
read gen id atomically or not.

-- 
MST


