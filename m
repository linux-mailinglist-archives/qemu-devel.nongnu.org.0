Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7503B278941
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:17:45 +0200 (CEST)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLnbc-0006JP-CL
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kLnW4-0008R9-4F
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kLnW0-0003rL-IM
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:11:59 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601039515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fpV8DHfqHlUsIFUnLnE9BpUd6xzNJarGN6/D8yQHXCY=;
 b=ibfqUJwXoWzJZOK3hRzsuibdtTKD8n10fRIhR0YXdsnRHs+SOAIOj+bQOOAoq1y0aZa7xY
 t2Nlp1ZlujwcaUlSTK3/MlbL9MkAv0nR6/TCpo5Eg/kyAkBNe/+QzxPal3JEQTcokOOTf7
 BYZlwrRaPLylD8BLECjOTNyuMa14Tyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-Ac7SFtpJO3-TCkXsDxcQMA-1; Fri, 25 Sep 2020 09:11:53 -0400
X-MC-Unique: Ac7SFtpJO3-TCkXsDxcQMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C39B46416A;
 Fri, 25 Sep 2020 13:11:52 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-239.rdu2.redhat.com [10.10.116.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C96755786;
 Fri, 25 Sep 2020 13:11:42 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 74B9D222FC0; Fri, 25 Sep 2020 09:11:42 -0400 (EDT)
Date: Fri, 25 Sep 2020 09:11:42 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: tools/virtiofs: Multi threading seems to hurt performance
Message-ID: <20200925131142.GC132653@redhat.com>
References: <20200918213436.GA3520@redhat.com> <20200921153243.GK3221@work-vm>
 <20200922102531.GA2837@work-vm> <20200922174733.GD57620@redhat.com>
 <20200925121127.GI2873@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200925121127.GI2873@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jose.carlos.venegas.munoz@intel.com, qemu-devel@nongnu.org,
 cdupontd@redhat.com, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, archana.m.shinde@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 25, 2020 at 01:11:27PM +0100, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > On Tue, Sep 22, 2020 at 11:25:31AM +0100, Dr. David Alan Gilbert wrote:
> > > * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > > > Hi,
> > > >   I've been doing some of my own perf tests and I think I agree
> > > > about the thread pool size;  my test is a kernel build
> > > > and I've tried a bunch of different options.
> > > > 
> > > > My config:
> > > >   Host: 16 core AMD EPYC (32 thread), 128G RAM,
> > > >      5.9.0-rc4 kernel, rhel 8.2ish userspace.
> > > >   5.1.0 qemu/virtiofsd built from git.
> > > >   Guest: Fedora 32 from cloud image with just enough extra installed for
> > > > a kernel build.
> > > > 
> > > >   git cloned and checkout v5.8 of Linux into /dev/shm/linux on the host
> > > > fresh before each test.  Then log into the guest, make defconfig,
> > > > time make -j 16 bzImage,  make clean; time make -j 16 bzImage 
> > > > The numbers below are the 'real' time in the guest from the initial make
> > > > (the subsequent makes dont vary much)
> > > > 
> > > > Below are the detauls of what each of these means, but here are the
> > > > numbers first
> > > > 
> > > > virtiofsdefault        4m0.978s
> > > > 9pdefault              9m41.660s
> > > > virtiofscache=none    10m29.700s
> > > > 9pmmappass             9m30.047s
> > > > 9pmbigmsize           12m4.208s
> > > > 9pmsecnone             9m21.363s
> > > > virtiofscache=noneT1   7m17.494s
> > > > virtiofsdefaultT1      3m43.326s
> > > > 
> > > > So the winner there by far is the 'virtiofsdefaultT1' - that's
> > > > the default virtiofs settings, but with --thread-pool-size=1 - so
> > > > yes it gives a small benefit.
> > > > But interestingly the cache=none virtiofs performance is pretty bad,
> > > > but thread-pool-size=1 on that makes a BIG improvement.
> > > 
> > > Here are fio runs that Vivek asked me to run in my same environment
> > > (there are some 0's in some of the mmap cases, and I've not investigated
> > > why yet).
> > 
> > cache=none does not allow mmap in case of virtiofs. That's when you
> > are seeing 0.
> > 
> > >virtiofs is looking good here in I think all of the cases;
> > > there's some division over which cinfig; cache=none
> > > seems faster in some cases which surprises me.
> > 
> > I know cache=none is faster in case of write workloads. It forces
> > direct write where we don't call file_remove_privs(). While cache=auto
> > goes through file_remove_privs() and that adds a GETXATTR request to
> > every WRITE request.
> 
> Can you point me to how cache=auto causes the file_remove_privs?

fs/fuse/file.c

fuse_cache_write_iter() {
	err = file_remove_privs(file);
}

Above path is taken when cache=auto/cache=always is used. If virtiofsd
is running with noxattr, then it does not impose any cost. But if xattr
are enabled, then every WRITE first results in a
getxattr(security.capability) and that slows down WRITES tremendously.

When cache=none is used, we go through following path instead.

fuse_direct_write_iter() and it does not have file_remove_privs(). We
set a flag in WRITE request to tell server to kill
suid/sgid/security.capability, instead.

fuse_direct_io() {
	ia->write.in.write_flags |= FUSE_WRITE_KILL_PRIV
}

Vivek


