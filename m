Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E060249D0B4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:29:32 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCm6t-0006LD-G6
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nClnI-0002Nu-6o; Wed, 26 Jan 2022 12:09:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nClnG-0000rq-G8; Wed, 26 Jan 2022 12:09:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 004B8B81CBA;
 Wed, 26 Jan 2022 17:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C71C340E3;
 Wed, 26 Jan 2022 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643216949;
 bh=wGmhNc8AFy6d1LsvdUtOtjUjWMYlTJXfX+j6voq1cD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=idvHeoW7NYrwDKbRw3eE6eZUFDZJmRnerE36K+iWyEvRyRsW6FRzlANQ1THu9EJgn
 XngMzCUX/sBts27e0Y4d6enmMzIZlyxoQvGRF5jpsPzAeX8chb6f/oGQ5w6KejxoLE
 nWZgQDijRxNQVYxpJgt+t8kHsoG4XJhhDuztnratoqo0xPdVeqqd04jPPXqblA2YE2
 50VKgsPF0Xwahn+toeqf34cVcmaEarR0ZhtIg0APQqyfE5MlSRuGshBiLOk5s9K5dK
 Ps75q7BFvOrDcKGXvaQdIzJ2xMUtaHpMMxtLF90flXwhL+SOFT6+qiIm1E+G1TJeuv
 ChbQlD8RiFXbw==
Date: Wed, 26 Jan 2022 09:09:07 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-7.0 4/4] hw/nvme: add support for zoned random write
 area
Message-ID: <20220126170907.GD1885300@dhcp-10-100-145-180.wdc.com>
References: <20211125073735.248403-1-its@irrelevant.dk>
 <20211125073735.248403-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125073735.248403-5-its@irrelevant.dk>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 08:37:35AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add support for TP 4076 ("Zoned Random Write Area"), v2021.08.23
> ("Ratified").
> 
> This adds three new namespace parameters: "zoned.numzrwa" (number of
> zrwa resources, i.e. number of zones that can have a zrwa),
> "zoned.zrwas" (zrwa size in LBAs), "zoned.zrwafg" (granularity in LBAs
> for flushes).
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Looks good, and will just need a minor update if you choose to take the
feedback from patch 2 onboard.

Reviewed-by: Keith Busch <kbusch@kernel.org>

