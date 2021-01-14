Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2052F64D7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:39:02 +0100 (CET)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04iD-0007fD-GA
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l04cm-0003Wr-NB
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l04cj-0006CX-Uh
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610638401;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtNuM8olaR7jZ6oi91Dt8+iP5QBXiEIcQy8JQqXwuNI=;
 b=Bv2XMNcuKmluNLdabKKzKKP7pquQBui/XSl0x/tUGVdo7riOIUhaG2/HY20Fdx3/H4yVwX
 XInYMA6QT6WveSZ9yo7KkkovyctYLjvhi2u3SIujPA9DP99wSRJBgKNKGHeXWKiPXb0aMD
 vrto+RCxGrktN/20fM3t4GKFq2kjn84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-boN0XtuPNMyN0H2WksQqMQ-1; Thu, 14 Jan 2021 10:33:17 -0500
X-MC-Unique: boN0XtuPNMyN0H2WksQqMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34338100F340;
 Thu, 14 Jan 2021 15:33:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-77.ams2.redhat.com [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 068E918AD6;
 Thu, 14 Jan 2021 15:33:03 +0000 (UTC)
Date: Thu, 14 Jan 2021 15:33:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20210114153301.GL1643043@redhat.com>
References: <20210114103643.GD2905@work-vm>
 <db2295ce-333f-2a3e-8219-bfa4853b256f@de.ibm.com>
 <20210114120531.3c7f350e.cohuck@redhat.com>
 <20210114114533.GF2905@work-vm>
 <b791406c-fde2-89db-4186-e1660f14418c@de.ibm.com>
 <20210114122048.GG1643043@redhat.com>
 <20210114150422.5f74ca41.cohuck@redhat.com>
 <b0084527-97b3-3174-d988-bf0f6d6221fd@de.ibm.com>
 <20210114141535.GJ1643043@redhat.com>
 <e13aad37-97ba-de1b-f311-cd37044c1809@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e13aad37-97ba-de1b-f311-cd37044c1809@de.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pair@us.ibm.com, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Bjoern Walk <bwalk@linux.ibm.com>, frankja@linux.ibm.com, david@redhat.com,
 mdroth@linux.vnet.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org, rth@twiddle.net,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 04:25:21PM +0100, Christian Borntraeger wrote:
> On 14.01.21 15:15, Daniel P. Berrangé wrote:
> > On Thu, Jan 14, 2021 at 03:09:01PM +0100, Christian Borntraeger wrote:
> >>
> >>
> >> On 14.01.21 15:04, Cornelia Huck wrote:
> >>
> >> What about a libvirt change that removes the unpack from the host-model as 
> >> soon as  only-migrateable is used. When that is in place, QEMU can reject
> >> the combination of only-migrateable + unpack.
> > 
> > I think libvirt needs to just unconditionally remove unpack from host-model
> > regardless, and require an explicit opt in. We can do that in libvirt
> > without compat problems, because we track the expansion of "host-model"
> > for existing running guests.
> 
> This is true for running guests, but not for shutdown and restart.
> 
> I would really like to avoid bad (and hard to debug) surprises that a guest boots
> fine with libvirt version x and then fail with x+1. So at the beginning
> I am fine with libvirt removing "unpack" from the default host model expansion
> if the --only-migrateable parameter is used. Now I look into libvirt and I 
> cannot actually find code that uses this parameter. Are there some patches
> posted somewhere?

Sorryy, I should have been clearer that we don't currently use
--only-migrateable.  I've been talking from the pov of the effects
if we were to introduce it into libvirt.

The way it would work would be for  'virsh start FOO' to start the guest
unconditionally, while  'virsh start --migratable FOO' would start the
same guest config but fail if it used a non-migratable feature. We need
the guest ABI to be the same in both cases.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


