Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70520422C7F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:29:14 +0200 (CEST)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmNV-0005Zl-8v
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXmB7-0002Z2-2v
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXmB5-0003OD-JD
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZGKh6UT74+xec7+47Uoo6vIl14vCd6q/Gnz37G3Las=;
 b=C5QOrbqhE7TSqgag72Rg+DnQEELJO4J0euurFweH6I7ZwJW1kYAExOPf8/WJn99TVRTszo
 lWy+2QBtXaS6VWILNPQsTmzFWtenzJHrtz66VmY0EAzGeqXZPcl/4N7d604Wss07iFvu6B
 moGAdzh29wgEOuao8aO0Mr4kwpCFXxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-Dl0Hu9SOPKSqZJ_udKl-Eg-1; Tue, 05 Oct 2021 11:16:19 -0400
X-MC-Unique: Dl0Hu9SOPKSqZJ_udKl-Eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADF76835DE1;
 Tue,  5 Oct 2021 15:16:18 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C79C60936;
 Tue,  5 Oct 2021 15:16:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 21D27220BDB; Tue,  5 Oct 2021 11:16:18 -0400 (EDT)
Date: Tue, 5 Oct 2021 11:16:18 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 13/13] virtiofsd, seccomp: Add
 clock_nanosleep() to allow list
Message-ID: <YVxsQg+edz0kFmUl@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-14-vgoyal@redhat.com>
 <YVxDouMEj3aqTNf3@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVxDouMEj3aqTNf3@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 01:22:58PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:37AM -0400, Vivek Goyal wrote:
> > g_usleep() calls nanosleep() and that now seems to call clock_nanosleep()
> > syscall. Now these patches are making use of g_usleep(). So add
> > clock_nanosleep() to list of allowed syscalls.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  tools/virtiofsd/passthrough_seccomp.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> > index cd24b40b78..03080806c0 100644
> > --- a/tools/virtiofsd/passthrough_seccomp.c
> > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > @@ -117,6 +117,7 @@ static const int syscall_allowlist[] = {
> >      SCMP_SYS(writev),
> >      SCMP_SYS(umask),
> >      SCMP_SYS(nanosleep),
> > +    SCMP_SYS(clock_nanosleep),
> 
> This patch can be dropped once sleep has been replaced by a condvar.

There is another sleep in do_pool_destroy() where we are waiting
for all current threads to exit.

do_pool_destroy() {
    g_usleep(10000);
}

Vivek


