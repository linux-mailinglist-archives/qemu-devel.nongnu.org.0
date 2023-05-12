Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3AF7010C1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:14:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxa4f-0005Pf-Cx; Fri, 12 May 2023 17:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pxa4d-0005O0-2Z; Fri, 12 May 2023 17:13:11 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pxa4b-0007Sn-9G; Fri, 12 May 2023 17:13:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2367863658;
 Fri, 12 May 2023 21:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B580C433D2;
 Fri, 12 May 2023 21:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683925985;
 bh=Sj34y1UnMe+RdJ+d2LBaBf2d2ip7dGtT1ZKiNppIFOQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=n56X88njBufIX+d33OvAnz9LtQYd8cDaGAHCoscM3uoEmY1Ndn53CKeW8g6nt+DJP
 DgvdodSZw9Paasj2pow+TxQ05txCX5hhy9rVNs2usgOfrhe+mRBy/nw9hW53UVM+m6
 zLPgBAKe3vbivnJT5dC2ebwE7bJpSqd7qAQyjYQi5lxQp6n+bAQJEJ4SfTsvWIMisw
 pZlz8c9VVw4uZRrOUX07QFB2fcmtPiH4HScrQdB50jcwG52YAILNoxGq5IshiV6kiA
 gOKmwOGSzMhQk/8XtU4QYaODo9gcHCMgqw+6FxJGjsOYyEv1oYGjch1FJPHVomjI42
 WWqdXucwQYsaw==
Date: Fri, 12 May 2023 14:12:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <20230510094719.26fb79e5.olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305121411310.3748626@ubuntu-linux-20-04-desktop>
References: <20210317070046.17860-1-olaf@aepfle.de>
 <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de>
 <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
 <20230509225818.GA16290@aepfle.de>
 <20230510094719.26fb79e5.olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 10 May 2023, Olaf Hering wrote:
> Wed, 10 May 2023 00:58:27 +0200 Olaf Hering <olaf@aepfle.de>:
> 
> > In my debugging (with v8.0.0) it turned out the three pci_set_word
> > causes the domU to hang. In fact, it is just the last one:
> > 
> >    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
> > 
> > It changes the value from 0xc121 to 0x1.
> 
> If I disable just "pci_set_word(pci_conf + PCI_COMMAND, 0x0000);" it works as well.
> It changes the value from 0x5 to 0.
> 
> In general I feel it is wrong to fiddle with PCI from the host side.
> This is most likely not the intention of the Xen unplug protocol.
> I'm sure the guest does not expect such changes under the hood.
> It happens to work by luck with pvops kernels because their PCI discovery
> is done after the unplug.
> 
> So, what do we do here to get this off the table?

I don't have a concrete suggestion because I don't understand the root
cause of the issue. Looking back at Paolo's reply from 2021

https://marc.info/?l=xen-devel&m=161669099305992&w=2

I think he was right. We can either fix the root cause of the issue or
avoid calling qdev_reset_all on unplug. I am OK with either one.

