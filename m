Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA525080A9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 07:34:31 +0200 (CEST)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh2yz-0000GZ-UV
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 01:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>)
 id 1nh2vj-0007NJ-DR; Wed, 20 Apr 2022 01:31:13 -0400
Received: from verein.lst.de ([213.95.11.211]:41922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>)
 id 1nh2vg-0001W5-8g; Wed, 20 Apr 2022 01:31:05 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9BAF267373; Wed, 20 Apr 2022 07:30:59 +0200 (CEST)
Date: Wed, 20 Apr 2022 07:30:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/5] hw/nvme: always set eui64
Message-ID: <20220420053059.GB1901@lst.de>
References: <20220419121039.1259477-1-its@irrelevant.dk>
 <20220419121039.1259477-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419121039.1259477-3-its@irrelevant.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Received-SPF: none client-ip=213.95.11.211; envelope-from=hch@lst.de;
 helo=verein.lst.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 02:10:36PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Unconditionally set an EUI64 for namespaces. The nvme-ns device defaults
> to auto-generating a persistent EUI64 if not specified, but for single
> namespace setups (-device nvme,drive=...), this does not happen.
> 
> Since the EUI64 has previously been zeroed it is not considered valid,
> so it should be safe to add this now.
> 
> The generated EUI64 is of the form 52:54:00:<namespace counter>. Note,
> this is NOT the namespace identifier since that is not unique across
> subsystems; it is a global namespace counter. This has the effect that
> the value of this auto-generated EUI64 is dependent on the order with
> which the namespaces are created. If a more flexible setup is required,
> the eui64 namespace parameter should be explicitly set. Update the
> documentation to make this clear.

How is this actually globally unique given that it uses a start value
that is incremented for each created namespace?  Also EUI64 values are
based on a OUI, while NVME_EUI64_DEFAULT seems to have the OUI values
cleared to all zero as far as I can tell.

I would strongly advise againt autogenerating eui64 values.  They are
small and have little entropy, and require at least three bytes (for
new allocations more) to be set to a IEEE assigned OUI.

