Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100E62F830F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:55:29 +0100 (CET)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TJo-0007k5-4h
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0THt-0006JD-3c; Fri, 15 Jan 2021 12:53:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:32906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0THr-0005K1-E7; Fri, 15 Jan 2021 12:53:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F13D221FA;
 Fri, 15 Jan 2021 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610733205;
 bh=/yk1E5TvRA5ZHsYjZQIlaSsGKxBNreucw7eOxjLhkY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N9+KkiQDK1O+YBxw2XiEuE+oDNx1t2I7WZ4mbO9b9MMYTTPppTklFHMnBgtY/tR2Q
 qUn27p+Myb/JoA+YLAPKCyHBhPmTmN1NwBGIAdOSa+uiA5SEyBbRxmcjtBKM/D0pKG
 ilgiY7xpipe23wwK1vHzWUtVj8lU2A4Mbe+z7raOI8SKbcB063ZgighiHJ6JydFI4f
 4Jjrxuwe3DActxr0UDAxlUPm2eUpPuSEw8yjmjklqwTgAXH0Jn70M2IXS4odtGmZ6r
 ZXKlz/C3yWIeHSv7QhXkwSPxd5MohxRycuPOuM94944RGxN/N05Rza4K14toa38qQJ
 bJCok6Rl6SLgA==
Date: Fri, 15 Jan 2021 09:53:23 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 0/5] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210115175323.GA1516013@dhcp-10-100-145-180.wdc.com>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
 <YAGfWe+OMxiBggh3@apples.localdomain>
 <20210115173504.GH1511902@dhcp-10-100-145-180.wdc.com>
 <YAHVKFOYaEO4N6I5@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAHVKFOYaEO4N6I5@apples.localdomain>
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

On Fri, Jan 15, 2021 at 06:47:20PM +0100, Klaus Jensen wrote:
> Cool!

I thought so too :)
 
> Question: NSIDs must be the same on each controller for shared
> namespaces, but can private namespaces "share" nsid across controllers
> in the subsystem?  I don't think the spec is clear on that point.

The namespace NSID has to be unique within the entire subsystem, whether
they're shared or private.

