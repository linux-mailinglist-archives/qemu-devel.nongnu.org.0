Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE720F357
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 13:04:40 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqE47-0006cV-FD
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 07:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqE2z-00062M-9j
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 07:03:29 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22193
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqE2x-0006Kb-1F
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 07:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593515006;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zcj9qsdWh1ZJWwvONxX6MREQYwmxR+n7OlNW327iP8I=;
 b=bWRZjEaMXjoxOZGJGUBnMJ6sH9LWwRcq/U83971z/Ou8p1bfc7ZCuAIGRH6LCMFwrvlXaD
 cpAWxTBE+aVLYpACHW8/SOK91PlU5OxYSsObFdAnnngKCmyHqVzDVuNPqF2OyotDYKhjWB
 mdvG+nvbuTTYtdnpGIajFf1sLQhGqPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-ZSo0Xj2tMAKmAeRCu2cKNg-1; Tue, 30 Jun 2020 07:03:19 -0400
X-MC-Unique: ZSo0Xj2tMAKmAeRCu2cKNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23ED10059A1;
 Tue, 30 Jun 2020 11:03:18 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 635AE1002388;
 Tue, 30 Jun 2020 11:03:13 +0000 (UTC)
Date: Tue, 30 Jun 2020 12:03:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] net: tap: check if the file descriptor is valid before
 using it
Message-ID: <20200630110310.GG1370404@redhat.com>
References: <20200625084835.GB1009994@redhat.com>
 <541b40c5-ee72-d37d-1c30-664775812d1b@redhat.com>
 <929203d2-20d2-7caf-e487-6bfe5b851974@redhat.com>
 <ea94fa3c-edb5-220e-e0e0-4b7fca7b90e8@redhat.com>
 <b912e24c-8dc5-7022-6ed2-cf10d72ef6e7@redhat.com>
 <20200630092318.GE1370404@redhat.com>
 <20200630093148.GF1370404@redhat.com>
 <247f4aa8-1846-c5ec-4fe3-1d344979ad52@redhat.com>
 <d24b43e9-5a8c-1cc0-9d1c-4ee01a8cbbca@redhat.com>
 <7a110325-0123-53da-604d-8a9374903782@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7a110325-0123-53da-604d-8a9374903782@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 30, 2020 at 12:35:46PM +0200, Laurent Vivier wrote:
> On 30/06/2020 12:03, Jason Wang wrote:
> > 
> > On 2020/6/30 下午5:45, Laurent Vivier wrote:
> >> On 30/06/2020 11:31, Daniel P. Berrangé wrote:
> >>> On Tue, Jun 30, 2020 at 10:23:18AM +0100, Daniel P. Berrangé wrote:
> >>>> On Tue, Jun 30, 2020 at 05:21:49PM +0800, Jason Wang wrote:
> >>>>> On 2020/6/30 上午3:30, Laurent Vivier wrote:
> >>>>>> On 28/06/2020 08:31, Jason Wang wrote:
> >>>>>>> On 2020/6/25 下午7:56, Laurent Vivier wrote:
> >>>>>>>> On 25/06/2020 10:48, Daniel P. Berrangé wrote:
> >>>>>>>>> On Wed, Jun 24, 2020 at 09:00:09PM +0200, Laurent Vivier wrote:
> >>>>>>>>>> qemu_set_nonblock() checks that the file descriptor can be
> >>>>>>>>>> used and, if
> >>>>>>>>>> not, crashes QEMU. An assert() is used for that. The use of
> >>>>>>>>>> assert() is
> >>>>>>>>>> used to detect programming error and the coredump will allow
> >>>>>>>>>> to debug
> >>>>>>>>>> the problem.
> >>>>>>>>>>
> >>>>>>>>>> But in the case of the tap device, this assert() can be
> >>>>>>>>>> triggered by
> >>>>>>>>>> a misconfiguration by the user. At startup, it's not a real
> >>>>>>>>>> problem,
> >>>>>>>>>> but it
> >>>>>>>>>> can also happen during the hot-plug of a new device, and here
> >>>>>>>>>> it's a
> >>>>>>>>>> problem because we can crash a perfectly healthy system.
> >>>>>>>>> If the user/mgmt app is not correctly passing FDs, then there's
> >>>>>>>>> a whole
> >>>>>>>>> pile of bad stuff that can happen. Checking whether the FD is
> >>>>>>>>> valid is
> >>>>>>>>> only going to catch a small subset. eg consider if fd=9 refers
> >>>>>>>>> to the
> >>>>>>>>> FD that is associated with the root disk QEMU has open. We'll
> >>>>>>>>> fail to
> >>>>>>>>> setup the TAP device and close this FD, breaking the healthy
> >>>>>>>>> system
> >>>>>>>>> again.
> >>>>>>>>>
> >>>>>>>>> I'm not saying we can't check if the FD is valid, but lets be
> >>>>>>>>> clear that
> >>>>>>>>> this is not offering very much protection against a broken mgmt
> >>>>>>>>> apps
> >>>>>>>>> passing bad FDs.
> >>>>>>>>>
> >>>>>>>> I agree with you, but my only goal here is to avoid the crash in
> >>>>>>>> this
> >>>>>>>> particular case.
> >>>>>>>>
> >>>>>>>> The punishment should fit the crime.
> >>>>>>>>
> >>>>>>>> The user can think the netdev_del doesn't close the fd, and he
> >>>>>>>> can try
> >>>>>>>> to reuse it. Sending back an error is better than crashing his
> >>>>>>>> system.
> >>>>>>>> After that, if the system crashes, it will be for the good
> >>>>>>>> reasons, not
> >>>>>>>> because of an assert.
> >>>>>>> Yes. And on top of this we may try to validate the TAP via st_dev
> >>>>>>> through fstat[1].
> >>>>>> I agree, but the problem I have is to know which major(st_dev) we can
> >>>>>> allow to use.
> >>>>>>
> >>>>>> Do we allow only macvtap major number?
> >>>>>
> >>>>> Macvtap and tuntap.
> >>>>>
> >>>>>
> >>>>>> How to know the macvtap major number at user level?
> >>>>>> [it is allocated dynamically: do we need to parse /proc/devices?]
> >>>>>
> >>>>> I think we can get them through fstat for /dev/net/tun and
> >>>>> /dev/macvtapX.
> >>>> Don't assume QEMU has any permission to access to these device nodes,
> >>>> only the pre-opened FDs it is given by libvirt.
> >>> Actually permissions are the least of the problem - the device nodes
> >>> won't even exist, because QEMU's almost certainly running in a private
> >>> mount namespace with a minimal /dev populated
> >>>
> >> I'm working on a solution using /proc/devices.
> > 
> > 
> > Similar issue with /dev. There's no guarantee that qemu can access
> > /proc/devices or it may not exist (CONFIG_PROCFS).
> 
> There is a lot of things that will not work without /proc (several tools
> rely on /proc, like ps, top, lsof, mount, ...). Some information are
> only available from /proc, and if /proc is there, I think /proc/devices
> is always readable by everyone. Moreover /proc is already used by qemu
> in several places.
> 
> It can also a best effort check.
> 
> The problem with fstat() on /dev files is to guess the /dev/macvtapX as
> X varies (the same with /dev/tapY)..
> 
> > 
> >> macvtap has its own major number, but tuntap use "misc" (10) major
> >> number.
> 
> Another question: it is possible to use the "fd=" parameter with macvtap
> as macvtap creates a /dev/tapY device, but how to do that with tuntap
> that does not create a /dev/tapY device?


I think we should step back and ask why we need to check this at all.

IMHO, if the passed-in FD works with the syscalls that tap-linux.c
is executing, then that shows the FD is suitable for QEMU. The problem
is that many of the tap APIs don't use "Error **errp" parameters to
report errors, so we can't catch the failures. IOW, instead of checking
the FD major/minor number, we should make the existing code be better
at reporting errors, so they can be fed back to the QMP console
gracefully.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


