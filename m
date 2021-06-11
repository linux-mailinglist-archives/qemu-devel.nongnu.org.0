Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E5F3A4ABC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 23:42:49 +0200 (CEST)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrovQ-0007J5-H3
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 17:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrotw-0006Np-5b
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 17:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrots-0002WM-Lz
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 17:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623447670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iM858NPSWQb8/B5+hOkUoYkAltk8T8eEwAvLvptqZi8=;
 b=Mt5svbLiA6EzK6TW4ZXeHe+I3n83KhpIbZ3sx6RgolLUWYAlFAZ0k1GzWXqqpsRjvIRer8
 Asq7x1jH8OnTHHBqcAWhlMDRmJzZYPCkR0jPcZc5niP7Z76ev/+1lqxZIAHwp6V7x+VGAn
 /d95Oc2wPg/In/z9U0J18spEYq2q7wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-ZSm68oQxMAeprhnjNSnwIg-1; Fri, 11 Jun 2021 17:41:07 -0400
X-MC-Unique: ZSm68oQxMAeprhnjNSnwIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DF8A107ACF6;
 Fri, 11 Jun 2021 21:41:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD78F60E3A;
 Fri, 11 Jun 2021 21:41:05 +0000 (UTC)
Date: Fri, 11 Jun 2021 16:41:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nirsof@gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210611214104.2bptve2o4zyqgnvh@redhat.com>
References: <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com>
 <YMMaJcKYe8nHDdjU@redhat.com>
 <20210611132830.i6wwm3fvytri6czu@redhat.com>
 <CAMRbyytDeniKkg4Bjcqry8203RHWzAKmAMdSELnLquBkXJNXvQ@mail.gmail.com>
 <20210611183443.bnw6npo53lbvfp2h@redhat.com>
 <CAMr-obsNTUzEf96U=Fgqwa1cOqpC8q8cTJ78cm1Yx3c+PbhvMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMr-obsNTUzEf96U=Fgqwa1cOqpC8q8cTJ78cm1Yx3c+PbhvMg@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 12, 2021 at 12:23:06AM +0300, Nir Soffer wrote:
> > Otherwise, you do have a point: "depth":1 in isolation is ambiguous
> > between "not allocated anywhere in this 1-element chain" and
> > "allocated at the first backing file in this chain of length 2 or
> > more".  At which point you can indeed use "qemu-img info" to determine
> > the backing chain depth.  How painful is that extra step?  Does it
> > justify the addition of a new optional "backing":true to any portion
> > of the file that was beyond the end of the chain (and omit that line
> > for all other regions, rather than printing "backing":false)?
> 
> Dealing with depth: N + 1 is not that painful, but also not great.
> 
> I think it is worth a little more effort, and it will save time in the long term
> for users and for developers. Better APIs need simpler and shorter
> documentation and require less support.
> 
> I'm not sure about backing: false, maybe absent: true to match libnbd?

In the patch [1], I did "backing":true if the cluster was not found in
the chain, and omitted the bool altogether when the cluster is
present.  If we like the name "absent":true better than
"backing":true, that's an easy change.  The libnbd change for nbdinfo
to report 'absent' instead of 'unallocated' has not yet been released,
so we have some leeway on naming choices.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03067.html

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


