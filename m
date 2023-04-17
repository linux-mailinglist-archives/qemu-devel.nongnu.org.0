Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E225E6E4E4A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:27:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRgu-0005WU-LI; Mon, 17 Apr 2023 12:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1poRgs-0005W5-08; Mon, 17 Apr 2023 12:26:54 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1poRgq-0006zX-EV; Mon, 17 Apr 2023 12:26:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A76AF61C4A;
 Mon, 17 Apr 2023 16:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45099C433D2;
 Mon, 17 Apr 2023 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681748803;
 bh=SrbrYbhHQYIUX+oyKn8usNV+FuytzjHVUs3jOde+HCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnyArK9sAzQ548ZkW5YA2RnPHZpk0bfuPFMCFBqCZXL6hd7zrtu380O/9R3D7NV6R
 Re6Owp7wX7GsTtvQN1GUCld9VjUxHSTaaWI8aR7tBCOH1T5Ix6mFl6iYtkTUZjvOYk
 6Fi1bu3TfuCNj2Is4oMresr/lAUR7rg/ox4FjUzHnzlfIlv5vc4k1+npuer6RI/See
 f1DIWe2UUuD6BiIOKKSoUU9Zv2wa3qdx0YI9siUoaIykWpe9GAV3MfRnLaJUW2ggHA
 alU5wIpFmv9MRf98gEg49yGFqpzMMAftoaGEJRE9+5zOQJejsmpLoE+C0Bc/X7n/3X
 2ExEFTyY936aw==
Date: Tue, 18 Apr 2023 00:15:45 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Remove CBAR from A55/A76 and add A78
Message-ID: <ZD1wseM2+xjgeCjb@xhacker>
References: <20230415083657.2308-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230415083657.2308-1-jszhang@kernel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Apr 15, 2023 at 04:36:55PM +0800, Jisheng Zhang wrote:
> patch1 removes CBAR from A55 and A76
> patch2 adds A78 CPU

For various reasons, I'd like to recall these two patches.

> 
> Jisheng Zhang (2):
>   target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
>   target/arm: Add Cortex-A78 CPU
> 
>  docs/system/arm/virt.rst |  1 +
>  hw/arm/virt.c            |  1 +
>  target/arm/cpu64.c       | 71 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 71 insertions(+), 2 deletions(-)
> 
> -- 
> 2.40.0
> 
> 

