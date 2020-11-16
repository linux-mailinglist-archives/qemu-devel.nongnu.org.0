Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3C2B4E9C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:58:08 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keilT-0001to-U8
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1keikj-0001PF-Nt; Mon, 16 Nov 2020 12:57:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1keiki-0003KV-0X; Mon, 16 Nov 2020 12:57:21 -0500
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2769420B80;
 Mon, 16 Nov 2020 17:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549436;
 bh=QUh1dHip0iMVATz/Hb+FNvmeNTPkx2FErgHZbPx6px8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NmeDJniCJEPNP4HCs0WHxmPoi7GeqipekxTzEZpqcKMzbAncISX6otOK/3woMxsD1
 W1XvPGlPpM43jsmZ+VoB+rJFj//MnLQGC/rII6HrQgVcQbDr5fiUr/1F6YvVel5jvX
 diT5d0yldjFuuYvkAwGy1j6qnh65/UsmhM4BMkEg=
Date: Mon, 16 Nov 2020 09:57:13 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v8 2/5] hw/block/nvme: pull aio error handling
Message-ID: <20201116175713.GA2715864@dhcp-10-100-145-180.wdc.com>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-3-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:57:17
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 08:59:42PM +0100, Klaus Jensen wrote:
> +static void nvme_aio_err(NvmeRequest *req, int ret)
> +{
> +    uint16_t status = NVME_SUCCESS;
> +    Error *local_err = NULL;
> +
> +    switch (req->cmd.opcode) {
> +    case NVME_CMD_READ:
> +        status = NVME_UNRECOVERED_READ;
> +        break;
> +    case NVME_CMD_FLUSH:
> +    case NVME_CMD_WRITE:
> +    case NVME_CMD_WRITE_ZEROES:
> +        status = NVME_WRITE_FAULT;
> +        break;
> +    default:
> +        status = NVME_INTERNAL_DEV_ERROR;
> +        break;
> +    }

Just curious, is there potentially a more appropriate way to set an nvme
status based on the value of 'ret'? What is 'ret' representing anyway?
Are these errno values?

