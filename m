Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341AC618562
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:55:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdTx-0000tI-Lv; Thu, 03 Nov 2022 12:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oqdTs-0000rT-Hz; Thu, 03 Nov 2022 12:54:16 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1oqdTq-0005uM-Rr; Thu, 03 Nov 2022 12:54:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10693B82924;
 Thu,  3 Nov 2022 16:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A481EC433C1;
 Thu,  3 Nov 2022 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667494450;
 bh=mlTVTxlNh5GfqJdIWBW0jvHVOnm7/Skx5oTGnszZIfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtA/kbU811R0W9wISi89LWIOV9gsciZdWnXs3lTIMtBEEGZPXjBRVEYN3kC/IIf6u
 61yV5XZF/FZr+92yyLZakRGam2STi25Phs5gHZZtfggYG0SUD9I2tlFOGivKfnQZVl
 2heCADk9ZZlF1pPK70RMuZAzTGxHBsDHygQgRVBS0VfHuSoHCUQ0qLW2NEOcBYzcat
 JcJR0mffvL86KfBbK82cbmQci7lrolmonwfQWxCsgR8LGg8hrH3Gmoc0S9HeP8tVJ9
 axCHfPRunQ+zJ8x7XCW6qk7OMFc4KFhH3i151WhzhV/jqIzwbNiSA2E1uJSQr8hGxF
 1MiYqT1s6h8Jg==
Date: Thu, 3 Nov 2022 16:54:09 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 hreitz@redhat.com, qemu-block@nongnu.org, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2PyMb4UluN6+ONg@gmail.com>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
 <Y2HVgnwAPdTIaZR6@sol.localdomain>
 <Y2HasGvN6qMFq29A@sol.localdomain> <Y2OPaxoX7UanUzTd@redhat.com>
 <Y2PrpOCjKsZ+rywG@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2PrpOCjKsZ+rywG@gmail.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ebiggers@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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

On Thu, Nov 03, 2022 at 04:26:14PM +0000, Eric Biggers wrote:
> > In other words, STATX_DIOALIGN is unusable from the start because we
> > don't know whether the information it returns is actually correct? :-/
> 
> That's a silly point of view.  STATX_DIOALIGN has only been in a released kernel
> for a few weeks (v6.0), the bug is only in one edge case, and it will get fixed
> quickly and backported to v6.0.y where users of 6.0 will get it.

Actually, scratch that.  STATX_DIOALIGN is in 6.1, not 6.0.  So it hasn't even
been released yet.  Upstream is currently on v6.1-rc3.

So thank you for reporting (or for not reporting?) this.  We'll make sure it
gets fixed before release :-)

- Eric

