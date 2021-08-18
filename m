Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD23F0B6A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:06:12 +0200 (CEST)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGQt8-0003S5-Sg
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGQre-0002ln-KX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGQrb-00067i-20
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629313474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RKRaR8ialZrJcZ2q5uYwpXQ6txvGrMjrVXBzyK2J2jo=;
 b=Mlj1Yvgwf0s3ZM3jNG9lVvlwjU86oQkIR/7l4RXPEo6qWcxw1P+YHCU4E5vps4WAsA8Utv
 pB3Mf25lQrsogh02wGtnDBBAYSKo3M/HeTVQAoqsRGzw5b99pPfuQ6OTGGBuilYrU4ICSZ
 EZVLabEirFGRc53OMQLaTe8Ozf51tlY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-w7CnekHEOmyrJ7jzv--0QQ-1; Wed, 18 Aug 2021 15:04:32 -0400
X-MC-Unique: w7CnekHEOmyrJ7jzv--0QQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so2564914wmd.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RKRaR8ialZrJcZ2q5uYwpXQ6txvGrMjrVXBzyK2J2jo=;
 b=WYYqSRWtNRopQWMw1Xq2OAts9W1CMyfgnFAuQBFsItQ3gtCRkqbFRZSeQeNJriscfF
 f9tPqsdxS4dsCevidkUX1XgO01GZZoR6gt85MbYmRa6wgmcRGwq65+TFVTjyFQcoafgg
 WNQvFLz5aEnXs76y7YfGpHk4KKe1JSArSP+IkE738kq6h+M+4DEGGRYnB3aT3WAh2xkg
 NJS6rKNq+0QSQkHuLaQ7Tpw9QWt/azqKzom/qUWX2CbVGDxtw6EXbl1KIkGbPE/kOWgU
 u6s9kSEuOyF5M2g19ZoAEVqnVmg13vdK0VBUPBIKqGNblGnJRBlyKmsysN/h2TPYS/ir
 68hQ==
X-Gm-Message-State: AOAM532u50M4I1eqXkXZXX9AcxAY14YMOkEbM+U7MSHw+vJcT0w23v7W
 H6ht85Os2P0Clsz7hHBiuPXtnradbbC9vKqGT0Yqyja3xumPlPsRLAbT/9bVfRSzK4SQP6AVOmv
 xAvVXOCXYV8J3l8s=
X-Received: by 2002:adf:9c8b:: with SMTP id d11mr12014222wre.43.1629313471543; 
 Wed, 18 Aug 2021 12:04:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLdMDbMSjp9h1NdcljIpckt7ie6vJPkq0kBmu03yZevd4oVZWyroH52DVVQV60VqXHh9XvBQ==
X-Received: by 2002:adf:9c8b:: with SMTP id d11mr12014177wre.43.1629313471328; 
 Wed, 18 Aug 2021 12:04:31 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id k3sm5996868wms.28.2021.08.18.12.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:04:30 -0700 (PDT)
Date: Wed, 18 Aug 2021 20:04:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YR1ZvArdq4sKVyTJ@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, Steve Rutherford <srutherford@google.com>,
 richard.henderson@linaro.org, jejb@linux.ibm.com, tobin@ibm.com,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, Paolo Bonzini <pbonzini@redhat.com>,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tobin Feldman-Fitzthum (tobin@linux.ibm.com) wrote:
> On 8/17/21 6:04 PM, Steve Rutherford wrote:
> > On Tue, Aug 17, 2021 at 1:50 PM Tobin Feldman-Fitzthum
> > <tobin@linux.ibm.com> wrote:
> > > This is essentially what we do in our prototype, although we have an
> > > even simpler approach. We have a 1:1 mapping that maps an address to
> > > itself with the cbit set. During Migration QEMU asks the migration
> > > handler to import/export encrypted pages and provides the GPA for said
> > > page. Since the migration handler only exports/imports encrypted pages,
> > > we can have the cbit set for every page in our mapping. We can still use
> > > OVMF functions with these mappings because they are on encrypted pages.
> > > The MH does need to use a few shared pages (to communicate with QEMU,
> > > for instance), so we have another mapping without the cbit that is at a
> > > large offset.
> > > 
> > > I think this is basically equivalent to what you suggest. As you point
> > > out above, this approach does require that any page that will be
> > > exported/imported by the MH is mapped in the guest. Is this a bad
> > > assumption? The VMSA for SEV-ES is one example of a region that is
> > > encrypted but not mapped in the guest (the PSP handles it directly). We
> > > have been planning to map the VMSA into the guest to support migration
> > > with SEV-ES (along with other changes).
> > Ahh, It sounds like you are looking into sidestepping the existing
> > AMD-SP flows for migration. I assume the idea is to spin up a VM on
> > the target side, and have the two VMs attest to each other. How do the
> > two sides know if the other is legitimate? I take it that the source
> > is directing the LAUNCH flows?
> 
> Yeah we don't use PSP migration flows at all. We don't need to send the MH
> code from the source to the target because the MH lives in firmware, which
> is common between the two.

Are you relying on the target firmware to be *identical* or purely for
it to be *compatible* ?  It's normal for a migration to be the result of
wanting to do an upgrade; and that means the destination build of OVMF
might be newer (or older, or ...).

Dave


> We start the target like a normal VM rather than
> waiting for an incoming migration. The plan is to treat the target like a
> normal VM for attestation as well. The guest owner will attest the target VM
> just like they would any other VM that is started on their behalf. Secret
> injection can be used to establish a shared key for the source and target.
> 
> -Tobin
> 
> > 
> > --Steve
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


