Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A021A4C9E9D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 08:50:24 +0100 (CET)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPJkd-0008Cv-9x
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 02:50:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPJjB-0007Se-TI
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:48:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPJj8-0001Li-7B
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646207328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VSCz2pxA5hTBIRgPDgOdyYSFpYrMbh4E3T7sCMIW0vU=;
 b=bvIWOWY2qUy3chL1HKVSZZhj30ffgJtRMW6tABNTAg9N0DmCK+lJsTRFlIE21t900G4Nnb
 nKn7LfpVVQeIvL/RWWI00PihqP99jspNi6AWRFoRj9LoppxzaOl8Y8acq/JmOOn+Uw5wIk
 qoZdtyo0z/9+A4f7cixAnQ8tHxBxx44=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-3XZi4B-WOUOEWMo2A0sygQ-1; Wed, 02 Mar 2022 02:48:46 -0500
X-MC-Unique: 3XZi4B-WOUOEWMo2A0sygQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a26-20020a7bc1da000000b003857205ec7cso90725wmj.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 23:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VSCz2pxA5hTBIRgPDgOdyYSFpYrMbh4E3T7sCMIW0vU=;
 b=cN+2sj/UaxKp/wsEUhKA417m174OhHVMKZtIdDhp/L8sg+XTB0RDQaDwGXfn0dN1w3
 bcp8fNV30lKSS6PlQuH1PQGV9SJGDfcgHVEDx2A44iyE8ehVrRYckUU9JcFKwi71CAFd
 fNcpONRnhujbneJI1YKyG+htSSLP04BQiIznO6QkrujMHpG9Dpdq2tA2/WH2KSD2MQ5i
 VEFAuRnSZ2zM9yWCqhp/gAmhYWSQtzoPvb4I7TAKvZuLbb3W+lnJ1GqdAj4LmGkxm2WV
 b+EwZZFgO12wrW1GZt55QV0E5PDfLRprkSc8iiwrKW0AIL6dIoRnW2n12j6ARaAAlZ+r
 rSIA==
X-Gm-Message-State: AOAM532MP6pnpNFOtX8CrxQ2L1KXio6DxQLGo9jrvYsZlzetu24IN3kA
 x/m8Ta0JHqWsfmDOH7XPHCrHo2+M0LyqAnNKf7Cf12QmlPLemnlj+FBUdFpNdvjQ9fy8UYnJmpX
 mqmYO4korzqI0PH4=
X-Received: by 2002:a5d:6da1:0:b0:1e3:2bf5:13c with SMTP id
 u1-20020a5d6da1000000b001e32bf5013cmr22959850wrs.316.1646207325624; 
 Tue, 01 Mar 2022 23:48:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9fOxEBC6Q2x8n5VmxQ/dfWM6m6ZkjkZTGFJDBmExfNYsTGNqiw6xeuncf/kpMaUAwvGB/xg==
X-Received: by 2002:a5d:6da1:0:b0:1e3:2bf5:13c with SMTP id
 u1-20020a5d6da1000000b001e32bf5013cmr22959817wrs.316.1646207325304; 
 Tue, 01 Mar 2022 23:48:45 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm6342218wmp.44.2022.03.01.23.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 23:48:44 -0800 (PST)
Date: Wed, 2 Mar 2022 02:48:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302024608-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302024137-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220302024137-mutt-send-email-mst@kernel.org>
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

On Wed, Mar 02, 2022 at 02:42:37AM -0500, Michael S. Tsirkin wrote:
> On Tue, Mar 01, 2022 at 07:37:06PM +0100, Jason A. Donenfeld wrote:
> > Hi Michael,
> > 
> > On Tue, Mar 1, 2022 at 6:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > Hmm okay, so it's a performance optimization... some batching then? Do
> > > you really need to worry about every packet? Every 64 packets not
> > > enough?  Packets are after all queued at NICs etc, and VM fork can
> > > happen after they leave wireguard ...
> > 
> > Unfortunately, yes, this is an "every packet" sort of thing -- if the
> > race is to be avoided in a meaningful way. It's really extra bad:
> > ChaCha20 and AES-CTR work by xoring a secret stream of bytes with
> > plaintext to produce a ciphertext. If you use that same secret stream
> > and xor it with a second plaintext and transmit that too, an attacker
> > can combine the two different ciphertexts to learn things about the
> > original plaintext.
> 
> So what about the point about packets queued then? You don't fish
> packets out of qdisc queues, do you?

Oh pls ignore it, I think I got it. Resending same packet is not
a problem, producing a new one is.

> > But, anyway, it seems like the race is here to stay given what we have
> > _currently_ available with the virtual hardware. That's why I'm
> > focused on trying to get something going that's the least bad with
> > what we've currently got, which is racy by design. How vitally
> > important is it to have something that doesn't race in the far future?
> > I don't know, really. It seems plausible that that ACPI notifier
> > triggers so early that nothing else really even has a chance, so the
> > race concern is purely theoretical. But I haven't tried to measure
> > that so I'm not sure.
> > 
> > Jason


So how about measuring the performance impact of reading the 16 byte
vmgenid then? This could be a performance option, too - some people
might want extra security, some might not care.  And I feel if linux
DTRT and reads the 16 bytes then hypervisor vendors will be motivated to
improve and add a 4 byte unique one. As long as linux is interrupt
driven there's no motivation for change.

-- 
MST


