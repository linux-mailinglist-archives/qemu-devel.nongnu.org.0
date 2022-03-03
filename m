Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7E4CBE89
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 14:09:13 +0100 (CET)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPlCi-0003NI-0x
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 08:09:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPlB5-0002gi-NR
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 08:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPlB2-0002d8-A4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 08:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646312846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lj6VpxefHrxOOwhnhf4/p/2XcRsNuTwXL6WEnQsA11I=;
 b=Xx+LgRSQNXT2n4OqVXCaKRKq9C7bsDVhJ8AqwiizTMMqmrvd9CeQ8guWYKnmxPs0nCDJbd
 /puBn2DrQenT82GNcN6mTImOsj17y5u0wZQ0QkBz/XNx+a4GDy6vMvmQFq6dCbBi004BfM
 VORoTOby/ckNjY/prcLJLK6dO3JIl9g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-jfzgcatUOxaMf5WdQM6ydA-1; Thu, 03 Mar 2022 08:07:23 -0500
X-MC-Unique: jfzgcatUOxaMf5WdQM6ydA-1
Received: by mail-wm1-f71.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso1312736wmq.6
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 05:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lj6VpxefHrxOOwhnhf4/p/2XcRsNuTwXL6WEnQsA11I=;
 b=4DNbKREoSy4jaaXkq9IjK5pDAklgF/LAToEomFfNbNeU7QbVtEHItOCYAijs72iIr8
 8d7d62F7SksItZQnA3PqRQ4U0eBnr6u3limFCucl+wRgyQlnhhDavOGrnaplrQiormdg
 UEuuVS0Vf9iL/XVNh49YNpaTte4ToiFvKEbzy9GQtFUNv8wHI/GaFwtnI95RKE4zQrXu
 //On/EUPibGPjEQkVeiAMSS648un2866wiuZUliMb1kOkhygASuasSNxpDIdoWRmravJ
 gwjWoxggCoYG81VEJbhcSUV1v3ZcJkRjC/KaGCdVR84w4IhAWyxwm2RlYDz1+j9GwpL5
 RbDw==
X-Gm-Message-State: AOAM532uyv9aRTKuGtCrNngQelbzSSZ9Xq0xXU0ewJ4dVUzcVkJJqJCz
 /fSXRfrtKW+aBacNUHEQ2MssAyEE0fFLWNrBQ1BkyQ5skS472BG78g8X5NWGQ/dEWmM9HhL6VRI
 VLL+GAVO5Nvca+po=
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr23412287wrv.653.1646312842501; 
 Thu, 03 Mar 2022 05:07:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBprWCBbiaeng1f6eFEkBly6o9vzAc3MArh79lj54xDzLKMIA0Xs/dF3R5oQGH8dSoCNnPBA==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr23412254wrv.653.1646312842242; 
 Thu, 03 Mar 2022 05:07:22 -0800 (PST)
Received: from redhat.com ([2.55.143.133]) by smtp.gmail.com with ESMTPSA id
 f1-20020a5d4dc1000000b001eeadc98c0csm1908052wru.101.2022.03.03.05.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 05:07:20 -0800 (PST)
Date: Thu, 3 Mar 2022 08:07:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220303075426-mutt-send-email-mst@kernel.org>
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

Oh I forgot about __int128.



#include <stdio.h>
#include <assert.h>
#include <limits.h>
#include <string.h>

struct lng {
	__int128 l;
};

struct shrt {
	unsigned long s;
};


struct lng l = { 1 };
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
	if (lp->l != l.l) {
		printf("long mismatch!\n");
		l.l = lp->l;
	}
}

int main(int argc, char **argv)
{
	volatile struct shrt sv = { 4 };
	volatile struct lng lv = { 5 };

	if (argc > 1) {
		printf("test 1\n");
		for (int i = 0; i < 100000000; ++i) 
			test1(&sv);
	} else {
		printf("test 2\n");
		for (int i = 0; i < 100000000; ++i)
			test2(&lv);
	}
	return 0;
}


with that the compiler has an easier time to produce optimal
code, so the difference is smaller.
Note: compiled with
gcc -O2 -mno-sse -mno-sse2 -ggdb bench3.c 

since with sse there's no difference at all.


[mst@tuck ~]$ perf stat -r 100 ./a.out 1 > /dev/null 


 Performance counter stats for './a.out 1' (100 runs):

             94.55 msec task-clock:u              #    0.996 CPUs utilized            ( +-  0.09% )
                 0      context-switches:u        #    0.000 /sec                   
                 0      cpu-migrations:u          #    0.000 /sec                   
                52      page-faults:u             #  548.914 /sec                     ( +-  0.21% )
       400,459,851      cycles:u                  #    4.227 GHz                      ( +-  0.03% )
       500,147,935      instructions:u            #    1.25  insn per cycle           ( +-  0.00% )
       200,032,462      branches:u                #    2.112 G/sec                    ( +-  0.00% )
             1,810      branch-misses:u           #    0.00% of all branches          ( +-  0.73% )

         0.0949732 +- 0.0000875 seconds time elapsed  ( +-  0.09% )

[mst@tuck ~]$ 
[mst@tuck ~]$ perf stat -r 100 ./a.out > /dev/null 

 Performance counter stats for './a.out' (100 runs):

            110.19 msec task-clock:u              #    1.136 CPUs utilized            ( +-  0.18% )
                 0      context-switches:u        #    0.000 /sec                   
                 0      cpu-migrations:u          #    0.000 /sec                   
                52      page-faults:u             #  537.743 /sec                     ( +-  0.22% )
       428,518,442      cycles:u                  #    4.431 GHz                      ( +-  0.07% )
       900,147,986      instructions:u            #    2.24  insn per cycle           ( +-  0.00% )
       200,032,505      branches:u                #    2.069 G/sec                    ( +-  0.00% )
             2,139      branch-misses:u           #    0.00% of all branches          ( +-  0.77% )

          0.096956 +- 0.000203 seconds time elapsed  ( +-  0.21% )

-- 
MST


