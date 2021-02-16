Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087131D2FE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:18:09 +0100 (CET)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9bc-0003r1-Ay
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9aB-0003Hx-M3; Tue, 16 Feb 2021 18:16:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:43284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9a9-00005D-O3; Tue, 16 Feb 2021 18:16:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3ED264E65;
 Tue, 16 Feb 2021 23:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613517395;
 bh=v9vHwCpfTOepaorRecnXZatBQ9FcPLPfQ18xMLxBpsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X928ZyFMOvhxya8PfTjz73XNrseWezlx+M2dpWbOHR6QTU8FZstNVkXB+dlg1X3+c
 xjZsaS2hQzjItIY7hs0YYMvMcMscgL63NiSH0+jyR55lpChU/rOsr3ZadOUgLugCTg
 ZCyb0cg0HeloQG5I9AfIRfdD0xpRf9P1fMwneLrEZIzjMrC+D+Gn5FPFV6+UO57Lih
 dyehelzQ/Mxt4yKhNzzB5769auubIyNjlXCGBqtWnjIDmE3hoAXX3qCgIydj6UkmXL
 104ZV17RejFGPPmrjAFO5GKJeb1FpZjvbyUyqUD+kCukQy83NaWLIHxu2CEWamsmjM
 Z2ZwoWPThlAtQ==
Date: Tue, 16 Feb 2021 15:16:32 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v3 12/12] hw/block/nvme: add support for the format
 nvm command
Message-ID: <20210216231632.GG2708768@dhcp-10-100-145-180.wdc.com>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-13-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214230240.301275-13-its@irrelevant.dk>
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

On Mon, Feb 15, 2021 at 12:02:40AM +0100, Klaus Jensen wrote:
> From: Minwoo Im <minwoo.im@samsung.com>
> 
> Format NVM admin command can make a namespace or namespaces to be
> with different LBA size and metadata size with protection information
> types.
> 
> This patch introduces Format NVM command with LBA format, Metadata, and
> Protection Information for the device. The secure erase operation things
> are yet to be added.
> 
> The parameter checks inside of this patch has been referred from
> Keith's old branch.

Oh, and here's the format command now, so my previous comment on patch
11 doesn't matter.

> +struct nvme_aio_format_ctx {
> +    NvmeRequest   *req;
> +    NvmeNamespace *ns;
> +
> +    /* number of outstanding write zeroes for this namespace */
> +    int *count;

Shouldn't this count be the NvmeRequest's opaque value?

