Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86988277749
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 18:58:21 +0200 (CEST)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLUZY-00088g-A6
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 12:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kLTzp-00080D-GE; Thu, 24 Sep 2020 12:21:26 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kLTzm-0006aD-6e; Thu, 24 Sep 2020 12:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Ncw662vfBnkwx6wOcZ5D2+dWkPPkzLDSgWd0BlzKJgE=; 
 b=oBiVdqHB5kiqN9e957F/ggWDO+jG+H+Z5/uCJOfFFqy+qiJ7tBGNXvfmDzJ2HooJdl3h9GmCs4O0zEoTri4ZmNpgs+zIKe+54c3SaWXHqhZ98gL/1jV10ILYrDCFRN5SwDUgzkLUNUtIUC7RSqFw9symfbli7jrFlb3HIbcc6sl4A1hpD7D/Avgy2Rxn5LsJO4n8odmmEmlHDrH/+LnDw89Yat+72ID4i8LpkAVIdKMtOusb12fJSSIO2C5OmP0z/nktoxVeRZBxL627WUnlD/WReNr8waKS5A4nDZhUgK7XbLqaajs+wKZr6TNFPUv40/va5TUHp6vPCbTOyUJIMw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kLTzk-0008Fp-19; Thu, 24 Sep 2020 18:21:20 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kLTzj-0004Ac-N7; Thu, 24 Sep 2020 18:21:19 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v6 4/5] block/io: fix bdrv_is_allocated_above
In-Reply-To: <20200916122008.20303-5-vsementsov@virtuozzo.com>
References: <20200916122008.20303-1-vsementsov@virtuozzo.com>
 <20200916122008.20303-5-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 24 Sep 2020 18:21:19 +0200
Message-ID: <w511rirqh6o.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 12:20:35
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 16 Sep 2020 02:20:07 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> bdrv_is_allocated_above wrongly handles short backing files: it reports
> after-EOF space as UNALLOCATED which is wrong, as on read the data is
> generated on the level of short backing file (if all overlays has
> unallocated area at that place).
>
> Reusing bdrv_common_block_status_above fixes the issue and unifies code
> path.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

