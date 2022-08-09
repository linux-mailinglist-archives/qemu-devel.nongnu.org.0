Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3786858DCDC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:11:31 +0200 (CEST)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSlO-0004cp-4U
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oLSbi-0003GT-Ev
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:01:30 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:49322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1oLSbg-0001LU-Gt
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:01:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E725F60CF2;
 Tue,  9 Aug 2022 17:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB26C433D6;
 Tue,  9 Aug 2022 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660064486;
 bh=hmekJ6jOiCrvqoA3jDufJ+FL+2Fkx7bdvAIh85HjxQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQBq5AN2z05A1AuIbGDykcFYIcvv5QYhJ5rLgd912VAfNKc9d8eyeGbjG2ltq4VYH
 De68r9a0TrxawAeHKbxzBgnxsUt6+d4xLJZXMbJs5k4MB/2gci7jKYiGzjqpikcmLe
 54h9NAt1xQciHo1rO+g69xuBANWYGtk/Vr5yDH+e+WISCErJWo+go6Dy/oKQcBrFpX
 Dz/xfNPugMVtmCKNNGPrHjmFgCq9nXuhCMcqRvT6obMxzaSxsZBatbE0inYeQkEof8
 fRBe4gav6ZBhI/vMZn+6vT1mQdLTNjFgkmmkPKAy3KJKxqFzUaiAax4zXzZQtxDgLH
 xpBCu+WPs2eKQ==
Date: Tue, 9 Aug 2022 11:01:21 -0600
From: Keith Busch <kbusch@kernel.org>
To: =?utf-8?B?5qiK6YeR5piK?= <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, its@irrelevant.dk
Subject: Re: Re: [RFC] hw/nvme: Use irqfd to send interrupts
Message-ID: <YvKS4ZK0MHANvPCE@kbusch-mbp.dhcp.thefacebook.com>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <851FC42E-DA19-4142-9AA6-39E2E384F618@ict.ac.cn>
 <YvKJk2dYiwomexFv@kbusch-mbp.dhcp.thefacebook.com>
 <1ec3f715.4ac4f.18283825663.Coremail.fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ec3f715.4ac4f.18283825663.Coremail.fanjinhao21s@ict.ac.cn>
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

On Wed, Aug 10, 2022 at 12:48:53AM +0800, 樊金昊 wrote:
>> The driver will create the cq with an allocated vector, but it's not activated
>> until after the driver wires it up to a handler. I think that's what you're
>> observing with the incomplete MSIx table entry on creation.
> 
> Also, I'm wondering if this is inconsistent with the NVMe spec. In Section 7.6.1
> of the 1.4 spec, it says "After determining the number of I/O Queues, the MSI
> and/or MSI-X registers should be configured;" in Step 8, and CQ creation happens
> in Step 9. Now the driver changes MSI-X registers after CQ creation, is it a
> violation of the spec?

I don't think it's a problem. This is really a more "informative" section of
the spec and doesn't specify any hard requirements. You should be able to rely
on the entry's data being stable after the first queue doorbell ring, though.

