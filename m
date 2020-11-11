Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9F2AF550
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:45:25 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsJI-00018G-Hj
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsIC-0000bC-3c
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:44:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsI9-0004Bp-Ej
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605109452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1h6Z7euvdewLStiN9IVPM4pNQRSP7zHQRWeT3BzvjOE=;
 b=Mho6lGyX7mjT2zydsIL45blffee01Vg9Ozpx9tZRucuC1ymxyvQyeJl9HVSt7WWGcmXC+x
 x2eQaO6G7OO36piqB+h73a9/MiLlKNgeFFQ5vzypTbejoiudfTEaC5eoT1Atsmj9Rxdipu
 6gVNJhbBNiknAnhq7Uhc68cIawoSNX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-rfCd1oKnOLKRIBcjiulcqA-1; Wed, 11 Nov 2020 10:44:11 -0500
X-MC-Unique: rfCd1oKnOLKRIBcjiulcqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC83187951B;
 Wed, 11 Nov 2020 15:44:09 +0000 (UTC)
Received: from starship (unknown [10.35.206.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B45B655760;
 Wed, 11 Nov 2020 15:44:06 +0000 (UTC)
Message-ID: <03b01c699c9fab64736d04891f1e835aef06c886.camel@redhat.com>
Subject: Re: [PATCH 0/2] RFC: Issue with discards on raw block device
 without O_DIRECT
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Nov 2020 17:44:05 +0200
In-Reply-To: <20201111153913.41840-1-mlevitsk@redhat.com>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Kara <jack@suse.cz>,
 qemu-block@nongnu.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-11-11 at 17:39 +0200, Maxim Levitsky wrote:
> clone of "starship_production"

The git-publish destroyed the cover letter:

For the reference this is for bz #1872633

The issue is that current kernel code that implements 'fallocate'
on kernel block devices roughly works like that:

1. Flush the page cache on the range that is about to be discarded.
2. Issue the discard and wait for it to finish.
   (as far as I can see the discard doesn't go through the
   page cache).

3. Check if the page cache is dirty for this range,
   if it is dirty (meaning that someone wrote to it meanwhile)
   return -EBUSY.

This means that if qemu (or qemu-img) issues a write, and then
discard to the area that shares a page, -EBUSY can be returned by
the kernel.

On the other hand, for example, the ext4 implementation of discard
doesn't seem to be affected. It does take a lock on the inode to avoid
concurrent IO and flushes O_DIRECT writers prior to doing discard thought.

Doing fsync and retrying is seems to resolve this issue, but it might be a too big hammer.
Just retrying doesn't work, indicating that maybe the code that flushes the page
cache in (1) doesn't do this correctly ?

It also can be racy unless special means are done to block IO from happening
from qemu during this fsync.

This patch series contains two patches:

First patch just lets the file-posix ignore the -EBUSY errors, which is
technically enough to fail back to plain write in this case, but seems wrong.

And the second patch adds an optimization to qemu-img to avoid such a
fragmented write/discard in the first place.

Both patches make the reproducer work for this particular bugzilla,
but I don't think they are enough.

What do you think?

Best regards,
	Maxim Levitsky


