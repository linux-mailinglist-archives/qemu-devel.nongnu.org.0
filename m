Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E931903D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:45:13 +0100 (CET)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAF5c-0006Mt-K4
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lAF44-0005d3-TB; Thu, 11 Feb 2021 11:43:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:51180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lAF41-0005xp-AB; Thu, 11 Feb 2021 11:43:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E82464D87;
 Thu, 11 Feb 2021 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613061811;
 bh=Xun30RHEzJw5RWnUQbdOPLbg10eeKZnmHynDMrglplA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fmvo79TiUOso0CGmtX0klW8pCGibtBX7ClbcIVjur/2jjO6DElY3WymbKYyKagj5M
 BGYhXXRizMUDY6SyabXyQCObTLwrPvExe7hxydpImzvltPYgEwMi8nmu8vPOETlQJH
 P+Fpz768UUiBf9RSQgsuFB/pjElkWkdnlBHWVAnfLGV76xPf3Ld6dbI8rBpsnXSeSk
 KW6wAnbbKyyxcdvMCbjVzpzsMOIE1a7jA5WtFJmoK8lMATG0Jg8ZXK0HD5YmlypKXc
 aCGyAwMMq5Etz+JeoiI66yk88CBaj0K3ThzZF9VBw0XlXwiii1MypjHlYJeii5Sw6z
 3YNhinzsx57lw==
Date: Thu, 11 Feb 2021 08:43:28 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <20210211164328.GA2679529@dhcp-10-100-145-180.wdc.com>
References: <20210125204231.254925-1-its@irrelevant.dk>
 <20210208185907.GA17042@redsun51.ssa.fujisawa.hgst.com>
 <YCGMIcjRlw3auFNc@apples.localdomain>
 <20210210033254.GC17042@redsun51.ssa.fujisawa.hgst.com>
 <YCOASbXtnp2RbvPF@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCOASbXtnp2RbvPF@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 07:42:17AM +0100, Klaus Jensen wrote:
> 
> Is that an Acked-by? ;)

Yep,

Acked-by: Keith Busch <kbusch@kernel.org>

