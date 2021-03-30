Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03934E7D9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:49:40 +0200 (CEST)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDoR-0007j0-FI
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lRDlt-0006Eb-Ni
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lRDlq-000797-5U
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9w+72Aj7tixZ62yUVO/4XVYc4FIACD1jnUr/XYw2nFs=;
 b=ahWnKn4PaStZMg+UIYpQYLRTQqYt0jEG1QcyouoLp66BddT5h0qW9OHQfbdMmf6+URP59U
 TosgGLTOdCVPT6gsOH+YmImk1w/tWZvF/JVlV0ZtyBJMfmzlBn3BVQgtjUC3ZVibuiEsei
 SfrPzb3dR7MsyFsxdfTUJzFiq2zfB+Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-x5opMBCaNNm31iZKOaVQtg-1; Tue, 30 Mar 2021 08:46:51 -0400
X-MC-Unique: x5opMBCaNNm31iZKOaVQtg-1
Received: by mail-wm1-f72.google.com with SMTP id n2so647959wmi.2
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9w+72Aj7tixZ62yUVO/4XVYc4FIACD1jnUr/XYw2nFs=;
 b=mTdvGJY5KXi0jukuvQKgT5VMmPouGk+cIt+T+vX6mjA5x4h8NvYnBWXhcgQ5w0+7bF
 hUxn5jorA2/U3Edk1sSTj8DvpPPhopYz2sRA2nrUrDSyFkba74cE7tJsVyX0kjL84B8O
 wf8uEqiK4Zze5ziUHVz0IyadZ0cmcplLfqqx9L/g64LC/LHcWqaz8+SVgax10ortnMQb
 eiHJAMVc3n3+LViDpIGSH3S5rCs6ZQ3vDqyAS3zV3+C1zS3rkb91puAeQzzKDWZpxi4M
 qd/2V8UhlzcTRuStgR1rYcehQz6fQua7MjBaO7RW1f2GinYY/nwF2RTho5YGFkx1r5h1
 /blw==
X-Gm-Message-State: AOAM530cP1WciJhogOHmV9Pfv1+b3xc9m++bYu3hLZMZSkB1RJn2EuTx
 SmXTymn+bTeoPQdU4i8j3jKUPfSfBACO36TQd724fngWVAbfkpqrPydGsBeoecq+rsQjYBl5TUA
 Qmcruw9Sg4ZwxrRA=
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr4030586wmf.47.1617108409890; 
 Tue, 30 Mar 2021 05:46:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwoSfXbZE9GRn6JXQxrGnbEqKBbh3vEcivUtlrm5T41kSRh1O0Ms6q4FbVIBxfw7LXgE1xGw==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr4030564wmf.47.1617108409656; 
 Tue, 30 Mar 2021 05:46:49 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id h14sm42512910wrq.45.2021.03.30.05.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 05:46:49 -0700 (PDT)
Date: Tue, 30 Mar 2021 14:46:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: John Simpson <ttr9droid@gmail.com>
Subject: Re: An error due to installation that require binutils package
Message-ID: <20210330124646.jl4re5srmbzhkipm@steredhat>
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
 <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "gcc-help@gcc.gnu.org" <gcc-help@gcc.gnu.org>,
 xen-devel@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>, qemu-devel@nongnu.org,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi John,

On Mon, Mar 29, 2021 at 09:46:49PM +0300, John Simpson wrote:
>Hello,
>
>Kindly ask you to have a look at this bug.
>Thank you for your replies.

It's already fixed in QEMU upstream and the fix will be released with 
the 6.0 version next month (the rc0 is already available):
https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f51884e0a26e53

I guess xen-4.14.1 is using an older version, so if you want you can 
backport that patch in your version, the change should be simple.

Thanks,
Stefano

>
>On Mon, Mar 29, 2021 at 7:07 PM George Dunlap <George.Dunlap@citrix.com>
>wrote:
>
>> John,
>>
>> Thanks for your report.  Can you post your bug report
>> xen-devel@lists.xenproject.org ?
>>
>> The bug is in the compilation of QEMU, which is an external project; so
>> it’s possible that we’ll end up having to raise this with that community as
>> well.
>>
>> Thanks,
>>  -George Dunlap
>>
>> > On Mar 28, 2021, at 2:26 PM, John Simpson <ttr9droid@gmail.com> wrote:
>> >
>> > Hello,
>> >
>> > Just forwarding this message to you. Can you give some thoughs about
>> this? Thanks a lot.
>> >
>> >
>> > ---------- Forwarded message ---------
>> > From: Alan Modra <amodra@gmail.com>
>> > Date: Sun, Mar 28, 2021 at 2:21 PM
>> > Subject: Re: An error due to installation that require binutils package.
>> > To: John Simpson <ttr9droid@gmail.com>
>> > Cc: <binutils@sourceware.org>
>> >
>> >
>> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils
>> wrote:
>> > >   BUILD   pc-bios/optionrom/kvmvapic.img
>> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> >
>> > -no-pie is a gcc option.  Neither -no-pie nor --no-pie is a valid ld
>> > option.  The fault lies with whatever passed -no-pie to ld.
>> >
>> > --
>> > Alan Modra
>> > Australia Development Lab, IBM
>> >
>> >
>> >
>> > ---------- Forwarded message ---------
>> > From: Andreas Schwab <schwab@linux-m68k.org>
>> > Date: Sun, Mar 28, 2021 at 2:17 PM
>> > Subject: Re: An error due to installation that require binutils 
>> > package.
>> > To: John Simpson via Binutils <binutils@sourceware.org>
>> > Cc: John Simpson <ttr9droid@gmail.com>
>> >
>> >
>> > Please report that to the xen project.  ld -no-pie doesn't have a useful
>> > meaning.  It used to mean the same as ld -n -o-pie, which sets "-pie" as
>> > the output file name.
>> >
>> > Andreas.
>> >
>> > --
>> > Andreas Schwab, schwab@linux-m68k.org
>> > GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
>> > "And now for something completely different."
>> >
>> >
>> >
>> > ---------- Forwarded message ---------
>> > From: John Simpson <ttr9droid@gmail.com>
>> > Date: Sun, Mar 28, 2021 at 12:55 PM
>> > Subject: An error due to installation that require binutils package.
>> > To: <binutils@sourceware.org>
>> >
>> >
>> > Hello,
>> >
>> > Recently I got a following error due to installation xen on
>> 5.11.6-1-MANJARO kernel:
>> >
>> >   GEN     target/riscv/trace.c
>> >   GEN     target/s390x/trace.c
>> >   GEN     target/sparc/trace.c
>> >   GEN     util/trace.c
>> >   GEN     config-all-devices.mak
>> > make[1]: Entering directory
>> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
>> > make[1]: Nothing to be done for 'all'.
>> > make[1]: Leaving directory
>> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
>> >   BUILD   pc-bios/optionrom/multiboot.img
>> >   BUILD   pc-bios/optionrom/linuxboot.img
>> >   BUILD   pc-bios/optionrom/linuxboot_dma.img
>> >   BUILD   pc-bios/optionrom/kvmvapic.img
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: multiboot.img] Error 1
>> > make[1]: *** Waiting for unfinished jobs....
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1
>> >   BUILD   pc-bios/optionrom/pvh.img
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: linuxboot.img] Error 1
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: kvmvapic.img] Error 1
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:50: pvh.img] Error 1
>> > make: *** [Makefile:581: pc-bios/optionrom/all] Error 2
>> > make: Leaving directory
>> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen-build'
>> > make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2
>> > make[3]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
>> > make[2]: ***
>> [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.mk:235:
>> subdirs-install] Error 2
>> > make[2]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
>> > make[1]: *** [Makefile:72: install] Error 2
>> > make[1]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
>> > make: *** [Makefile:134: install-tools] Error 2
>> > ==> ERROR: A failure occurred in build().
>> >     Aborting...
>> >
>> > Currently I have fresh binutils 2.36.1-2 and it seems to me that the
>> issue is related to this part of code:
>> >
>> > https://github.com/bminor/binutils-gdb/blob/master/ld/lexsup.c#L451
>> >
>> > It seems to me that this could impact far more users than just me.
>> >
>>
>>


