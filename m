Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD482FC0EE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:26:47 +0100 (CET)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xaP-0005r8-UB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l1web-0001bk-4Y; Tue, 19 Jan 2021 14:27:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:44802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l1weY-0000AH-IQ; Tue, 19 Jan 2021 14:27:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1EF123103;
 Tue, 19 Jan 2021 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611084416;
 bh=ZuSADCf4dtuHwQ3o0MsHgy5SpouD0spmmLI1tAcisSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BWHP/gIsOdyvRSCngpsZFTEG0/cnJMt905C196/qoNOxXApjga1qwPkfCnA0W18Te
 Bmj9dZhb97ZDZ/7WC5U9bbS23clFMyhvTlKyQULgO5aNZjyaRZF9ccgfq3/dAfLTIH
 Zo4pOKiGokUeQHQ9aljnEzHuE0foX+QM1BakDi7PsQWg30sMdXywXXhIA2NurAW72e
 S0hxDh0buo1H3t1+fPf2FSgu7m2uljBUecxNZdXvshhcf1V5zQ50hmGWtiLfKgkTEm
 sibpzboscRubIKkPZhl4eBEU0HimJ52mUgvdtAcULHGBWP/vgZ3K30tAzl6Tkxwcox
 ly+uChLHV//2g==
Date: Tue, 19 Jan 2021 11:26:53 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH V3 0/8] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210119192653.GA1520753@dhcp-10-100-145-180.wdc.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <YAciaPBu9TuGjifu@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAciaPBu9TuGjifu@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 07:18:16PM +0100, Klaus Jensen wrote:
> On Jan 20 02:01, Minwoo Im wrote:
> > Run with:
> >   -device nvme,serial=qux,id=nvme3
> >   -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3
> > 
> >   -device nvme-subsys,id=subsys0
> >   -device nvme,serial=foo,id=nvme0,subsys=subsys0
> >   -device nvme,serial=bar,id=nvme1,subsys=subsys0
> >   -device nvme,serial=baz,id=nvme2,subsys=subsys0
> >   -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0,detached=true
> >   -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2
> > 
> > nvme-cli:
> >   root@vm:~/work# nvme list -v                                                                                                      
> >   NVM Express Subsystems                                                                                                 
> >                                                                                                                                      
> >   Subsystem        Subsystem-NQN                                                                                    Controllers
> >   ---------------- ------------------------------------------------------------------------------------------------ ----------------
> >   nvme-subsys0     nqn.2019-08.org.qemu:qux                                                                         nvme0
> >   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme1, nvme2, nvme3
> >                                                                                                                                    
> >   NVM Express Controllers                                                                                           
> >                                                                                                                   
> >   Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
> >   -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
> >   nvme0    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys0
> 
> Shouldn't nvme0n1 be listed under Namespaces for nvme0?

Minwoo, try pulling the most current nvme-cli. There was a sysfs
scanning bug for non-mpath drives that should be fixed now.

