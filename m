Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35473792CC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:34:26 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7vC-0004UY-Uh
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lg7sF-0002xi-Le; Mon, 10 May 2021 11:31:12 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:56036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lg7sC-00059l-8X; Mon, 10 May 2021 11:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=ig8qZC3vTq2HVHNrArFudDc3eMKAnn1iOZ93IZLEDAc=; 
 b=ABWgmHNIQJWFEh1jMNJtNtNB2PN+Mal9g7DKuqxeGo+rLfFHVV6l3eroJZo/4EU5PS3iB6BHnt+8PInOlRxyHy69OQMulfKM0o6abSwX62FAUYld6OotYjov3k6doBvTezYGO3cOzGd41vFEORcfm7FNERHWmA2DEAlGUBBKR8SJFtkImhMsaHMs0pT1N9Aln92qckZuIEPna8kFkQIjvSYr+qgP4DOJ+p2x/bPLFZOZBAubk7eJA+VzQQwUw41rw3qisenf/FyRvwJsFH+ue3mBOgmq/oX7j0YhCKZNZFGvFOC8Amnrt6gqcQTbFy0uBPpt50Wr39au9yLTjXFXbQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lg7rn-0002To-Ce; Mon, 10 May 2021 17:30:43 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lg7rn-0001AU-2z; Mon, 10 May 2021 17:30:43 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 3/5] block: improve bdrv_child_get_parent_desc()
In-Reply-To: <20210504094510.25032-4-vsementsov@virtuozzo.com>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-4-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 10 May 2021 17:30:43 +0200
Message-ID: <w51lf8mwqqk.fsf@maestria.local.igalia.com>
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
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 04 May 2021 11:45:08 AM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> We have different types of parents: block nodes, block backends and
> jobs. So, it makes sense to specify type together with name.
>
> Next, this handler us used to compose an error message about permission
> conflict. And permission conflict occurs in a specific place of block
> graph. We shouldn't report name of parent device (as it refers another
> place in block graph), but exactly and only the name of the node. So,
> use bdrv_get_node_name() directly.
>
> iotest 283 output is updated.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

