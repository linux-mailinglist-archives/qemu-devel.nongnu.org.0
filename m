Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751482327B7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 00:51:21 +0200 (CEST)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0uus-0004xe-7c
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 18:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uu5-0004Sz-Gi; Wed, 29 Jul 2020 18:50:29 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uu2-0005sf-In; Wed, 29 Jul 2020 18:50:29 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 4AAD4BF616;
 Wed, 29 Jul 2020 22:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596063023;
 bh=8vZkRkbiBoHyq+eyyC945GKBUbc6RHZYumuvTQKhDvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=quXcb+4axgA21sgbQUoyaLOiENT7aYyCaideKqNtoC8kzxb7wmx3TNnwjUXGOvi93
 mawf+Kn6XHrevZKEUU2KHsf6PyyGWdFOHh1S2ylgcIaGjp+AGqSX5rBDSlaBiMEdM0
 9sVpR9th5/Iw7Qa5PRJ8pVKWDP42qfgME0vD0b2JEVf5PGwnNtIeU3f7Pg15lHLUHp
 ozwMvtPDkMO5umnl3NTk1ODVKqFpWbNrXkQaBYpoOM+2mUgVnRw5OQe6TQFTcrsNeB
 nwRUdYdvnOr+euf2DakVZBtlCkGPCCqqk9HE7Q91ALThhPjSZZXBHORmMG5gRWhP3r
 /Jejx5pFe+1BQ==
Date: Thu, 30 Jul 2020 00:50:19 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: [PATCH v6 2/2] nvme: allow cmb and pmr to be enabled on same
 device
Message-ID: <20200729225019.GA346228@apples.localdomain>
References: <20200729220107.37758-1-andrzej.jakowski@linux.intel.com>
 <20200729220107.37758-3-andrzej.jakowski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200729220107.37758-3-andrzej.jakowski@linux.intel.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 29 15:01, Andrzej Jakowski wrote:
> So far it was not possible to have CMB and PMR emulated on the same
> device, because BAR2 was used exclusively either of PMR or CMB. This
> patch places CMB at BAR4 offset so it not conflicts with MSI-X vectors.
> 
> Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
> ---

Well, I'm certainly happy now. LGTM!

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

