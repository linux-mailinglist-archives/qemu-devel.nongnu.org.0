Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213131D2F9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:13:25 +0100 (CET)
Received: from localhost ([::1]:34828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9X2-0001So-5l
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9W1-0000hA-6M; Tue, 16 Feb 2021 18:12:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lC9Vz-0007yE-Kp; Tue, 16 Feb 2021 18:12:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92B4164E7A;
 Tue, 16 Feb 2021 23:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613517136;
 bh=POGCWEywOoXtGSSW6UtbE+UNePDYsvxtAghkQG/hedQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dbFAf/OUHfBBkCGq3O0+D2mktzZhKkOxbiNrMzEiLgMPyxPcHL/rsHOgEnjp5U4ZO
 b57mq3RtjMUumId3fXBEi9iji56lav/VXmw+qP9Eo1m98ZXdE6FwqZFyOpV7sGllvN
 YJPjWix1YiQUYDuu76VisSMzRi27GRYNQEL64Fm+rOnoulBBHF4oD4mUSzBQLIZ50k
 pyDHmwT376rHPqfFIN7COT9V6eUQlkFMdIKCesv8WZkkf8dtLHSeSxYkxyyMlYE/t1
 pDiypWQt7ys8HYUe/C3j1dZxP8/ufW/NyiYRt2OFXdfE1KdOL+2ZY/zWNxN7hLntxS
 edwQd0JDVY0Ag==
Date: Tue, 16 Feb 2021 15:12:13 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v3 09/12] hw/block/nvme: add verify command
Message-ID: <20210216231213.GE2708768@dhcp-10-100-145-180.wdc.com>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-10-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214230240.301275-10-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 12:02:37AM +0100, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> See NVM Express 1.4, section 6.14 ("Verify Command").
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> [k.jensen: rebased, refactored for e2e]
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Verify is a generic block command supported in other protocols beyond
nvme. If we're going to support the command in nvme, I prefer the
implementation had generic backing out of the qemu block API rather than
emulate the entirety out of the nvme device.

