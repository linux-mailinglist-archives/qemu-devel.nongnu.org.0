Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873E4335A3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 14:13:53 +0200 (CEST)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mco07-0002zr-0F
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 08:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcnpL-00087f-2f
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcnpI-0002UZ-UK
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634644960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OFODH6XlTHi1OVJQgmLw1XElwBdd26WHtJnfrfhd1E=;
 b=O+zKFvhkbNI67O9EkPc+vzxWzjw1h5OI8xb7DIEGzp3beGLH63T7cgr5XMGGCllSH1GFV2
 k2WjiakrzimWvzHUk9IJReHEmTh1UL9UUccWZx6CHAmYoiIApyGceWtdedzaKOijZNbwUK
 tfDmXevThg615x6r23kZe1laE075ZQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-EI9nOte-Owi76lQfb2SRxQ-1; Tue, 19 Oct 2021 08:02:37 -0400
X-MC-Unique: EI9nOte-Owi76lQfb2SRxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D43588066EF;
 Tue, 19 Oct 2021 12:02:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A16466A248;
 Tue, 19 Oct 2021 12:02:22 +0000 (UTC)
Date: Tue, 19 Oct 2021 14:02:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ari Sundholm <ari@tuxera.com>
Subject: Re: [PATCH v2] block/file-posix: Fix return value translation for
 AIO discards.
Message-ID: <YW6zzSKnm26+8ZXS@redhat.com>
References: <20211018180753.2436008-1-ari@tuxera.com>
 <20211019110954.4170931-1-ari@tuxera.com>
MIME-Version: 1.0
In-Reply-To: <20211019110954.4170931-1-ari@tuxera.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Emil Karlson <jkarlson@tuxera.com>, Hanna Reitz <hreitz@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.10.2021 um 13:09 hat Ari Sundholm geschrieben:
> AIO discards regressed as a result of the following commit:
> 	0dfc7af2 block/file-posix: Optimize for macOS
> 
> When trying to run blkdiscard within a Linux guest, the request would
> fail, with some errors in dmesg:
> 
> ---- [ snip ] ----
> [    4.010070] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
> driverbyte=DRIVER_SENSE
> [    4.011061] sd 2:0:0:0: [sda] tag#0 Sense Key : Aborted Command
> [current]
> [    4.011061] sd 2:0:0:0: [sda] tag#0 Add. Sense: I/O process
> terminated
> [    4.011061] sd 2:0:0:0: [sda] tag#0 CDB: Unmap/Read sub-channel 42
> 00 00 00 00 00 00 00 18 00
> [    4.011061] blk_update_request: I/O error, dev sda, sector 0
> ---- [ snip ] ----
> 
> This turns out to be a result of a flaw in changes to the error value
> translation logic in handle_aiocb_discard(). The default return value
> may be left untranslated in some configurations, and the wrong variable
> is used in one translation.
> 
> Fix both issues.
> 
> Signed-off-by: Ari Sundholm <ari@tuxera.com>
> Signed-off-by: Emil Karlson <jkarlson@tuxera.com>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 0dfc7af2b28 ("block/file-posix: Optimize for macOS")

Thanks, applied to the block branch.

Kevin


