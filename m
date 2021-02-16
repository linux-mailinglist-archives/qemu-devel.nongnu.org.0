Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820931D2FA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:14:30 +0100 (CET)
Received: from localhost ([::1]:37102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9Y5-0002R4-4X
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9Wa-0001Up-1o; Tue, 16 Feb 2021 18:12:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:42860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9WY-0007zu-JQ; Tue, 16 Feb 2021 18:12:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33F4B64E65;
 Tue, 16 Feb 2021 23:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613517172;
 bh=6vszfPwSTPLe6fZWJyRcKW5tmTaglLlugRZYx29HX4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kFeCvYPA6uQ6bbs2QREiciXbs5/uwZ/YWKTOhQNqX0UOvXShXOn4xbjrN8eyOUwkT
 hEkHm49BExGJtwOOFFkt8iYoILcfB5hll4hXfDGUAg/na0uD4eWLgi5kkMsl41/oD9
 vrB9POFMwTsp8jpDx/ruFWuqdeD+EoprPW6SOKKPDQlgb1YGs8okuC9mJxwN5Qpaew
 4qYa1b3fZJytWk54tfSWdO+fFgkFqFDmiTrpg6Rbdn0A79Aiqe//+SIG0BVlDtihiB
 CrPcZHNCwXq7IbkOaLbEdS8LxhHeETXQICNWjK3NkKrWPafgEJIPXvpRhLAzNOMF4m
 D3J2+C4AvFbXg==
Date: Tue, 16 Feb 2021 15:12:50 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v3 11/12] hw/block/nvme: support multiple lba formats
Message-ID: <20210216231250.GF2708768@dhcp-10-100-145-180.wdc.com>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-12-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214230240.301275-12-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 12:02:39AM +0100, Klaus Jensen wrote:
> From: Minwoo Im <minwoo.im@samsung.com>
> 
> This patch introduces multiple LBA formats supported with the typical
> logical block sizes of 512 bytes and 4096 bytes as well as metadata
> sizes of 0, 8, 16 and 64 bytes. The format will be chosed based on the
> lbads and ms parameters of the nvme-ns device.

This is much less useful without support for Format NVM command.

