Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02A2F829D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:37:08 +0100 (CET)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0T23-0001qb-Cy
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0T0A-0000qN-GE; Fri, 15 Jan 2021 12:35:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:56082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0T08-0005qQ-Pb; Fri, 15 Jan 2021 12:35:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F30D212CC;
 Fri, 15 Jan 2021 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610732107;
 bh=Yn2MpuvSz/VTZ8eri4dflF1hBnoxf9/Ez4WB0ysr8kU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2EZUPjoiIoYlh9sU2L3sfKl98opVqW0D23c2AcSOoA1J5mlwFcLDB0Bx+8s1nCkq
 ZOIcyg2y6tlJgF4QpXsPhySZATes/t48xx0sPzzLEtrjU1uwmac4/5fGvOcYuWfQG2
 6CMGYLor8uF2Zd44+5lWIsGiSWrxrbsp10LD2EVLMT7VMBG/utjHWvgKQ41vubAQDk
 P1RNMl80QAEeKlIjGXam73jFDM+lLtj6K9fWeJbiqgQWW66+yqBQ79nE/Z4jmbWKqV
 XztiLwEq7GSEQfHKS8/OEIiP3KwbBfeSsp9RaXRIfuJuZJJZnYepXH0hXjVm2xZ+j3
 8+onzEKGH74tw==
Date: Fri, 15 Jan 2021 09:35:04 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 0/5] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210115173504.GH1511902@dhcp-10-100-145-180.wdc.com>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
 <YAGfWe+OMxiBggh3@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAGfWe+OMxiBggh3@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 02:57:45PM +0100, Klaus Jensen wrote:
> 
> As you already mentioned, the problem I see with this approach is that
> we have separate namespaces attached to separate controllers. So we are
> faking it to the max and if I/O starts going through the other
> controller we end up on a namespace that is unrelated (different data).
> Havoc ensues.
> 
> My approach looks a lot like yours, but I hacked around this by adding
> extra 'ctrl-0', 'ctrl-1', ..., link-parameters to the namespace device,
> replacing the bus. This works well because the namespace then just
> registers with multiple controllers. But adding more parameters like
> that just isnt nice, so I've been trying to figure out how to allow a
> parameter to be specified multiple times, so we could just do more
> 'ctrl'-parameters.
> 
> Alas, since I started thinking about namespace sharing I have been
> regretting that I didn't reverse the bus-mechanic for namespace
> attachment. It would align better with the theory of operation if it was
> the controllers that attached to namespaces, and not the other way
> around. So what I would actually really prefer, is that we had multiple
> 'ns' link parameters on the controller device.

Would this work better if we introduce a new device in the nvme hierarchy:
the nvme-subsystem? You could attach multi-path namespaces and
controllers to that, and namespaces you don't want shared can attach
directly to controllers like they do today. You could also auto-assign
cntlid, and you wouldn't need to duplicate serial numbers in your
parameters.

