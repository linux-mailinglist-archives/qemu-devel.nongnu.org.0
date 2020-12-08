Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA12D2254
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 05:53:50 +0100 (CET)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmV0X-0002Wr-HR
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 23:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kmUyg-0001mB-4S
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 23:51:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kmUyb-0000eM-4W
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 23:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607403106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEAi0bA+j9UTD7cHRAZIOvytKYmXsVCI2IduNES6nrQ=;
 b=bgh2pkPD0bMvrLrQAmpc7UHb+CSWME0+hhlKMIOsd/k2On8n5UBGChJ2rOfynXyE1D101s
 fqJxrcyHXxdyek5XNM/Iifz7RoCXlXR1Ljl1sAveph0+dqhfC5aOylUtZCCFR16KDmXNXk
 a9KuE+5KW9srKf8W8ahZBOta/pn5pR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-OO7MZNoJPX2Ate4ALvQk3A-1; Mon, 07 Dec 2020 23:51:44 -0500
X-MC-Unique: OO7MZNoJPX2Ate4ALvQk3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605F9107ACE4
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 04:51:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-30.ams2.redhat.com
 [10.36.112.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0E4227C27;
 Tue,  8 Dec 2020 04:51:35 +0000 (UTC)
Subject: Re: [PATCH 0/3] virtiofsd: Fix lo_flush() and inode->posix_lock init
To: Vivek Goyal <vgoyal@redhat.com>, qemu-devel@nongnu.org
References: <20201207183021.22752-1-vgoyal@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <861a96f9-34fa-cd1f-4bbf-4a3506c9afa2@redhat.com>
Date: Tue, 8 Dec 2020 05:51:34 +0100
MIME-Version: 1.0
In-Reply-To: <20201207183021.22752-1-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vivek,

On 12/07/20 19:30, Vivek Goyal wrote:
> Laszlo is writing a virtiofs client for OVMF and noticed that if he
> sends fuse FLUSH command for directory object, virtiofsd crashes.
> virtiofsd does not expect a FLUSH arriving for a directory object.
> 
> This patch series has one of the patches which fixes that. It also
> has couple of posix lock fixes as a result of lo_flush() related debugging.
> 
> Vivek Goyal (3):
>   virtiofsd: Set up posix_lock hash table for root inode
>   virtiofsd: Disable posix_lock hash table if remote locks are not
>     enabled
>   virtiofsd: Check file type in lo_flush()
> 
>  tools/virtiofsd/passthrough_ll.c | 54 +++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 15 deletions(-)
> 

I put back the (wrong) FLUSH for the root dir into my code temporarily, to reproduce the crash (it does, with v5.2.0-rc4).

Then I applied your series [*], and retested.

[*] I'm unsure about the email you sent in response to 1/3, namely <https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01504.html>; I ignored that when applying the patches.

Indeed now I get a graceful -EBADF:

[13316825985314] [ID: 00000004] unique: 60, opcode: FLUSH (25), nodeid: 1, insize: 64, pid: 1
[13316825993517] [ID: 00000004]    unique: 60, error: -9 (Bad file descriptor), outsize: 16

For whichever patch in the series my testing is relevant:

Tested-by: Laszlo Ersek <lersek@redhat.com>

(I'm having some difficulty figuring out which patch(es) should carry my T-b.

- I think I didn't really test patch#2 with the above, so that one should likely not get the T-b

- I think patch#3 is what I really tested.

- But, if that's the case, doesn't patch#3 make the fix in patch#1 untestable, in my scenario? I believe the code is no longer reached in lo_flush(), due to patch#3, where the change from patch#1 would matter. Patch#1 seems correct, and the last paragraph of its commit message relevant, but I think my testing currently only covered patch#3.

I'll let you decide where to apply my T-b.)

Thanks!
Laszlo


