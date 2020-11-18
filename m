Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D22B7327
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 01:33:47 +0100 (CET)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfBPt-0006I6-Mk
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 19:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kfBOw-0005mk-0k; Tue, 17 Nov 2020 19:32:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kfBOt-0004Eb-TD; Tue, 17 Nov 2020 19:32:45 -0500
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02BFC2067D;
 Wed, 18 Nov 2020 00:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605659558;
 bh=SoHFCnZS1ie9opTHPLcFl1131acGC/lcxn0HeiMmrYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUV5FiyrLe3kZBTa6kE2XWUcuEdoEBuWP0q489Z8zg2BQbSJnux3q3AwmoE0o20yz
 IcvNP9iC71qCOJDQXMgRTOMI9TFpf4OHZa0vNzM/pX/GXAELleBUtm7e/zgNaXyx98
 /gZyTNcHApzjhuqULpw8xTKNwNG9iUHqhJaZHL3M=
Date: Tue, 17 Nov 2020 16:32:34 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v9 08/12] hw/block/nvme: Support Zoned Namespace Command
 Set
Message-ID: <20201118003234.GA2719991@dhcp-10-100-145-180.wdc.com>
References: <20201105025342.9037-1-dmitry.fomichev@wdc.com>
 <20201105025342.9037-9-dmitry.fomichev@wdc.com>
 <20201112193639.GA811486@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112193639.GA811486@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:32:38
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 08:36:39PM +0100, Klaus Jensen wrote:
> On Nov  5 11:53, Dmitry Fomichev wrote:
> > @@ -133,6 +300,12 @@ static Property nvme_ns_props[] = {
> >      DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
> >      DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
> >      DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
> > +    DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
> 
> I disagree on this. Using the "magic" value ensures that only one
> command set can be selected. We can do a custom property so we can set
> `iocs=zoned` as well as `iocs=0x2` if that makes it more user friendly?

IMO, 'iocs' is a rather difficult parameter name for a user to remember
compared to 'zoned=true'. While 'iocs' is a spec field, the spec isn't
very user friendly either, and these user parameters can hide the spec
terms behind human comprehensible names.

