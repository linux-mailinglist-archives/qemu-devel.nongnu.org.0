Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48AB3F151A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 10:23:55 +0200 (CEST)
Received: from localhost ([::1]:36766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGdL8-00047l-T1
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 04:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGdKD-0002rM-2x
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGdKB-000580-I7
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 04:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629361374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3RUvVH4hlrm7njxKuul053rmb1kpEbBf4sJ3JmkcGns=;
 b=e4YBgP1QURm0mXT8qfexOK5P/EU2w6bWFte+l5Ezfn4/LqsKBUGey2K1bEdJHXhvmDocga
 H9Yf8MFCZaAWLtJ8HnvD2qGw4TEhWKkg2XFYpajfcHs4vckdWy3tCLoWPa0h9Bu1zFyGo5
 VpwBDoVNHEO68mZg4JkKC+FdFYwRD2U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-ZCHoH6LcM464tIFG3PVM9A-1; Thu, 19 Aug 2021 04:22:51 -0400
X-MC-Unique: ZCHoH6LcM464tIFG3PVM9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 a13-20020adfed0d000000b00156fd70137aso1316655wro.8
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 01:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3RUvVH4hlrm7njxKuul053rmb1kpEbBf4sJ3JmkcGns=;
 b=I9sH1xNC+yIg7y6fJz7onAFpJBEaCKmIjsW8eGj+v5xPnDxPf6SURKAnWxwET0C1OW
 gBXtFIg+VMxfiz9wZmq9gpiIej78BbFJDz4FqgsWN2SHpu1k97M81QuiBKREWZdim8tk
 N8FZAwOThkQsWZly+nAuyqtWEjp43Grh8meGguOPjAfdp9pjUsglxgzdTNmUtzaUE/nv
 +gknAr8vhPp37f291PBohLn39BvHjZBAU7MESWRXqlgNQrN5KR9iC8i25mgMO4DtsZEz
 oelHstfXON3rN67b/33ZaHMrP4gjTe5fj1MIFIjurqHBp8awTXXAKBdhev32YkZ0jc6z
 K0HQ==
X-Gm-Message-State: AOAM530/2fXA3Aoi0dhyjxD2WejcCPyGpTEgqihoDAhlkAKr7MoF64si
 6AULtH1MYQxilIrSs8Lm7Zh0fGo+JuNv6yKM+OMrm/f57nkpS0ta0HiVvJcTKZXsCIukTZbAGhY
 1XjDpJLkmprUNKME=
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr12268491wmq.159.1629361370636; 
 Thu, 19 Aug 2021 01:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqncaYM3iV0vzPV1ldTAYyMmARPm2+WDbp9axtWT7GFnS3Ia7cksTVRG7kGcq3hTWPfY7HaQ==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr12268465wmq.159.1629361370407; 
 Thu, 19 Aug 2021 01:22:50 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id a77sm7515035wmd.31.2021.08.19.01.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:22:49 -0700 (PDT)
Date: Thu, 19 Aug 2021 09:22:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YR4U11ssVUztsPyx@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
 <YR1ZvArdq4sKVyTJ@work-vm>
 <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
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
> On 8/18/21 3:04 PM, Dr. David Alan Gilbert wrote:
> > * Tobin Feldman-Fitzthum (tobin@linux.ibm.com) wrote:
> > > On 8/17/21 6:04 PM, Steve Rutherford wrote:
> > > > Ahh, It sounds like you are looking into sidestepping the existing
> > > > AMD-SP flows for migration. I assume the idea is to spin up a VM on
> > > > the target side, and have the two VMs attest to each other. How do the
> > > > two sides know if the other is legitimate? I take it that the source
> > > > is directing the LAUNCH flows?
> > > Yeah we don't use PSP migration flows at all. We don't need to send the MH
> > > code from the source to the target because the MH lives in firmware, which
> > > is common between the two.
> > Are you relying on the target firmware to be *identical* or purely for
> > it to be *compatible* ?  It's normal for a migration to be the result of
> > wanting to do an upgrade; and that means the destination build of OVMF
> > might be newer (or older, or ...).
> > 
> > Dave
> 
> This is a good point. The migration handler on the source and target must
> have the same memory footprint or bad things will happen. Using the same
> firmware on the source and target is an easy way to guarantee this. Since
> the MH in OVMF is not a contiguous region of memory, but a group of
> functions scattered around OVMF, it is a bit difficult to guarantee that the
> memory footprint is the same if the build is different.

Can you explain what the 'memory footprint' consists of? Can't it just
be the whole of the OVMF rom space if you have no way of nudging the MH
into it's own chunk?

I think it really does have to cope with migration to a new version of
host.

Dave

> -Tobin
> 
> > 
> > 
> > > We start the target like a normal VM rather than
> > > waiting for an incoming migration. The plan is to treat the target like a
> > > normal VM for attestation as well. The guest owner will attest the target VM
> > > just like they would any other VM that is started on their behalf. Secret
> > > injection can be used to establish a shared key for the source and target.
> > > 
> > > -Tobin
> > > 
> > > > --Steve
> > > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


