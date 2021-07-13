Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6CD3C6C10
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 10:33:27 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Dr4-0002Zs-Of
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 04:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3DpZ-0001sq-78
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3DpW-0000i1-3k
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626165108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPw81F/HlP2Vls5vGEhwPX6XDpvIte64RBD+kcDomLE=;
 b=SuUvhR7eyVhVugvPdWCljAxg+GgZCn5GMDAOScdPqW+PhXmqhJLk9wZwhxcdNj9PSRvjZv
 BlSq/3M4Qqo6F13b3PkcNj+K4Xtr82E/IFwziE10tFcst9Hao2BVpw1+RW+hvfab+j8hOK
 3Uva9bYhNyaMPsmjcVyVtdu/TbVtj2Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-SCXvG_w_NGqJSdcdpBrk6A-1; Tue, 13 Jul 2021 04:31:46 -0400
X-MC-Unique: SCXvG_w_NGqJSdcdpBrk6A-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020adffb840000b02901304c660e75so8293640wrr.19
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 01:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gPw81F/HlP2Vls5vGEhwPX6XDpvIte64RBD+kcDomLE=;
 b=TWraj0v3o+RUoXnbdFDfQv7KWTlthPquNBafKk5uh0EtYl0xU+3F0cp1/B0s0gRLvo
 2IJ3rhqOozTbfs/5wgIVjtiQRFIlxWzqD0XrvwKeROHv3N9xWrC/nmiO67C5L9aNuuQY
 ZFDK0X/8TPnMEULdqo3aDp/SDkaMwzABN2eem9KOoF7qD5hXjZS2wrm/aSZVdl+0DBf4
 cQDTyHxkWq+t9QQL0TLjDcRRsBprv6fgno3kNVw/w3Wl/CD6/fKm8fqfiLRYIkCqg9IJ
 3DBa4ZqTrdMqGInUjaEAGaiD9pqD08UUqrJ0orgUzV8oRGL4a1270duXNerbiiMPRgkD
 Sf4w==
X-Gm-Message-State: AOAM530mSJHPqLqe5pSOgH1uEdBPE9pMmt8uxJ1imAIY1pTPUw4XBBcN
 xPQBlYrk2l/i8x+r363f8hyAd/L2hop2P1K0bsG5IsCB2XmXAX+945/trndYFE/OXqUIx9e4WdX
 jd1PPQ7kiANIRvLI=
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr3696675wme.101.1626165103747; 
 Tue, 13 Jul 2021 01:31:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQgCJ+SPE6CleUWDxOeRUR4Zhk9tJ1RbkIN8Xf8LcJ/bbzquqsZufKX/Ba6LJpf/PuQcbQkA==
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr3696646wme.101.1626165103564; 
 Tue, 13 Jul 2021 01:31:43 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id j6sm9010213wrm.97.2021.07.13.01.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 01:31:42 -0700 (PDT)
Date: Tue, 13 Jul 2021 09:31:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [RFC PATCH 0/6] Add AMD Secure Nested Paging (SEV-SNP) support
Message-ID: <YO1PbIPXem0E0Bgd@work-vm>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <e68a9760-121f-72ee-f8ae-193b92bde403@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <e68a9760-121f-72ee-f8ae-193b92bde403@linux.ibm.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> Brijesh,
> 
> On 10/07/2021 0:55, Brijesh Singh wrote:
> > SEV-SNP builds upon existing SEV and SEV-ES functionality while adding
> > new hardware-based memory protections. SEV-SNP adds strong memory integrity
> > protection to help prevent malicious hypervisor-based attacks like data
> > replay, memory re-mapping and more in order to create an isolated memory
> > encryption environment.
> > 
> > The patches to support the SEV-SNP in Linux kernel and OVMF are available:
> > https://lore.kernel.org/kvm/20210707181506.30489-1-brijesh.singh@amd.com/
> > https://lore.kernel.org/kvm/20210707183616.5620-1-brijesh.singh@amd.com/
> > https://edk2.groups.io/g/devel/message/77335?p=,,,20,0,0,0::Created,,posterid%3A5969970,20,2,20,83891508
> > 
> > The Qemu patches uses the command id added by the SEV-SNP hypervisor
> > patches to bootstrap the SEV-SNP VMs.
> > 
> > TODO:
> >  * Add support to filter CPUID values through the PSP.
> > 
> > Additional resources
> > ---------------------
> > SEV-SNP whitepaper
> > https://www.amd.com/system/files/TechDocs/SEV-SNP-strengthening-vm-isolation-with-integrity-protection-and-more.pdf
> > 
> > APM 2: https://www.amd.com/system/files/TechDocs/24593.pdf (section 15.36)
> > 
> > GHCB spec:
> > https://developer.amd.com/wp-content/resources/56421.pdf
> > 
> > SEV-SNP firmware specification:
> > https://www.amd.com/system/files/TechDocs/56860.pdf
> > 
> > Brijesh Singh (6):
> >   linux-header: add the SNP specific command
> >   i386/sev: extend sev-guest property to include SEV-SNP
> >   i386/sev: initialize SNP context
> >   i386/sev: add the SNP launch start context
> >   i386/sev: add support to encrypt BIOS when SEV-SNP is enabled
> >   i386/sev: populate secrets and cpuid page and finalize the SNP launch
> > 
> >  docs/amd-memory-encryption.txt |  81 +++++-
> >  linux-headers/linux/kvm.h      |  47 ++++
> >  qapi/qom.json                  |   6 +
> >  target/i386/sev.c              | 498 ++++++++++++++++++++++++++++++++-
> >  target/i386/sev_i386.h         |   1 +
> >  target/i386/trace-events       |   4 +
> >  6 files changed, 628 insertions(+), 9 deletions(-)
> > 
> 
> It might be useful to allow the user to view SNP-related status/settings
> in HMP's `info sev` and QMP's qom-list/qom-get under
> /machine/confidential-guest-support .
> 
> (Not sure whether HMP is deprecated and new stuff should not be added
> there.)

It's still fine to add stuff to HMP, although generally you should be
adding it to QMP as well (unles sit's purely for debug and may change).

Dave

> Particularly confusing is the `policy` attribute which is only relevant
> for SEV / SEV-ES, while there's a new `snp.policy` attribute for SNP...
> Maybe the irrelevant attributes should not be added to the tree when not
> in SNP.
> 
> -Dov
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


