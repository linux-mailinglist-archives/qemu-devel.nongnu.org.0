Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9B3027B2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:23:38 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44eP-0007yi-I2
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l44au-0005xu-QK
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l44at-00075l-77
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rqgd6lng9OfD+mj3f9xERc8cvQna8Zqa/0OlBz1Lo/g=;
 b=Bd6M+yCaeSh3lpwqkD57nRRIspxiLnlOBFRV7pf0ymmykz0dsXNrARIbQnbMjtZGCfsWyT
 AeFB0XaLRi68q20pKYYfFPdQDxyHnJb7xSyKEcLWjUgeFyztvuoCRsseArOZ2CRor/yesX
 jozy5UFVqsdtolgzCZLYCR+RsyqbAgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-hGGgHjsBMVqapzkHk4Go_g-1; Mon, 25 Jan 2021 11:19:56 -0500
X-MC-Unique: hGGgHjsBMVqapzkHk4Go_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1FA51005504;
 Mon, 25 Jan 2021 16:19:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-150.ams2.redhat.com [10.36.115.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B7319C47;
 Mon, 25 Jan 2021 16:19:53 +0000 (UTC)
Date: Mon, 25 Jan 2021 17:19:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: How to check when "raw" format driver uses a "regular" file?
Message-ID: <20210125161952.GE7107@merkur.fritz.box>
References: <1ccc5e60-65fa-21aa-713d-d5bb575b2594@redhat.com>
 <20210125154316.GC7107@merkur.fritz.box>
 <c53e6ff2-b09a-ee1e-110d-b64f23e7b609@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c53e6ff2-b09a-ee1e-110d-b64f23e7b609@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.2021 um 17:01 hat Philippe Mathieu-Daudé geschrieben:
> On 1/25/21 4:43 PM, Kevin Wolf wrote:
> > Am 25.01.2021 um 16:05 hat Philippe Mathieu-Daudé geschrieben:
> >> Is it possible to restrict a block driver to a particular set of
> >> options? In my case I'd like to restrict the raw driver to regular files.
> >>
> >> I noticed the NFS driver does it locally in nfs_client_open(),
> >> and FUSE has is_regular_file() -- which is POSIX specific however.
> >>
> >> When a backend is a SCSI drive, the block layer provide the blk_is_sg()
> >> method to test it.
> >> 1/ Should I provide a similar blk_is_regular_file()?
> >>
> >> 2/ There is no oslib function to check for regular file,
> >> should I add one too?
> > 
> > I find this question confusing because on one hand you're talking about
> > block driver implementations like NFS, but on the other hand about SCSI
> > devices, which are users, not implementations of block drivers.
> 
> Sorry for the confusion and thanks for the quick answer :)
> 
> My question is confused because the problem is not clear to me...
> 
> > At which level is the code where you think you need to make this
> > distinction?
> 
> (see below)
> 
> > The other problem is that "is this a regular file?" is probably not what
> > you're really interested in. The content of an image can be spread
> > across several files (for example, consider backing files) or not use a
> > local file descriptor at all (network protocol drivers), and block layer
> > functions should ideally make sense for all drivers unless something can
> > only possibly make sense for a single driver (blk_is_sg might be a case
> > of this).
> > 
> > I assume that you are interested in some specific property that regular
> > files happen to provide. If at all possible, we shouldn't check for a
> > specific backend type, but for capabilities or properties of a given
> > block node.
> > 
> > So what are you really trying to do here?
> 
> Well, maybe this is more an emulation problem rather than a block
> one. But system emulation consumes block layer :)
> 
> The problem is when emulating devices such NOR Flash (parallel mapping
> or SD cards) we expect the block driver being a plain file (either "raw"
> format or another) but a "regular" file. When an user passes something
> else like a block device, odd things happen.

What kind of odd things?

In theory, a block device shouldn't look much different from a regular
file for almost all block layer functions. The major difference is that
it has a fixed size, but device emulation isn't supposed to change the
size of an image file anyway. I could imagine some differences related
to block status. What else?

So far no other device emulation makes the distinction, so there are a
few options: Either they would need it, but we failed to realise this.
Or there is a block layer bug that happens to only be exposed with your
flash code. Or your flash code is doing something wrong. Or you really
have a unique requirement (which we should then make explicitly known to
block layer people) and there is a limitation in the handling of block
devices that we weren't aware of and should document at least.

"odd things happen" doesn't really give much information about which of
these cases we actually have here.

> Well, I guess I self-restricted my question to device emulation. So
> in the cases mentioned I would like to add a check in sd_realize()/
> pflash_cfi0?_realize() for regular file when a block drive is provided.
> 
> Description of problematic user case:
> 
> * -pflash /dev/sda
> * -sd /dev/mmcblk0
> 
> User runs emulation on top of hardware (maybe like passthru?), and
> expect underlying block to be in correct state out of QEMU.

Indeed, I would expect the same. Why doesn't this work, and is it
fundamentally impossible to make it work?

Kevin


