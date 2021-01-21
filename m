Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B822FF894
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 00:18:38 +0100 (CET)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2jDo-0006hG-Um
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 18:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l2jCc-0006D6-3I; Thu, 21 Jan 2021 18:17:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:53506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l2jCa-0006rY-FD; Thu, 21 Jan 2021 18:17:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C18020769;
 Thu, 21 Jan 2021 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611271038;
 bh=31dIbH5q+bO56EiFZ+3w7Hy/6+4IjBjnSAnMErFzNkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfJA3G2MlX9ZxwJEmpJOuW2xjt2eMndW9oioGrMk115dwVArnlTnNgvn4T9MJFNC3
 eL9gi9C46sQ4Kz3xtGvt18uHSrq/aaajuE3tO0hKaS81TMQeJNsW17U2r2Er4p2n32
 sUqLecTWQsLVagJN1jq+pEqFCS2AVIid7t43ox1Mi6jS8MOGvw82WuvAfADziTmKnm
 inCaTeO5kaqzhIFN6zMez7OSTCvt5OTeXPBZ1Oz4GjGaWUnmrrBeXrSKLOOE7uKfOr
 AvYgV/KiWJvhWden1ogeh5nWmWtGwKv83kgmkUyRogGhsviUtl3ijw2G2VmaNckep/
 xrlC/Cmd6TgbQ==
Date: Thu, 21 Jan 2021 15:17:16 -0800
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V4 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <20210121231716.GD1727271@dhcp-10-100-145-180.wdc.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
 <20210121220908.14247-5-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121220908.14247-5-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 07:09:06AM +0900, Minwoo Im wrote:
> -static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> +static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t cntlid)
>  {
>      NvmeIdCtrl *id = &n->id_ctrl;
>      uint8_t *pci_conf = pci_dev->config;
>  
> +    n->cntlid = cntlid;

I don't think 'cntlid' is important enough to be a function parameter.
You can just set it within the 'NvmeCtrl' struct before calling this
function like all the other properties.

> @@ -4517,7 +4543,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>          return;
>      }
>  
> -    nvme_init_ctrl(n, pci_dev);
> +    cntlid = nvme_init_subsys(n, errp);
> +    if (cntlid < 0) {

    error_propogate();

> +        return;
> +    }
> +    nvme_init_ctrl(n, pci_dev, cntlid);

