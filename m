Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C983F49D086
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:15:54 +0100 (CET)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClth-0004ka-BV
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:15:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nClef-0001xg-GL; Wed, 26 Jan 2022 12:00:27 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:42372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nCled-0007qV-LJ; Wed, 26 Jan 2022 12:00:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDE7F6091A;
 Wed, 26 Jan 2022 17:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EF9C340E3;
 Wed, 26 Jan 2022 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643216413;
 bh=H6XLucFj5sL+vRidMlCj6UV9RYYM947YOhFXK3Pvtfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EC8L3AYBtFlSBP9z66rCC9963zie3AduQWMXxs48fJgHQ8EUaM6VirkpUpPfzOFys
 Nw2/lRbXS5elZARDCWin4yoqWqVU+HM5oBrFv1RYnPeTsdv9GT7OVJUwHwYouglR1m
 iQHcjITB8H5E1gZKN0DFtXJ3PHq9f/c3mI7D+Xk6ShuK2FNy/a3LwxnR61HgQtCqEl
 KQV0O5FZFh8q4/T2rKKfBXqm6wIaMIkKKuzXlcm6OXMnFsxofaTG9HLK1CiFqfiznJ
 YSaQz2P8LL417b6YX8POR8nG+BOGTwalORADtjThry05zaZRz1rcMcLsO4x/9Bqsy4
 AhDO9/HnU3/YA==
Date: Wed, 26 Jan 2022 09:00:10 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-7.0 1/4] hw/nvme: add struct for zone management send
Message-ID: <20220126170010.GA1885300@dhcp-10-100-145-180.wdc.com>
References: <20211125073735.248403-1-its@irrelevant.dk>
 <20211125073735.248403-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125073735.248403-2-its@irrelevant.dk>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 08:37:32AM +0100, Klaus Jensen wrote:
> +typedef struct QEMU_PACKED NvmeZoneSendCmd {
> +    uint8_t     opcode;
> +    uint8_t     flags;
> +    uint16_t    cid;
> +    uint32_t    nsid;
> +    uint32_t    rsvd2[4];
> +    NvmeCmdDptr dptr;
> +    uint64_t    slba;
> +    uint32_t    rsvd12;
> +    uint8_t     zsa;
> +    uint8_t     zsflags[3];

This should be just a single uint8_t for zsflags, followed by 
'uint8_t rsvd[2]'.

Otherwise, looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

