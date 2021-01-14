Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27EB2F6F06
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 00:40:50 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0CET-0007W0-Cd
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 18:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0CDG-000764-53; Thu, 14 Jan 2021 18:39:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:34958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0CDE-0006NX-Hh; Thu, 14 Jan 2021 18:39:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32F6F23A24;
 Thu, 14 Jan 2021 23:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610667570;
 bh=fmE+p37I1kd9aOvjBiO+b62FRKdZE8p9QHvEG6fJqMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RnjjrAlnyLcMeRJAJ4xbSUf5jRafDfDhZSqNzSK8b77tRK1njOO+eRwp6OGcoiWaT
 xMTWKvvC0Ao1RqV4BTx+cNoe9xbvKyGWw/VfQPFnNWViIprXhbSBoERPuXG/i4kG7t
 Ek6hiypFRTY9IjPltl1ZDpdOeBFIq/br1fnSCuy2/5B8Ff3Py5f6H0FoYmubRD6E1C
 g1hdLoR3aWUQpLZctNzU8/plGExLLuxM17FkT7++UoixUhUb/u7WEwAr4IoHbbzSZY
 BRT771S6GpnkvKbJBh2Ex+LKswy/cmQNtxjfFx+bNXUcWXBuEiu168hGThyEQZsFJA
 NP7PY5iG38nzw==
Date: Thu, 14 Jan 2021 15:39:28 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: conditionally enable DULBE for zoned
 namespaces
Message-ID: <20210114233928.GF1511902@dhcp-10-100-145-180.wdc.com>
References: <20210111180952.112488-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111180952.112488-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 07:09:52PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
> status of logical blocks. Since the zoned namespaces command set
> specification defines that logical blocks SHALL be marked as deallocated
> when the zone is in the Empty or Offline states, DULBE can only be
> supported if the zone size is a multiple of the calculated deallocation
> granularity (reported in NPDG) which depends on the underlying block
> device cluster size (if applicable) or the configured
> discard_granularity.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

