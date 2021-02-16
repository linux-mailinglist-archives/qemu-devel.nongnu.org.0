Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4947D31CE8C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:59:33 +0100 (CET)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3hE-00047s-CG
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lC3I6-00018q-GX; Tue, 16 Feb 2021 11:33:39 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:59838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lC3Hy-0005AM-5x; Tue, 16 Feb 2021 11:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=YjH8hW7wYzMlGapM/AutNPU2H7eNF9tOzGNl1uewZ9k=; 
 b=ovX+ry5nBKlSuwFyc8r4Tx2GKtfgpS28kyaxGZvt7XTngYld/n9GbL05M63otVtNZKDuH1VOdYmpI26FrIFN1jo3jmdnqkAt2b44BgpyxxUcKU/+LM5KLa2J/axz3A8ZgVixsuCO5cJf7JVGPoBCPxlk0z/HyXRL1TfjPpQYx04i3S0Z8IEkfj6hATtIFduVV622bMF8CBY256sP3cN/gi/cfXoloLXbN9vEOq404hqZG8BK3gQQZ8dmO70nZWBaKVSE0LfHDoGZ5CzvebYg/eWnAHyUcexecEr8uZXegQuc26VnwSq922joSSZE6Jl59EYssfepQEljweVpPsVO+Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lC3Hu-0000Qd-Ao; Tue, 16 Feb 2021 17:33:22 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lC3Hu-0001hH-1Y; Tue, 16 Feb 2021 17:33:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
In-Reply-To: <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
 <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 16 Feb 2021 17:33:22 +0100
Message-ID: <w517dn82crx.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 09 Feb 2021 09:03:02 AM CET, Vladimir Sementsov-Ogievskiy wrote:
>>   { 'command': 'x-blockdev-reopen',
>> -  'data': 'BlockdevOptions', 'boxed': true }
>> +  'data': { 'options': ['BlockdevOptions'] } }
>
> Do we also want to drop x- prefix?

I think we can drop it once it's clear the the API is fine. It can be on
a separate patch after this.

>> -    visit_free(v);
>> +    bdrv_reopen_queue_free(queue);
>> +    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
>> +    g_slist_free_full(aio_ctxs, (GDestroyNotify) aio_context_release);
>> +    g_slist_free_full(visitors, (GDestroyNotify) visit_free);
>
> Probably you can use g_autoslist() for defining these lists to get
> automatic cleanup.

g_autoslist() requires that the type has a cleanup function, but that's
not the case here and I don't think we can add one ('drained' contains a
BlockDriverState, what's the cleanup function? bdrv_subtree_drained_end
or bdrv_unref?)

I think it's fine to call g_slist_free_full() explicitly in this case.

Berto

