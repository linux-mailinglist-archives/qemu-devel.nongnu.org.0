Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213364B69A6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:46:51 +0100 (CET)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJvM9-00050X-CI
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:46:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJvKp-0004Fq-PR
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJvKl-00047r-V6
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644921922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=B7AwO4+sTGzqweAjlUTOY5stF5sMlXbFPZe7vb2KjNE=;
 b=LGSMucvpnK+ESgKa8ostgg8kHZRFDDaph97pLHVgU8YynCuYx9WoBtcaUMoQYK1bOV7d3O
 5ZqHwBWe6rx1gbGqYf1jPVEyOqA9E0b7oITKi5l8a/urRQzHfSNzr1LQpkfn+SIF3NsElS
 KQIxZ6m82EhRFF3Is8JTyS4db2kSVXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-K6pbBXafMg2q5uN1mK6GAw-1; Tue, 15 Feb 2022 05:45:07 -0500
X-MC-Unique: K6pbBXafMg2q5uN1mK6GAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BB781006AA4;
 Tue, 15 Feb 2022 10:45:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.196.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91C60703B5;
 Tue, 15 Feb 2022 10:44:58 +0000 (UTC)
Date: Tue, 15 Feb 2022 10:44:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: 9 TiB vm memory creation
Message-ID: <YguEJ332BZXm3fFC@redhat.com>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
 <b06ab7b0-61f2-5301-70f9-197dfd9527e9@redhat.com>
 <CAARzgwwDFybUsCj8Ym6kpcjNRCVV6vbsY7Lks0wsmrc2+ET03Q@mail.gmail.com>
 <492bd3a4-4a26-afc9-1268-74a9fd7f095a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <492bd3a4-4a26-afc9-1268-74a9fd7f095a@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 09:38:34AM +0100, David Hildenbrand wrote:
> On 15.02.22 09:12, Ani Sinha wrote:
> > On Tue, Feb 15, 2022 at 1:25 PM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 15.02.22 08:00, Ani Sinha wrote:
> >>>
> >>>
> >>> On Mon, 14 Feb 2022, David Hildenbrand wrote:
> >>>
> >>>> On 14.02.22 13:36, Igor Mammedov wrote:
> >>>>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
> >>>>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>>>
> >>>>>> Hi Igor:
> >>>>>>
> >>>>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
> >>>>>> system with the following commandline before either the system
> >>>>>> destabilized or the OOM killed killed qemu
> >>>>>>
> >>>>>> -m 2T,maxmem=9T,slots=1 \
> >>>>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
> >>>>>> -machine memory-backend=mem0 \
> >>>>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
> >>>>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
> >>>>>>
> >>>>>> I have attached the debugcon output from 2 TiB vm.
> >>>>>> Is there any other commandline parameters or options I should try?
> >>>>>>
> >>>>>> thanks
> >>>>>> ani
> >>>>>
> >>>>> $ truncate -s 9T 9tb_sparse_disk.img
> >>>>> $ qemu-system-x86_64 -m 9T \
> >>>>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
> >>>>>   -machine memory-backend=mem0
> >>>>>
> >>>>> works for me till GRUB menu, with sufficient guest kernel
> >>>>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
> >>>>> guest on it and inspect SMBIOS tables comfortably.
> >>>>>
> >>>>>
> >>>>> With KVM enabled it bails out with:
> >>>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> >>>>>
> >>>
> >>> I have seen this in my system but not always. Maybe I should have dug
> >>> deeper as to why i do see this all the time.
> >>>
> >>>>> all of that on a host with 32G of RAM/no swap.
> >>>>>
> >>>
> >>> My system in 16 Gib of main memory, no swap.
> >>>
> >>>>
> >>>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
> >>>>
> >>>> ~8 TiB (7,999999)
> >>>
> >>> That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
> >>> than 2 Gib * 4K (assuming 4K size pages).
> >>
> >> "pages" don't carry the unit "GiB/TiB", so I was talking about the
> >> actual size with 4k pages (your setup, I assume)
> > 
> > yes I got that after reading your email again.
> > The interesting question now is how is redhat QE running 9 TiB vm with kvm?
> 
> As already indicated by me regarding s390x only having single large NUMA
> nodes, x86 is usually using multiple NUMA nodes with such large memory.

Yes, this is a documented requirement for KVM limits:

     https://access.redhat.com/articles/906543

   "3. Note that virtualized guests larger than 8 TB currently 
    require explicit virtual NUMA configuration, because the 
    maximum virtual NUMA node size is 8 TB."

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


