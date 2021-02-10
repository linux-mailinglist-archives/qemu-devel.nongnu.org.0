Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1950315DCC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 04:34:12 +0100 (CET)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9gGZ-0004Sn-8L
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 22:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l9gFV-0003xt-EU; Tue, 09 Feb 2021 22:33:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:58368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l9gFT-0005An-Rj; Tue, 09 Feb 2021 22:33:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0789364DDF;
 Wed, 10 Feb 2021 03:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612927981;
 bh=2s6VKeq65OLhJ+P6lnTQwXLZiJO5XxQZ4y2Rk6Rs7Cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rxe3PlDbUV7Tduqfdiw9FdJIDz2E+qc7lEAIcXcvt5nJ0XkuET0UcY+OeM1A0Ll64
 5xKfFBajctWZTertSC3+pHf6K6ixSbvrxw816Dy7K1VMnFz97Q/lvdXrIyg6dJbyNF
 4ruxvQiQvGAivlutPIyKeQZqSiIRD8JI3+uJJITHpFccYhu+Md1yPoR8gvai6pS1DO
 34wd5h6NzI9iGzqeTl0mc6xPiObtv8DfkBedTSndB1RObFM9Qt0C6pePvOx0eM8ibu
 BMI9bhUgQC74qfIusi1HeOwdlEUtiOI81B9u7c6YNgfTkccssX07bFluA2TzJA6tvP
 8G5c4Kdiuibwg==
Date: Wed, 10 Feb 2021 12:32:54 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <20210210033254.GC17042@redsun51.ssa.fujisawa.hgst.com>
References: <20210125204231.254925-1-its@irrelevant.dk>
 <20210208185907.GA17042@redsun51.ssa.fujisawa.hgst.com>
 <YCGMIcjRlw3auFNc@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCGMIcjRlw3auFNc@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 08:08:17PM +0100, Klaus Jensen wrote:
> On Feb  9 03:59, Keith Busch wrote:
> > This whole implementation would be much simpler with the synchronous
> > blk_flush() routine instead of the AIO equivalent. This is not really a
> > performant feature, so I don't think it's critical to get these
> > operations happening in parallel. What do you think?
> 
> It would definitely be simpler, but I believe that if there is a lot to
> flush, then we won't just block the nvme device. We are holding the Big
> QEMU Lock and will block most other devices as well.

Hm, I feel like you may have told me this same explanation for a
different patch. :) Okay, I'm convinced: this is the way.

