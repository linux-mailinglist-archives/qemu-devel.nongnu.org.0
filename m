Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453602DE8CE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:09:56 +0100 (CET)
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqKCR-0001iH-BN
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kqKAw-0000Se-Fj; Fri, 18 Dec 2020 13:08:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:47876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kqKAp-000435-0q; Fri, 18 Dec 2020 13:08:22 -0500
Date: Sat, 19 Dec 2020 03:08:06 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608314893;
 bh=O2iGqq6oWUn6ZDwY91E7syVANdtgCAP9dCyTv5ArsXU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=j44I7zWRX1C7yZ1qEt6Je5Hjo5qRET4soQEKzsh0Vyv3m2x+4Ju6zFQ3Y8jDwPoHI
 MbRgbCaM2QHO63ENKB1CJbGKP3fHB0XShb0kqScMF2R7qgBqVMlxZaZW9TGNb1z5UY
 yOdunTiGgUqWKwW6ibJ/acPw+DoRF4/GTy/NbW0+3jYwO0Q5dJ968XzoWr46QUx5CM
 lA7rV5lG2DfklUtI0chKC9UnEypM9fRiGzD/339vq2FBc5sDLBtgXTIU5Rd2oBlcjB
 l+fOQTldkyl6w0pImhoIyutkhb3VD0uacPUNfSrT6K4Gt1YcfN2jpU1PzGaJbjpZwT
 erqgST1U1lE+Q==
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 3/3] hw/block/nvme: end-to-end data protection
Message-ID: <20201218180806.GC8722@redsun51.ssa.fujisawa.hgst.com>
References: <20201217210222.779619-1-its@irrelevant.dk>
 <20201217210222.779619-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217210222.779619-4-its@irrelevant.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 10:02:22PM +0100, Klaus Jensen wrote:
>  static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
>      NvmeNamespace *ns = req->ns;
>      uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
>      uint64_t slba = le64_to_cpu(rw->slba);
> +    uint16_t ctrl = le16_to_cpu(rw->control);
>  
>      uint64_t data_size = nvme_l2b(ns, nlb);
> +    uint64_t real_data_size = data_size;
>      uint64_t data_offset = nvme_l2b(ns, slba);
>      enum BlockAcctType acct = req->cmd.opcode == NVME_CMD_WRITE ?
>          BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;

Since this is right in the middle of the nvme read/write path, and we
have the outstanding ZNS stuff intermixed here, could we possibly
converge on the ZNS solution first, and rebase new IO path capabilities
on a ZNS enabled tree?

