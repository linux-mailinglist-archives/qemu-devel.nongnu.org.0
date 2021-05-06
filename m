Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347EA375862
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:22:34 +0200 (CEST)
Received: from localhost ([::1]:46890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legll-0004iB-98
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1legSU-0001nr-DM
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1legSR-0002Qy-Mv
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620316955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sTNEbKcnXCambpACrV1BNqfYIWb/tXEnzCtPppiYR8s=;
 b=A7RQYqNp+ejEzwm+fcFhzeMpUEGpxxxActxe1GxblpJJrZHkZOyeeUXmTgQ8yQ2IWOvSzX
 nELFkCHN8mlgThE1rDY4FaTm+ajmudO6/T25kXxzN82ziNxzQUMl1KGnb/K/ZUDQUmi3/T
 zFLaGlzIiAGnClkb2LPE/D3fkbP8ltc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-Y0F5BMiqN7KjUw3oG7x6mg-1; Thu, 06 May 2021 12:02:33 -0400
X-MC-Unique: Y0F5BMiqN7KjUw3oG7x6mg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E11218B9ED7;
 Thu,  6 May 2021 16:02:31 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-166.rdu2.redhat.com [10.10.114.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FEA760871;
 Thu,  6 May 2021 16:02:24 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 8C59B22054F; Thu,  6 May 2021 12:02:23 -0400 (EDT)
Date: Thu, 6 May 2021 12:02:23 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <20210506160223.GA277745@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-27-dgilbert@redhat.com>
 <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, groug@kaod.org,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 06, 2021 at 04:37:04PM +0100, Stefan Hajnoczi wrote:
> On Wed, Apr 28, 2021 at 12:01:00PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: Vivek Goyal <vgoyal@redhat.com>
> > 
> > If qemu guest asked to drop CAP_FSETID upon write, send that info
> > to qemu in SLAVE_FS_IO message so that qemu can drop capability
> > before WRITE. This is to make sure that any setuid bit is killed
> > on fd (if there is one set).
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> 
> I'm not sure if the QEMU FSETID patches make sense. QEMU shouldn't be
> running with FSETID because QEMU is untrusted. FSETGID would allow QEMU
> to create setgid files, thereby potentially allowing an attacker to gain
> any GID.

Sure, its not recommended to run QEMU as root, but we don't block that
either and I do regularly test with qemu running as root.

> 
> I think it's better not to implement QEMU FSETID functionality at all
> and to handle it another way.

One way could be that virtiofsd tries to clear setuid bit after I/O
has finished. But that will be non-atomic operation and it is filled
with perils as it requires virtiofsd to know what all kernel will
do if this write has been done with CAP_FSETID dropped.

> In the worst case I/O requests should just
> fail, it seems like a rare case anyway:

Is there a way for virtiofsd to know if qemu is running with CAP_FSETID
or not. If there is one, it might be reasonable to error out. If we
don't know, then we can't fail all the operations.

> I/O to a setuid/setgid file with
> a memory buffer that is not mapped in virtiofsd.

With DAX it is easily triggerable. User has to append to a setuid file
in virtiofs and this path will trigger.

I am fine with not supporting this patch but will also need a reaosonable
alternative solution.

Vivek


