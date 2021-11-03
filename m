Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBECF444332
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:15:30 +0100 (CET)
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH33-0004PL-Ii
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1miGwp-0002T8-Lw
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1miGwj-00054Z-UO
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635948536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8eQJHqTNjSWY3mxP6s5ms+SmAZpET50NosD40q8kcM=;
 b=WJ3ufTJrgvw/+TJ6peEJIH9TdVyx/fuE5fm5TII1fMzRQdMtjA4DfSb7sfPRp4u5PbvaUd
 4yf2dCboyuJ2+ZisOV4uVCNQ0+KeKclDyAm5FaYaNAqz78gzVZHBDY6ZlnBoOo0ysA4UL+
 7s99zuhZZYbK9+mXOnRy3aTWTTUsYXM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-8LjQJgjtNM62YBkFTnMNRQ-1; Wed, 03 Nov 2021 10:08:55 -0400
X-MC-Unique: 8LjQJgjtNM62YBkFTnMNRQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v13-20020adfe28d000000b00186c47ee9e3so453106wri.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b8eQJHqTNjSWY3mxP6s5ms+SmAZpET50NosD40q8kcM=;
 b=tkpHBwWJIeQjl9mUtJxfncuAKGmLnBLPwBpmLIPmZCXXG94mZbWie+HQ1JuQUAriKX
 y7eprf/BTSeen4PdWd1jyrVKP8plfaUqvQlgcKqwO8imTStKdyjPQK7OIxDmqXMOx20o
 IhGhPtXUhZv1kvDPLnChvL9WYHOIok5+lK0c6ENdmKLesWgMBpmaOo+kmPBWfzCaIPAB
 cnVXEvOsbcbLHTKDRpqilCqTZvkkVTSgXpAXeYomKKbsb0661HbTzGVGmFj5OINYKrm2
 S9cW4twU5ceqpJ3IaqJXz+gJ/cUwgZKQX+2QcMDoecpLJ4mKTnov38LhtNPpVF2jqAfq
 7cCw==
X-Gm-Message-State: AOAM533r0eWer6lXsB9E5PdpnHIkdf+SSbuPg1NomTurSAjNsLG7kmAk
 hnXaMThJrggaroxjk8AWVNv3eI27GT0IteXA0DuIlUelQcdXQxl1qBMURwaP5zZMCtRM7acA28x
 K8Bfq0njc5RKvj2I=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr47127152wrf.302.1635948533320; 
 Wed, 03 Nov 2021 07:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIVP1xiyv0eKIACpOj3GXU/8r/QjN8r+vbZQI3myPEvgRU6FS0HcmrTowGhECxuCrOe7edDA==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr47126811wrf.302.1635948529055; 
 Wed, 03 Nov 2021 07:08:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t11sm2037606wrz.97.2021.11.03.07.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:48 -0700 (PDT)
Date: Wed, 3 Nov 2021 14:08:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
Message-ID: <YYKX7kmDE71NN8Sb@work-vm>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
 <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
 <9e4c0415-4153-e234-7c59-872e903e6567@amd.com>
MIME-Version: 1.0
In-Reply-To: <9e4c0415-4153-e234-7c59-872e903e6567@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Brijesh Singh (brijesh.singh@amd.com) wrote:
> 
> 
> On 11/2/21 8:22 AM, Dov Murik wrote:
> > 
> > 
> > On 02/11/2021 12:52, Brijesh Singh wrote:
> > > Hi Dov,
> > > 
> > > Overall the patch looks good, only question I have is that now we are
> > > enforce qemu to hash the kernel, initrd and cmdline unconditionally for
> > > any of the SEV guest launches. This requires anyone wanting to
> > > calculating the expected measurement need to account for it. Should we
> > > make the hash page build optional ?
> > > 
> > 
> > The problem with adding a -enable-add-kernel-hashes QEMU option (or
> > suboption) is yet another complexity for the user.  I'd also argue that
> > adding these hashes can lead to a more secure VM boot process, so it
> > makes sense for it to be the default (and maybe introduce a
> > -allow-insecure-unmeasured-kernel-via-fw-cfg option to prevent the
> > measurement from changing due to addition of hashes?).
> > 
> > Maybe, on the other hand, OVMF should "report" whether it supports
> > hashes verification. If it does, it should have the GUID in the table
> > (near the reset vector), like the current OvmfPkg/AmdSev edk2 build. If
> > it doesn't support that, then the entry should not appear at all, and
> > then QEMU won't add the hashes (with patch 1 from this series).  This
> > means that in edk2 we need to remove the SEV Hash Table block from the
> > ResetVectorVtf0.asm for OvmfPkg, but include it in the AmdSev build.
> > 
> 
> By leaving it ON is conveying a wrong message to the user. The library used
> for verifying the hash is a NULL library for all the builds of Ovmf except
> the AmdSev package. In the NULL library case, OVMF does not perform any
> checks and hash table is useless. I will raise this on concern on your Ovmf
> patch series.
> 
> IMHO, if you want to turn it ON by default then make sure all the OVMF
> package builds supports validating the hash.
> 
> 
> > But the problem with this approach is that it prevents the future
> > unification of AmdSev and OvmfPkg, which is a possibility we discussed
> > (at least with Dave Gilbert), though not sure it's a good/feasible goal.
> > 
> > 
> 
> This is my exact concern, we are auto enabling the features in Qemu that is
> supported by AmdSev package only.

I'm confused; wouldn't the trick be to only define the GUIDs for the
builds that support the validation?

Dave

> 
> > 
> > > I am thinking this more for the SEV-SNP guest. As you may be aware that
> > > with SEV-SNP the attestation is performed by the guest, and its possible
> > > for the launch flow to pass 512-bits of host_data that gets included in
> > > the report. If a user wants to do the hash'e checks for the SNP then
> > > they can pass a hash of kernel, initrd and cmdline through a
> > > launch_finish.ID_BLOCK.host_data and does not require a special hash
> > > page. This it will simplify the expected hash calculation.
> > 
> > That is a new measured boot "protocol" that we can discuss, and see
> > whether it's better/easier than the existing one at hand that works on
> > SEV and SEV-ES.
> > 
> > What I don't understand in your suggestion is who performs a SHA256 of
> > the fw_cfg blobs (kernel/initrd/cmdline) so they can later be verified
> > (though ideally earlier is better).  Can you describe the details
> > (step-by-step) of an SNP VM boot with -kernel/-initrd/-append and how
> > the measurement/attestation is performed?
> > 
> > 
> 
> There are a multiple ways on how you can do a measured boot with the SNP.
> 
> 1) VMPL0 (SVSM) can provide a complete vTPM (see the MSFT proposal on SNP
> mailing list).
> 
> 2) Use your existing hashing approach with some changes to provide a bit
> more flexibility.
> 
> 3) Use your existing hashing approach but zero out the hash page when
> -kernel is not used.
> 
> Let me expand #2.
> 
> While launching the SNP guest, a guest owner can provide a ID block that KVM
> will pass to the PSP during the guest launch flow. In the ID block there is
> a field called "host_data". A guest owner can do a hash of
> kernel/initrd/cmdline and include it in the "host_data" field. During the
> hash verification, the OVMF can call the SNP_GET_REPORT. The PSP will
> includes the "host_data" passed in the launch process in the report and OVMF
> can use it for the verification. Unlike the current implementation, this
> enables a guest owner to provides the hash without requiring any changes in
> the Qemu and thus affecting the measurement.
> 
> One thing to note that both #2 and #3 requires ovmf to connect to guest
> owner to validate the report before using the "host_data" or "hash page".
> 
> 
> thanks
> 
> > 
> > > Adding a
> > > special page requires a validation of that page. All the prevalidated
> > > page need to be excluded by guest BIOS page validation flow to avoid the
> > > double validation. The hash page is populated only when we pass -kernel
> > > and it will be tricky to communicate this information to the guest BIOS
> > > so that it can skip the validation.
> > 
> > So that again comes back to the earlier question of whether we should
> > always fill the hashes page or only sometimes, and how can OVMF tell.
> > 
> > How about: QEMU always prevalidates this page (either fills it with
> > zeros or with the hashes table), and the BIOS always excludes it?
> > 
> > -Dov
> > 
> > 
> > > 
> > > Thoughts ?
> > > 
> > > thanks
> > > 
> > > On 11/1/21 5:21 AM, Dov Murik wrote:
> > > > Tom Lendacky and Brijesh Singh reported two issues with launching SEV
> > > > guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
> > > > OVMF images are used.
> > > > 
> > > > The fixes in patches 1 and 2 allow such guests to boot by skipping the
> > > > kernel/initrd/cmdline hashes addition to the initial guest memory (and
> > > > warning the user).
> > > > 
> > > > Patch 3 is a refactoring of parts of the same function
> > > > sev_add_kernel_loader_hashes() to calculate all padding sizes at
> > > > compile-time.  This patch is not required to fix the issues above, but
> > > > is suggested as an improvement (no functional change intended).
> > > > 
> > > > Note that launch measurement security is not harmed by these fixes: a
> > > > Guest Owner that wants to use measured Linux boot with -kernel, must use
> > > > (and measure) an OVMF image that designates a proper hashes table area,
> > > > and that verifies those hashes when loading the binaries from QEMU via
> > > > fw_cfg.
> > > > 
> > > > The old OVMFs which don't publish the hashes table GUID or don't reserve
> > > > a valid area for it in MEMFD cannot support these hashes verification in
> > > > any case (for measured boot with -kernel).
> > > > 
> > > > 
> > > > [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F3b9d10d9-5d9c-da52-f18c-cd93c1931706%40amd.com%2F&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7Cffa0a5981860476c3bcc08d99e03d3d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637714561554218974%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=591wZvEzQQQ6JBjLDhGnvEM8fxX6iky9yxlWn2pifjI%3D&amp;reserved=0
> > > > [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F001dd81a-282d-c307-a657-e228480d4af3%40amd.com%2F&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7Cffa0a5981860476c3bcc08d99e03d3d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637714561554218974%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ihwNJjetXq5I0WaLjEFzhtrKMbj%2FaFmOmn1xYlLowjg%3D&amp;reserved=0
> > > > 
> > > > Dov Murik (3):
> > > >    sev/i386: Allow launching with -kernel if no OVMF hashes table found
> > > >    sev/i386: Warn if using -kernel with invalid OVMF hashes table area
> > > >    sev/i386: Perform padding calculations at compile-time
> > > > 
> > > >   target/i386/sev.c | 34 +++++++++++++++++++++++-----------
> > > >   1 file changed, 23 insertions(+), 11 deletions(-)
> > > > 
> > > > 
> > > > base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


