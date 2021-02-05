Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA84310B51
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 13:49:22 +0100 (CET)
Received: from localhost ([::1]:57968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l80Y4-0007wK-JD
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 07:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l80W1-0006zp-Ff; Fri, 05 Feb 2021 07:47:15 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l80Vw-0000fp-UP; Fri, 05 Feb 2021 07:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=3FixcFZf/dplEjvTd/Mgiln6L5+kymhA63o+RNQQfkc=; 
 b=BAq2dXPLOKXNhj2LKDv0qdQB+sJXrllksrhLrg8uwcH86AEEgDVD8RPoSdYAN0T7tpZxe+xF/RSy4jtxre41SCcHA0slnM6ZT+HH3eKT0ayuFTvlxSA+euN8y4BWlrRtCQhhWOLLKuAvthbqIWilQo9RURS2Ov8xzt2ZZh8Bh7fDSkHbO0syEFQdY/zQwMcaOXQjN+YkJY0AnGUv1wSL8EIW6fR1k46DDKyOEVdwPpUtsE7XzZb5PYwdcDOXLPWcx7dDsNhRDndLqWR4cbfDbbZ49qq5ojZwOTh/37PWngdoaIiTJZzIj7gLWbiCPMzv4SruqnyjjJKxZ/Zb4t6TNw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l80Vo-0006RM-G5; Fri, 05 Feb 2021 13:47:00 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1l80Vo-00081d-6r; Fri, 05 Feb 2021 13:47:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 0/2] Allow changing bs->file on reopen
In-Reply-To: <20210121105217.GA5466@merkur.fritz.box>
References: <cover.1610715661.git.berto@igalia.com>
 <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
 <20210121105217.GA5466@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 05 Feb 2021 13:47:00 +0100
Message-ID: <w51ft2abs1n.fsf@maestria.local.igalia.com>
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 21 Jan 2021 11:52:17 AM CET, Kevin Wolf wrote:
>> Hmm, still, removing a filter which want to unshare WRITE even when
>> doesn't have any parents will be a problem anyway, so we'll need a
>> new command to drop filter with a logic like in bdrv_drop_filter in
>> my series.
>> 
>> Or, we can introduce multiple reopen.. So that x-blockdev-reopen will
>> take a list of BlockdevOptions, and do all modifications in one
>> transaction. Than we'll be able to drop filter by transactional
>> update of top node child and removing filter child link.
>
> Internally, we already have reopen queues anyway, so it would make
> sense to me to expose them externally and take a list of
> BlockdevOptions.  This way we should be able to do even complex
> changes of the graph where adding some edges requires the removal of
> other edges in a single atomic operation.

So you mean changing the signature to something like this?

{ 'command': 'x-blockdev-reopen',
  'data': { 'options': ['BlockdevOptions'] } }

It should be easy to make that change, I can have a look.

Berto

