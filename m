Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058E343EBC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:01:55 +0100 (CET)
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIJm-00013Y-AC
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOIHG-0008LH-HB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOIHE-0007EV-QB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616410755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZGlgZBoUUQMZFr6Y5Qk2lq1TTR2mi8k2lAr5JAhPi8=;
 b=CqL/ygHzKwVFbeEJWm+wguQhsstA46RKlKWfE1LO9TClquCDEBmhnkbNlS5S/sTRMaieAw
 xZin9qpri4oghBBkbl+1VmhLuaxECzuh4gEw8HCBJh44J6FmC95hLZ65sng2tdvQ3nU5+R
 AyPBa5AoSzRMi2xAnOlhNF+TN6VRbdA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-HRS8M-s3Pz-Q_67EL-Q6bA-1; Mon, 22 Mar 2021 06:59:14 -0400
X-MC-Unique: HRS8M-s3Pz-Q_67EL-Q6bA-1
Received: by mail-ed1-f70.google.com with SMTP id cq11so27130007edb.14
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dZGlgZBoUUQMZFr6Y5Qk2lq1TTR2mi8k2lAr5JAhPi8=;
 b=cZmP75xGJ6Sy6Q7KMAMkRmS3/ARZXzwxAKlZzGIEjrzZpcoKDRey7fgYi1FbAArlX0
 IAMbKdpleglScvrdKVjujiSloHrqxdr0pHCkTIKBNJ0Efyl4KBmpRPKpZ1tO4RWzFzsd
 WcDqP+PXmNkvLzK0ppUL41OR6cQmTazZJB+qyKACj9+B2q3CV65rlXVyD5IEh8FvwxN/
 2lEBXy6jnsbUMyueZScE4b8LLStK1cgnlKvpDPgr2aMoc2DBWJ8GlpDeGI/MIo8EFeZ1
 hN4HQ8oXVsbsmrhivQilDtkkjB4KsCiZn4V9ROT2FnBTsSySvMVHZczWv612e/iFviEv
 967Q==
X-Gm-Message-State: AOAM533qhTCxqyPj1VW5VPWxVeyL/81GsbYc/dMU2oCpQjVWRFlH0j3Q
 CW6Pey6lBie0WgA4Ll3e0pzJgmj5ouqwhBHnjFAmw3LfevqjtsnQVQW0LC+GJ1hagZPfS5xQowq
 ax4ANsY91gofdxCA=
X-Received: by 2002:a17:906:7c44:: with SMTP id
 g4mr18410220ejp.269.1616410753186; 
 Mon, 22 Mar 2021 03:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+Fd/M5DEc5NLr95Qtz7CKeWfxuXWBbzWxGSzWQPmfmcqxVrkWiRIOzpooJppKmfOBB8xtQw==
X-Received: by 2002:a17:906:7c44:: with SMTP id
 g4mr18410200ejp.269.1616410752984; 
 Mon, 22 Mar 2021 03:59:12 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id h13sm11229429edz.71.2021.03.22.03.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 03:59:12 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:59:10 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <CAGxU2F5x_TNQZJ3f+baam3pHzzP+0k57FFNB5ms-qt3B25gSVQ@mail.gmail.com>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
 <20210319173524.rnrxslpmdjck6uxv@steredhat>
 <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
 <20210319182022.veha5gbcg3p4idgk@steredhat>
 <CAGxU2F7hNoJeDpsCtU0ypKd=3+3mrxcc3QU6Yx9SK9e_7y6Khw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F7hNoJeDpsCtU0ypKd=3+3mrxcc3QU6Yx9SK9e_7y6Khw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 7:25 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Fri, Mar 19, 2021 at 7:20 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > On Fri, Mar 19, 2021 at 06:52:39PM +0100, Paolo Bonzini wrote:
> > >It's likely that the compiler will online it. But indeed it's better to add
> > >-minline-all-stringops to the compiler command line.
> > >
> >
> > Cool, I didn't know that one!
> > I tried but I did something wrong because the linker is not happy, next
> > week I'll check better:
> > ld: pvh_main.o: in function `search_rsdp':
> > /home/stefano/repos/qemu/pc-bios/optionrom/pvh_main.c:62: undefined reference to `memcmp'
> > ld: /home/stefano/repos/qemu/pc-bios/optionrom/pvh_main.c:62: undefined reference to `memcmp'
> >
> >
> > In the mean time, I simply tried to assign the RSDP_SIGNATURE macro to
> > an uint64_t variable and I have this new warning, using gcc 10.2.1 "cc
> > (Alpine 10.2.1_pre2) 10.2.1 20210313":
> >
> > In file included from /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:25:
> > /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
> > /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:30:42: warning: conversion from 'long long unsigned int' to 'uint64_t' {aka 'long unsigned int'} changes value from '2329016660419433298' to '541348690' [-Woverflow]
> >     30 | #define RSDP_SIGNATURE          UINT64_C(0x2052545020445352) /* "RSD PTR " */
> >        |                                          ^~~~~~~~~~~~~~~~~~
> > /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:69:31: note: in expansion of macro 'RSDP_SIGNATURE'
> >     69 |     uint64_t rsdp_signature = RSDP_SIGNATURE;
> >        |
> >
> > Using gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9) I don't have it.
> >
> > It seems a bit strange, I don't know if it's related to the fact that we
> > compile with -m16, I'll check better.
>
> Anyway I think that using memcmp() I can switch to a character array to
> store the signature, but this gcc warnings confused me a bit...
>

I'll send a patch to add a simple implementation of memcmp and use it 
since I wasn't able to embedded it with -minline-all-stringops.

In the mean time, I played a bit with sizeof() to understand what's 
going on and I think there is something strange with Alpine gcc 
10.2.1_pre2.

I added this 3 lines in pvh_main.c to print the sizes at compile time 
(maybe there is a better way :-):

+    char (*__size1)[sizeof(uint64_t)] = 1;
+    char (*__size2)[sizeof(UINT64_C(1))] = 1;
+    char (*__size3)[sizeof(UINT64_C(0x2052545020445352))] = 1;


If I build with gcc 10.2.1 20201125 (Red Hat 10.2.1-9) everything looks 
normal, since they are all 8 bytes:

   warning: initialization of ‘char (*)[8]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   74 |     char (*__size1)[sizeof(uint64_t)] = 1;
      |                                         ^
   warning: initialization of ‘char (*)[8]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   75 |     char (*__size2)[sizeof(UINT64_C(1))] = 1;
      |                                            ^
   warning: initialization of ‘char (*)[8]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   76 |     char (*__size3)[sizeof(UINT64_C(0x2052545020445352))] = 1;


If I build with gcc 10.2.1 20210313 (Alpine 10.2.1_pre2) uint64_t and 
UINT64_C(1) have a size of 4 bytes, while UINT64_C(0x2052545020445352) 
has a size of 8 bytes:

   warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   74 |     char (*__size1)[sizeof(uint64_t)] = 1;
      |                                         ^
   warning: initialization of ‘char (*)[4]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   75 |     char (*__size2)[sizeof(UINT64_C(1))] = 1;
      |                                            ^
   warning: initialization of ‘char (*)[8]’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   76 |     char (*__size3)[sizeof(UINT64_C(0x2052545020445352))] = 1;

This is a bit strange...

Thanks,
Stefano


