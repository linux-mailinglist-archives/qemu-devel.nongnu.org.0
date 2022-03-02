Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3094C9F49
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 09:33:38 +0100 (CET)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPKQT-0005KG-61
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 03:33:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPKNG-0004Sh-9X
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:30:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPKNC-0003oW-EK
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646209812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ju3TXslkK4ikbzwJYtvQpU2DB+d0S/w2MnovYNUeUk=;
 b=LSDk0QzDGFTMZo8ie3l84Q8M5k37KeUt7+akkIqbjXt+JAaP9BAXHH5SbpOvlI01PrH+mX
 uUo4HY55LRvCq05WZZmjm7DFQesBwmZG+2Xo+OFTFjXSDjH5DEGLfcgJINxEPZof9KDhRk
 2aiEzMKzYzseINDxBJTLyA6LS6DJEgA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-3imqObVvMBSlNa87AIXwLQ-1; Wed, 02 Mar 2022 03:30:11 -0500
X-MC-Unique: 3imqObVvMBSlNa87AIXwLQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f13-20020a05600c154d00b003818123caf9so584153wmg.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 00:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4ju3TXslkK4ikbzwJYtvQpU2DB+d0S/w2MnovYNUeUk=;
 b=bCq7ep1o4jqoyQ87XCfNodUqUAh/5otN4zOJdiFmB1A7HToQRvEBGmxOLyhJJYdj+P
 fQMy6ZNUkM/gxK0gcS4y0OhwzxJWQRnnUmWXh97LKvhEZttyZ0fanwcF2xrnU1e3NESr
 svTXZEX+KDwshez/BBvsttUylgVjE223O7wsoqLeFEyhzNpo/hOo3lPD4zDdiBd8CGtV
 r78r20bxtTPUDJuDGaI454yBiY9jW3jLXDOAdN6pOeDldxHGnAu4qJafHCdI5WG6DgCn
 2R/J4bu/L/fnsGGl6LoDHAd4PRcmENszxLla9msPUPZzMC7zkVJuEVvJ+fqTAC7gc7Ry
 8uHQ==
X-Gm-Message-State: AOAM5319IV6VbqZ08UeZztvm5slqHuMbbzcdUdeRodvU4VCtEewekFHP
 p0L45UI1bw1nujwVJplv6P7cxjd9VVj/spHdPRM7H1F5Z9QmQ/bt14cArUxPMaUuo4Q37WYA+Az
 x4QAGonCSaf7XNYQ=
X-Received: by 2002:a05:600c:587:b0:381:b2:89b0 with SMTP id
 o7-20020a05600c058700b0038100b289b0mr20467127wmd.114.1646209810406; 
 Wed, 02 Mar 2022 00:30:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUFCa8ddS38oq9IT6e/yWdwiarFYl14hc8Iyy/vjPTuHZpDyCAzWiVC6dCDT5EWZ3tUieAJg==
X-Received: by 2002:a05:600c:587:b0:381:b2:89b0 with SMTP id
 o7-20020a05600c058700b0038100b289b0mr20467105wmd.114.1646209810176; 
 Wed, 02 Mar 2022 00:30:10 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a5d4dc4000000b001d8e67e5214sm16454314wru.48.2022.03.02.00.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 00:30:09 -0800 (PST)
Date: Wed, 2 Mar 2022 03:30:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302031738-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
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

On Tue, Mar 01, 2022 at 07:37:06PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Tue, Mar 1, 2022 at 6:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > Hmm okay, so it's a performance optimization... some batching then? Do
> > you really need to worry about every packet? Every 64 packets not
> > enough?  Packets are after all queued at NICs etc, and VM fork can
> > happen after they leave wireguard ...
> 
> Unfortunately, yes, this is an "every packet" sort of thing -- if the
> race is to be avoided in a meaningful way. It's really extra bad:
> ChaCha20 and AES-CTR work by xoring a secret stream of bytes with
> plaintext to produce a ciphertext. If you use that same secret stream
> and xor it with a second plaintext and transmit that too, an attacker
> can combine the two different ciphertexts to learn things about the
> original plaintext.
> 
> But, anyway, it seems like the race is here to stay given what we have
> _currently_ available with the virtual hardware. That's why I'm
> focused on trying to get something going that's the least bad with
> what we've currently got, which is racy by design. How vitally
> important is it to have something that doesn't race in the far future?
> I don't know, really. It seems plausible that that ACPI notifier
> triggers so early that nothing else really even has a chance, so the
> race concern is purely theoretical. But I haven't tried to measure
> that so I'm not sure.
> 
> Jason


I got curious, and wrote a dumb benchmark:


#include <stdio.h>
#include <assert.h>
#include <limits.h>
#include <string.h>

struct lng {
	unsigned long long l1;
	unsigned long long l2;
};

struct shrt {
	unsigned long s;
};


struct lng l = { 1, 2 };
struct shrt s = { 3 };

static void test1(volatile struct shrt *sp)
{
	if (sp->s != s.s) {
		printf("short mismatch!\n");
		s.s = sp->s;
	}
}
static void test2(volatile struct lng *lp)
{
	if (lp->l1 != l.l1 || lp->l2 != l.l2) {
		printf("long mismatch!\n");
		l.l1 = lp->l1;
		l.l2 = lp->l2;
	}
}

int main(int argc, char **argv)
{
	volatile struct shrt sv = { 4 };
	volatile struct lng lv = { 5, 6 };

	if (argc > 1) {
		printf("test 1\n");
		for (int i = 0; i < 10000000; ++i) 
			test1(&sv);
	} else {
		printf("test 2\n");
		for (int i = 0; i < 10000000; ++i)
			test2(&lv);
	}
	return 0;
}


Results (built with -O2, nothing fancy):

[mst@tuck ~]$ perf stat -r 1000 ./a.out 1 > /dev/null

 Performance counter stats for './a.out 1' (1000 runs):

              5.12 msec task-clock:u              #    0.945 CPUs utilized            ( +-  0.07% )
                 0      context-switches:u        #    0.000 /sec                   
                 0      cpu-migrations:u          #    0.000 /sec                   
                52      page-faults:u             #   10.016 K/sec                    ( +-  0.07% )
        20,190,800      cycles:u                  #    3.889 GHz                      ( +-  0.01% )
        50,147,371      instructions:u            #    2.48  insn per cycle           ( +-  0.00% )
        20,032,224      branches:u                #    3.858 G/sec                    ( +-  0.00% )
             1,604      branch-misses:u           #    0.01% of all branches          ( +-  0.26% )

        0.00541882 +- 0.00000847 seconds time elapsed  ( +-  0.16% )

[mst@tuck ~]$ perf stat -r 1000 ./a.out > /dev/null

 Performance counter stats for './a.out' (1000 runs):

              7.75 msec task-clock:u              #    0.947 CPUs utilized            ( +-  0.12% )
                 0      context-switches:u        #    0.000 /sec                   
                 0      cpu-migrations:u          #    0.000 /sec                   
                52      page-faults:u             #    6.539 K/sec                    ( +-  0.07% )
        30,205,916      cycles:u                  #    3.798 GHz                      ( +-  0.01% )
        80,147,373      instructions:u            #    2.65  insn per cycle           ( +-  0.00% )
        30,032,227      branches:u                #    3.776 G/sec                    ( +-  0.00% )
             1,621      branch-misses:u           #    0.01% of all branches          ( +-  0.23% )

        0.00817982 +- 0.00000965 seconds time elapsed  ( +-  0.12% )


So yes, the overhead is higher by 50% which seems a lot but it's from a
very small number, so I don't see why it's a show stopper, it's not by a
factor of 10 such that we should sacrifice safety by default. Maybe a
kernel flag that removes the read replacing it with an interrupt will
do.

In other words, premature optimization is the root of all evil.

-- 
MST


