Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158DB3AED02
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:03:51 +0200 (CEST)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMOr-0008PX-BX
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvML5-0005Vc-2k
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:59:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvML0-0006gy-Mc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624291188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y0kHX+8joUBrEhkikRA4i06kVvjs2F2Y7x4fTgJfHpc=;
 b=ECT59Tudkpf/ChluDqDz56Cq4ILTi2WDnk831OZHcyhyuCeuqV+Ex8gXUs5oL6XsyVHGMP
 iHocGs8H6+TMvKHmq2i6WDVFmB+t8VMu56EtcEXDkFggm0imP8zoXdghjpmhiu2qQ2StLA
 mqMfaH7EQSzcCSaGrHiUvxKMzpEs7vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-S72Q9QBnP9Chv9KL5aslgw-1; Mon, 21 Jun 2021 11:59:47 -0400
X-MC-Unique: S72Q9QBnP9Chv9KL5aslgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE65A192297D;
 Mon, 21 Jun 2021 15:59:45 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AF4610013D6;
 Mon, 21 Jun 2021 15:59:44 +0000 (UTC)
Date: Mon, 21 Jun 2021 17:59:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH RFC] meson: add option to use zstd for qcow2 compression
 by default
Message-ID: <YNC3b3S8tLM47PJn@redhat.com>
References: <20210617195128.66675-1-vsementsov@virtuozzo.com>
 <8d3711a0-2716-3bc5-3710-990042e16c0b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8d3711a0-2716-3bc5-3710-990042e16c0b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: den@openvz.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.06.2021 um 10:22 hat Paolo Bonzini geschrieben:
> On 17/06/21 21:51, Vladimir Sementsov-Ogievskiy wrote:
> > So, it's an RFC. I also can split the patch so that refactoring of
> > qcow2_co_create() go in a separate preparation patch.
> > 
> > Another RFC question, shouldn't we move to zstd by default in upstream
> > too?
> 
> I think backwards-incompatible changes in the past were not handled with
> build options, but that can be changed.
> 
> However I would prefer to have an option like
> --with-qcow2-compression={zstd,zlib}.  Meson supports multiple-choice
> options, they don't have to use enabled/disabled or (if boolean) true/false.

Yes, this is more extensible.

> Regarding changing the default, that would make images unreadable to QEMU
> 5.0 and earlier versions.  Does that apply to images that have no compressed
> clusters?

I think it does because you could be writing compressed clusters to it
later. Originally, we had only 'qemu-img convert -c' that could write
compressed clusters, but today the backup job can write them, too, and
it doesn't create the image file itself.

Kevin


