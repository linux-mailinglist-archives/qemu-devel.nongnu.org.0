Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A950703B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 16:26:46 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngooW-00037Y-VE
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 10:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ngolf-0001mX-5m
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ngolb-0003Az-Qk
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650378221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pgYoda6jxeg1UkBVWOZGijo6tDurwISefvcfRWo9yGA=;
 b=HG9awpCJaR5SLpnTh7ae8QfLgzzosUK+YC34eDrgOozeFdZYuuHv8VKhoyJFHUfUT5m466
 mTtE88yAldulPZjYC8qOjvVPyp0yf32hCSUwsZjg2A4u0GxnlsYcF4S9dHVdpW0tHBxy8U
 TkmUH8AxOrfSBkHIzJCCDBNjLt9JEQY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-zXyM7tNDPsuz-mwy52Ajog-1; Tue, 19 Apr 2022 10:23:38 -0400
X-MC-Unique: zXyM7tNDPsuz-mwy52Ajog-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adfc392000000b00207a2102f9bso1969642wrf.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 07:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pgYoda6jxeg1UkBVWOZGijo6tDurwISefvcfRWo9yGA=;
 b=C+2b/9W0SUnZ+ACgPsYKlmsx+I340DAyMUcZyiMcwy33L0OD+QE7hjsB4pEVwSmH42
 HkdrEL8OgUZHAEC6yMpNmAyk2nelFtUvqd3M1FBO3fDpYeFRCO4LuFVgUlFyPjieTCGa
 aO16WGBq7u77ysIN5PAN//o+a8jo0GAtaS7qRwyxhWftdirFjd5EIO7miwFeKLBZdxJS
 4TKDVu8v9WFeIsUhGZk/Ho7EMq7EdZVzJZF9ePr5GDgtvKzpphRAD2pzPi6FW0KJdytH
 l/+LhmFPcwtlQr+APily9zEYktYiVxP0+yGnz4gwX7kbsLYvGR1VM/xqRfzTRB+c3rOW
 84aA==
X-Gm-Message-State: AOAM5316qxXzvN+8KvnmF94uxRUYLJyRM0y8fYijvz0QDtdgCR1I9S4W
 09JF0eypfO1tGDT2r1b3aLakIxPlTJAq80eaPSqk1LEPH928Vp+p/4hZcf4J3KVvRrnTQsLBxtc
 IQpzEI36je8eyyzw=
X-Received: by 2002:adf:e0ce:0:b0:1ef:706d:d6b9 with SMTP id
 m14-20020adfe0ce000000b001ef706dd6b9mr12023655wri.71.1650378217498; 
 Tue, 19 Apr 2022 07:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeH06zyVEvRzR25XqZfs6P6WlcYVWa3Pnx9E8TjyeSMb+poPRbkmrWccNm+5XAKLTet+MGFA==
X-Received: by 2002:adf:e0ce:0:b0:1ef:706d:d6b9 with SMTP id
 m14-20020adfe0ce000000b001ef706dd6b9mr12023635wri.71.1650378217272; 
 Tue, 19 Apr 2022 07:23:37 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c414a00b0038ebb6884d8sm23660891wmm.0.2022.04.19.07.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 07:23:36 -0700 (PDT)
Date: Tue, 19 Apr 2022 15:23:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: adding 'official' way to dump SEV VMSA
Message-ID: <Yl7F5o5egojJ09EB@work-vm>
References: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
 <462cbf77-432a-c09c-6ec9-91556dc0f887@linux.ibm.com>
 <YlfakQfkZFOpKWeU@work-vm>
 <ac2bc657-947b-e528-791b-101447e074d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ac2bc657-947b-e528-791b-101447e074d8@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 qemu-devel <qemu-devel@nongnu.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Singh, Brijesh" <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Cole Robinson (crobinso@redhat.com) wrote:
> On 4/14/22 4:25 AM, Dr. David Alan Gilbert wrote:
> > * Dov Murik (dovmurik@linux.ibm.com) wrote:
> >> Hi Cole,
> >>
> >> On 13/04/2022 16:36, Cole Robinson wrote:
> >>> Hi all,
> >>>
> >>> SEV-ES and SEV-SNP attestation require a copy of the initial VMSA to
> >>> validate the launch measurement. For developers dipping their toe into
> >>> SEV-* work, the easiest way to get sample VMSA data for their machine is
> >>> to grab it from a running VM.
> >>>
> >>> There's two techniques I've seen for that: patch some printing into
> >>> kernel __sev_launch_update_vmsa, or use systemtap like danpb's script
> >>> here: https://gitlab.com/berrange/libvirt/-/blob/lgtm/scripts/sev-vmsa.stp
> >>>
> >>> Seems like this could be friendlier though. I'd like to work on this if
> >>> others agree.
> >>>
> >>> Some ideas I've seen mentioned in passing:
> >>>
> >>> - debugfs entry in /sys/kernel/debug/kvm/.../vcpuX/
> >>> - new KVM ioctl
> >>> - something with tracepoints
> >>> - some kind of dump in dmesg that doesn't require a patch
> >>>
> >>> Thoughts?
> >>
> >>
> >> Brijesh suggested to me to construct the VMSA without getting any info from
> >> the host (except number of vcpus), because the initial state of the vcpus
> >> is standard and known if you use QEMU and OVMF (but that's open for discussion).
> >>
> >> I took his approach (thanks Brijesh!) and now it's how we calculate expected
> >> SNP measurements in sev-snp-measure [1].  The relevant part for VMSA construction
> >> is in [2].
> >>
> >> I plan to add SEV-ES and SEV measurements calculation to this 
> >> library/program as well.
> > 
> > Everyone seems to be writing one; you, Dan etc!
> > 
> 
> Yeah, I should have mentioned Dan's demo tool here:
> https://gitlab.com/berrange/libvirt/-/blob/lgtm/tools/virt-dom-sev-vmsa-tool.py
> 
> Tyler Fanelli is looking at adding that functionality to sevctl too FWIW
> 
> > I think I agree the right way is to build it programmatically rather
> > than taking a copy from the kernel;  it's fairly simple, although the
> > scripts get increasingly hairy as you deal with more and more VMM's and
> > firmwares.
> > 
> 
> Agreed. A nice way to dump VMSA from the kernel will be useful for
> debugging, or extending these scripts to support different VMMs.
> 
> > I think I'd like to see a new ioctl to read the initial VMSA, primarily
> > as a way of debugging so you can see what VMSA you have when something
> > goes wrong.
> > 
> 
> debugfs seems simpler for the dev user (accessing a file per CPU vs code
> to call ioctl), but beyond that I don't have any insight. Is there a
> reason you think ioctl and not debugfs?

I'm not sure how easy it is to cook up a VMSA when you ask for it;
where as following the normal route for vCPU creation and then
taking a copy of the VMSA it was about to use sounds easy.
(Although I've tried neither).

Dave

> Thanks,
> Cole
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


