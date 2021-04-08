Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51F358F54
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 23:39:28 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUcN5-0005nh-2l
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 17:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lUcMD-0005FB-NW; Thu, 08 Apr 2021 17:38:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lUcMC-0007uJ-4V; Thu, 08 Apr 2021 17:38:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5097961007;
 Thu,  8 Apr 2021 21:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617917908;
 bh=9vSPPxKnBux5aib8aL0UI6C52Qx8QH13yrkcxuq5oKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QjCOB7aIlO3AHYHvMeWjmcsbXPKxg+SZWMOCESPcZFNIL9e8b9qfsGrLFV/ep46k0
 NT0TMh44UdEMcxh+w06I4QVnEuCP5KEP0Sdv8RKhylE2zZ+4TElxyyAc5u4hpTRKgE
 JR/Mx6UkYioIU0Izgsbfzpbrjdtkcmh00mqYiC8121o5y/dpfugNsY7KSxs0N23Xg1
 ZF8jTCNHco9hpsBJ0TJptD6qLC7IJUOs4xXVqBsisyHUkiD8gd0TecXPsUAzPaM+uM
 2fbVm+gO/otLb88tYze750IIpzA4z+U94AjAAXGu0H3Pj5gvZazNU0mekbddcR5QRz
 dBPAarAE8KKyQ==
Date: Fri, 9 Apr 2021 06:38:21 +0900
From: Keith Busch <kbusch@kernel.org>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: map prp fix if prp2 contains non-zero
 offset
Message-ID: <20210408213821.GA4727@redsun51.ssa.fujisawa.hgst.com>
References: <CGME20210408162750epcas5p1f093ab42779ab250fbcb672a41455a30@epcas5p1.samsung.com>
 <20210408162313.22749-1-p.kalghatgi@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408162313.22749-1-p.kalghatgi@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 09:53:13PM +0530, Padmakar Kalghatgi wrote:
> +            /*
> +             *   The first PRP list entry, pointed by PRP2 can contain
> +             *   offsets. Hence, we need calculate the no of entries in
> +             *   prp2 based on the offset it has.
> +             */

This comment has some unnecessary spacing at the beginning.

> +            nents = (n->page_size - (prp2 % n->page_size)) >> 3;

page_size is a always a power of two, so let's replace the costly modulo
with:

	nents = (n->page_size - (prp2 & (n->page_size - 1))) >> 3;

