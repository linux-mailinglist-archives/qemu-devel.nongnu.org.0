Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593B3220FD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:56:28 +0100 (CET)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEIFm-0003e9-Ms
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lEIEf-0002wP-L0; Mon, 22 Feb 2021 15:55:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:45112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lEIEe-0001v1-1E; Mon, 22 Feb 2021 15:55:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4927264E12;
 Mon, 22 Feb 2021 20:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614027313;
 bh=Q22QTKJY3j6dpomAvJCYmWdBRAkp25pfZkdSQwfU/CU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gaRahgLQvT5akjwOeFd5990qb+zQ+d2Wp86kloRn44r1i4WbB7v0kVPmNccibglwe
 +Qd5eRc4C2eCal3mqvZVjDCEyn1xhZ+2muoK6HF3g47f57X4a2Rgm+9NlDbs9/tOyc
 AckMvPhVNCpkMJDzItelH2qckUohJQw397LQ4A8DsMB9xSHvlOHtjuj3M04XagXTje
 o0/YwM3jLV+lgI3j2iICiAZE3u8GgeV1bmJVzpGUy9pNKANrXY8wEOWzuL0NAVxtmP
 om03TgmxWxZv9klijscaSI3+Sv0f+jckyUU+z2GL54r0/acUr1Y5RjEs52mU9P9EOg
 H4wd4Aj0L73/A==
Date: Tue, 23 Feb 2021 05:55:06 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 5/5] hw/block/nvme: report non-mdts command size limit
 for dsm
Message-ID: <20210222205506.GB16253@redsun51.ssa.fujisawa.hgst.com>
References: <20210222184759.65041-1-its@irrelevant.dk>
 <20210222184759.65041-6-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222184759.65041-6-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 07:47:59PM +0100, Klaus Jensen wrote:
> +typedef struct NvmeIdCtrlNvm {
> +    uint8_t     vsl;
> +    uint8_t     wzsl;
> +    uint8_t     wusl;
> +    uint8_t     dmrl;
> +    uint32_t    dmrsl;
> +    uint64_t    dmsl;
> +    uint8_t     rsvd16[4080];
> +} NvmeIdCtrlNvm;

TP 4040a still displays these fields with preceding '...' indicating
something comes before this. Is that just left-over from the integration
for TBD offsets, or is there something that still hasn't been accounted
for?

