Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41052D2CF3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:18:35 +0100 (CET)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdp4-0007rG-Tu
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmdn6-0006hz-T9
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:16:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmdn2-000357-BQ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607436986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y/tC5Z5PPiCoXJMjQ+sX/dxTz0M24Z6RpKeZ27sm29s=;
 b=EBD5oc7Cgbxhl9zy3Or+pblIDCUD19ujG2KE/Bpr5NxD2z7NmM+n/a9D+CkvjjO0BrnSMm
 vqD9QUGQR3YhWumKFE+QbB2vQLJqw5kQjSvmTIumBRlWFS1dkb2wcGVU7JzRKnfs+T7RiR
 XZiJ0pFU0dqQwig+kuWORZ/lZs8mRbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-f5LfudTMOom18A4w9vyWnA-1; Tue, 08 Dec 2020 09:16:22 -0500
X-MC-Unique: f5LfudTMOom18A4w9vyWnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B276104ED3F
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 14:16:09 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-241.rdu2.redhat.com [10.10.116.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA6726E51B;
 Tue,  8 Dec 2020 14:16:08 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4DFE1220BCF; Tue,  8 Dec 2020 09:16:08 -0500 (EST)
Date: Tue, 8 Dec 2020 09:16:08 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH 0/3] virtiofsd: Fix lo_flush() and inode->posix_lock init
Message-ID: <20201208141608.GA3212@redhat.com>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <861a96f9-34fa-cd1f-4bbf-4a3506c9afa2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <861a96f9-34fa-cd1f-4bbf-4a3506c9afa2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 05:51:34AM +0100, Laszlo Ersek wrote:
> Hi Vivek,
> 
> On 12/07/20 19:30, Vivek Goyal wrote:
> > Laszlo is writing a virtiofs client for OVMF and noticed that if he
> > sends fuse FLUSH command for directory object, virtiofsd crashes.
> > virtiofsd does not expect a FLUSH arriving for a directory object.
> > 
> > This patch series has one of the patches which fixes that. It also
> > has couple of posix lock fixes as a result of lo_flush() related debugging.
> > 
> > Vivek Goyal (3):
> >   virtiofsd: Set up posix_lock hash table for root inode
> >   virtiofsd: Disable posix_lock hash table if remote locks are not
> >     enabled
> >   virtiofsd: Check file type in lo_flush()
> > 
> >  tools/virtiofsd/passthrough_ll.c | 54 +++++++++++++++++++++++---------
> >  1 file changed, 39 insertions(+), 15 deletions(-)
> > 
> 
> I put back the (wrong) FLUSH for the root dir into my code temporarily, to reproduce the crash (it does, with v5.2.0-rc4).
> 
> Then I applied your series [*], and retested.
> 
> [*] I'm unsure about the email you sent in response to 1/3, namely <https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01504.html>; I ignored that when applying the patches.

Hi Laszlo,

Thank you for the testing.

I reposed patch 1 to take care of coding style issues. Functionally both
the versions are same.

> 
> Indeed now I get a graceful -EBADF:
> 
> [13316825985314] [ID: 00000004] unique: 60, opcode: FLUSH (25), nodeid: 1, insize: 64, pid: 1
> [13316825993517] [ID: 00000004]    unique: 60, error: -9 (Bad file descriptor), outsize: 16
> 
> For whichever patch in the series my testing is relevant:
> 
> Tested-by: Laszlo Ersek <lersek@redhat.com>
> 
> (I'm having some difficulty figuring out which patch(es) should carry my T-b.
> 
> - I think I didn't really test patch#2 with the above, so that one should likely not get the T-b
> 
> - I think patch#3 is what I really tested.
> 
> - But, if that's the case, doesn't patch#3 make the fix in patch#1 untestable, in my scenario? I believe the code is no longer reached in lo_flush(), due to patch#3, where the change from patch#1 would matter. Patch#1 seems correct, and the last paragraph of its commit message relevant, but I think my testing currently only covered patch#3.
> 
> I'll let you decide where to apply my T-b.)

David Gilbert can add your Tested-by: while applying this patch series.
I think adding it to patch 3 makes most sense.

Thanks
Vivek


