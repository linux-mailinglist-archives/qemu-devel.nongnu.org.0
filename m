Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A1567709
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:59:35 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nlm-0003A6-5t
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o8nWt-0004W9-Sv
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:44:15 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:48876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o8nWq-0004nY-Px
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:44:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7835B818BF;
 Tue,  5 Jul 2022 18:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0DFC341C7;
 Tue,  5 Jul 2022 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657046641;
 bh=rwHyWGkpNx/pQ5EaEY0BY33dbyyEnOQI6AwyJR21ud4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JfgoFNdn/feVl3MDuI15S+tI0M3YNhv/E9k9r2gi+Oc3NZfcLqAUcqdZFuaX8mRhC
 MRe7OfHZE686wKfzlaWU13RfAo3a9uGMZbkq6pKGjpdtNZGiioX9P3dE2LdpvVwy2y
 Qn5VzKzTkxE5lGQ+wPq9L+AGXKUVhK132Pd/QkqBNnKDHzzvq3ixsPqZS12QRe/hC1
 kZqh2a+jwXvwym05bq1B/CmQTzzlLK5Wzo1q14pkQIJVSUJXVjZ2IC0wtqN2duLjm1
 vrahjIWa9ds4H3xU3Nza4BwV5jrtq+8bS81wJhiPauktdHH3pa4/H9O+LDkpKvLMp1
 JJQLGlUrfF+Sw==
Date: Tue, 5 Jul 2022 12:43:58 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <YsSGbhJQXp9fiCZK@kbusch-mbp.dhcp.thefacebook.com>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <YsRwyMONg0+mHVsL@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsRwyMONg0+mHVsL@apples>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
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

On Tue, Jul 05, 2022 at 07:11:36PM +0200, Klaus Jensen wrote:
> On Jul  5 22:24, Jinhao Fan wrote:
> > @@ -1374,7 +1374,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
> >  
> >      QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
> >      QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
> > -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
> > +
> > +    if (req->sq->ioeventfd_enabled) {
> > +        /* Post CQE directly since we are in main loop thread */
> > +        nvme_post_cqes(cq);
> > +    } else {
> > +        /* Schedule the timer to post CQE later since we are in vcpu thread */
> > +        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
> > +    }
> 
> Actually, we are only in the vcpu thread if we come here from
> nvme_process_db that in very rare circumstances may enqueue the
> completion of an AER due to an invalid doorbell write.
> 
> In general, nvme_enqueue_req_completion is only ever called from the
> main iothread. Which actually causes me to wonder why we defer this work
> in the first place. It does have the benefit that we queue up several
> completions before posting them in one go and raising the interrupt.
> But I wonder if that could be handled better.

I think the timer is used because of the cq_full condition. We need to restart
completions when it becomes not full, which requires a doorbell write. Having
everyone from the main iothread use the same timer as the doorbell handler just
ensures single threaded list access.

