Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29513487DBE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:29:10 +0100 (CET)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vrJ-0006Ur-AG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n5vi9-0004vr-OT
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n5vi6-0004yO-EG
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641586777;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fK0I5rc4NfnGdOoKswQky2Steqcm4EW7BavYxUQm3pY=;
 b=Nn3x3SJRzToUoiArwLp8QAvYgIRjsmj53cUHhfOwPefo5AV0H9b2ujrpjFHqVYj7pLFQ5y
 nGLPEhAC2MeMdtyjtE95H9Kn68NKgZGSRmXQ6oZ1R5U9ybx9YNn7ZRYeDEn5RQKi+goLHE
 ueHYrygFocMtcWL0Esf/4SXUW7DuprY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-hE-0ewzoOwi-gSmazAfSsg-1; Fri, 07 Jan 2022 15:19:19 -0500
X-MC-Unique: hE-0ewzoOwi-gSmazAfSsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C7818710FE;
 Fri,  7 Jan 2022 20:19:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D92B15C25D;
 Fri,  7 Jan 2022 20:19:03 +0000 (UTC)
Date: Fri, 7 Jan 2022 20:18:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Message-ID: <YdigM5W8AnBt2HM4@redhat.com>
References: <20211214135910.2732101-1-dovmurik@linux.ibm.com>
 <Ybjk6XJUNIyC/LX5@redhat.com>
 <336cbad3-06da-f11c-8cd1-ca058dd9c6b0@linux.ibm.com>
 <YbtkzdpERCnODpft@redhat.com>
 <1c972953-a7b0-f06c-7d78-0e5fbf13b00e@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1c972953-a7b0-f06c-7d78-0e5fbf13b00e@linux.ibm.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 11:41:27PM +0200, Dov Murik wrote:
> 
> 
> On 16/12/2021 18:09, Daniel P. Berrangé wrote:
> > On Thu, Dec 16, 2021 at 12:38:34PM +0200, Dov Murik wrote:
> >>
> >>
> >> On 14/12/2021 20:39, Daniel P. Berrangé wrote:
> >>> Is there any practical guidance we can give apps on the way the VMSAs
> >>> can be expected to be initialized ? eg can they assume essentially
> >>> all fields in vmcb_save_area are 0 initialized except for certain
> >>> ones ? Is initialization likely to vary at all across KVM or EDK2
> >>> vesions or something ?
> >>
> >> From my own experience, the VMSA of vcpu0 doesn't change; it is basically what QEMU
> >> sets up in x86_cpu_reset() (which is mostly zeros but not all).  I don't know if it
> >> may change in newer QEMU (machine types?) or kvm.  As for vcpu1+, in SEV-ES the
> >> CS:EIP for the APs is taken from a GUIDed table at the end of the OVMF image, and has
> >> actually changed a few months ago when the memory layout changed to support both TDX
> >> and SEV.
> > 
> > That is an unplesantly large number of moving parts that could
> > potentially impact the expected state :-(  I think we need to
> > be careful to avoid gratuitous changes, to avoid creating a
> > combinatorial expansion in the number of possibly valid VMSA
> > blocks.
> > 
> > It makes me wonder if we need to think about defining some
> > standard approach for distro vendors (and/or cloud vendors)
> > to publish the expected contents for various combinations
> > of their software pieces.
> > 
> >>
> >>
> >> Here are the VMSAs for my 2-vcpu SEV-ES VM:
> >>
> >>
> >> $ hd vmsa/vmsa_cpu0.bin
> > 
> > ...snipp...
> > 
> > was there a nice approach / tool you used to capture
> > this initial state ?
> > 
> 
> I wouldn't qualify this as nice: I ended up modifying my
> host kernel's kvm (see patch below).  Later I wrote a
> script to parse that hex dump from the kernel log into
> proper 4096-byte binary VMSA files.
> 
> 
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 7fbce342eec4..4e45fe37b93d 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -624,6 +624,12 @@ static int sev_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
>                  */
>                 clflush_cache_range(svm->vmsa, PAGE_SIZE);
> 
> +                /* dubek */
> +                pr_info("DEBUG_VMSA - cpu %d START ---------------\n", i);
> +                print_hex_dump(KERN_INFO, "DEBUG_VMSA", DUMP_PREFIX_OFFSET, 16, 1, svm->vmsa, PAGE_SIZE, true);
> +                pr_info("DEBUG_VMSA - cpu %d END ---------------\n", i);
> +                /* ----- */
> +
>                 vmsa.handle = sev->handle;
>                 vmsa.address = __sme_pa(svm->vmsa);
>                 vmsa.len = PAGE_SIZE;

FWIW, I made a 1% less hacky solution by writing a systemtap
script. It will require changing to set the line number for
every single kernel version, but at least it doesn't require
building a custom kernel

$ cat sev-vmsa.stp 
function dump_vmsa(addr:long) {
  printf("VMSA\n")
  for (i = 0; i < 4096 ; i+= 64) {
    printf("%.64M\n", addr + i);
  }
}

probe module("kvm_amd").statement("__sev_launch_update_vmsa@arch/x86/kvm/svm/sev.c:618") {
  dump_vmsa($svm->vmsa)
}

the line number is that of the 'vmsa.handle = sev->handle' assignment

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


