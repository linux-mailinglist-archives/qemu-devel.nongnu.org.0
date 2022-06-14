Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08CB54B4F9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 17:45:28 +0200 (CEST)
Received: from localhost ([::1]:60504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o18jP-0003Hw-Of
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 11:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o18fv-000220-Cp
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 11:41:52 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:52688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o18fk-00012P-FA
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 11:41:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6221612D3;
 Tue, 14 Jun 2022 15:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7965C3411B;
 Tue, 14 Jun 2022 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655221296;
 bh=YdoeEVuwtT79PVK06WiEaLkp0JxCI7a/od4Ukr4OBBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kjPap0Dj33WxEBR/Gnqdg4335OIcZ3J9zPsiVkApbyp62ZdZNkKZ+X3mCgssl3MeR
 gv9j31ivziPJ9+4ZCdv9GkFTcQW9A9wmSI49O7qiLdA6VGcPfxGAo0qbwnh3hC6DRC
 Yt0HLXSMQsu+7GVJr74mIy7wdVrJiMOO9ItmNtcjmgBa/MafM1JhglwskOpc+tXIvP
 hUMs9ET0oc0kxsHqEiC/UZfOkdYAWl659CcdQPXytaSvS5+FDr74JglTkg0lxY6prF
 Ql38c3Y5HsLjE+gF08sTXmoSkrw0zp+rs/MGoU9W1VNnNA5I2Nlfyeu1uhjY5VM/oF
 9q0XmkDhlK0HQ==
Date: Tue, 14 Jun 2022 08:41:31 -0700
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Klaus Jensen <its@irrelevant.dk>, John Levon <levon@movementarian.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 14, 2022 at 03:24:37PM +0800, Jinhao Fan wrote:
> > On Jun 14, 2022, at 5:15 AM, Keith Busch <kbusch@kernel.org> wrote:
> > @@ -6538,9 +6544,25 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
> > 
> >         trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
> > 
> > -        if (!sq->db_addr) {
> >         sq->tail = new_tail;
> > +        if (sq->db_addr) {
> > +            /*
> > +             * The spec states "the host shall also update the controller's
> > +             * corresponding doorbell property to match the value of that entry
> > +             * in the Shadow Doorbell buffer."
> > +             *
> > +             * Since this context is currently a VM trap, we can safely enforce
> > +             * the requirement from the device side in case the host is
> > +             * misbehaving.
> > +             *
> > +             * Note, we shouldn't have to do this, but various drivers
> > +             * including ones that run on Linux, are not updating Admin Queues,
> > +             * so we can't trust reading it for an appropriate sq tail.
> > +             */
> > +            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
> > +                    sizeof(sq->tail));
> >         }
> > +
> >         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
> >     }
> > }
> > --
> 
> Thanks Keith,
> 
> This is an interesting hack. I wonder how should I incorporate your changes in my patch. I guess I can modify the code in PATCH 1/2 and add a “Proposed-by” tag. Is this the correct way?

It's a pretty nasty hack, and definitely not in compliance with the spec: the
db_addr is supposed to be read-only from the device side, though I do think
it's safe for this environment. Unless Klaus or anyone finds something I'm
missing, I feel this is an acceptable compromise to address this odd
discrepency.

I believe the recommended tag for something like this is "Suggested-by:", but
no need to credit me. Just fold it into your first patch and send a v2.

By the way, I noticed that the patch never updates the cq's ei_addr value. Is
that on purpose?

