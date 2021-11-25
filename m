Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087B45DCCF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:02:03 +0100 (CET)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGG9-0006qu-Qy
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:02:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqGEk-00065k-2O
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqGEf-0000I0-Nl
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637852428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DlrksR2/e/P7W8M7bY1+XpXPMHWEUpB075puN4R/KWo=;
 b=RZ57Jwi3ZsyhIJJUNLjpj30nvJoUtMPHcuZZYcMZHborFkbBOPElez3Y5VrkUXTv3ayt4J
 QGuJC+hDX/v5br1WkpjLddtqBID1sFayISWHyypboqHZzOMQtM/owSZ1QG89pvqkQjlk/z
 LYKjlmSwsunrWPJgVkh5zpbHDMeI3zo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-Ic_msyW5Mt-5eJaC2YopsQ-1; Thu, 25 Nov 2021 10:00:22 -0500
X-MC-Unique: Ic_msyW5Mt-5eJaC2YopsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so3358532wmj.7
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=DlrksR2/e/P7W8M7bY1+XpXPMHWEUpB075puN4R/KWo=;
 b=NoXfMdAIafKcX8ieRERz4UviTFL7QfZjRBRHDZJrdZwlsozgo7/0lCkrD7cLQyHfPx
 HtpPjmRmBpOhpo9FY0ovqcI5p2ujeKEazJJnOp9UJcSUvgFlPFsn9jpuZAvwx+GRigZ4
 qRinBORMtf1wlHQoZ9ckUzBcAtAJVotxI+mpzHHqzFIi+OtOMPe/W/UygqhdUB991SAe
 VKdAawiLtYQ8Ft203AShbkRjGsYq6eJPvPk0gHxK5I4SnTFt3xrESl7XWwFRDGEoP4Y/
 dxsyTH6PEghgZ0W0bcjFU2mQSJq/NKctPXbt6Bf2ce3YQyFlaXRr1kHqmj2LZEWtiXWa
 PV/w==
X-Gm-Message-State: AOAM532AkLkmnQeyewaDC+0NR5fcmBXPI4707sdRPiUEsAOPTzgwNv4c
 vcF1up7v+zEa+kfWyTo1oNO3NNrHv4uotI45Inwl+R4NWLGY6PtxHjjaU1pMLjNAW4jIXpPJ6RZ
 HwQvWKCIKp5aXSSo=
X-Received: by 2002:adf:e391:: with SMTP id e17mr7112207wrm.613.1637852420993; 
 Thu, 25 Nov 2021 07:00:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDBAgUC4MHVth0Boqx9WdHmWw6Y5OkPxHzu9cAyfp6eFZCNu8NZKyyFc+E1Acqih6faXwJyw==
X-Received: by 2002:adf:e391:: with SMTP id e17mr7112165wrm.613.1637852420725; 
 Thu, 25 Nov 2021 07:00:20 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o5sm2914520wrx.83.2021.11.25.07.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:00:18 -0800 (PST)
Date: Thu, 25 Nov 2021 15:00:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+lAA2YnblXfmib@work-vm>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
 <YZ+VAotzIOwUjMc8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YZ+VAotzIOwUjMc8@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: Sergio Lopez <slp@redhat.com>, afrosi@redhat.com, qemu-devel@nongnu.org,
 dovmurik@linux.ibm.com, Tyler Fanelli <tfanelli@redhat.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Nov 25, 2021 at 08:14:28AM +0100, Sergio Lopez wrote:
> > For SEV-SNP, this is pretty much the end of the story, because the
> > attestation exchange is driven by an agent inside the guest. Well,
> > there's also the need to have in the VM a well-known vNIC bridged to a
> > network that's routed to the Attestation Server, that everyone seems
> > to consider a given, but to me, from a CSP perspective, looks like
> > quite a headache. In fact, I'd go as far as to suggest this
> > communication should happen through an alternative channel, such as
> > vsock, having a proxy on the Host, but I guess that depends on the CSP
> > infrastructure.
> 
> Allowing network connections from inside the VM, to any kind
> of host side mgmt LAN services is a big no for some cloud hosts.
> 
> They usually desire for any guest network connectivity to be
> associated with a VLAN/network segment that is strictly isolated
> from any host mgmt LAN.
> 
> OpenStack provides a virtual CCDROM for injecting cloud-init
> metadata as an alternative to the network based metadata REST
> service, since they latter often isn't deployed.
> 
> Similarly for virtual filesystems, we've designed virtiofs,
> rather than relying on a 2nd NIC combined with NFS.
> 
> We cannot assume availability of a real network device for the
> attestation. If one does exist fine, but there needs to be an
> alternative option that can be used.
> 
> 
> On a slightly different topic - if the attestation is driven
> from an agent inside the guest, this seems to imply we let the
> guest vCPUs start beforre attestation is done. Contrary to
> the SEV/SEV-ES where we seem to be wanting vCPUs to remain
> in the stopped state until attestation is complete & secrets
> provided.

That's right; SEV/SEV-ES is the odd case here.

> If the vCPUs are started, is there some mechanism
> to restrict what can be done  before attestation is complete?

Just the fact you haven't provided it the keys to decrypt it's disk to
do anything interesting; there's the potential to add extra if you
wanted (e.g. 802.1X network auth).

Dave

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


