Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2DA4CABA0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:28:27 +0100 (CET)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSm2-0004wj-5s
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:28:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPSlE-0004Gw-5e
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:27:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPSlB-0003zP-7U
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646242052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdGVpD6JC2co+YDkL+SNwGtc/UkboD0tVW/slwVWtYg=;
 b=IWNGfT2v3ZIEOrSnBcP2wGemlyXI4GX56fY0oO04XkZFrv1Qgy+skz2NVfaHv+HJWdGdN+
 kNEq4acBO6qlhREtZF/7d95afHXl/08ujZMVMQ8fgM5Mh3AzoEeSLYNA0PqjufXkwoSYa6
 RF0W+F7w6xDggKA8svL75yAHxyIlDKs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-LiTSAINkO6KjGTFcH_XKug-1; Wed, 02 Mar 2022 12:27:31 -0500
X-MC-Unique: LiTSAINkO6KjGTFcH_XKug-1
Received: by mail-wm1-f71.google.com with SMTP id
 h19-20020a05600c351300b0038141cf26deso1063994wmq.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 09:27:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LdGVpD6JC2co+YDkL+SNwGtc/UkboD0tVW/slwVWtYg=;
 b=FhYJEFjdDj5x19kwlGTzX5+Xfnb4bzdslicTM3ugicjPO7/X8SB23bumji/bAuy8cg
 UNcAsjeseAM44U7zD7lEqibezAKVU8sFzZlxEh/zEsPW6mKZtPEXFAT4elOczu6fhu66
 BUpLxaQcTf2zJ4SyMh82i1HVbrO/7VyWJKs9tGVlBxtbV1/f7nMDooXIA0uUQbx9P3Pu
 /Fq/iODS9dhgoCCPkyoQ1JpIVmpPpdXz0nqR9TxHqHtOfPI2kStoYeF+FK7jDyM9/qXq
 yjie737kPx5gxhJb8tSp8Hjd/WnctQuV171b9bCWP8JIkmo644KBduC6bG0XiF+KRldq
 +1Zw==
X-Gm-Message-State: AOAM532lEVSMlQ1by9Xap3/c2Hjk+T/y9InEQVU8CiDPglpuVC6iUr9j
 UlVS98qJ/DFUbXNUGh0NVtfPIP+3X87geZImvXA4R9U5fB3AGC9Ar5wFRCn14ru4StVnnAk9kyi
 UM25/IYeJuUGAhd8=
X-Received: by 2002:a5d:47ac:0:b0:1ed:164f:8ed0 with SMTP id
 12-20020a5d47ac000000b001ed164f8ed0mr23095476wrb.622.1646242050333; 
 Wed, 02 Mar 2022 09:27:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5jLSkK6NkZFrdgBwYO0IRaD957h+T8kNnewiZxTC2pec2pB+yzgfBbghP0YSfy6Ertpoqhw==
X-Received: by 2002:a5d:47ac:0:b0:1ed:164f:8ed0 with SMTP id
 12-20020a5d47ac000000b001ed164f8ed0mr23095446wrb.622.1646242050108; 
 Wed, 02 Mar 2022 09:27:30 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b003808165fbc2sm7335011wmq.25.2022.03.02.09.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:27:29 -0800 (PST)
Date: Wed, 2 Mar 2022 12:27:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302122640-mutt-send-email-mst@kernel.org>
References: <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
 <Yh93UZMQSYCe2LQ7@zx2c4.com>
 <20220302092149-mutt-send-email-mst@kernel.org>
 <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
 <20220302101602-mutt-send-email-mst@kernel.org>
 <Yh+PET49oHNpxn+H@zx2c4.com>
 <20220302111737-mutt-send-email-mst@kernel.org>
 <Yh+cB5bWarl8CFN1@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <Yh+cB5bWarl8CFN1@zx2c4.com>
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

On Wed, Mar 02, 2022 at 05:32:07PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Wed, Mar 02, 2022 at 11:22:46AM -0500, Michael S. Tsirkin wrote:
> > > Because that 16 byte read of vmgenid is not atomic. Let's say you read
> > > the first 8 bytes, and then the VM is forked.
> > 
> > But at this point when VM was forked plaintext key and nonce are all in
> > buffer, and you previously indicated a fork at this point is harmless.
> > You wrote "If it changes _after_ that point of check ... it doesn't
> > matter:"
> 
> Ahhh, fair point. I think you're right.
> 
> Alright, so all we're talking about here is an ordinary 16-byte read,
> and 16 bytes of storage per keypair, and a 16-byte comparison.
> 
> Still seems much worse than just having a single word...
> 
> Jason

And it is, I saw a 30% higher overhead, it is however 30% of a very
low number ;)

-- 
MST


