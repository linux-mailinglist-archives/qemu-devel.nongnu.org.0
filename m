Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA5292E68
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 21:26:01 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUanA-00062H-NK
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 15:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kUalU-0005Mw-JB; Mon, 19 Oct 2020 15:24:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kUalT-0003gC-43; Mon, 19 Oct 2020 15:24:16 -0400
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11AC722260;
 Mon, 19 Oct 2020 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603135453;
 bh=pUC3Ky1rQud7NlWjZnI236A8uzbsjnVZxeMlc6OZw14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qM7BXzoHGuuvi81UI41F2FY/bDbNHlFMyNCJHMckAlCaXDb1qLOkDdzVtbgbY61O2
 xlm3h3V5HbOtz8tr/yJ2O+hqZ/v3QwDf0QxnE6Fn9FyWnUFwUP5WMVNf7PE2j+pI4W
 oGYXN9wR9FqIiq0wy7+cRB+p6wuusq4k/0BoTLTs=
Date: Mon, 19 Oct 2020 12:24:09 -0700
From: Keith Busch <kbusch@kernel.org>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v7 02/11] hw/block/nvme: Generate namespace UUIDs
Message-ID: <20201019192409.GE1435260@dhcp-10-100-145-180.wdc.com>
References: <20201019021726.12048-1-dmitry.fomichev@wdc.com>
 <20201019021726.12048-3-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019021726.12048-3-dmitry.fomichev@wdc.com>
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

On Mon, Oct 19, 2020 at 11:17:17AM +0900, Dmitry Fomichev wrote:
> In NVMe 1.4, a namespace must report an ID descriptor of UUID type
> if it doesn't support EUI64 or NGUID. Add a new namespace property,
> "uuid", that provides the user the option to either specify the UUID
> explicitly or have a UUID generated automatically every time a
> namespace is initialized.
> 
> Suggested-by: Klaus Jansen <its@irrelevant.dk>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Reviewed-by: Klaus Jansen <its@irrelevant.dk>

Looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

