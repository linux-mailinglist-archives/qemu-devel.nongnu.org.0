Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5025EFBA6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:09:36 +0200 (CEST)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odx2V-00038K-Gu
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1odw6n-0007Hp-My; Thu, 29 Sep 2022 12:09:57 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:56012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1odw6k-0007FD-Pj; Thu, 29 Sep 2022 12:09:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3127611E9;
 Thu, 29 Sep 2022 16:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865D1C433C1;
 Thu, 29 Sep 2022 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664467790;
 bh=1W8N06g1sJc8oERjGJ+OejBiZLDcu4E1NN+VyVeKeY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmXOV2UBxBDsuxyIW0Ub3xeI8siQwCFNtRcF1LKCZL7rZ0yyVgXRQCKzV/73V2ieF
 s8LfhD/Q7kMYSDCzrOWyR5VBJC/UQennZlwJWqM815khsgj2RkcM8a8x0N1Adefxh6
 LYbxl7t8hmAZzIp6bNTckoIY9VuHlk3UmnQVyK2/G020ADoT4IcUylilkaAQSX1XOR
 Aw5ARQ0KFveJVcbB0JWwFHojFwRM8NHBhCJP3Zj5id3BYcTxuPi57I6CKEBpLBHFHp
 Zai7tNh+wzXiWHlKVgDVmxoBJUe8rx3kZyiii8XgMcJcNMWg2VUaZdDkwxLgOK/DQP
 cyEEp/nveu1tg==
Date: Thu, 29 Sep 2022 10:09:46 -0600
From: Keith Busch <kbusch@kernel.org>
To: Keith Busch <kbusch@fb.com>
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCHv2] block: use the request length for iov alignment
Message-ID: <YzXDSlksuOucjZm3@kbusch-mbp.dhcp.thefacebook.com>
References: <20220923153451.3810456-1-kbusch@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923153451.3810456-1-kbusch@fb.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 08:34:51AM -0700, Keith Busch wrote:
> 
> An iov length needs to be aligned to the logical block size, which may
> be larger than the memory alignment. And since this is only used with
> file-posix backing storage, move the alignment function to there, where
> the value of the request_alignment is known to be the file's logical
> block size.

Any objections to this version? This is fixing real bug reports that may become
more frequent without this patch.

