Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3235815AB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:48:57 +0200 (CEST)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLrk-0006d0-G9
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oGLou-0003cQ-Kh
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:46:00 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oGLos-0007Yl-3L
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:46:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43AFF6017B;
 Tue, 26 Jul 2022 14:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B93C433C1;
 Tue, 26 Jul 2022 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658846749;
 bh=klK+iNINk+tDrXyvdf/CMn/ZtqVNO5m392OUIrw0HEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZcqLKemUEl0d8sQZbdQiDEdvafrV+QqlJxsNJcYwsX0wF3qC16wA3DOuwun4bx8k/
 KmzRE3KpLd61rA5I6NhFzD26GinpknJ9y6cpUp+c22dO1Aqslt5OrCSAjCrHfp5v24
 clL87vjzRBc0GrKJI+1XEviRBHxBzsOxh7AhJTdu/5Wx0vf66TaKVVcRewMRu2Ls6o
 6ifChrCT0ANTS370BNinzYrrChZGVoGekdDmJZbTv7HV9QgXOTtB3GP/TfY48XKz8x
 8ewfW5T9pqREUA1/VbJcSdbMhI1biOiAUcFrrfjBxDpCeHkNiutvpv7UPfUsRL/vRB
 +VVngWkXEnmNQ==
Date: Tue, 26 Jul 2022 08:45:45 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, its@irrelevant.dk
Subject: Re: [PATCH] hw/nvme: Add iothread support
Message-ID: <Yt/+GfYPyeM4gFdq@kbusch-mbp.dhcp.thefacebook.com>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
 <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
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

On Tue, Jul 26, 2022 at 04:55:54PM +0800, Jinhao Fan wrote:
> 
> Hi Klaus and Keith,
> 
> I just added support for interrupt masking. How can I test interrupt
> masking?

Are you asking about MSI masking? I don't think any drivers are using the
feature, so you'd need to modify one to test it. I can give you some pointers
if you are asking about MSI.

