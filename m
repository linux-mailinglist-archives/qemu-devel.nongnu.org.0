Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24130C2A2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:57:09 +0100 (CET)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x76-0001uh-FA
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6wkz-0000ec-7u
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6wkt-00068E-Hk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pWynqGmsBPMo2csT8/XD1/efepqrc/Xop2AsNdNMfV8=;
 b=Fem1xK+5Q/CP+MVOoifpu/8tzY9RQYf9CqMHZZrJSpPIw8dy/ojetmcdGsAHjJgV1cLL42
 0ZEAPwBaRRmDZ6GRFXy3Gt5mAPJhLMXbYe4GW8H/0oVo6bvmytV3+dLGLr7LiF2NcUVmQ1
 MxGQKJ79Rpn0OiZtLkIfuZyYHb2+nEM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-HX-KUkhSNBqdourew-7qdQ-1; Tue, 02 Feb 2021 09:34:09 -0500
X-MC-Unique: HX-KUkhSNBqdourew-7qdQ-1
Received: by mail-wm1-f69.google.com with SMTP id z188so1562508wme.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pWynqGmsBPMo2csT8/XD1/efepqrc/Xop2AsNdNMfV8=;
 b=jxNSM0XOzxXTG6oKhdNl9psCb9P/ZLTlxzxvUJBTE5N/3xY8sawmVU4rZa19R6AvzR
 S4VmbE5FkcA9C2F1YG+O+Y1ProDV4vshgRazfbeJyUGoBK4QkrTkftJKNJio22LsApMS
 rkzk3NtSogR3Sgh1Cgwxu5g33SMvx64YFDXRxwR7Oel6KnzIcQ+zGWt+VsMc/25Vyve2
 OLtjxghe4faZSXq/7pVH3keotHXlAJj4CVHl2uqiH4JRqlDiTjUzjp+FysXMfQKGpg6L
 Kfghr6tGD3ZpFXvx4KwpNPHXxvr9/fo6E9gLc5wgCHgL6GM7eyiwazflynYGkZFcBPtF
 Kyug==
X-Gm-Message-State: AOAM533Vdr3ByMOvKNkV7EZqN0PFvQEnFYjoENT82dsMTe2Tq3NBropo
 P5Vy0yz/vRPPsXpyBvtkCtvuBRyPF19VrRCk0/By06Yt9ZK8XV/43J8BTy/t9Xp2UDVMRHaSZhJ
 +f5zgy8Fg+G4u3Ro=
X-Received: by 2002:a5d:4806:: with SMTP id l6mr24622865wrq.389.1612276448256; 
 Tue, 02 Feb 2021 06:34:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1hCDA2xSSHkNj2aRCVD2MGe1J566UOUcjjiLZk0lXEd3kct9S6G5KO9A8n4axv2y33eEesA==
X-Received: by 2002:a5d:4806:: with SMTP id l6mr24622831wrq.389.1612276448024; 
 Tue, 02 Feb 2021 06:34:08 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id q9sm3873912wme.18.2021.02.02.06.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 06:34:05 -0800 (PST)
Date: Tue, 2 Feb 2021 09:34:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Graf <graf@amazon.de>
Subject: Re: [PATCH v4 0/2] System Generation ID driver and VMGENID backend
Message-ID: <20210202093337-mutt-send-email-mst@kernel.org>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <20210112074658-mutt-send-email-mst@kernel.org>
 <9952EF0C-CD1D-4EDB-BAB8-21F72C0BF90D@amazon.com>
 <20210127074549-mutt-send-email-mst@kernel.org>
 <7bcd1cf3-d055-db46-95ea-5c023df2f184@amazon.de>
MIME-Version: 1.0
In-Reply-To: <7bcd1cf3-d055-db46-95ea-5c023df2f184@amazon.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "avagin@gmail.com" <avagin@gmail.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "jannh@google.com" <jannh@google.com>, "Weiss,
 Radu" <raduweis@amazon.com>, "asmehra@redhat.com" <asmehra@redhat.com>,
 "Catangiu, Adrian Costin" <acatan@amazon.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "luto@kernel.org" <luto@kernel.org>,
 "gil@azul.com" <gil@azul.com>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "tytso@mit.edu" <tytso@mit.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "areber@redhat.com" <areber@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "ovzxemul@gmail.com" <ovzxemul@gmail.com>, "w@1wt.eu" <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 01:58:12PM +0100, Alexander Graf wrote:
> Hey Michael!
> 
> On 27.01.21 13:47, Michael S. Tsirkin wrote:
> > 
> > On Thu, Jan 21, 2021 at 10:28:16AM +0000, Catangiu, Adrian Costin wrote:
> > > On 12/01/2021, 14:49, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > 
> > >      On Tue, Jan 12, 2021 at 02:15:58PM +0200, Adrian Catangiu wrote:
> > >      > The first patch in the set implements a device driver which exposes a
> > >      > read-only device /dev/sysgenid to userspace, which contains a
> > >      > monotonically increasing u32 generation counter. Libraries and
> > >      > applications are expected to open() the device, and then call read()
> > >      > which blocks until the SysGenId changes. Following an update, read()
> > >      > calls no longer block until the application acknowledges the new
> > >      > SysGenId by write()ing it back to the device. Non-blocking read() calls
> > >      > return EAGAIN when there is no new SysGenId available. Alternatively,
> > >      > libraries can mmap() the device to get a single shared page which
> > >      > contains the latest SysGenId at offset 0.
> > > 
> > >      Looking at some specifications, the gen ID might actually be located
> > >      at an arbitrary address. How about instead of hard-coding the offset,
> > >      we expose it e.g. in sysfs?
> > > 
> > > The functionality is split between SysGenID which exposes an internal u32
> > > counter to userspace, and an (optional) VmGenID backend which drives
> > > SysGenID generation changes based on hw vmgenid updates.
> > > 
> > > The hw UUID you're referring to (vmgenid) is not mmap-ed to userspace or
> > > otherwise exposed to userspace. It is only used internally by the vmgenid
> > > driver to find out about VM generation changes and drive the more generic
> > > SysGenID.
> > > 
> > > The SysGenID u32 monotonic increasing counter is the one that is mmaped to
> > > userspace, but it is a software counter. I don't see any value in using a dynamic
> > > offset in the mmaped page. Offset 0 is fast and easy and most importantly it is
> > > static so no need to dynamically calculate or find it at runtime.
> > 
> > Well you are burning a whole page on it, using an offset the page
> > can be shared with other functionality.
> 
> Currently, the SysGenID lives is one page owned by Linux that we share out
> to multiple user space clients. So yes, we burn a single page of the system
> here.
> 
> If we put more data in that same page, what data would you put there? Random
> other bits from other subsystems? At that point, we'd be reinventing vdso
> all over again, no? Probably with the same problems.
> 
> Which gets me to the second alternative: Reuse VDSO. The problem there is
> that the VDSO is an extremely architecture specific mechanism. Any new
> architecture we'd want to support would need multiple layers of changes in
> multiple layers of both kernel and libc. I'd like to avoid that if we can
> :).
> 
> So that leaves us with either wasting a page per system or not having an
> mmap() interface in the first place.
> 
> The reason we have the mmap() interface is that it's be easier to consume
> for libraries, that are not hooked into the main event loop.
> 
> So, uh, what are you suggesting? :)

I'd drop mmap at this point. I haven't seen a way to use it
that isn't racy.

> 
> Alex
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 


