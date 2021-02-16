Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B690F31CD5A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:59:13 +0100 (CET)
Received: from localhost ([::1]:33470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2kq-0003O4-R0
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lC2jI-0002UM-2j
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lC2jD-0005C7-WC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613491045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=niqBju6q/ywUqwBbNhglQLmh8cvdySAr+kc/jJkgwxw=;
 b=XU2+JebxIri4IYzfPJrm5HX6I9NWHsX3z//Y//yjb3gUApPzz6vRo8lteEvTdip7Ceanrv
 vfRmdi0tRD/5J4bNezQWvQC5+z06pthHO6FZn5Nw8T/RpMNrORj6/q2dEp+++m0erFH6K+
 9lqwlLxzJHBcXdMU/Dzp0QAjymR4zto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-etouiES_NTOmBpGPmhE5Fg-1; Tue, 16 Feb 2021 10:57:24 -0500
X-MC-Unique: etouiES_NTOmBpGPmhE5Fg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D04107ACE4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 15:57:23 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-123.rdu2.redhat.com [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD2810023AD;
 Tue, 16 Feb 2021 15:57:11 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id AEC92220BCF; Tue, 16 Feb 2021 10:57:10 -0500 (EST)
Date: Tue, 16 Feb 2021 10:57:10 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 23/24] vhost-user-fs: Implement drop CAP_FSETID
 functionality
Message-ID: <20210216155710.GB10195@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-24-dgilbert@redhat.com>
 <20210211143542.GT247031@stefanha-x1.localdomain>
 <20210211144031.GB5014@redhat.com>
 <20210215155711.GA95852@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210215155711.GA95852@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 03:57:11PM +0000, Stefan Hajnoczi wrote:
> On Thu, Feb 11, 2021 at 09:40:31AM -0500, Vivek Goyal wrote:
> > On Thu, Feb 11, 2021 at 02:35:42PM +0000, Stefan Hajnoczi wrote:
> > > On Tue, Feb 09, 2021 at 07:02:23PM +0000, Dr. David Alan Gilbert (git) wrote:
> > > > From: Vivek Goyal <vgoyal@redhat.com>
> > > > 
> > > > As part of slave_io message, slave can ask to do I/O on an fd. Additionally
> > > > slave can ask for dropping CAP_FSETID (if master has it) before doing I/O.
> > > > Implement functionality to drop CAP_FSETID and gain it back after the
> > > > operation.
> > > > 
> > > > This also creates a dependency on libcap-ng.
> > > 
> > > Is this patch only for the case where QEMU is running as root?
> > > 
> > 
> > Yes, it primarily is for the case where qemu is running as root, or
> > somebody managed to launch it non-root but with still having capability
> > CAP_FSETID.
> 
> Running QEMU as root is not encouraged because the security model is
> designed around the principle of least privilege (only give QEMU access
> to resources that belong to the guest).
> 
> What happens in the case where QEMU is not root? Does that mean QEMU
> will drop suid/guid bits even if the FUSE client wanted them to be
> preserved?

QEMU will drop CAP_FSETID only if vhost-user slave asked for it. There
is no notion of gaining CAP_FSETID.

IOW, yes, if qemu is running unpriviliged and does not have CAP_FSETID,
then we will end up clearing setuid bit on host. Not sure how that
problem can be fixed.

Vivek


