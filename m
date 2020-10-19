Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA8292EF2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 21:54:31 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUbEk-00038q-DM
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 15:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kUbC1-0000v4-58; Mon, 19 Oct 2020 15:51:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kUbBy-0007UB-EC; Mon, 19 Oct 2020 15:51:40 -0400
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F26B22314;
 Mon, 19 Oct 2020 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603137094;
 bh=KpmEbuX0ddGgJ5OTUiR7wr8ZN26C7YtnSBiVI1q5I1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ekThQp39vwtHgdu/BwZLVSwpa4DczZ2ETeQvEnAnv+caZ7fmmWCOLxiRbT2Lkf42+
 p1eV1WtmJnx8Z5TOc+dOyN1A4eY1rE9/0bMdm/aJDvEsdZBwqRs5v/ozR6l4UcJbI9
 iVfo+v3g9zY1DQq1/ZtHzh08afx70wZE/DZZiKHc=
Date: Mon, 19 Oct 2020 12:51:31 -0700
From: Keith Busch <kbusch@kernel.org>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v7 03/11] hw/block/nvme: Add support for Namespace Types
Message-ID: <20201019195131.GF1435260@dhcp-10-100-145-180.wdc.com>
References: <20201019021726.12048-1-dmitry.fomichev@wdc.com>
 <20201019021726.12048-4-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019021726.12048-4-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 12:35:01
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
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 19, 2020 at 11:17:18AM +0900, Dmitry Fomichev wrote:
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
...
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);

You've got duplicate sizeof checks for the NvmeIdNsDescr.

Otherwise, the patch looks fine.

