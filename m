Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CF545132
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:48:45 +0200 (CEST)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKOq-0001lU-HK
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1nzJAO-000849-Ps
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:29:44 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:44238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1nzJAM-00059w-VZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:29:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2DA78B82E00;
 Thu,  9 Jun 2022 14:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84619C34114;
 Thu,  9 Jun 2022 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654784972;
 bh=5JicH6X8xz0dJKg4FV5zcGgBeL4vm0Jf2JCoWb/pyVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwhi933zfIa/lWUFHm3sLszUpVGWSCgf/cQXry5quUFoo1Cq0drKhDpRlUQKrMSBa
 KSf1rBy2Qx752xS3P475S8L8KVMMaJmd30uHzXoT3EvIl0BbeKj4jDY6ITmxzQMzLa
 PrFklHCM9azymdIi3bnaxoVZ8iZC3gvRcRCRw+6govvWThMME0CcYsL1G1N/xo4iG7
 cXsLhFmy3qqX1sEGBf+kTMx/irn9wVXgGkYtY+wx767oJM/vJvwlBUb5lG7bKMVJxt
 hjw+A8qtY80ZfAwBZuYWKHgYqknpepmKnLMCtaUdNM/w3itlLVNcs6InvJnISOIgs0
 mYTSnsJxl0JQQ==
Date: Thu, 9 Jun 2022 08:29:30 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqEMwsclktptJvQI@apples>
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

On Wed, Jun 08, 2022 at 10:55:30PM +0200, Klaus Jensen wrote:
> 
> Keith, is this a bug in the kernel? If the code here would expect the
> doorbell buffer to be updated for the admin queue as well, would we
> break?

The admin queue has to be created before db buffer can be set up, so we can't
rely on it. And this is a performance feature. Admin commands have never been
considered performant, so we decided not to consider it though the spec allows
it.

