Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE03D5710
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:07:54 +0200 (CEST)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xWc-0004xr-0a
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7xVo-0004Cw-Gt
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7xVk-0003YV-7i
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627294018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTDC60FXaFBoEe9kN5zioiG3bR9tZCd0vnKutMcBsKQ=;
 b=AcNDRZ4HES9+xFa5DxQ6jwJ1F2GsZ4WRQ2XWItdBhBiyzPtWt9vfJLM8523/Y328oYMUgk
 5sLSsheJKOPsu+Raiy0okR/yJjMGksxkamFEpRBdoFmuOGtLH2F5O4EIke9NUBF6MpXRzU
 mr8esofBhX8sVzVHc+Y2FEbyxpOhbN8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-bOAjn9gJPYiqNn4LMJCIJA-1; Mon, 26 Jul 2021 06:06:56 -0400
X-MC-Unique: bOAjn9gJPYiqNn4LMJCIJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s22-20020adf97960000b02901535eae4100so2579951wrb.14
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTDC60FXaFBoEe9kN5zioiG3bR9tZCd0vnKutMcBsKQ=;
 b=UucuwN/flM36AbVY9XTy3/kQLDWzCpdT0jAKbHlERJgCh7heNpAFQcUOkNx9URe+WP
 +QOnQS0iiwmVxhi6RcIpCVce6FLobBVB6h0j2/8H7OU3KjpDdT0dqwx1FGlIoF9uxU7u
 RiBTmzCzplPlE/Sww2ZSA12sYMVW7JVN98viO0EVoUy3120/pQ6kEIN7n4rWXrk3+Me/
 Arv08yBUhEv1yQSzKPqpCAgkePUMFwhEEuCHLWlO9uwfDHdYFNhquTNol04Itg02Pay8
 At7S8zYPcBRWfpW4CxtFjxcMjuZmIY6WGrSqcjhwONwi0SVwTXvQmY6YK8OiwsrHD/cQ
 UpkA==
X-Gm-Message-State: AOAM530nJHlhQSTYRwWcr1DidMp25B8XdK4YBh/GzKxuLjqIzx7tHsxv
 M5/c9SfBOwY5B+O4uYD7Bp5UxghP+sC1Ho2nUIJUnVNIrh18f02bmJJH+My3Q4QgyuKa8sZfKmc
 arLy+3yf2Gi7xYLA=
X-Received: by 2002:adf:f485:: with SMTP id l5mr337721wro.8.1627294015577;
 Mon, 26 Jul 2021 03:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwymoY+3Tul/lmgv0gkCrbgc5vHG/IYHzaqLzLVc4xrX4iDhkAxjqMFf9A6GLJRsKs4fW5gA==
X-Received: by 2002:adf:f485:: with SMTP id l5mr337692wro.8.1627294015357;
 Mon, 26 Jul 2021 03:06:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v15sm36622463wmj.11.2021.07.26.03.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 03:06:54 -0700 (PDT)
Date: Mon, 26 Jul 2021 12:06:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 02/10] ACPI ERST: specification for ERST support
Message-ID: <20210726120650.4bb9272f@redhat.com>
In-Reply-To: <c0b0a60a-bd4e-ef2c-d398-bef96d8731dc@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
 <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210719170244.7402e008@redhat.com>
 <c0b0a60a-bd4e-ef2c-d398-bef96d8731dc@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Eric Blake <eblake@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 10:42:33 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/19/21 10:02 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 19:26:39 +0000
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >   
> >> Oops, at the end of the 4th paragraph, I meant to state that "Linux does not support the NVRAM mode."
> >> rather than "non-NVRAM mode", which contradicts everything I stated prior.
> >> Eric.
> >> ________________________________
> >> From: Eric DeVolder <eric.devolder@oracle.com>
> >> Sent: Wednesday, June 30, 2021 2:07 PM
> >> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> >> Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >> Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support
> >>
> >> Information on the implementation of the ACPI ERST support.
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >> ---
> >>   docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 152 insertions(+)
> >>   create mode 100644 docs/specs/acpi_erst.txt
> >>
> >> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
> >> new file mode 100644
> >> index 0000000..79f8eb9
> >> --- /dev/null
> >> +++ b/docs/specs/acpi_erst.txt
> >> @@ -0,0 +1,152 @@
> >> +ACPI ERST DEVICE
> >> +================
> >> +
> >> +The ACPI ERST device is utilized to support the ACPI Error Record
> >> +Serialization Table, ERST, functionality. The functionality is
> >> +designed for storing error records in persistent storage for
> >> +future reference/debugging.
> >> +
> >> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> >> +(APEI)", and specifically subsection "Error Serialization", outlines
> >> +a method for storing error records into persistent storage.
> >> +
> >> +The format of error records is described in the UEFI specification[2],
> >> +in Appendix N "Common Platform Error Record".
> >> +
> >> +While the ACPI specification allows for an NVRAM "mode" (see
> >> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
> >> +directly exposed for direct access by the OS/guest, this implements
> >> +the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
> >> +by most BIOS (since flash memory requires programming operations
> >> +in order to update its contents). Furthermore, as of the time of this
> >> +writing, Linux does not support the non-NVRAM "mode".  
> > 
> > shouldn't it be s/non-NVRAM/NVRAM/ ?  
> 
> Yes, it has been corrected.
> 
> >   
> >> +
> >> +
> >> +Background/Motivation
> >> +---------------------
> >> +Linux uses the persistent storage filesystem, pstore, to record
> >> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> >> +independent of, and runs before, kdump.  In certain scenarios (ie.
> >> +hosts/guests with root filesystems on NFS/iSCSI where networking
> >> +software and/or hardware fails), pstore may contain the only
> >> +information available for post-mortem debugging.  
> > 
> > well,
> > it's not the only way, one can use existing pvpanic device to notify
> > mgmt layer about crash and mgmt layer can take appropriate measures
> > to for post-mortem debugging, including dumping guest state,
> > which is superior to anything pstore can offer as VM is still exists
> > and mgmt layer can inspect VMs crashed state directly or dump
> > necessary parts of it.
> > 
> > So ERST shouldn't be portrayed as the only way here but rather
> > as limited alternative to pvpanic in regards to post-mortem debugging
> > (it's the only way only on bare-metal).
> > 
> > It would be better to describe here other use-cases you've mentioned
> > in earlier reviews, that justify adding alternative to pvpanic.  
> 
> I'm not sure how I would change this. I do say "may contain", which means it
> is not the only way. Pvpanic is a way to notify the mgmt layer/host, but
> this is a method solely with the guest. Each serves a different purpose;
> plugs a different hole.
> 

I'd suggest edit  "pstore may contain the only information" as "pstore may contain information"

> As noted in a separate message, my company has intentions of storing other
> data in ERST beyond panics.
perhaps add your use cases here as well.
 

> >> +Two common storage backends for the pstore filesystem are ACPI ERST
> >> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
> >> +all guests. With QEMU supporting ACPI ERST, it becomes a viable
> >> +pstore storage backend for virtual machines (as it is now for
> >> +bare metal machines).
> >> +  
> >   
> >> +Enabling support for ACPI ERST facilitates a consistent method to
> >> +capture kernel panic information in a wide range of guests: from
> >> +resource-constrained microvms to very large guests, and in
> >> +particular, in direct-boot environments (which would lack UEFI
> >> +run-time services).  
> > this hunk probably not necessary
> >   
> >> +
> >> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
> >> +crash information, if available.  
> > a pointer to a relevant source would be helpful here.  
> 
> I've included the reference, here for your benefit.
> Windows Hardware Error Architecutre, specifically Persistence Mechanism
> https://docs.microsoft.com/en-us/windows-hardware/drivers/whea/error-record-persistence-mechanism
> 
> >   
> >> +Invocation  
> > s/^^/Configuration|Usage/  
> 
> Corrected
> 
> >   
> >> +----------
> >> +
> >> +To utilize ACPI ERST, a memory-backend-file object and acpi-erst  
> > s/utilize/use/  
> 
> Corrected
> 
> >   
> >> +device must be created, for example:  
> > s/must/can/  
> 
> Corrected
> 
> >   
> >> +
> >> + qemu ...
> >> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,
> >> +  size=0x10000,share=on  
> > I'd put ^^^ on the same line as -object and use '\' at the end the
> > so example could be easily copy-pasted  
> 
> Corrected
> 
> >   
> >> + -device acpi-erst,memdev=erstnvram
> >> +
> >> +For proper operation, the ACPI ERST device needs a memory-backend-file
> >> +object with the following parameters:
> >> +
> >> + - id: The id of the memory-backend-file object is used to associate
> >> +   this memory with the acpi-erst device.
> >> + - size: The size of the ACPI ERST backing storage. This parameter is
> >> +   required.
> >> + - mem-path: The location of the ACPI ERST backing storage file. This
> >> +   parameter is also required.
> >> + - share: The share=on parameter is required so that updates to the
> >> +   ERST back store are written to the file immediately as well. Without
> >> +   it, updates the the backing file are unpredictable and may not
> >> +   properly persist (eg. if qemu should crash).  
> > 
> > mmap manpage says:
> >    MAP_SHARED
> >               Updates to the mapping ... are carried through to the underlying file.
> > it doesn't guarantee 'written to the file immediately', though.
> > So I'd rephrase it to something like that:
> > 
> > - share: The share=on parameter is required so that updates to the ERST back store
> >           are written back to the file.  
> 
> Corrected
> 
> >   
> >> +
> >> +The ACPI ERST device is a simple PCI device, and requires this one
> >> +parameter:  
> > s/^.*:/and ERST device:/  
> 
> Corrected
> 
> >   
> >> +
> >> + - memdev: Is the object id of the memory-backend-file.
> >> +
> >> +
> >> +PCI Interface
> >> +-------------
> >> +
> >> +The ERST device is a PCI device with two BARs, one for accessing
> >> +the programming registers, and the other for accessing the
> >> +record exchange buffer.
> >> +
> >> +BAR0 contains the programming interface consisting of just two
> >> +64-bit registers. The two registers are an ACTION (cmd) and a
> >> +VALUE (data). All ERST actions/operations/side effects happen  
> > s/consisting of... All ERST/consisting of ACTION and VALUE 64-bit registers. All ERST/  
> 
> Corrected
> 
> >   
> >> +on the write to the ACTION, by design. Thus any data needed  
> > s/Thus//  
> Corrected
> 
> >   
> >> +by the action must be placed into VALUE prior to writing
> >> +ACTION. Reading the VALUE simply returns the register contents,
> >> +which can be updated by a previous ACTION.  
> >   
> >> This behavior is
> >> +encoded in the ACPI ERST table generated by QEMU.  
> > it's too vague, Either drop sentence or add a reference to relevant place in spec.  
> Corrected
> 
> > 
> >   
> >> +
> >> +BAR1 contains the record exchange buffer, and the size of this
> >> +buffer sets the maximum record size. This record exchange
> >> +buffer size is 8KiB.  
> > s/^^^/
> > BAR1 contains the 8KiB record exchange buffer, which is the implemented maximum record size limit.  
> Corrected
> 
> > 
> >   
> >> +Backing File  
> > 
> > s/^^^/Backing Storage Format/  
> Corrected
> 
> >   
> >> +------------  
> > 
> >   
> >> +
> >> +The ACPI ERST persistent storage is contained within a single backing
> >> +file. The size and location of the backing file is specified upon
> >> +QEMU startup of the ACPI ERST device.  
> > 
> > I'd drop above paragraph and describe file format here,
> > ultimately used backend doesn't have to be a file. For
> > example if user doesn't need it persist over QEMU restarts,
> > ram backend could be used, guest will still be able to see
> > it's own crash log after guest is reboot, or it could be
> > memfd backend passed to QEMU by mgmt layer.  
> Dropped
> 
> > 
> >   
> >> +Records are stored in the backing file in a simple fashion.  
> > s/backing file/backend storage/
> > ditto for other occurrences  
> Corrected
> 
> >   
> >> +The backing file is essentially divided into fixed size
> >> +"slots", ERST_RECORD_SIZE in length, with each "slot"
> >> +storing a single record.  
> >   
> >> No attempt at optimizing storage
> >> +through compression, compaction, etc is attempted.  
> > s/^^^//  
> 
> I'd like to keep this statement. It is there because in a number of
> hardware BIOS I tested, these kinds of features lead to bugs in the
> ERST support.
this doc it's not about issues in other BIOSes, it's about conrete
QEMU impl. So sentence starting with "No attempt" is not relevant here at all.
  
> >> +NOTE that any change to this value will make any pre-
> >> +existing backing files, not of the same ERST_RECORD_SIZE,
> >> +unusable to the guest.  
> > when that can happen, can we detect it and error out?  
> I've dropped this statement. That value is hard coded, and not a
> parameter, so there is no simple way to change it. This comment
> does exist next to the ERST_RECORD_SIZE declaration in the code.

It's not a problem with current impl. but rather with possible
future expansion.

If you'd add a header with record size at the start of storage,
it wouldn't be issue as ERST would be able to get used record
size for storage. That will help with avoiding compat issues
later on.

> >> +Below is an example layout of the backing store file.
> >> +The size of the file is a multiple of ERST_RECORD_SIZE,
> >> +and contains N number of "slots" to store records. The
> >> +example below shows two records (in CPER format) in the
> >> +backing file, while the remaining slots are empty/
> >> +available.
> >> +
> >> + Slot   Record
> >> +        +--------------------------------------------+
> >> +    0   | empty/available                            |
> >> +        +--------------------------------------------+
> >> +    1   | CPER                                       |
> >> +        +--------------------------------------------+
> >> +    2   | CPER                                       |
> >> +        +--------------------------------------------+
> >> +  ...   |                                            |
> >> +        +--------------------------------------------+
> >> +    N   | empty/available                            |
> >> +        +--------------------------------------------+
> >> +        <-------------- ERST_RECORD_SIZE ------------>  
> > 
> >   
> >> +Not all slots need to be occupied, and they need not be
> >> +occupied in a contiguous fashion. The ability to clear/erase
> >> +specific records allows for the formation of unoccupied
> >> +slots.  
> > I'd drop this as not necessary  
> 
> I'd like to keep this statement. Again, several BIOS on which I tested
> ERST had bugs around non-contiguous record storage.

I'd drop this and alter sentence above ending with " in a simple fashion."
to describe sparse usage of storage and then after that comes example diagram.

I'd like this part to start with unambiguous concise description of
format and to be finished with example diagram.
It is the part that will be considered as the the only true source
how file should be formatted, when it comes to fixing bugs or
modifying original impl. later on. So it's important to have clear
description without any unnecessary information here.


> > 
> >   
> >> +
> >> +
> >> +References
> >> +----------
> >> +
> >> +[1] "Advanced Configuration and Power Interface Specification",
> >> +    version 4.0, June 2009.
> >> +
> >> +[2] "Unified Extensible Firmware Interface Specification",
> >> +    version 2.1, October 2008.
> >> +
> >> --
> >> 1.8.3.1
> >>  
> >   
> 


