Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA262D1480
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:18:40 +0100 (CET)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIHe-0000pk-JA
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIFI-0007t1-UG
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:16:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIFA-0000uv-Ch
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607354162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+Ak496Wzp673l31cjgmhLGbwr4Er/AbSakLHDsHLkk=;
 b=ETtbkLJzVsWc+KigrkXFdV1o98RANfFNrIByvl6WJpgFWfX5p42C5lSPERhZizWai+ek4d
 sjlu6tNtG0ZE5Jza8SDcR++S3SrRTO4ZYMnljgec6Zw3li748aRFw48mBarbzlpl8v8glx
 nDPTVkIB4lnodnicmrLLrzUp5eNJ6lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-earJwNf2PpqmSzDfUZkuiA-1; Mon, 07 Dec 2020 10:15:47 -0500
X-MC-Unique: earJwNf2PpqmSzDfUZkuiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96250AFA81;
 Mon,  7 Dec 2020 15:15:44 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 443FF60BE2;
 Mon,  7 Dec 2020 15:15:40 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:15:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.0 v3 00/20] block/export: Allow exporting BDSs via
 FUSE
Message-ID: <20201207151538.GB5281@merkur.fritz.box>
References: <20201027190600.192171-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201027190600.192171-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.10.2020 um 20:05 hat Max Reitz geschrieben:
> v1: https://lists.nongnu.org/archive/html/qemu-block/2019-12/msg00451.html
> v2: https://lists.nongnu.org/archive/html/qemu-block/2020-09/msg01611.html
> 
> Branch: https://github.com/XanClic/qemu.git fuse-exports-v3
> Branch: https://git.xanclic.moe/XanClic/qemu.git fuse-exports-v3
> 
> 
> Hi,
> 
> Ever since I found out that you can mount FUSE filesystems on regular
> files (not just directories), I had the idea of adding FUSE block
> exports to qemu where you can export block nodes as raw images.  The
> best thing is that you’d be able to mount an image on itself, so
> whatever format it may be in, qemu lets it appear as a raw image (and
> you can then use regular tools like dd on it).
> 
> The performance is quite bad so far, but we can always try to improve it
> if the need arises.  For now I consider it mostly a cute feature to get
> easy access to the raw contents of image files in any format (without
> requiring root rights).
> 
> 
> This series does the following:
> 
> First, add the FUSE export module (block/export/fuse.c) that implements
> the basic file access functions.  (Note that you need libfuse 3.8.0 or
> later for SEEK_HOLE/SEEK_DATA.)
> 
> Second, it allows using FUSE exports as a protocol in the iotests and
> makes many iotests work with it.  (The file node is exported by a
> background qemu instance to $SOCK_DIR.)
> 
> This gives us a lot of coverage for, well, not free (it does take twelve
> patches), but for cheap; but there are still some more specialized
> things we want to test, so third and last, this series adds an iotest
> dedicated to FUSE exports.

Thanks, applied to the block branch.

Kevin


