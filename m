Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE828E521
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 19:12:54 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSkKa-0005GW-V1
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 13:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kSkDP-0006D2-5A; Wed, 14 Oct 2020 13:05:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:55576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kSkDL-00015P-Ur; Wed, 14 Oct 2020 13:05:26 -0400
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C4E52173E;
 Wed, 14 Oct 2020 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602695116;
 bh=AMI8/UaIQqgv1jChKmenoZyj+FSl0r0Ybz7vyn2FTIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMzruDYmY/m42XguhQqIsmBKH7LRWC8+LSq3orWNM/wzd30JU4ZOJ+jE8hcTr/nsG
 bTIaxjBggtaOzSFdnDukKghV5hrW4sTaQCetEqzaA16qv1SuDDBimwF17qL/7dX1SA
 00ATo58NJpejQ4Lsn2IN5yTlylkVd+RBlpGZ8Y4M=
Date: Wed, 14 Oct 2020 10:05:13 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: add block utilization tracking
Message-ID: <20201014170513.GB1267726@dhcp-10-100-145-180.wdl.wdc.com>
References: <20201013190846.260841-1-its@irrelevant.dk>
 <20201013210636.GA1049395@dhcp-10-100-145-180.wdl.wdc.com>
 <20201014084721.GB267924@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014084721.GB267924@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 13:05:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 14, 2020 at 10:47:21AM +0200, Klaus Jensen wrote:
> On Oct 13 14:06, Keith Busch wrote:
> 
> > If we were going to support it here, wouldn't it make more sense to
> > tie it to the filesystem's ability to support fallocate hole punch for
> > the backing namespace, and check if the range is allocated with
> > SEEK_HOLE?  Then you don't even need to track persistent state, and
> > we're actually getting the genuine capability.
> > 
> 
> Yes, this would be optimal, definitely. I think we have to rely on what
> we can do with the QEMU block layer, so please see my v2 that uses
> bdrv_block_status. I did do something like this initially, but was
> unsure if we could live with the fact that block drivers such as qcow2
> cannot honor a discard unless an entire cluster is discard/zeroed.
> 
> But see my commit message, I think we can work with it and still be in
> compliance with the spec.

Yes, I think that's better, though I'm not familiar with that particular
API. I definitely prefer implementing spec features in useful ways that
work with other layers rather than faking it.

