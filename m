Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460461DCB36
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 12:44:52 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbih1-00069G-C2
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 06:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jbigI-0005eP-97
 for qemu-devel@nongnu.org; Thu, 21 May 2020 06:44:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36145
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jbigG-0006IE-WD
 for qemu-devel@nongnu.org; Thu, 21 May 2020 06:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590057843;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3pH87xIq2jlvjOJb1ctZAs7/dK98Qqrq4rzf70bIiw=;
 b=LBYTni1i4zKnoJ25e3PD3iW5WYJ3McV84+118Q2fwHJbdjZbxCbfbI6nWBvGlt3S9rrYdP
 ASBvAodqubnGMEtFoWy67SZbtkpgwtwgGFavGhPSV2H0WbfB2ndUVed8+VzNQfJvuQ9dxn
 JG6/PAl7rtuVmxb+S12R5GJ9u0SzkhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-q3sv6YjZP7KSaRj5nmlcbA-1; Thu, 21 May 2020 06:43:52 -0400
X-MC-Unique: q3sv6YjZP7KSaRj5nmlcbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D184E19057A5;
 Thu, 21 May 2020 10:43:51 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F69E6EA4A;
 Thu, 21 May 2020 10:43:47 +0000 (UTC)
Date: Thu, 21 May 2020 11:43:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH] virtiofsd: Use clone() and not unshare(), support non-root
Message-ID: <20200521104344.GD2211791@redhat.com>
References: <348d4774-bd5f-4832-bd7e-a21491fdac8d@www.fastmail.com>
 <20200506191614.GR2743@work-vm>
 <20200507092832.GA1104082@redhat.com>
 <20200521101923.GF251811@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200521101923.GF251811@stefanha-x1.localdomain>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:47:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Colin Walters <walters@verbum.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 21, 2020 at 11:19:23AM +0100, Stefan Hajnoczi wrote:
> On Thu, May 07, 2020 at 10:28:32AM +0100, Daniel P. Berrangé wrote:
> > If the person in the host launching virtiofsd is non-root, then
> > user namespaces mean they can offer the guest the full range of
> > POSIX APIs wrt access control & file ownership, since they're
> > no longer restricted to their single host UID when inside the
> > container.
> 
> What installs the uid_map/gid_map for virtiofsd?
> 
> My machine has /etc/subuid and /etc/subgid, but how would this come into
> play with these patches applied?

AFAICT, nothing is setting up the mapping, hence my question in the first
review of this patch, that this patch seems incomplete.

The subuid/subgid files are essentially just reserving a range of IDs
for each user. Something then needs to read & honour those IDs.

The rules on setting up a mapping are complex though, to avoid a user
from creating a new user namespace, and defining a mapping that lets
them elevate privileges to read files in the host they wouldn't otherwise
be permitted to access.

IIUC, applying the range of IDs from subuid/subgid will require the
process defining the mapping to have CAP_SETUID *outside* the container.
As an unprivileged host user, you won't have that, so I think the only
thing you can do is setup a mapping for your own UID/GID, which would
allow the container to read/write files owned by the host user that
started it. That should be ok for virtiofsd's needs at least for simple
file sharing. If virtiofsd needs to expose its full range of features
though, something privileged in the host needs to setup a full mapping
based on subuid/subgid

BTW, "man user_namespaces" gives many more details on UID mapping
rules.

> What happens when an unprivileged user who is not listed in /etc/subuid
> runs virtiofsd?

The UID map inside the container will be empty, which should result in
all files being remapped to (uid_t)-1 or whatever is shown in the
/proc/sys/kernel/overflow{u,g}id files.

So virtiofsd would not have any write access, and only have read access
to files which have world-read bit set.  


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


