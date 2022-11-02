Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3316615790
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 03:28:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq3TY-00063g-TO; Tue, 01 Nov 2022 22:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oq3TW-00063I-QZ; Tue, 01 Nov 2022 22:27:30 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oq3TV-00060U-1F; Tue, 01 Nov 2022 22:27:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB681B82064;
 Wed,  2 Nov 2022 02:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61ED6C433D7;
 Wed,  2 Nov 2022 02:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667356036;
 bh=rkOS07cMedaA5AHG2zBRKkQqFZbGFCFvtx5/EIB0F1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ge8Wg03a6Js0rYQsklN+bbLdG8YqGCBBluxI0K2roXzCUJoKwhiVGtRF3Uq6ADxxb
 s+bRlMO2Hxi4L3Ux2ayoc7725151In2qrVopsg0+15S1b/irHuUmIG+XV1PBsJ2dKV
 n2DqL2tQ+6S7LJSiHYfgrtdDwvDdUdvXjsNgapCRdIPLm/D/rv35dEYBx9xNZ5VN9R
 5YV5lzz7VRqUaJSwt1HP2TUvmDNanGGQlJ+/edJiEqrBs5MObPzwIzstsbfHCJnwH2
 LyJzNkXBqDsrLUAVsMxCvcjXL/Z+CklZJcVCBMqqdw2umJiT0ZPdE8rlPfnIqAEwDJ
 +Ih3A4Hs9COmQ==
Date: Tue, 1 Nov 2022 19:27:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2HVgnwAPdTIaZR6@sol.localdomain>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101190031.6766-2-stefanha@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ebiggers@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 01, 2022 at 03:00:30PM -0400, Stefan Hajnoczi wrote:
> Linux dm-crypt returns errno EIO from unaligned O_DIRECT pread(2) calls.

Citation needed.  For direct I/O to block devices, the kernel's block layer
checks the alignment before the I/O is actually submitted to the underlying
block device.  See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/fops.c?h=v6.1-rc3#n306

> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290

That "bug" seems to be based on a misunderstanding of the kernel source code,
and not any actual testing.

I just tested it, and the error code is EINVAL.

- Eric

