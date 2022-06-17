Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401BE54FE73
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 22:36:52 +0200 (CEST)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Ii2-0000Qn-TA
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 16:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o2Igs-00085G-70
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 16:35:38 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:59512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o2Igq-0002dJ-Fa
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 16:35:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45EF3B82BC5;
 Fri, 17 Jun 2022 20:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE3AC3411B;
 Fri, 17 Jun 2022 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655498126;
 bh=aM53J75b+KGfripkwDRSXOKl2ZN0VCNUUj/PaNw/8vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d6k1Fv6TiQ/NDU1iM9wSZh6WAvyH5fp/qhd7VIu2fQ1SEVBFHIIlVkWh1g3YJlr3I
 7fi90ViqRlsw45V3qnV/zwvPAIqBjO7tS0om7yGhdCc5V/u88v3KrJyx80PAsNqPG9
 ekS4RGOSJfMnPqWz/vP6XH73ALubL7J45ASae9sviFodMls+45q0WWJRgGwE5tltC8
 LfZQoASEBdx1cTvDZmwCjbWfe2fpnf1Z1kTaagDbgN2J6Yf/ROm6Aqko4Ms69uIhwE
 bfmYp7XJAqMTNnEcsiaZFlm8C3eckUAwGbX2p/NmoJODh8HHYuZITMijEHRRGmk0fl
 u2pj1/2FymjBw==
Date: Fri, 17 Jun 2022 14:35:22 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk
Subject: Re: [PATCH v3 0/2] hw/nvme: Add shadow doorbell buffer support
Message-ID: <YqzlijslTlqIDsSp@kbusch-mbp.dhcp.thefacebook.com>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 08:34:06PM +0800, Jinhao Fan wrote:
> This patch adds shadow doorbell buffer support in NVMe 1.3 to QEMU
> NVMe. The Doorbell Buffer Config admin command is implemented for the
> guest to enable shadow doobell buffer. When this feature is enabled, each
> SQ/CQ is associated with two buffers, i.e., Shadow Doorbell buffer and
> EventIdx buffer. According to the Spec, each queue's doorbell register
> is only updated when the Shadow Doorbell buffer value changes from being
> less than or equal to the value of the corresponding EventIdx buffer
> entry to being greater than that value. Therefore, the number of MMIO's
> on the doorbell registers is greatly reduced.

Looks good to me, and passes my sanity tests.

Reviewed-by: Keith Busch <kbusch@kernel.org>

