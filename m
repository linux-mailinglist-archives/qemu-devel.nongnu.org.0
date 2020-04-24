Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CA1B7C56
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 19:04:24 +0200 (CEST)
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS1kV-0001nl-13
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 13:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jS1jT-00012k-0c
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 13:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jS1jR-0001Qn-Mb
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 13:03:18 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:59530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jS1jO-0000bP-0j; Fri, 24 Apr 2020 13:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=53kwb4a82Jmw8WuLBuSnE9DHpqBvJNBYA1SMwNYxzL4=; 
 b=eQmzvEYd3gH5v+jaJpggL6Wk8shQ/R68SQw/n6T0VThoP7V8k3xVBQxti6PFMYUz0rxdrsVFnXSo7y941ECz2QCYzf7P9wuW0dNBM6LxVWP0AlVmEzZZa95NhByFJGHKDcYBQEtYNgqWAHSvq0y1VMWlE2IgA2Wioc3rUd9Us3bZNBsKrtUcebGAfJ4Icc2HUa7c4SzELfKjbpaOv0hfdgtZJKMq8xAVA5VrrBSmkpVfsGDDd+D3I2oo6aYNhFIEerWBAJ8A2CkAq7yRfmHPKGGbMA9Nx+nMvcjWOMqqdYsW02hG7t91Q+arEX0t2sfi2zeZi6fDOy30mNKsXG9ncA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jS1iz-0001YB-QB; Fri, 24 Apr 2020 19:02:49 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jS1iz-0001ew-Gd; Fri, 24 Apr 2020 19:02:49 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 24/30] qcow2: Clear the L2 bitmap when allocating a
 compressed cluster
In-Reply-To: <6d596d82ed62615a8565b661691a06bfaf32237e.1584468723.git.berto@igalia.com>
References: <cover.1584468723.git.berto@igalia.com>
 <6d596d82ed62615a8565b661691a06bfaf32237e.1584468723.git.berto@igalia.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 24 Apr 2020 19:02:49 +0200
Message-ID: <w51r1wcn7eu.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 13:02:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 17 Mar 2020 07:16:21 PM CET, Alberto Garcia <berto@igalia.com> wrote:
> Compressed clusters always have the bitmap part of the extended L2
> entry set to 0.

I was just finishing some improvements to the new code that allows
BDRV_REQ_ZERO_WRITE at the subcluster level, and I'm starting to
entertain the idea of using the L2 bitmap for compressed clusters as
well.

I will make some tests next week, but I would like to know your opinion
in case I'm missing something.

A compressed cluster cannot be divided into subclusters on the image:
you would not be able to allocate or overwrite them separately,
therefore any write request necessarily has to write (or do COW of) the
whole cluster.

However if you consider the uncompressed guest data I don't see any
reason why you wouldn't be able to zeroize or even deallocate individual
subclusters. These operations don't touch the cluster data on disk
anyway, they only touch the L2 metadata in order to change what the
guest sees.

'write -c 0 64k' followed by 'write -z 16k 16k' would not need to do any
copy on write. The compressed data would remain untouched on disk but
some of the subclusters would have the 'all zeroes' bit set, exactly
like what happens with normal clusters.

I think that this would make the on-disk format a bit simpler in general
(no need to treat compressed clusters differently in some cases) and it
would add a new optimization to compressed images. I just need to make
sure that it doesn't complicate the code (my feeling is that it would
actually simplify it, but I have to see).

Opinions?

Berto

