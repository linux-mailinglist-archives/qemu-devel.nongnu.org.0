Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD645DE24
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:58:57 +0100 (CET)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqH9E-0003L8-4C
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqH7t-0002G3-Kt
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqH7p-00075M-Am
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637855848;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qnhIx7TqUSlXOC8rZ3fTDQkh/vTYSUoKuy8oFlYY6gk=;
 b=aPBdK6FV0DRjnKoO5ZhdTZTAxsTuWR70Q8zZZwaXI+VbVo8CsBBMKg3mrn+xoJuSse/SOP
 qZIs7+a8Sg9PBkQxnsHk+zD40S+XnVE8rp53ZX0hT4Ndn69bpM9tWp6GNAV++aZjNab521
 1vPFpCFF+EC1YUcJXT0UTRHVnLw2vNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-wArtX1YpM9GTgUreTir72g-1; Thu, 25 Nov 2021 10:57:19 -0500
X-MC-Unique: wArtX1YpM9GTgUreTir72g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE00E102CB73;
 Thu, 25 Nov 2021 15:57:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 273A818369;
 Thu, 25 Nov 2021 15:56:45 +0000 (UTC)
Date: Thu, 25 Nov 2021 15:56:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+yO0vNVgh/KeJi@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
 <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
 <20211125151107.nhh7jfofk7qhkujd@mhamilton>
 <YZ+udETWZvkZP9ug@work-vm>
MIME-Version: 1.0
In-Reply-To: <YZ+udETWZvkZP9ug@work-vm>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Hubertus Franke <frankeh@us.ibm.com>, Sergio Lopez <slp@redhat.com>,
 afrosi@redhat.com, James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tyler Fanelli <tfanelli@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 03:40:36PM +0000, Dr. David Alan Gilbert wrote:
> * Sergio Lopez (slp@redhat.com) wrote:
> > On Thu, Nov 25, 2021 at 02:44:51PM +0200, Dov Murik wrote:
> > > 
> > > SEV-ES has pre-launch measurement and secret injection, just like SEV
> > > (except that the measurement includes the initial states of all vcpus,
> > > that is, their VMSAs.  BTW that means that in order to calculate the
> > > measurement the Attestation Server must know exactly how many vcpus are
> > > in the VM).
> > 
> > You need the number of vCPUs and an idea of what their initial state
> > is going to be, to be able to reproduce the same VMSA struct in the
> > Attestation Server.
> > 
> > This may tie the Attestation Server with a particular version of both
> > QEMU and KVM. I haven't checked if configuration changes in QEMU may
> > also have an impact on it.
> 
> That's all OK; I'm expecting the attestation server to be given a whole
> pile of information about the apparent environment to check.

Generally though we try not to let a VM to tied to a specific
version of software. eg use machine types to ensure that the
guest can run on any QEMU version, and get the same environment.
This lets host admin upgrade the host software for bug/security
fixes without negatively impacting users. It'd be nice not to
loose that feature with SEV if possible.

IOW, if there are aspects of the vCPU initial state that might
vary over time with different QEMU versions, should we be looking
to tie that variance into the machine type version.

For KVM changes, this might again come back to the idea fo a
"host type version".

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


