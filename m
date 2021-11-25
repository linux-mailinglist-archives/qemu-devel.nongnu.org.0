Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D3C45DE5A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 17:10:15 +0100 (CET)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqHKA-0003MH-H9
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 11:10:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqHJ1-0002ft-0i
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:09:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqHIt-0000Ts-9b
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637856534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dni5/9wmR2eNDMisfkHMz662VAa27py1dUEq9FUtCY0=;
 b=av7BgEDY2x5/RFmogEq3hRPvpNn46ONesSo5E7ofgYySdLUaU0CxJCzoocD7uEUQChuVzm
 XJFojMuRhBRDbynzRl09YbAX6k91R1ZDc86fzOdUoFiyDM0gBvgMOyJWaxKglB6mKN/GCC
 iihzumXx1WzTTmuwckMFmUKM+XL1TGs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-eayIvEESNh6alAgcRBd_CA-1; Thu, 25 Nov 2021 11:08:52 -0500
X-MC-Unique: eayIvEESNh6alAgcRBd_CA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so3736366wms.7
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 08:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Dni5/9wmR2eNDMisfkHMz662VAa27py1dUEq9FUtCY0=;
 b=m3TcLVBob8knqWN715GqrwkktJuwEZuhNRUFSTdL/N85A5xlOal7KmkpU82fKxAmoV
 vv9ytNz+KmZlb8OCaViSKxJH+J72AeukHOTPPGi2iqJAS5blPFcuWLczcj1T4Vvtkv5S
 qq+9x2aDgwItXTLZOdHe4G7+c38H97F5aIjaOB+z+Arf9EIeO7Gq9v/9y5Dq477SQOBf
 ew/Q533+qhwG/sGqNI9b99NZrOglzJgYfJiOTB376ppUaxVb3gj77zUF3+MebTy3oVO7
 8A5bShMBV6qB79Gj6etP7gGa1ENE5qe3EkkYAmolqE/rZsH7CGXEdylM86s1/CqIdUz4
 UtqQ==
X-Gm-Message-State: AOAM532lSejGv1YU4jSDURHun/PC5PdPe+rvIyC3QAPPZOvmvDW/z5cv
 Kj2b1q+XlAyq5S+QU5+4LkDKcLQhNUx9EFrYm62iPhadLXSgJdmDCK9DKwoqB4bpSNU27Fy82uF
 294/JPuxsRrJOE1s=
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr8659538wmq.144.1637856531517; 
 Thu, 25 Nov 2021 08:08:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKV16laTlP+vtFBOyBs0NQ6pkJ2W8Ki5bygu8FaLXdT3VOgdf1SIaJER9/zIa//y7tCCYbVw==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr8659495wmq.144.1637856531290; 
 Thu, 25 Nov 2021 08:08:51 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id h2sm3073237wrz.23.2021.11.25.08.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 08:08:50 -0800 (PST)
Date: Thu, 25 Nov 2021 16:08:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+1EOvL7/6Usk0z@work-vm>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
 <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
 <20211125151107.nhh7jfofk7qhkujd@mhamilton>
 <YZ+udETWZvkZP9ug@work-vm> <YZ+yO0vNVgh/KeJi@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YZ+yO0vNVgh/KeJi@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Hubertus Franke <frankeh@us.ibm.com>, Sergio Lopez <slp@redhat.com>,
 afrosi@redhat.com, James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tyler Fanelli <tfanelli@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Nov 25, 2021 at 03:40:36PM +0000, Dr. David Alan Gilbert wrote:
> > * Sergio Lopez (slp@redhat.com) wrote:
> > > On Thu, Nov 25, 2021 at 02:44:51PM +0200, Dov Murik wrote:
> > > > 
> > > > SEV-ES has pre-launch measurement and secret injection, just like SEV
> > > > (except that the measurement includes the initial states of all vcpus,
> > > > that is, their VMSAs.  BTW that means that in order to calculate the
> > > > measurement the Attestation Server must know exactly how many vcpus are
> > > > in the VM).
> > > 
> > > You need the number of vCPUs and an idea of what their initial state
> > > is going to be, to be able to reproduce the same VMSA struct in the
> > > Attestation Server.
> > > 
> > > This may tie the Attestation Server with a particular version of both
> > > QEMU and KVM. I haven't checked if configuration changes in QEMU may
> > > also have an impact on it.
> > 
> > That's all OK; I'm expecting the attestation server to be given a whole
> > pile of information about the apparent environment to check.
> 
> Generally though we try not to let a VM to tied to a specific
> version of software. eg use machine types to ensure that the
> guest can run on any QEMU version, and get the same environment.
> This lets host admin upgrade the host software for bug/security
> fixes without negatively impacting users. It'd be nice not to
> loose that feature with SEV if possible.
> 
> IOW, if there are aspects of the vCPU initial state that might
> vary over time with different QEMU versions, should we be looking
> to tie that variance into the machine type version.

It's not tied to a particular version; but you may need to let the
attesting server know what version it's using so that it can check
everything adds up.

Dave

> For KVM changes, this might again come back to the idea fo a
> "host type version".
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


