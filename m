Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A6D4CA87D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:48:37 +0100 (CET)
Received: from localhost ([::1]:50956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPQHL-0005Ds-TS
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPQFH-0003vh-S5
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPQFE-0002VL-2X
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646232382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w205eOqOdxeAZdCILUJdCHi/CnhyFtZESdwZqehxcdc=;
 b=Je6CMSh8r1AH7ug9FzR90T1f6Xx68CUSjCDNlLZaLcpRFzo2owKIJzbZYIIiWsJ4G8VyhK
 f2qKY2fRuWh5O5n4yyTzEFgjFk4LTOnPZv+0qZqYlAACFSlFbjfeLD6cqr4sPIMaGEtWyZ
 XkZB5EN78wR9a5sK3Es2RQT/t6m9Wko=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-nyUKvKRYO5uhZ32bWtCueQ-1; Wed, 02 Mar 2022 09:46:21 -0500
X-MC-Unique: nyUKvKRYO5uhZ32bWtCueQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n31-20020a05600c3b9f00b003812242973aso894120wms.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 06:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w205eOqOdxeAZdCILUJdCHi/CnhyFtZESdwZqehxcdc=;
 b=gAWHy8TYNXt3qKqhyyWY7x09eAM8AdbsN25Y94CcEww7/uhQihY13cg3S65WCX9zu9
 1bzCHbbIvW9Nr60qJfOKJRVV5xlLUVcCyffFVsYQ6QqG6O8omiBXIYA85364EUx3DFQh
 RrknQJeFBd1LU8tKmllwq6o6nV8ZhLKYtBrSWqjUMdXJLyyp75t4oyhB8T0dhswuVcgA
 c8N+5JRxRkbO0FAY6IWxlvPAKnPRserXdgdqo3YcVEyMjMqYIDK6E+Upn+LqHX8hHqwf
 qqK64QsfcttYplGUoe7oYwwkpAaS6nGvBnsOERDcNq4srTdUQUDYK7thKEdemSpKYB4H
 KmlQ==
X-Gm-Message-State: AOAM532sn4c75E9jT9mm6WkPlMNyRr7lJrCd2TgHA28Yzj8KF4OTZPZT
 onMX6uINmIcj1ZHiJdNRWNsMyGoQkrdgqmsnmjZvMGNkiGDc6X5BNi+b2/SaExAaX41GSThXCHZ
 4niXim8CedXqtMVM=
X-Received: by 2002:adf:eb45:0:b0:1ef:6070:7641 with SMTP id
 u5-20020adfeb45000000b001ef60707641mr20390159wrn.301.1646232380725; 
 Wed, 02 Mar 2022 06:46:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza4Ib8iRQhbK5h23mGl00nx8utPjoauWdru+z6xmj8vBVgS9w4ICFHCPrxOEOgLj/22uh95g==
X-Received: by 2002:adf:eb45:0:b0:1ef:6070:7641 with SMTP id
 u5-20020adfeb45000000b001ef60707641mr20390128wrn.301.1646232380470; 
 Wed, 02 Mar 2022 06:46:20 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a7bc7d0000000b00381004c643asm5677773wmk.30.2022.03.02.06.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 06:46:19 -0800 (PST)
Date: Wed, 2 Mar 2022 09:46:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302092149-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
 <Yh93UZMQSYCe2LQ7@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <Yh93UZMQSYCe2LQ7@zx2c4.com>
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

On Wed, Mar 02, 2022 at 02:55:29PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Wed, Mar 02, 2022 at 07:58:33AM -0500, Michael S. Tsirkin wrote:
> > > There's also the atomicity aspect, which I think makes your benchmark
> > > not quite accurate. Those 16 bytes could change between the first and
> > > second word (or between the Nth and N+1th word for N<=3 on 32-bit).
> > > What if in that case the word you read second doesn't change, but the
> > > word you read first did? So then you find yourself having to do a
> > > hi-lo-hi dance.
> > > And then consider the 32-bit case, where that's even
> > > more annoying. This is just one of those things that comes up when you
> > > compare the semantics of a "large unique ID" and "word-sized counter",
> > > as general topics. (My suggestion is that vmgenid provide both.)
> > 
> > I don't see how this matters for any applications at all. Feel free to
> > present a case that would be race free with a word but not a 16
> > byte value, I could not imagine one. It's human to err of course.
> 
> Word-size reads happen all at once on systems that Linux supports,
> whereas this is not the case for 16 bytes (with a few niche exceptions
> like cmpxchg16b and such). If you read the counter atomically, you can
> check to see whether it's changed just after encrypting but before
> transmitting and not transmit if it has changed, and voila, no race.
> With 16 bytes, synchronization of that read is pretty tricky (though
> maybe not all together impossible), because, as I mentioned, the first
> word might have changed by the time you read a matching second word. I'm
> sure you're familiar with the use of seqlocks in the kernel for solving
> a somewhat related problem.
> 
> Jason

I just don't see how "value changed while it was read" is so different
from "value changed one clock after it was read".  Since we don't detect
the latter I don't see why we should worry about the former.  What I
don't have here is how would a code reading the value look.  It might
help to write some pseudo code to show that, but I'd say it makes more
sense to just code the read up even just so the overhead of the current
interface can be roughtly measured.

-- 
MST


