Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C357024C4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 08:33:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyRl1-00048g-Ng; Mon, 15 May 2023 02:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyRko-00047F-IF; Mon, 15 May 2023 02:32:19 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyRkl-0003Pr-4Q; Mon, 15 May 2023 02:32:18 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-643ac91c51fso7892647b3a.1; 
 Sun, 14 May 2023 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684132333; x=1686724333;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAirHYwph2UTXTEcM2zVtFG9b9kb0IP66rHrC/WC5Lc=;
 b=seL2PQOHa2Dn9t7UwTXsYoJCfux1r4X29xqukQR5rX1K4OIC96Ubg2/bqIQGfHUf8j
 G4T9yBzJkUlRQoFntc8ZO38wR9d6x0nfHVaSYUSAcVSkklnsXajblBhCu/84uU2qR67U
 tHvl+QzqmIVCz5kDhQXqCvdSRkYYnyAO9w7uS00XvMRF5mNeKIa7Rd3j8yB9xaXoiFGD
 hd53/ylbPZmOSGgKNJCR6U+hZX96kdYDvjqzakTsWOfpV4PcjXwn1kELUhdfWJUmn7P3
 VHwo0lGUS2xxT4MLUhTNjblKuV8j3xKtj4GuD7Ld9YwUH6tkh6LC4MHps8qX9NkbRwKn
 ijJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684132333; x=1686724333;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xAirHYwph2UTXTEcM2zVtFG9b9kb0IP66rHrC/WC5Lc=;
 b=Z5RK/fwtRAemfOEd///Iw1giulFaDEkOXy3pq+mRuOh+KquAkzZx0ErZj2fb157by/
 7VfJGn6MIy0u5c05tv3S3h2fdKoJc4dgpxiI53BpV9w62uLRnLEl9YHUAzx71oXmmKYV
 9NS8eo9nOG0qZV9DF0yMiNzBnzTSbNmZo0H3ZaFA7pxexp53R47cogZ5te7pwxrATGQ0
 5cIOJc4kNPIv3PbJIKa1KBEO+Q9w/ZNRpUYT9wE3iTdkCCFQDG+I95tHydMqCFHVYu44
 fSzrsaWmc40PpGkuwllfwQT4zbJ/yj0+CMQDVXfxPd0d/0HeY6nRLK9eUapwHcCWFHfr
 /mMg==
X-Gm-Message-State: AC+VfDyIQELun3wjoFS0Kh8Ju63TvdLwjnytPb0oV38jAMzR3RuMx5Kh
 GBr3FandrB5ssqa2yKfxlLU=
X-Google-Smtp-Source: ACHHUZ7jhNGJbYOPFv4Yzbb8vsNMgqZ4PyduLPPnR+h6DMKjdIvEyZ+iZwV5+LlH+cFjLd8KVHvj9A==
X-Received: by 2002:a05:6a00:1311:b0:648:c1be:483 with SMTP id
 j17-20020a056a00131100b00648c1be0483mr19760633pfu.4.1684132332908; 
 Sun, 14 May 2023 23:32:12 -0700 (PDT)
Received: from localhost ([1.146.119.84]) by smtp.gmail.com with ESMTPSA id
 n1-20020aa78a41000000b0064550f76efesm11041776pfa.29.2023.05.14.23.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 23:32:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 16:32:03 +1000
Message-Id: <CSMN30SCVNA1.DOF9IMJOJRM5@wheely>
Subject: Re: [PATCH] target: ppc: Correctly initialize HILE in HID-0 for
 book3s processors
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Fabiano Rosas" <farosas@suse.de>, "Vaibhav Jain"
 <vaibhav@linux.ibm.com>, "Narayana Murty N" <nnmlinux@linux.ibm.com>,
 <danielhb413@gmail.com>, <clg@kaod.org>, <david@gibson.dropbear.id.au>,
 <groug@kaod.org>
Cc: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, <npiggin@linux.ibm.com>,
 <vajain21@linux.ibm.com>, <harshpb@linux.ibm.com>, <sbhat@linux.ibm.com>
X-Mailer: aerc 0.14.0
References: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
 <87v8hq8lgz.fsf@suse.de> <87y1mcfvzo.fsf@vajain21.in.ibm.com>
 <87sfckrsd9.fsf@suse.de>
In-Reply-To: <87sfckrsd9.fsf@suse.de>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat Apr 29, 2023 at 12:30 AM AEST, Fabiano Rosas wrote:
> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
> > Hi Fabiano,
> >
> > Thanks for looking into this patch and apologies for the delayed repons=
e.
> > Fabiano Rosas <farosas@suse.de> writes:
> >
> >> Narayana Murty N <nnmlinux@linux.ibm.com> writes:
> >>
> >>> On PPC64 the HILE(Hypervisor Interrupt Little Endian) bit in HID-0
> >>> register needs to be initialized as per isa 3.0b[1] section
> >>> 2.10. This bit gets copied to the MSR_LE when handling interrupts tha=
t
> >>> are handled in HV mode to establish the Endianess mode of the interru=
pt
> >>> handler.
> >>>
> >>> Qemu's ppc_interrupts_little_endian() depends on HILE to determine Ho=
st
> >>> endianness which is then used to determine the endianess of the guest=
 dump.
> >>>
> >>
> >> Not quite. We use the interrupt endianness as a proxy to guest
> >> endianness to avoid reading MSR_LE at an inopportune moment when the
> >> guest is switching endianness.
> > Agreed
> >
> >> This is not dependent on host
> >> endianness. The HILE check is used when taking a memory dump of a
> >> HV-capable machine such as the emulated powernv.
> >
> > I think one concern which the patch tries to address is the guest memor=
ydump file
> > generated of a BigEndian(BE) guest on a LittleEndian(LE) host is not re=
adable on
> > the same LE host since 'crash' doesnt support cross endianess
> > dumps. Also even for a LE guest on LE host the memory dumps are marked =
as BE
> > making it not possible to analyze any guest memory dumps on the host.
> >
>
> From QEMU's perspective there's no "host" in this equation. We'll
> generate a BE dump for a BE guest and a LE dump for a LE guest. Anything
> different is a bug in QEMU (as the one this patch addresses).

I'm trying to figure out what's going on here. On one hand we are
creating a dump for/in the host. The dump is just a format that
describes register metadata, the same values can be represented just
fine with either endian. Memory has no endianness (without data
structures). So from that perspective, we do want to dump host endian
format.

OTOH crash could be taught foreign-endianness in which case the
endianness of the ELF file could be useful metadata about the
target I suppose. But ILE !=3D MSR[LE] at any given time.

ILE seems like a half way house. It doesn't always give host endian
dumps so crash won't always work. It doesn't always give the machine
operating mode either. So why is it better to take guest ILE mode than
HV ILE mode?

I guess the first thing we need is a better and precise description of
the problem and the desired resolution. PPC64 has powernv and pseries,
both of which can support guests in various ways (PR, HV, nested HV),
and then when running guests the target itself also functions as a host,
so need to make all that unambiguous and use correct terminoogy in
the changelog.

> > However setting the HILE based on host endianess of qemu might not be
> > the right way to fix this problem. Based on an off mailing list discuss=
ion
> > with Narayana, he is working on another patch which doesnt set HILE
> > based on host endianess. However the problem seems to be stemming from
> > fact that qemu on KVM is using the HILE to set up the endianess of
> > memory-dump elf and since its not setup correctly the memory dumps are
> > in wrong endianess.
> >
> >> I think the actual issue might be that we're calling
> >> ppc_interrupts_little_endian with hv=3Dtrue for the dump.
> >>
> > Yes, that is currently the case with cpu_get_dump_info(). Excerpt from
> > that function below that sets the endianess of the dump:
> >
> >     if (ppc_interrupts_little_endian(cpu, cpu->env.has_hv_mode)) {
>
> This should probably be looking at cpu->vhyp or MSR_HVB since
> has_hv_mode will not change after we init the cpu.
>
> >         info->d_endian =3D ELFDATA2LSB;
> >     } else {
> >         info->d_endian =3D ELFDATA2MSB;
> >     }
> >
> > for pseries kvm guest cpu->env.has_hv_mode is already set hence
> > ppc_interrupts_little_endian() assumes its running in 'hv' mode. The ne=
w
> > patch from Narayana will be addressing this.
> >
> >>> Currently the HILE bit is never set in the HID0 register even if the
> >>> qemu is running in Little-Endian mode. This causes the guest dumps to=
 be
> >>> always taken in Big-Endian byte ordering. A guest memory dump of a
> >>> Little-Endian guest running on Little-Endian qemu guest fails with th=
e
> >>> crash tool as illustrated below:
> >>>
> >>
> >> Could you describe in more detail what is your setup? Specifically
> >> whether both guests are running TCG or KVM (info kvm) and the state of
> >> the nested-hv capability in QEMU command line.
> > Currently the issue is seen with any pseries KVM guest running on a Pow=
erNV host.

Okay originally I thought you were talking about a powernv target
that is running a pseries guest and dumping that. But after re-reading, I
think you're talking about dumping a pseries target?

Questions still remain about why that's the best way to go. If the
target was running a nested-HV guest, is it reasonable that the guest
can change the endinaness of the target dump on a whim by changing its
ILE?

Thanks,
Nick

