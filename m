Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5AE295B6C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 11:09:22 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVWb3-0007zb-Lr
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 05:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kVWV9-0004Am-Q0; Thu, 22 Oct 2020 05:03:16 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:48660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kVWUv-0002cB-7x; Thu, 22 Oct 2020 05:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=t95Yv07Xt1H46vKv+YJXcLtvUiwAVQUaK3CvHb8bg/Q=; 
 b=qHZyvNlMhcDoueyB/Q/YeGMUcbGG0idzJARYgVED9wnBdXzaSZDzfwhRUCeImfyDcQBm1wCPqIS7w7jdXJC8bUU44LrmfymJwCVrqzl3OuBBCZzPwuD70vVxhW1s+ux87TKu3SMqQUp2PBjicBKBbMLVfYS78zjWBhEj1v1SeOwWVjLQXYCmlbhY2S5HpUT6s027gR0rEHOdQtTOruFIZWjiB+knbpjtAnMjMhAQWLLNwoROx3RGxbHVncLQTgSPnfEKAabWem00T2YrVccaQlMCACePEcshH4dewrAP8EuogmN9slNEtcr3U/8f7JkEVUlkCaTJVhReFCPjPzn2gg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kVWUX-0007iS-IW; Thu, 22 Oct 2020 11:02:37 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kVWUX-0007ow-8o; Thu, 22 Oct 2020 11:02:37 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/2] Skip copy-on-write when allocating a zero cluster
In-Reply-To: <cover.1600698425.git.berto@igalia.com>
References: <cover.1600698425.git.berto@igalia.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 22 Oct 2020 11:02:37 +0200
Message-ID: <w511rhqd45u.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 05:02:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On Mon 21 Sep 2020 04:30:48 PM CEST, Alberto Garcia wrote:
> I had to rebase the series due to conflicting changes on master. There
> are no other differences.
>
> Berto
>
> v4:
> - Fix rebase conflicts after cb8503159a
>
> v3: https://lists.gnu.org/archive/html/qemu-block/2020-09/msg00912.html
> - Add a new patch to improve the reporting of BDRV_BLOCK_ZERO [Vladimir]
> - Rename function to bdrv_co_is_zero_fast() [Vladimir, Kevin]
> - Don't call bdrv_common_block_status_above() if bytes == 0
>
> v2: https://lists.gnu.org/archive/html/qemu-block/2020-08/msg01165.html
> - Add new, simpler API: bdrv_is_unallocated_or_zero_above()
>
> v1: https://lists.gnu.org/archive/html/qemu-block/2020-08/msg00403.html

