Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D323792E4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:39:01 +0200 (CEST)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7zo-0002ul-3z
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lg7xo-0000o2-VT; Mon, 10 May 2021 11:36:56 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:56317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lg7xn-000647-32; Mon, 10 May 2021 11:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=o/R/vuYz6ARNXrPvCT2CuUh6r3Raavu7JMwisebirw4=; 
 b=QVExWJg++THy0aq2zpeq93sv1tBg8guaJo/U2IcGhpVEW5GhmMKjLm+3o/QsZNSAq70+KgQmx/gE5Z+lReAjXQj8Rh2Y+SULjIrGqJHegaLmNvHqRk7UnxASFs0/q5yCAqPyPozuxAHqExHt1me3UyIsooF393Gs0Su8i1Oh9EY0m/Ase/T8GPRknm0SR+457KxAwZyoceYYrPr+I64YQVIXvM5M1APaRaCEPMmrkEnrhr6+AMIjYZEOTpuZKoVj4xJNHNlKKEHfbn70E7d//7vhHvS1qj2wrh7ti47gBByMUTsz03wFSaADzrANfShicOx/FrE1jpd0xWw3c/jOXw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lg7xj-0003fn-S7; Mon, 10 May 2021 17:36:51 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lg7xj-0001Wa-IM; Mon, 10 May 2021 17:36:51 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 02/10] qcow2: compressed read: simplify cluster
 descriptor passing
In-Reply-To: <20210505065955.13964-3-vsementsov@virtuozzo.com>
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
 <20210505065955.13964-3-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 10 May 2021 17:36:51 +0200
Message-ID: <w51fsyuwqgc.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 05 May 2021 08:59:47 AM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> Let's pass the whole L2 entry and not bother with
> L2E_COMPRESSED_OFFSET_SIZE_MASK.
>
> It also helps further refactoring that adds generic
> qcow2_parse_compressed_l2_entry() helper.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

