Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6828F296162
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 17:02:55 +0200 (CEST)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVc7C-0003de-ES
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 11:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kVc5Z-000333-8C; Thu, 22 Oct 2020 11:01:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kVc5U-00005p-L4; Thu, 22 Oct 2020 11:01:12 -0400
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0618F24630;
 Thu, 22 Oct 2020 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603378866;
 bh=OAHa5l8XeDn/xMWPeMKLsKLbFRznHKW1FqXR/3b4MWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TB9bmku5bEm+5VDQwFb0XmachFp5fP6hoNe2OXePW9qZyS0fCd4LLLqvWsueEoY9k
 PfrFUFi7oKO9QvjuDMpIZA3df2omeQ2cXdQg0fDfGruGpGBdfTL3u+lUbnzYnokcY4
 Zztxqzoz2o54PnxDd3jhGqKQpcs36CmALd3b6o7Y=
Date: Thu, 22 Oct 2020 08:01:03 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v4 2/2] hw/block/nvme: add the dataset management command
Message-ID: <20201022150103.GA1665151@dhcp-10-100-145-180.wdc.com>
References: <20201022073313.143794-1-its@irrelevant.dk>
 <20201022073313.143794-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022073313.143794-3-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 11:01:06
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

On Thu, Oct 22, 2020 at 09:33:13AM +0200, Klaus Jensen wrote:
> +        if (--(*discards)) {
> +            status = NVME_NO_COMPLETE;
> +        } else {
> +            g_free(discards);
> +            req->opaque = NULL;

This case needs a

            status = req->status;

So that we get the error set in the callback.

Otherwise, this looks fine. I am assuming everything still runs single
threaded since this isn't using atomics.

