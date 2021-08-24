Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21F3F5D45
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 13:43:55 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIUqQ-00083d-2k
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 07:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIUpR-0007Io-U3
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIUpQ-0006nX-2M
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629805370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iso7bt58RY5IoZJC7imhR+y4dSPS8Wjo86q8q/MxRQM=;
 b=ba1PTrhaeAowKe8dvX1kFkO0gHhpbid3DH4MdvV/SCO8n+0toawJRLsx9SKp6G2VTyTIMt
 E1i6MnqJrpn8rFS8i+4mRTe2UkyWqeWzTZcsXyGAeMkCbBJBACjcTVBw9sTiHwfZLOErTr
 8/cw7QfL2vutWABDTwFXOrdXZz0NRGg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-rIuAemJiMYeVpjxenkR6Yw-1; Tue, 24 Aug 2021 07:42:48 -0400
X-MC-Unique: rIuAemJiMYeVpjxenkR6Yw-1
Received: by mail-ej1-f71.google.com with SMTP id
 bx10-20020a170906a1ca00b005c341820edeso3980627ejb.10
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 04:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5w5fYjyYVhIacB4/koGS96XUqJuMEXo/5VCvR4n9IYs=;
 b=aPlc3mPMJpR5GyHb1Fa0HQnIA8jGigPl9/NzOMupthJ4v88ttlWsu79f7Jam/V1St3
 4WrM8ra/5waYOvpsG1YJ90y1vP2Laukcat2f1YVPC0oRVoRuuUHIxnscl8AA1a7u9suE
 CZ/p0BehUlwqWCH+JXyvM1LGFJ4pcwMt3ex0QJGYT4HAlocnW2RnJJ4o0s9gcJU6M9pB
 plEpuYmnNewXMISrVnn/ZEr5+RHNYOTYJAXGNGvRMCwAdPPh3Kuw+9YoRvw74xhIgQno
 RcLFZyNgfUPcwXEXs/DmqKCIwwSLZ3bJSB8RliiajIE62fYmjS/tJrz5JpaNfDxOmFfJ
 hDng==
X-Gm-Message-State: AOAM532EFi7x/ZkVtFkIPysktAyNyfTuHyiYZp6OdjgQ66uowLCKHXgS
 cVucveTDyIf71Ruj2gLpV1lQNZqMzrFgAYUbp6tKn5vXYODAM2fvoiPdFncKUycIginHYpvqgvB
 d2GANuwhS5NxJliM=
X-Received: by 2002:a17:907:2091:: with SMTP id
 pv17mr40202247ejb.204.1629805367290; 
 Tue, 24 Aug 2021 04:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3WxfCIR9DwUO8F8DUTu3cTc2qdhF6vXIrhuPDVZkAi5EPhNPSf0Qj7wlWA9zOwnpmC6LfFA==
X-Received: by 2002:a17:907:2091:: with SMTP id
 pv17mr40202213ejb.204.1629805367005; 
 Tue, 24 Aug 2021 04:42:47 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q21sm9050136ejs.43.2021.08.24.04.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 04:42:45 -0700 (PDT)
Date: Tue, 24 Aug 2021 13:42:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation
 failure error message
Message-ID: <20210824134244.39c199d2@redhat.com>
In-Reply-To: <YSSv4vwfqDbwNWQI@work-vm>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
 <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
 <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
 <1a63c2d2-7420-5fc1-1023-0504a67dc40b@redhat.com>
 <628a7ee5-b88d-c043-2e67-67e791532c18@redhat.com>
 <e6245d98-173c-2d25-8587-b6690c5f9037@redhat.com>
 <c0bbadf8-d834-168e-9aa5-b3cf1373aa91@redhat.com>
 <YSSv4vwfqDbwNWQI@work-vm>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1E?= =?UTF-8?B?YXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 09:37:54 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * David Hildenbrand (david@redhat.com) wrote:
> > On 23.08.21 12:34, Philippe Mathieu-Daud=C3=A9 wrote: =20
> > > On 8/23/21 12:24 PM, David Hildenbrand wrote: =20
> > > > On 23.08.21 12:12, Philippe Mathieu-Daud=C3=A9 wrote: =20
> > > > > On 8/23/21 11:29 AM, David Hildenbrand wrote: =20
> > > > > > On 23.08.21 11:23, Peter Maydell wrote: =20
> > > > > > > On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat=
.com>
> > > > > > > wrote: =20
> > > > > > > > Not opposed to printing the size, although I doubt that it =
will really
> > > > > > > > stop similar questions/problems getting raised. =20
> > > > > > >=20
> > > > > > > The case that triggered this was somebody thinking
> > > > > > > -m took a byte count, so very likely that an error message
> > > > > > > saying "you tried to allocate 38TB" would have made their
> > > > > > > mistake clear in a way that just "allocation failed" did not.
> > > > > > > It also means that if a future user asks us for help then
> > > > > > > we can look at the error message and immediately tell them
> > > > > > > the problem, rather than going "hmm, what are all the possibl=
e
> > > > > > > ways that allocation might have failed" and going off down
> > > > > > > rabbitholes like VM overcommit settings... =20
> > > > > >=20
> > > > > > We've had similar issues recently where Linux memory overcommit=
 handling
> > > > > > rejected the allocation -- and the user was well aware about th=
e actual
> > > > > > size. You won't be able to catch such reports, because people d=
on't
> > > > > > understand how Linux memory overcommit handling works or was co=
nfigured.
> > > > > >=20
> > > > > > "I have 3 GiB of free memory, why can't I create a 3 GiB VM". "=
I have 3
> > > > > > GiB of RAM, why can't I create a 3 GiB VM even if it won't make=
 use of
> > > > > > all 3 GiB of memory".
> > > > > >=20
> > > > > > Thus my comment, it will only stop very basic usage issues. And=
 I agree
> > > > > > that looking at the error *might* help. It didn't help for the =
cases I
> > > > > > just described, because we need much more system information to=
 make a
> > > > > > guess what the user error actually is. =20
> > > > >=20
> > > > > Is it possible to get the maximal overcommitable amount on Linux?=
 =20
> > > >=20
> > > > Not reliably I think.
> > > >=20
> > > > In the "always" mode, there is none.
> > > >=20
> > > > In the "guess"/"estimate" mode, the kernel takes a guess (currently
> > > > implemented as checking if the mmap size <=3D total RAM + total SWA=
P).
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0Committable =3D MemTotal + SwapTotal
> > > >=20
> > > > In the "never" mode:
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0Committable =3D CommitLimit - Committed_AS
> > > > However, the value gets further reduced for !root applications by
> > > > /proc/sys/vm/admin_reserve_kbytes.
> > > >=20
> > > > Replicating these calculations in user space would be suboptimal IM=
HO. =20
> > >=20
> > > What about simply giving a hint about memory overcommit and display
> > > a link to documentation with longer description about how to check
> > > and figure out this issue? =20
> >=20
> > That would be highly OS-specific -- for example, there is no memory
> > overcommit under Windows. Sure, we could add a Linux specific hint,
> > indication documentation. But I'm not sure if most end users stumbling =
into
> > such an error+hint would be able to make sense of memory overcommit det=
ails
> > (not to mention that they know what it even is) :)
> >=20
> > You can run into memory allocation issues with many applications. Let m=
e
> > give you a simple example
> >=20
> > t480s: ~  $ dd if=3D/dev/zero of=3D/dev/null ibs=3D100G
> > dd: memory exhausted by input buffer of size 107374182400 bytes (100 Gi=
B)
> >=20
> > So indicating the size of the failing allocation might be just good eno=
ugh.
> > For the other parts it's usually just "the way the OS was configured, i=
t
> > does not think it can allow this allocation". =20
>=20
> Does it also get complicated by the use of CGroup?

And if it's not complex enough, add to that NUMA node binding,
which introduces additional limitations on RAM size that
can be allocated.

> Dave
>=20
> > --=20
> > Thanks,
> >=20
> > David / dhildenb
> >  =20


