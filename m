Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6492C228B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 11:12:14 +0100 (CET)
Received: from localhost ([::1]:58750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khVIz-0007Y6-So
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 05:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khVGD-0005ks-Sw; Tue, 24 Nov 2020 05:09:21 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:55607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khVGB-0004dw-Jo; Tue, 24 Nov 2020 05:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=bURXUzbkX0/CgBXOhjwNpGPLEkIKKQLFNhxftMZz+jg=; 
 b=TBoXw/VxRZMi54yR+rGWBWMdEfcICzmiv3wQAiHBuGWMZWFe9jMP510qk/hqAeQZZnw15iFoVJ4st3qWrmF4vspPtrEQMT9Waha3Hvw9CW+YhU5xekvp6cPqkGbm4fAVzgXpcqEmyZe9Na2xVKLNKzVmxj8ReU5y8eeh+RCSqmAsFx2RSupva6/YNSxBbV/ktbVmHSosircsuERHghe3q6T5jlMV4JXJjiETn6e5A8sPCF/u381FVJDun3NLPO3KRmmhIrl2JcRuvqXitBC2iBu1FjyJy4U3TPS5h2jbgBnrTXuJ2frVxOLixLNXH1vZBgu2kmjD5VjjnNxZN0n6YQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1khVG6-0008L4-Kh; Tue, 24 Nov 2020 11:09:14 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1khVG6-0001TP-BJ; Tue, 24 Nov 2020 11:09:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH for-5.2 v2] qcow2: Fix corruption on write_zeroes with
 MAY_UNMAP
In-Reply-To: <20201124092815.39056-1-kwolf@redhat.com>
References: <20201124092815.39056-1-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 24 Nov 2020 11:09:14 +0100
Message-ID: <w51o8jn9id1.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, zhang_youjia@126.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, andrey.shinkevich@virtuozzo.com,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 24 Nov 2020 10:28:15 AM CET, Kevin Wolf wrote:
> From: Maxim Levitsky <mlevitsk@redhat.com>
>
> Commit 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
> introduced a subtle change to code in zero_in_l2_slice:
>
> It swapped the order of
>
> 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> 2. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
> 3. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
>
> To
>
> 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
> 2. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
> 3. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
>
> It seems harmless, however the call to qcow2_free_any_clusters can
> trigger a cache flush which can mark the L2 table as clean, and
> assuming that this was the last write to it, a stale version of it
> will remain on the disk.
>
> Now we have a valid L2 entry pointing to a freed cluster. Oops.
>
> Fixes: 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [ kwolf: Fixed to restore the correct original order from before
>   205fa50750; added comments like in discard_in_l2_slice(). ]

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

